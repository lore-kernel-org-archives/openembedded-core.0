Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6926FEF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 15:15:19 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id x49so42599557qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 07:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eHc/FIuf5POmCiiWDVbjSckAuMeDMzVtrCMeD/mpXnI=;
	b=XWAgML9oqcYDrd7yNsW/AFLrfhCXs+m3GSSWjiDTx0VIkTgp1iJkPkS8O2E5hjiQhd
	v2ctpwA48LETEX/Ad6XLWGgDi0ywmAvRC11RTUQdnOucxyjMJqCzd7S7dfU30O7roDYq
	K67qsfr7lAn7PQOEVLVfVSuVPyTYC4GIOJ0+9jiDkn5m/UeYPrcKaXK2YnLP7mVMOWR0
	rI7UWRraY+owO7sZduwj1JZoBrekKTm57W/sFRHVHnNsGwshZusPB/ElHVQkmuqZQSOx
	y1OvAiZGrT8X03EkXmXJkXcE1+hPpye7E8yzsYLSArbJEFVxnAtOI0UtHHVFysgeXZtA
	luaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eHc/FIuf5POmCiiWDVbjSckAuMeDMzVtrCMeD/mpXnI=;
	b=dj5ul8ck11/I5JbDr+CjWDdPzmHb7nlyCjcWv7wAhbXgkpAV5SXNjHwkoMFUDN0byT
	n2ysTIViRuAbf311laKaj/kOTn6DENr4l7/GYhjCARhwcJ6EP6LOA3zqBsSdhBaMkGSS
	8vnykejf22SBapmQdIizP5XRTeX20Z1CH6KXzOivdPScYzAjFXJG85A3sB6Gt/uPhg72
	cO/5ao172dIwydqSTSIC+URfG6biX5X+XiCd2Hc3vibGYXf+S2CSRiyvjoloeTF6S8sK
	TRYEWzuojNtMC/MCWs7+G1zBZuIyDAxbWeM0K5ExUNCkhz0pUvp8ecszStrTubfdCR++
	tVjA==
X-Gm-Message-State: AMke39njk90rXbZhwckrbW46uLBShtWeG7Qzz0ojSvn+e7C3RH9XbUrp7TckvF7Pn1UUhvGTqaXg5T6yormo6ySB
X-Received: by 10.237.39.148 with SMTP id a20mr8207482qtd.65.1487344519556;
	Fri, 17 Feb 2017 07:15:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 17 Feb 2017 07:14:59 -0800 (PST)
In-Reply-To: <5c9fb24fb0118322b6ef212808eb7fe2c1fcd171.1487139819.git.liezhi.yang@windriver.com>
References: <cover.1487139819.git.liezhi.yang@windriver.com>
	<5c9fb24fb0118322b6ef212808eb7fe2c1fcd171.1487139819.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Feb 2017 15:14:59 +0000
Message-ID: <CAJTo0LZaQj9383VjtQOWzj00_sVX9jvCYyDDOTGvUEuE8p3Wxg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] btrfs-tools: remove udev from DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Feb 2017 15:15:20 -0000
Content-Type: multipart/alternative; boundary=f403045ee6d8bf621f0548bb618b

--f403045ee6d8bf621f0548bb618b
Content-Type: text/plain; charset=UTF-8

On 15 February 2017 at 06:25, Robert Yang <liezhi.yang@windriver.com> wrote:

> The log said that udev was added to DEPENDS because btrfs-tools installs
> a udev rule, this was incorrect, and it caused a side effect:
>
> $ bitbake btrfs-tools-native
>
> ERROR: Nothing PROVIDES 'udev-native' (but virtual:native:btrfs-tools_4.
> 8.5.bb DEPENDS on or otherwise requires it). Close matches:
> [snip]
>

Are you sure?  The configure.ac does this:

UDEVDIR=
if pkg-config udev --atleast-version 190; then
        UDEVDIR="$(pkg-config udev --variable=udevdir)"
fi
AC_SUBST(UDEVDIR)

Ross

--f403045ee6d8bf621f0548bb618b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 February 2017 at 06:25, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"=
mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:3ii" class=
=3D"gmail-a3s gmail-aXjCH gmail-m15a407350a4c039a">The log said that udev w=
as added to DEPENDS because btrfs-tools installs<br>
a udev rule, this was incorrect, and it caused a side effect:<br>
<br>
$ bitbake btrfs-tools-native<br>
<br>
ERROR: Nothing PROVIDES &#39;udev-native&#39; (but virtual:native:<a href=
=3D"http://btrfs-tools_4.8.5.bb" rel=3D"noreferrer" target=3D"_blank">btrfs=
-tools_4.<wbr>8.5.bb</a> DEPENDS on or otherwise requires it). Close matche=
s:<br>
[snip]</div></blockquote></div><br>Are you sure?=C2=A0 The <a href=3D"http:=
//configure.ac">configure.ac</a> does this:</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">UDEVDIR=3D=
</div><div class=3D"gmail_extra">if pkg-config udev --atleast-version 190; =
then</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 UDEVDIR=3D=
&quot;$(pkg-config udev --variable=3Dudevdir)&quot;</div><div class=3D"gmai=
l_extra">fi</div><div class=3D"gmail_extra">AC_SUBST(UDEVDIR)</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></d=
iv>

--f403045ee6d8bf621f0548bb618b--

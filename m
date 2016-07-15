Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 06F667316D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 19:35:03 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id h190so27711888ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V+hEaN2r6tPUXQD6Lp/6lU9uZAeFJiATjUTYWzaWqgM=;
	b=lT9hgnOKrcEwS8LNzj9wk0LgYout50A4SExBs+kwP5JZoXc8fdKmfPNFHR/nmTtD6+
	uZb1e4uE4+zEWobHZF34eTrF2QdZgxGkCBABcePG8RTCxBGgW4cmpTnGxNzHPsTSsHf+
	fWHOd8gMdHLADh6CE8b2X0ycNy2FrfydKkTl0ax2qEn9hcExr9mmSiqGXdERLiiLvLhC
	8njFUj5hS9AWvlhZ2lsNWe6Vtd71GXOb/yoWrs6aPzlADPj0NQt79erIkUrMCyZJA6sp
	3Ue2hl/Lt06N1gc0hN1w7Zj8MmodyJy+x9xN44HfFs+Hii0zGeaxL/1Z+FsK7LnatxLC
	OCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V+hEaN2r6tPUXQD6Lp/6lU9uZAeFJiATjUTYWzaWqgM=;
	b=Br9qPdEWIRa8F4xuTGoE3Ywqg2fX0vam29pvdvCtWY2MdoAb3y1D4q/gnCcJ6m97Pk
	5Lon4oEqgjCRyemPANxw2MH5xF79E7WeQWbRSBgEBxFQy44TYbpfAx5/NiGa48RtdyA3
	nmBv6o07blqCF8vIIPLYy1YHCRT232TE6tyqNk6qlrIfTt4eiCvrgfbAGfSIhmr1GZ5x
	jtaSO1kgiq8yhZA4mcaLEOVg35ReR4KiBomMvtnNN/xKgFo5JbJoQHC3tORwuu3KJZff
	VqdOPCUS0G1I00twusYLUM51N2CDS3fcERU1fLUBuIiysS8u+0ytuXqFdFLMm6UcUp7G
	ONrw==
X-Gm-Message-State: ALyK8tJbyl/Dtql90jrxwKBmyYqYczHh6lSLh37IRhw/UXcHtiCscZgGJnK/F/HMU961mh2ZJs9j7QhMmdszHBwM
X-Received: by 10.36.147.198 with SMTP id y189mr22879085itd.83.1468611304097; 
	Fri, 15 Jul 2016 12:35:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 15 Jul 2016 12:34:44 -0700 (PDT)
In-Reply-To: <1468358990-14377-3-git-send-email-anibal.limon@linux.intel.com>
References: <1468358990-14377-1-git-send-email-anibal.limon@linux.intel.com>
	<1468358990-14377-3-git-send-email-anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Jul 2016 20:34:44 +0100
Message-ID: <CAJTo0LZ_jV7BoyhGAn_xjydZMCFsbcdp_5dvaGTgbNy5MDsfqg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] classes/testimage: When image is systemd enable debug log level
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
X-List-Received-Date: Fri, 15 Jul 2016 19:35:04 -0000
Content-Type: multipart/alternative; boundary=94eb2c089e14181ffd0537b1b71e

--94eb2c089e14181ffd0537b1b71e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12 July 2016 at 22:29, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.=
com> wrote:

> +            bootparams =3D 'systemd.log_level=3Ddebug systemd
> .log_target=3Dconsole'
>

The problem with this is that it appears that logger output then goes
*only* to the console and not the journal or syslog, which breaks selftest
(and expected behaviour).

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/build=
s/851
for example, which goes green if I revert this patch.

If this is the case then it would be great if there was a
journal-and-console log_target I guess.

Ross

--94eb2c089e14181ffd0537b1b71e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2016 at 22:29, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limon@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:r=
gb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":301" =
class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bootparams =3D &#39;<=
span class=3D"">systemd</span>.log_level=3Ddebug <span class=3D"">systemd</=
span>.log_target=3Dconsole&#39;<br></div></blockquote></div><br>The problem=
 with this is that it appears that logger output then goes *only* to the co=
nsole and not the journal or syslog, which breaks selftest (and expected be=
haviour).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra"><a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-q=
a-systemd/builds/851">https://autobuilder.yoctoproject.org/main/builders/ni=
ghtly-qa-systemd/builds/851</a> for example, which goes green if I revert t=
his patch.<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">If this is the case then it would be great if there was a journal-=
and-console log_target I guess.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--94eb2c089e14181ffd0537b1b71e--

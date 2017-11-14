Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8D37197B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:27:40 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id w127so6771461iow.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 04:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IIogMlH7v9XhL3WheQbaNO5b0ldJ5rLQA0Oe3WE51Qo=;
	b=TcyaZlvQdeMefBFBSR2q5jtQSzWCgedGnQD6XyYRzQIoufPgwSfbKESSEOuMLfcabu
	dsALkJaLuZtnqNGfoWMLF/NDbdYBtO8ObroC/IxLeRBLbsT0zFSppGgqw9mBe90nCPOP
	pZ/ne3IsUO3LbqPADn7cw6szbck3DWiBxGazL3AzHm46si0IJs+rGmJUC0rMYP/tdaOC
	xyJ4kVmAyY1VovpHjX81Yxwl7ziUW76L74B0DEI0dyRQKM9maHEPCaavJfFEHaEADfw/
	bAzehysloubXr3gBUvj/tARF7eJr51RM2j8n1x7vVFUZfOBGXYZ1BkrV0SeJK6kHYAGR
	W0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IIogMlH7v9XhL3WheQbaNO5b0ldJ5rLQA0Oe3WE51Qo=;
	b=nbfbQFG/MpeXIlFSi+CtViZ9NK7Un8WWk9cziSxiNrW8W9Pn85LT5hJOMNaRZZipbM
	QkNiKyLS99ZiAdVdmg0svRgxd8iXIAn8t29LzA1pCSWaAxSe9g1S+7Uk4vJESG1tMmYy
	HVCDAbVz/VnhfnVs5xCPzTbCeUi29kAj8tAs+9+5NefuRhlK/qIyISTzmE0Nzl+WYcwd
	PW0vAIkaF9tqqP5dOuOl4x1xVTFxsNn9A261zoiPhJSvBhA7/o4OkT78Wbei27dUotLJ
	JMzXAzZ8B7E22QR+V8sngpHtMTiVOI3nXJoXoKx5sjTswFALO7UTbMWR8pNYwN12rrXQ
	aU9w==
X-Gm-Message-State: AJaThX7AQmNS2/cbq4b92tQfgn6m+E0rbCFLPBwIhpjhK77cIq/F5Vb8
	VxzjG5aQVfzpzwWIccDEXo4MwF3iqAu5IqpeZmGf6A==
X-Google-Smtp-Source: AGs4zMaKlsr6mToBIfkYn27Yl9icGsjj+jWWqR2ce1zL55hcz+oR3w2yrlfevjtqr/NJsZLa4p/L1O7VMNbrStcF99w=
X-Received: by 10.107.133.85 with SMTP id h82mr13463050iod.208.1510662461332; 
	Tue, 14 Nov 2017 04:27:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Tue, 14 Nov 2017 04:27:20 -0800 (PST)
In-Reply-To: <5a5cb4d84589268dcb65daa80ee86ba3094f777d.1510595883.git.liezhi.yang@windriver.com>
References: <cover.1510595883.git.liezhi.yang@windriver.com>
	<5a5cb4d84589268dcb65daa80ee86ba3094f777d.1510595883.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Nov 2017 12:27:20 +0000
Message-ID: <CAJTo0LYaO3G6cura1G029Bq5p0NMFpkDwXYUa+ru2pPP5wnyUA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/10] debianutils: 4.8.1.1 -> 4.8.3
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
X-List-Received-Date: Tue, 14 Nov 2017 12:27:40 -0000
Content-Type: multipart/alternative; boundary="001a113fd83a622d44055df083c9"

--001a113fd83a622d44055df083c9
Content-Type: text/plain; charset="UTF-8"

On 13 November 2017 at 17:58, Robert Yang <liezhi.yang@windriver.com> wrote:

> -SRC_URI = "http://snapshot.debian.org/archive/debian/
> 20170402T211732Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz"
> +SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz"
>  # the package is taken from snapshots.debian.org; that source is static
> and goes stale
>  # so we check the latest upstream from a directory that does get updated
>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"


Don't use DEBIAN_MIRROR as files are removed when they're not in an active
debian release anymore.  Please continue to use snapshot.debian.org but
update the full URL.

Ross

--001a113fd83a622d44055df083c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 13 November 2017 at 17:58, Robert Yang <span dir=3D"ltr=
">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi=
.yang@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">-SRC_URI =3D &quot;<=
a href=3D"http://snapshot.debian.org/archive/debian/20170402T211732Z/pool/m=
ain/d/${BPN}/${BPN}_${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">http=
://snapshot.debian.org/<wbr>archive/debian/<wbr>20170402T211732Z/pool/main/=
d/$<wbr>{BPN}/${BPN}_${PV}.tar.xz</a>&quot;<br>
+SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/d/${<wbr>BPN}/${BPN}_${PV}.tar.xz&=
quot;<br>
=C2=A0# the package is taken from <a href=3D"http://snapshots.debian.org" r=
el=3D"noreferrer" target=3D"_blank">snapshots.debian.org</a>; that source i=
s static and goes stale<br>
=C2=A0# so we check the latest upstream from a directory that does get upda=
ted<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;${DEBIAN_MIRROR}/main/d/${<wbr>BPN}/&quo=
t;</blockquote><div>=C2=A0</div><div>Don&#39;t use DEBIAN_MIRROR as files a=
re removed when they&#39;re not in an active debian release anymore.=C2=A0 =
Please continue to use <a href=3D"http://snapshot.debian.org">snapshot.debi=
an.org</a> but update the full URL.</div><div><br></div><div>Ross</div></di=
v></div></div>

--001a113fd83a622d44055df083c9--

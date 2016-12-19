Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id C35AF73181
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:04:08 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id u25so3107785qki.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 05:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QZycEAmSommSBCJi6u70PL1KuLV8ee9V5sDNvRh3zP0=;
	b=SRkFPidq9FRbpngh96zyKk2jyoml3O7Gn/WkcKPuQ7aJ85HUySC8X2PrQmSyb1BILx
	LczwxOZ68BTC1tilhyKMZyCG/xlecWwXL/c/Ge/+TQ2a7O0Uulyv8BxL89a+gncrZ+Rh
	/NxAr19SdkowJSp8Ay5AhS0pCvycTTZGontxSv6z9EaJFqiewUsK7XD5Yw0Xgjq7Bm3u
	dVp2dyneyyz8zYUB6TMlmJPk2q9tTysdd3Oy+mR3dr55iGkZTPAK6HB5gLVqQRl3E2Cc
	X512C983ogoNhCKqF1ky02/5RA1yv83snJxeEWC57HFLHVFAp4X9pXWgkvKAr0NGU+qd
	s7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QZycEAmSommSBCJi6u70PL1KuLV8ee9V5sDNvRh3zP0=;
	b=F+rPlURZn9XZRzmi764RUr7tWOrAdB8VH5IS0Pf88wtbbeSO4qFOG1mbDEp4NIZ6Vp
	I9LObI2zgbT9wLniqBWR1gW854Vk4jv9uUJs4oOGFpxboJ3uzSeUMaUjrvDshUrUouGj
	L7bPmHgIZt2EqVBa5ywejl3fXbzWYi98UV5ZXDak4tzmVEAcN+BW4IX6JnaUJelXPcgm
	4ajW/ESrcYmoNkvfHs6evtoP8W099dQbEYoyd6AzJPcTGpvz9cjhxS1sm3TpuxgUQ9Y+
	pzOXUyavbp2N9aUcTLjrgp3RKFoeOwHobmVRXc6nreaMN0hhbnJIvz0gWvtM/I14WsE+
	tCzA==
X-Gm-Message-State: AIkVDXLHMZN7CFoYBFt/IrJEs+2zE7uYDznKuXQ4PEQokozoZ26pbWk/xJX2Nync/N/sHTDmAu9cp2VynWtHRyE0
X-Received: by 10.55.8.20 with SMTP id 20mr1966786qki.3.1482152650387; Mon, 19
	Dec 2016 05:04:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 05:03:49 -0800 (PST)
In-Reply-To: <1481901072-25196-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
References: <1481901072-25196-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 13:03:50 +0000
Message-ID: <CAJTo0LYepxcF1a2E=djGwQUvcATyw9+G6vp9G8FEQXEGx_RDZQ@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] dpkg: upgrade to 1.18.15
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
X-List-Received-Date: Mon, 19 Dec 2016 13:04:10 -0000
Content-Type: multipart/alternative; boundary=001a114c9d603b4e4e0544028ecc

--001a114c9d603b4e4e0544028ecc
Content-Type: text/plain; charset=UTF-8

On 16 December 2016 at 15:11, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:

> -SRC_URI = "http://snapshot.debian.org/archive/debian/
> 20160509T100042Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
> +SRC_URI = "http://ftp.debian.org/debian/pool/main/d/${BPN}/${BPN}_${
> PV}.tar.xz \
>

Please always use snapshot.debian.org links as ftp.debian.org URLs are only
valid whilst the version you're after is actually shipped in a Debian
release.  The moment 1.18.15 is replaced by 1.18.16, the old tarball will
be deleted.

Ross

--001a114c9d603b4e4e0544028ecc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 December 2016 at 15:11, Edwin Plauchu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.p=
lauchu.camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":28i" class=3D"a3s aXjCH m159082f2c6e605cb">-SRC_U=
RI =3D &quot;<a href=3D"http://snapshot.debian.org/archive/debian/20160509T=
100042Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">http://snapshot.debian.org/<wbr>archive/debian/<wbr>20160509T10=
0042Z/pool/main/d/$<wbr>{BPN}/${BPN}_${PV}.tar.xz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"http://ftp.debian.org/debian/pool/main/d/${BP=
N}/${BPN}_${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://ftp.deb=
ian.org/debian/<wbr>pool/main/d/${BPN}/${BPN}_${<wbr>PV}.tar.xz</a> \<br></=
div></blockquote></div><br>Please always use <a href=3D"http://snapshot.deb=
ian.org">snapshot.debian.org</a> links as <a href=3D"http://ftp.debian.org"=
>ftp.debian.org</a> URLs are only valid whilst the version you&#39;re after=
 is actually shipped in a Debian release.=C2=A0 The moment 1.18.15 is repla=
ced by 1.18.16, the old tarball will be deleted.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c9d603b4e4e0544028ecc--

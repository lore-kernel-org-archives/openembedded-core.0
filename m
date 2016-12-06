Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id A3803719BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 09:52:37 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id c47so341106394qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 01:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=34Z7XAUotv0DrzL1D/EzbeOOXs8h5H09BIglrvEbSy0=;
	b=oMoDoBBFbDVlz3Nk0dFEpFzrtDrnAkyftiPvS6EYUUexBdVkQyyzjU6qsjymKmoOFP
	QYhVWT9h6pLDyPp1eed0vdjX4YOAeIu5DQhipusNtdT/Kws1HVt6TRgSXgyJHcza6mbI
	z/8CI4FeP+tWtFvm2IVC1/dc9MzCxtWJ/IslzpktrmyTZQJ4+HtOx15T2dGceo3ZyakM
	n/iqetukSpYvLYJO/mjby0hIkLNSUWeoKHpx40Fu25zyz76v3hWF/RgtFs2e8asK+F5L
	y5WB53x5g6XAF50QGB9CISETue/eEN1z3ejvgOnVHlQRHtdPUeLJ7xwYjAhNlVBPUNhe
	0Eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=34Z7XAUotv0DrzL1D/EzbeOOXs8h5H09BIglrvEbSy0=;
	b=KPLuM0NwUnhuSAKEMkIgJ6BpilBRP0ABCaM22MA/V7h7VsjLWgrr61m6hLMgKaoHiL
	JGM+UzsQ0yluzhBwuK6MOleJU3GWqVznjP9pYz3uZdfn9ddVIi4bFtWmw0YYGGOD2mlU
	d9ycE/UC7ar//xCrG21OtmYH30Sy6zRHiLiWjvq6kdfHG6XV1XrWxSzb6z6Vs43kdURc
	0sPqHAbVITtUyMasfA/v+cJgmLyQAR8QXzd7Z32F0p2zU4fX+f7TyQCQab9zcr2kb4kH
	vEicD6iDpqVuOtj4NUKhR3Xa7Dh9PlY0ht9fuQVyv4LHjXMBZnyakSIcvagni+i8U04r
	ksbQ==
X-Gm-Message-State: AKaTC02jUFMhITz+W69zU3ZaYfz6zgFfgaQBIY6HWRu878xA5P60uKXR8nfkVsHjqQqMpaMgX/+UFwUv7A2SLf/o
X-Received: by 10.237.61.42 with SMTP id g39mr59476085qtf.65.1481017959315;
	Tue, 06 Dec 2016 01:52:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 01:52:18 -0800 (PST)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84BF4DD4D5@ALA-MBB.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84BF4DD4D5@ALA-MBB.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 09:52:18 +0000
Message-ID: <CAJTo0LbJHGvB347RYZip+4w73opHMQpm_yKMsmDfdSFgYBXjdg@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: oetest.py construction of pkgmanifest is probably wrong
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
X-List-Received-Date: Tue, 06 Dec 2016 09:52:39 -0000
Content-Type: multipart/alternative; boundary=001a1142a3ea5f0faa0542fa5d04

--001a1142a3ea5f0faa0542fa5d04
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 02:24, Slater, Joseph <joe.slater@windriver.com>
wrote:

> This variable is a dictionary with entries based on package, but for
> multillib a package might exist in only some variants.  Perhaps
>
> each entry should be a dictionary of multilib variants?
>
>
Yeah, probably.  Got a patch? :)

Ross

--001a1142a3ea5f0faa0542fa5d04
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 02:24, Slater, Joseph <span dir=3D"ltr">&lt;<a href=
=3D"mailto:joe.slater@windriver.com" target=3D"_blank">joe.slater@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D"Ms=
oNormal">This variable is a dictionary with entries based on package, but f=
or multillib a package might exist in only some variants.=C2=A0 Perhaps<u><=
/u><u></u></p>
<p class=3D"MsoNormal">each entry should be a dictionary of multilib varian=
ts?<u></u><u></u></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>Yeah, probably.=C2=A0 Got=
 a patch? :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a1142a3ea5f0faa0542fa5d04--

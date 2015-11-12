Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 337B77720C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 12:12:28 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so39647989igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 04:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=a5FV4QDX0EZazV20zsbrQh6tfiU1VGjWYccEoBC0DQ8=;
	b=gWDa4qeHGumDeUEuCMxgkev3HjKE8bbDYVGhyBFaL8qTDCeA22+0lDN1UMAov6yDnK
	auo8FlToEgNeHBrfpbCL62qoRktnBLazj7cQXZoObtjXHhIBUQoDMIAZzdQ/zU974kRT
	xBTmr+T9YOeHpEYAQIb0ZvqpCde6LLmsz7K6uRPNB0ttxye8jHTpmVd9ue+Vl4YZiWoo
	qYFlJ1A2d9NP7rjiXDD81/KgMXVgz1zn/UYXz8BCSaQ01Tn8CyXFZgJ07UgYyOfPqQoS
	uGkUv1eweTKD1XTK3CYgd7n0enCFW8oLAHMVgfaGgGM7Ux2iyXsPXU50bvM4UvJpTSt9
	RDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=a5FV4QDX0EZazV20zsbrQh6tfiU1VGjWYccEoBC0DQ8=;
	b=TuL1LE8jXBQJbodK4ZVzXMOjmG3pQsJEA1Hz9tjnXKnhV1AdiW+fgopeT0GRbZS4cN
	BrsRepmg7ELeh+HnHHKdeCyEcwQAtJWFc/QGnTZ3PAC2NRGCHCyKH1hx0oaYuYQ75BST
	LVZM77zE1g8xjbVM/b5aDkoK78vd+OUflcgvD6vFokdNT8HYwBBvc4AXymGyvHVR4jJ2
	+xP8XkRoxY5Mh5UYCRSa+DytSdQRzQdvgOHrjUgrJoN4Ge8AJfZ01ubWlwBd3E2GH7Hu
	1QYJhvbrP8JSOwCNRGRq+PBcSOJUJdUvBkly0PF5MSYv9ARiqtTyGX6YjpbNIxqGOmYQ
	2H0A==
X-Gm-Message-State: ALoCoQlkbraiVFivQFuSUjUrJxWUCgKtVnsrIrnEIEPmycHbk6DrfX5dsR1UIX9tiZ5BMUhZ0pG3
X-Received: by 10.50.112.100 with SMTP id ip4mr15317677igb.78.1447330348496;
	Thu, 12 Nov 2015 04:12:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 12 Nov 2015 04:12:09 -0800 (PST)
In-Reply-To: <20151112114311.GD2574@jama>
References: <20151112114311.GD2574@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Nov 2015 12:12:09 +0000
Message-ID: <CAJTo0LaeSCxpDbt2QmKXyE+hdYJs5Sb7NuVPZ3=1ZzyfrVfd7A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, test-dependencies 2015-11-12
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
X-List-Received-Date: Thu, 12 Nov 2015 12:12:30 -0000
Content-Type: multipart/alternative; boundary=089e01161d004b9467052456dbdf

--089e01161d004b9467052456dbdf
Content-Type: text/plain; charset=UTF-8

On 12 November 2015 at 11:43, Martin Jansa <martin.jansa@gmail.com> wrote:

> WARN: clutter-gst-3.0: clutter-gst-3.0 rdepends on libgudev, but it isn't
> a build dependency?
> WARN: gammu: gammu rdepends on libgudev, but it isn't a build dependency?
> WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2
> rdepends on libgudev, but it isn't a build dependency?
>

Looks like oe-core should take gudev for consistency between init systems.

Ross

--089e01161d004b9467052456dbdf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 November 2015 at 11:43, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1z2" clas=
s=3D"a3s" style=3D"overflow:hidden">WARN: clutter-gst-3.0: clutter-gst-3.0 =
rdepends on libgudev, but it isn&#39;t a build dependency?<br>WARN: gammu: =
gammu rdepends on libgudev, but it isn&#39;t a build dependency?<br>WARN: g=
streamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends o=
n libgudev, but it isn&#39;t a build dependency?<br></div></blockquote><div=
><br></div><div>Looks like oe-core should take gudev for consistency betwee=
n init systems.</div><div><br></div><div>Ross=C2=A0</div></div><br></div></=
div>

--089e01161d004b9467052456dbdf--

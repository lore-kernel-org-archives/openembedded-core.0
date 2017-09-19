Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id AF7EC78082
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 16:07:28 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id e134so100545ite.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9CSdkfZr9jOneGx3eC1tALMWnA+BoVtEH1bseqjCwCc=;
	b=KtXnf7hRl7xyn9wfOqQ1ehdGOs8v/2rckK7PdF9JixDKoVYXk8mX/aQXEuMoP1a7O2
	kFLsTR3acfUDEiyV280+9ebOmJ94AZPGW1yHxp8khOEmHP4QcVmAyJoLTGExPqSYLuaN
	u8ZK/38Rpeh0B8mZO6B8N5BJtS8scq29/osA9pGdeWdr34RKA4u9gqOAaQIi9usOW1cA
	RqfbXDiBsGxsZpbjLbjqNczmKM9ertsg+M57UnozHyUJbRiT3RbqM2TBiAOGW1595hd6
	EpNt4KhGuMU/UTyr9mmYCWksOI0fuZOxEC5gJPDftuO+D8ir5xZ/xGhYUILz+NDSfxUM
	Uzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9CSdkfZr9jOneGx3eC1tALMWnA+BoVtEH1bseqjCwCc=;
	b=o+fhq8hkoUWflbaAinIzg4+vY8+o7m4qP/u5fKA2EVRvqbgASElmWxeRaxd0jD+rs7
	E6TtFqjdcCE9oEkRUPODPL+rwodnMpkM3M8crPe4E8wPveGIXCq8DzcuTenKdAhfIHbi
	2WtRcUF6j3G1ucKyH/xj3zIbOVXWPJYoP0JyQ3VDE4Yb55BbEAmYY+E6i+jrFUtBd15k
	r3t4RGJXfrCgL4MetTuYLe/mEvjSKoGF0hHul6UfT+5Tyz78D57Tvtn/RB7UHElgGjLD
	e9qHF4UZH0HlipHC4MT2GKT/5bTsaAHxLC+dsV6krTGyeEY+d32pW4sVLobKWp6UsdJL
	FiGw==
X-Gm-Message-State: AHPjjUhVMuPbrjW0Z/MbQtoo5893+x31vqvuTlGfP4SWHTuWdO20axFo
	s/Gidb/SeGGWqcVBAlD5k16a22ObybUBf0fxeTOURg==
X-Google-Smtp-Source: AOwi7QCCAg61ImPv7Hsboau7351kqUwosuF7zfFiy2QdIyfKvF4SKP2X1ddL26He6/UPj/p1BpnnzKjbMkyxYfjQmw4=
X-Received: by 10.36.150.4 with SMTP id z4mr2514222itd.48.1505837249646; Tue,
	19 Sep 2017 09:07:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 09:07:09 -0700 (PDT)
In-Reply-To: <20170919103653.23870-1-tomasz.meresinski@comarch.pl>
References: <20170919103653.23870-1-tomasz.meresinski@comarch.pl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 17:07:09 +0100
Message-ID: <CAJTo0LZmbdxxsxVnvxa_h9LCX2Sy9La=+OqiQ1pBzADmfoKHhg@mail.gmail.com>
To: =?UTF-8?Q?Tomasz_Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/image: fix do_image_qa dependencies
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
X-List-Received-Date: Tue, 19 Sep 2017 16:07:28 -0000
Content-Type: multipart/alternative; boundary="94eb2c07ea985aeda405598d0e84"

--94eb2c07ea985aeda405598d0e84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 19 September 2017 at 11:36, Tomasz Meresi=C5=84ski <
tomasz.meresinski@comarch.pl> wrote:

> After do_image_complete IMAGE_ROOTFS directory is empty so qa checks do
> not work


Important context: this only happens if rm_work is enabled.  I'm wondering
if the task should be moved earlier so its between rootfs and image, as
it's actually a *rootfs* QA hook (its expected that functions examine the
contents of IMAGE_ROOTFS).

I think we need to push the task back a bit in the tree and put it in
between rootfs and image.  This way if it fails the image generation
doesn't happen, and rm_work won't break it.

Ross

--94eb2c07ea985aeda405598d0e84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 September 2017 at 11:36, Tomasz Meresi=C5=84ski <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:tomasz.meresinski@comarch.pl" target=3D=
"_blank">tomasz.meresinski@comarch.pl</a>&gt;</span> wrote:<br><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
After do_image_complete IMAGE_ROOTFS directory is empty so qa checks do not=
 work</blockquote><div><br></div><div>Important context: this only happens =
if rm_work is enabled.=C2=A0 I&#39;m wondering if the task should be moved =
earlier so its between rootfs and image, as it&#39;s actually a *rootfs* QA=
 hook (its expected that functions examine the contents of IMAGE_ROOTFS).</=
div><div><br></div><div>I think we need to push the task back a bit in the =
tree and put it in between rootfs and image.=C2=A0 This way if it fails the=
 image generation doesn&#39;t happen, and rm_work won&#39;t break it.</div>=
<div><br></div><div>Ross</div><div><br></div></div></div></div>

--94eb2c07ea985aeda405598d0e84--

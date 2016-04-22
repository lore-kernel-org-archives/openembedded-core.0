Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5E645602D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 23:27:11 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id d62so38832584iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 16:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=61n5HdczPGrqFfot6eLekjzrNlbxt3396wRIF4WjgwE=;
	b=B5FKpyESynCVOp2gLVX/FONL3YtsYRpPbwM+tkgrJYmmCwywya4bWL3R5oUvWgudNW
	xwas7CVUV3ABQd8AvTq/W3X24l8yOdDne5CIPkOuMibRMKRq8QxayrbPKjF+L77q3fwN
	Pb8G8xc79ZkIw1xwAI5sp2MW+K/ry8BJUXuH97n4TzEFkRQ/B/qzpdK2wU3nLuPXDQ+g
	O5nKIMpntRETbvmVwQcYAV9DVA6lXaMUZcmi1li5i1HpbpWHS10FV/y5Skf7skwYTrtE
	4JO20dIP3K8klkp62/Lxr3l9XIQ3iLBn3nlMHNWawt34iVX9Vvw8xXEW7MELG0A0gTlp
	+AQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=61n5HdczPGrqFfot6eLekjzrNlbxt3396wRIF4WjgwE=;
	b=KGWF5zBntbWuJhZHdEsIW5RGZTDok9GN8GuAT4VY9/CAgL4KXNFcGAKnBs0GhGaxeY
	mF/pmrOK3GO3WZfJUEvJhLXYoFj5yymMLsnxTiUHH7unQpa/296/3ibZwswqOcGh7AFJ
	07S3Ouv7VCjh76Utge3NFRT1Rv/SXGvQTEGou6CTRcLSrFt/wwUg5BDVSqJuMh3jPwHT
	tPXsgJyg9r9nUwcq0sAcqps/LoA9elEId5Gu3IZPzclPtC+jKqfxp1etk/ZFEN5bUdbz
	vhENv5UZBJf58ZyRu897jQaRMGPNhyiHOTQaM3J/r4fUoKFPEhezAbNyxY1Aktj+Rd4v
	pxxA==
X-Gm-Message-State: AOPr4FXupDmC6Vryi2t69CsBrEshZgcvkE7Jcwq27bFE1jGfsOVafBav8gmdmrejsMLvKf1P7LFg7h3oyr+axw==
X-Received: by 10.107.15.159 with SMTP id 31mr25863639iop.3.1461367632629;
	Fri, 22 Apr 2016 16:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <571846A4.7010001@windriver.com>
In-Reply-To: <571846A4.7010001@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 22 Apr 2016 23:27:03 +0000
Message-ID: <CABcZAN=riPYG7bLdh7tjaaTH+Rm2maV2gPYhACFrMZE8dpgNzg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>, 
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Add ovmf-native to make qemu-native/runqemu support boot UEFI image?
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
X-List-Received-Date: Fri, 22 Apr 2016 23:27:14 -0000
Content-Type: multipart/alternative; boundary=001a113ee868a117a005311b2aee

--001a113ee868a117a005311b2aee
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 20, 2016 at 8:19 PM Robert Yang <liezhi.yang@windriver.com>
wrote:

> I'd like to add ovmf-native to make qemu-native/runqemu support
> boot UEFI image, that will make us debug UEFI image much more easier,
> without ovmf, we have to burn EFI image to a usb disk or cdrom,
> then boot it on the real hardware, this is inconvenient. (Virtual
> box can't boot our UEFI image, either, please see my last email
> about virtualbox, we may fix it later.)
>
> The ovmf is released under BSD license:
> http://www.tianocore.org/ovmf/
> The website says:
> License information: BSD (May contain an additional exception if bundled
> with
> the FAT driver.)
>
> We don't use the prebuilt FAT driver, we will build it from ovmf source.
>
> I tried it in my local repo, it works.
>
> We need to do:
> 1) Add ovmf-native to oe-core.
> 2) Move acpica from meta-oe to oe-core since ovmf-naive requires iasl
> which is
>     provided by acpica, we may also move acpitests to oe-core since it is
> used
>     for testing acpica, others are not needed.
> 3) Update runqemu to make it can boot EFI image.
>
> Of course, this for master branch only.
>
> Any objections or comments, please ?
>

Seems like a good idea to me. I'd love to be able to test EFI images in
qemu, and there's an open issue in bugzilla about it.

--001a113ee868a117a005311b2aee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Apr 20, 2016 at 8:19 PM Robert Yang &lt;<a href=3D=
"mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:=
<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I&#39;d like =
to add ovmf-native to make qemu-native/runqemu support<br>
boot UEFI image, that will make us debug UEFI image much more easier,<br>
without ovmf, we have to burn EFI image to a usb disk or cdrom,<br>
then boot it on the real hardware, this is inconvenient. (Virtual<br>
box can&#39;t boot our UEFI image, either, please see my last email<br>
about virtualbox, we may fix it later.)<br>
<br>
The ovmf is released under BSD license:<br>
<a href=3D"http://www.tianocore.org/ovmf/" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.tianocore.org/ovmf/</a><br>
The website says:<br>
License information: BSD (May contain an additional exception if bundled wi=
th<br>
the FAT driver.)<br>
<br>
We don&#39;t use the prebuilt FAT driver, we will build it from ovmf source=
.<br>
<br>
I tried it in my local repo, it works.<br>
<br>
We need to do:<br>
1) Add ovmf-native to oe-core.<br>
2) Move acpica from meta-oe to oe-core since ovmf-naive requires iasl which=
 is<br>
=C2=A0 =C2=A0 provided by acpica, we may also move acpitests to oe-core sin=
ce it is used<br>
=C2=A0 =C2=A0 for testing acpica, others are not needed.<br>
3) Update runqemu to make it can boot EFI image.<br>
<br>
Of course, this for master branch only.<br>
<br>
Any objections or comments, please ?<br></blockquote><div><br></div><div>Se=
ems like a good idea to me. I&#39;d love to be able to test EFI images in q=
emu, and there&#39;s an open issue in bugzilla about it.</div></div></div>

--001a113ee868a117a005311b2aee--

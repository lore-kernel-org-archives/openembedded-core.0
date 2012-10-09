Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TLeUq-0001st-68
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 20:25:36 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so4930380pad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2012 11:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=emSU/hc8P4RFHDTXq6YFOWD74C/1nyVq8noeGYg/+h8=;
	b=ox6l0OReO3Sngxt+57ou3OgZaGCu7xrLrgb8vGem5/P8l1FJ67e/nxcUON0cnYVIgS
	R48aH03Jl/plSzYkGTjwBUFM/DdX99oOIUrPBJcTFEtXxVA9ishz0ouT7U99x7smUn8D
	vsky/5YkQexVA/9QqsIUqAg1zWmat2TdD8ZciylRHr6qbOqM6S+7iXV7E0eK74a/CyJs
	QcjbzOCagw+Q1BkJIZY58/Hivrg+GcLosp3yEZeVjavLTlhoIbh38Eu7yBkzPecr5T+7
	gSXHSw7Llny6F68cyrIiekvy93NZ8VryMYgm07H4jXI1dj05R/cIVyNkIaHXRxbgBO5H
	wx+Q==
Received: by 10.68.217.201 with SMTP id pa9mr65635943pbc.45.1349806347304;
	Tue, 09 Oct 2012 11:12:27 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id v9sm12926677paz.6.2012.10.09.11.12.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 11:12:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <518EE65C-BC64-4BB4-A4ED-3C9BD3C0E017@gmail.com>
Date: Tue, 9 Oct 2012 11:12:20 -0700
Message-Id: <812D05AB-0A30-4236-988E-D08E13BE0823@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
	<8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
	<48919519-8CA2-41A8-96EA-F5D7F91DE33F@gmail.com>
	<CAMKF1sou8jjkoktbC4J1O+b-KbxZ43MyF3aPq68S74p8wC_qwQ@mail.gmail.com>
	<C309CEF1-33E5-4DD0-BA0E-8414EB53802C@gmail.com>
	<CAMKF1srk7SJSGiCDztiyx71NJZUgG530=QbhYCMm88t6ndgSbw@mail.gmail.com>
	<F0DDC3CE-D71C-4CBE-ACA4-B6E66DEDD4FC@gmail.com>
	<CAMKF1sqJ==O+AO-Si-CWQSOoZZhppepLjVmjQnipiXuSHWXLMQ@mail.gmail.com>
	<F90052C7-AE0C-49EE-9471-29C8618432DD@gmail.com>
	<518EE65C-BC64-4BB4-A4ED-3C9BD3C0E017@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
X-Mailer: Apple Mail (2.1499)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2012 18:25:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 9, 2012, at 10:37 AM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:

> Hi Khem,
>=20
> On Oct 9, 2012, at 5:48 PM, Elvis Dowson wrote:
>=20
>> So, now I've got gcc-4.5.4 working with eglibc-2.13, upto the point =
where the kconfig infrastructure was added.
>>=20
>> Next, to add the kconfig infrastructure to eglibc-2.13, and fast =
forward to the tip of the poky master branch, and
>> see if things are still ok, with the PowerPC440.
>=20
> Good news, I was able to get the backported patches for gcc-4.5.4 and =
eglibc-2.13 working with the latest poky and meta-openembedded master =
branch commits. This includes the gcc toolchain rework and the kconfig =
support to eglibc.
>=20
> Let me now try to switch to gcc-4.7.2 and eglibc-2.16, and see if =
things work. I noticed that there was a recent patch to fix a =
core-image.bb class, that prevented root login if debug tweaks was =
enabled. Perhaps that is why I didn't see the boot prompt on the target =
console with the recent gcc versions?
>=20

I don't think so. You should always see login prompt. It might not let =
you login if you don't have debug-tweaks in IMAGE_FEATURES

> Best regards,
>=20
> Elvis Dowson




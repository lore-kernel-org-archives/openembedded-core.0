Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 85AFF71DD2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 12:51:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u23so32323111wma.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zX0Y16sjUFURj5ZSvH9tNg5nqCpxSnPu6We4mF+78Q0=;
	b=inxHGEpLxAbJKwVZH8qvaCsMpcYrcvsDAaxqZ0gxm4wDbwUKRQQ3Qesu7RrNcYNEat
	xSgJ+MwrHBGpaZaC/6lcEMx82RnE1bTAFwgUkyYoigy/2mtgIJ8wRg09On7kgRnhqgaE
	Sa8GW/tj/MpLt69v2Sk5ePcxdsFFJJrJPNEON5GvgyFnB2x5uh7kWyN5Dnv2j5tBAdb7
	B8m33H8Fj+jsm3zlOcZwMVPrftHjlzmiDZmhIuZ38tV4zDuoXv9RakWjMz1/d2heSFpO
	m/8RbMhodWKL5iRZ3O+jvuSwtVN6Ky6dUhCwpHDBRBi4wcGqtostPL5tJYToxsLaWG8F
	YIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zX0Y16sjUFURj5ZSvH9tNg5nqCpxSnPu6We4mF+78Q0=;
	b=MZK4DrRR+7ckXfZos28FZ4ziBVjC8Va5cvlmpWxyc1WI86tkTYytKR6E4s1lVK7nFJ
	NSyXWy1iwuTtY8VZsHuBR1Mrm4Av8qlZtD5NjW/9qapdDOv5RrnrXwB6aB5Q2djz/DYR
	LlSzfUEF568+LuAO2CRH0BiCQoV3YmbseDNAdQgWMloz0u4Gm2X7TLfpIV5m85MdVxuV
	6ZK9p+tqSSrjxfh6XEuYaxnpml8Mw/jj2LNVW988C7Enoq0VVVRl4Li8yPgOXd9jDjpT
	f8FdEZLYABSpZAPnq018kVK//wSLOdVdPrdjHk1k3D+otu2h186o3D8H414Che2qal3X
	/sHw==
X-Gm-Message-State: AIVw112uw6KyKPDCMR6lwjgQ8kzweuVooCydFwXcdyyBx5qwQu2XOm2T
	lGv+sjrsAi8kiRUpY7w=
X-Received: by 10.28.154.17 with SMTP id c17mr23042899wme.35.1499259104357;
	Wed, 05 Jul 2017 05:51:44 -0700 (PDT)
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com.
	[74.125.82.45]) by smtp.gmail.com with ESMTPSA id
	139sm11731983wmq.16.2017.07.05.05.51.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jul 2017 05:51:43 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f45.google.com with SMTP id f67so111896838wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 05:51:43 -0700 (PDT)
X-Received: by 10.28.26.2 with SMTP id a2mr13067448wma.21.1499259102799; Wed,
	05 Jul 2017 05:51:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.209.14 with HTTP; Wed, 5 Jul 2017 05:51:41 -0700 (PDT)
In-Reply-To: <CBAEED2EB06BF94889E80B47A33FE329ED6E35@PGSMSX105.gar.corp.intel.com>
References: <cover.1498782014.git.wei.tee.ng@intel.com>
	<340dcd3ae5be23d6f1395d4f8bb6fd25f7a95c6e.1498782014.git.wei.tee.ng@intel.com>
	<CAP9ODKoZ48A6Qp1TEvvt2mwE-LEvArjTEQim=FHE9ksvCG1U2w@mail.gmail.com>
	<CBAEED2EB06BF94889E80B47A33FE329ED6B5E@PGSMSX105.gar.corp.intel.com>
	<CAP9ODKo2hNUgt1VioyhK6Y=s-qp+bcXH1R17hWzG6yGEkUY67w@mail.gmail.com>
	<CBAEED2EB06BF94889E80B47A33FE329ED6E35@PGSMSX105.gar.corp.intel.com>
Date: Wed, 5 Jul 2017 09:51:41 -0300
X-Gmail-Original-Message-ID: <CAP9ODKowPg_xWf7hp5axCuaLvupGcTAX7=VFyxD3zuKtkHRowQ@mail.gmail.com>
Message-ID: <CAP9ODKowPg_xWf7hp5axCuaLvupGcTAX7=VFyxD3zuKtkHRowQ@mail.gmail.com>
To: "Ng, Wei Tee" <wei.tee.ng@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] initramfs-framework: udev: Add a runtime dependency on udev-extraconf
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
X-List-Received-Date: Wed, 05 Jul 2017 12:51:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 4, 2017 at 10:03 PM, Ng, Wei Tee <wei.tee.ng@intel.com> wrote:
> The existing live-boot package is consists of udev and udev-extraconf. (h=
ttp://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-core/initrd=
scripts/initramfs-live-boot_1.0.bb ) Now I am working on integrate this int=
o the initramfs-framework model. Because when it is using the initramfs-fra=
mework method, the image could not automount  which depends on udev-extraco=
nf. Therefore, I added the runtime dependency on udev-extraconf in my recip=
e file (http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-co=
re/initrdscripts/initramfs-framework_1.0.bb )  to include the same features=
 as the live-boot package.
>
> Please correct it if I get it wrong.

I understood it.

What I meant is that adding udev-extraconf rdepends to udev module is
conceptually wrong as it does not require it to work. live-boot
requires it so make a module that makes use of it. For example:
initramfs-framework-udev-automount

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


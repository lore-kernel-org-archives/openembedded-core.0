Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DCC52719E2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 21:28:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b189so12509392wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 14:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZlAHErGAciQAaw+ovbzTpaMQ5F58Fz9FIqYBtyky+bk=;
	b=tczGE4cOlVBiuCXFKrkfrIGXAavbra6x4JRDPp8gRYRaVCa8IYaHZy4T+vSqptBUMb
	znveaDYXdaRjvW4FG1VQ3HmQofEJ3B0/isHkQ0ej3UOMX6SkoPSgmYCNEMVrxZ2pSSGC
	D8FPytXai5bIkv3Wd4O1RkNxZwpzYPuR+Sl6mn0TlJPFs0mncAjrRb5CGpffWsbhE0Rz
	DDqEFVfr+DJUYS3ALYOcTGk+ruv1eQa2W+EABGyAokM0ewszNTdOcGUOKzLvkY+MdLGB
	Ddh3rKfINulWPZ+QGKQBZ4Muv/w4oOTJFH3x+CYgmyrn7D62GUVFN69PT6VwMelCAvJe
	d6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZlAHErGAciQAaw+ovbzTpaMQ5F58Fz9FIqYBtyky+bk=;
	b=Fin9sAGI685fqEt84AgGUxtAt23mhT6pTZbxXfBkekmmhVda3sK6pwUNLLZbGC+9eP
	aLTfSVUqQH9NeC+BT08OOcFUCdEsXWYIoazIT5bWbWf6TMJu2QM5T1Vmp3TuCxFs8q7t
	pQGQOZDJWl/FKY6Z5epyUQcL5m+SPYn9XTyQYnnZRRUI5iEQGTRJdJT9hxeBhC0c2bCF
	8knIF7QJvkRukwK0nGwYLAX8exCXT3z9Syc6+4SJtonVaauPMAzgfve0113YzuFJrkxJ
	Z5dJTpFDHEc4A82iBP9B4cTQQpA705/a3JPoMhgDKuA3IUKFBWUe5nH4E2UJDd9uhiKe
	vzJQ==
X-Gm-Message-State: AMCzsaUimt6UbSFmHQ+5jafVmHLl3dIs2Jw6DCEf8QI2WUUBjGtjg2TR
	HUU+LiEou4oIIe/DVxHwNZXjIkrEtlo6jvvEwds=
X-Google-Smtp-Source: AOwi7QC6LxiMim5MB8n/tKvo1ZZ8kfo+AQX1Iq9IZx8UejeI/+TVn6Tea86GuIVY/YknqOi0vjMO5sqt2y61sU11puA=
X-Received: by 10.223.186.140 with SMTP id p12mr3111117wrg.235.1507325334536; 
	Fri, 06 Oct 2017 14:28:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Fri, 6 Oct 2017 14:28:54 -0700 (PDT)
In-Reply-To: <cover.1507301999.git.akuster808@gmail.com>
References: <cover.1507301999.git.akuster808@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 6 Oct 2017 14:28:54 -0700
Message-ID: <CAJ86T=Xw7rBZ_2N2NT1kWKwspx9S88wmASx5mgxxGYcG4QqBVA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/16] Morty next pull request
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
X-List-Received-Date: Fri, 06 Oct 2017 21:28:54 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

On Fri, Oct 6, 2017 at 8:02 AM, Armin Kuster <akuster808@gmail.com> wrote:
> Cover letter only
>
> Please consider these changes for Morty.
> Clean build on AB

I guess these changes are too late for this round but please consider
for the next one:

  http://lists.openembedded.org/pipermail/openembedded-core/2017-October/142985.html

> The following changes since commit e2fcc721c2af8e2785a91eaceea1d81f503ea2ec:
>
>   devtool.py: update testcase Ids in morty (2017-09-25 22:21:45 +0100)
>
> are available in the git repository at:
>
>   git://push.yoctoproject.org/poky-contrib akuster/morty-next
>
> Alexander Kanavin (1):
>   v86d: take tarball from debian
>
> Armin Kuster (7):
>   linux-yocto/4.1: update to 4.1.43 plus bluetooth CVE-2017-1000251
>   linux-yocto/4.4: update to 4.4.87 plus bluetooth: CVE-2017-1000251
>   lunux-yocto/4.8: update to 4.8.25 plus bluetooth: CVE-2017-1000251
>   linux-yotoc/4.1: update to 4.1.43 plus CVE-2017-1000251
>   linux-yotoc/4.4: update to 4.4.87 plus CVE-2017-1000251
>   linux-yotoc/4.8: update to 4.8.25 plus CVE-2017-1000251
>   libpng: lsb version 1.2.56 url fix
>
> Bruce Ashfield (1):
>   linux-yocto/4.1: fix gcc7 compilation and v4.1.39
>
> Leonardo Sandoval (2):
>   selftest/cases/signing: ignore removal errors when cleaning temporary
>     gpg directory
>   sign_rpm.bbclass: force rpm serial signing
>
> Maxin B. John (1):
>   hostap-utils: use w1.fi for SRC_URI
>
> Nicolas Dechesne (1):
>   kernel.bbclass: fix KERNEL_IMAGETYPE(S) for Image.gz
>
> Ross Burton (3):
>   bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
>   diffstat: use HTTP mirror for SRC_URI
>   libpng: use SourceForge mirror
>
>  .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 20 ++++++-------
>  .../recipes-kernel/linux/linux-yocto_4.4.bbappend  | 20 ++++++-------
>  .../recipes-kernel/linux/linux-yocto_4.8.bbappend  | 20 ++++++-------
>  meta/classes/kernel.bbclass                        | 18 ++++++------
>  meta/classes/sign_rpm.bbclass                      |  6 ++++
>  meta/lib/oeqa/selftest/signing.py                  |  7 +++--
>  meta/recipes-bsp/hostap/hostap-utils.inc           |  5 ++--
>  meta/recipes-bsp/v86d/v86d_0.1.10.bb               |  6 ++--
>  meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
>  .../bluez5/bluez5/cve-2017-1000250.patch           | 34 ++++++++++++++++++++++
>  meta/recipes-devtools/diffstat/diffstat_1.61.bb    |  2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 ++++++-------
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 20 ++++++-------
>  meta/recipes-kernel/linux/linux-yocto_4.8.bb       | 20 ++++++-------
>  meta/recipes-lsb4/libpng/libpng12_1.2.56.bb        |  6 ++--
>  meta/recipes-multimedia/libpng/libpng_1.6.24.bb    |  6 ++--
>  22 files changed, 145 insertions(+), 102 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


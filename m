Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8DF6BEA6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 19:50:02 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id m6so3371964oag.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 12:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=TNCbhHS0QEgm61eFYFxvU2NvgEk+szcwk40i9zdRmKw=;
	b=mnjDVeqbuxysCkpGnpZ2C3fYdUhJACoEQYjRKDbe3XQWNSoWYts1vRtyLx7nDfrpfZ
	mTL7cyesfk8L1M5M3eDUM5EYpK21rKftzZPK/3ARiw0qDRy4v6T7ZmypoT3FppIVEnco
	C4IOKwEYndzCPT+Flf6rIrKVWPl7OXXu4P5fnoSmiT24CD/mwJmgg+ywS/Bkd4wqQyuN
	CSUjqZyt9HEOQF+kh218rnI1CIzcUtRDRahW1Y2aj2P+5zQdglf3IF+q3Jeb5TJ3zWmL
	vJDhw23DK8Ex+Rj6a62qL1h4sdC2F75AFs99Gn0wUbDdQAgil7CE1fepVzvURivEbKRg
	2KMw==
MIME-Version: 1.0
X-Received: by 10.182.199.74 with SMTP id ji10mr22067063obc.69.1378237802964; 
	Tue, 03 Sep 2013 12:50:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 3 Sep 2013 12:50:02 -0700 (PDT)
In-Reply-To: <1377269339-6139-3-git-send-email-otavio@ossystems.com.br>
References: <1377269339-6139-1-git-send-email-otavio@ossystems.com.br>
	<1377269339-6139-3-git-send-email-otavio@ossystems.com.br>
Date: Tue, 3 Sep 2013 16:50:02 -0300
X-Google-Sender-Auth: ia6cPdQ8FaiIxrNz-yoM9XVjkxc
Message-ID: <CAP9ODKpy3jnL8rWgJYr+COB67HM6N5Wy17gZBHn43w=YdpDdkA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH v5 2/2] uboot-config.bbclass: Allow choose of U-Boot config for machine
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
X-List-Received-Date: Tue, 03 Sep 2013 19:50:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 23, 2013 at 11:48 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Some machines provide several possible configurations and until now
> there was no easy way for user to override the default setting.
>
> This class provides a system similar to PACKAGECONFIG but for
> U-Boot. The format is:
>
> UBOOT_CONFIG ??= <default>
> UBOOT_CONFIG[foo] = "config,images"
>
> There are two possible parameters:
>
>  - config: it is used to set UBOOT_MACHINE
>  - images: it is used to append onto IMAGE_FSTYPES
>
> Below there's an usage example:
>
> ,----[ i.MX6Q SABRE AUTO based example ]
> | UBOOT_CONFIG ??= "sd"
> | UBOOT_CONFIG[sd] = "mx6qsabreauto_config,sdcard"
> | UBOOT_CONFIG[eimnor] = "mx6qsabreauto_eimnor_config"
> | UBOOT_CONFIG[nand] = "mx6qsabreauto_nand_config,ubifs"
> | UBOOT_CONFIG[spinor] = "mx6qsabreauto_spinor_config"
> `----
>
> User can, from local.conf or environment, use UBOOT_CONFIG=nand and
> override the default setting, as:
>
> ,----[ Override example from command line ]
> | MACHINE=imx6qsabreauto UBOOT_CONFIG=nand bitbake core-image-base
> `----
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Could someone provide a feedback on this? I'd like to fix the gabs on
this and propose a new version of it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5F22965DE9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 19:44:33 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id h18so2604684igc.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 12:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uebsHSPRvddZ5Sqwy7JGD49XeBKgpsgbr+BFviHr98Y=;
	b=kBI0sW7A7VW8gwLXLU8YgaEbY29eHsIz9toueplv/pGle+DP1WK1Jtll/cU/UXQZ/f
	tJrHlqNFfW1D0kbjNzLVKmc27OMoDFGhwm3JXBGKKK/cbUeYWnHS+KPpRmQ69rEih3ge
	KvHJ1udYt7IcxfS5Xq8AeOPLDFndLlpyQ5x03o3s+w3YmVw0b2OcRd1Vgea2hlTprWFk
	b3W2uXJGYGbaPW6auiBXkLD3rJNmdp1Cc5+GlgKTuu2ICFbc9wYJIrN3NiJOoUoXBJ/E
	7/4UrRGVx0uKdO5NTkhA1aTg9evVWtvB4nMS32Z1p1WySvlaYk/MgQAbNFHws3UMFTD3
	cJow==
X-Received: by 10.42.161.69 with SMTP id s5mr3203357icx.70.1398455074827; Fri,
	25 Apr 2014 12:44:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Fri, 25 Apr 2014 12:44:04 -0700 (PDT)
In-Reply-To: <1398331182.16672.175.camel@ted>
References: <1398331182.16672.175.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2014 12:44:04 -0700
Message-ID: <CAMKF1sqWdDneW7dvQrSk_owBorB2GaJpicJTCtmHz3JRk1_jHw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Improve handling of unwind.h
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
X-List-Received-Date: Fri, 25 Apr 2014 19:44:38 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 24, 2014 at 2:19 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -71,7 +71,6 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>            file://0048-PR58854_fix_arm_apcs_epilogue.patch \
>            file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
>            file://0050-PR-target-58595.patch \
> -          file://0051-fix-unwind-race.patch \
>           "
>  SRC_URI[md5sum] = "a3d7d63b9cb6b6ea049469a0c4a43c9d"
>  SRC_URI[sha256sum] = "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"

if 0051-fix-unwind-race.patch is not needed then please delete it from
metadata as well. Ideally this should have been squashed with commit
d3b02218dcfedda8e4efb43b8fa6d13af8d91f78 before push


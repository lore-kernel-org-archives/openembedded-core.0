Return-Path: <armccurdy@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7CEC160745
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 19:03:02 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id l131so5783996lfl.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9bd+Yv80MwihBETk0L+b7YaltVjAz+SU1G85bd++Eqw=;
	b=RSKUYhTSs7XGlaaVBzj08HSl96un1PnsD7VWuEMSk44rH7P+Gzy5JXk7SaNYEgob8m
	ioAQjhG2s588nsBDl02t2CcKfUoBzCJuLf7DaCp4+rSGpk199z4sxRB1covxzl4ZjY9H
	FWfXarLLmFjOqyQA4DoiNDqZXdi52lA5sMjgd1pOHxXc/EsMBkCqjqrp2yV8PydfcwKE
	5Cyx5HeT5s0TsHID2NESyjleqhKRYWoyHSyZvCQbCJq9YL1pw+taGLNBGKdKSVAzUkqL
	WO7ghM89rbfTmRX7OcsNiNnnAplr3LeldX+eJLuczTeN9BZ7in1BODPUFi+YE9dyQqJW
	IPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9bd+Yv80MwihBETk0L+b7YaltVjAz+SU1G85bd++Eqw=;
	b=kBLo7kGH7OAyRU5+E76Ou3XVfWT7Vu7PZaKB9QHy8YiAX3dPAij/D+rTqQZ7GkQusw
	y9/ljzWhJPI30zHQuIMxP7wumBjrICJb2M5Ol2eHWbL1P2+hlheMCc8UPsOSDmz0Oy5U
	jMAFzLnjm8gICVCkHPRmsDQBvVKqtJwAaHyD0FxhVL8M2N16vmlwxU39eVHXHDKkk0vZ
	nBFDFTOuzaSEEpOw4cjziFemV30honhptXNTRTWMFTIN+/2FUGeoCGoorcFsLI2BaGCK
	i/OAgcSU3aRnCiHJQDnP1UYCO4L8gOvIAs81UAeAqflnyfIWjLkkbER6uG4dvrFuUiYT
	8g+Q==
X-Gm-Message-State: AA6/9Rke2Alm42sPeoat2RGHATAfxGNXmaT1ebc3kNo7iHT+pOhJLT6ZK9AKCZRL3dJL014pM12V0YwtuIHsuA==
X-Received: by 10.194.175.166 with SMTP id cb6mr3655008wjc.220.1476298983555; 
	Wed, 12 Oct 2016 12:03:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.155.103 with HTTP; Wed, 12 Oct 2016 12:03:02 -0700 (PDT)
In-Reply-To: <1476276760-56560-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1476276760-56560-1-git-send-email-Zubair.Kakakhel@imgtec.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 12 Oct 2016 12:03:02 -0700
Message-ID: <CAJ86T=UMHN9voJDxSYPf3aizy8eDsVV8k2XPjDOHGwrbR9R2Ww@mail.gmail.com>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmp: Disable assembly for MIPS R6
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
X-List-Received-Date: Wed, 12 Oct 2016 19:03:05 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 12, 2016 at 5:52 AM, Zubair Lutfullah Kakakhel
<Zubair.Kakakhel@imgtec.com> wrote:
> gmplib has some assembly routines. These have not been optimized
> for MIPS R6 yet. Add --disable-assembly so that the C implementation
> is used.
>
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  meta/recipes-support/gmp/gmp_6.1.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-support/gmp/gmp_6.1.1.bb b/meta/recipes-support/gmp/gmp_6.1.1.bb
> index 303c3ef..430ce93 100644
> --- a/meta/recipes-support/gmp/gmp_6.1.1.bb
> +++ b/meta/recipes-support/gmp/gmp_6.1.1.bb
> @@ -21,6 +21,10 @@ SRC_URI[sha256sum] = "a8109865f2893f1373b0a8ed5ff7429de8db696fc451b1036bd7bdf95b
>  acpaths = ""
>
>  EXTRA_OECONF += " --enable-cxx=detect"
> +EXTRA_OECONF_mipsisa32r6el += " --disable-assembly"
> +EXTRA_OECONF_mipsisa32r6   += " --disable-assembly"
> +EXTRA_OECONF_mipsisa64r6el += " --disable-assembly"
> +EXTRA_OECONF_mipsisa64r6   += " --disable-assembly"

These over-rides will cause --disable-assembly to completely replace
the original value of EXTRA_OECONF, rather than being appended to it.

A typical solution is to use an intermediate variable, something like:

DISABLE_ASSEMBLY ?= ""
DISABLE_ASSEMBLY_mipsisa32r6 = "--disable-assembly"
DISABLE_ASSEMBLY_mipsisa32r6el = "--disable-assembly"
DISABLE_ASSEMBLY_mipsisa64r6 = "--disable-assembly"
DISABLE_ASSEMBLY_mipsisa64r6el = "--disable-assembly"

EXTRA_OECONF += "${DISABLE_ASSEMBLY}"


>
>  PACKAGES =+ "libgmpxx"
>  FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


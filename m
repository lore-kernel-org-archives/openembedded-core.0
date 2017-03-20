Return-Path: <phil@advancedtelematic.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id F260360777
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:17:43 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n11so58798697wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=advancedtelematic.com; s=google;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=5HDLwwBTAyql/+4BnbG/sLnZswSZ6X0nJ/4Smmy3G+o=;
	b=YHlT/VeRkHYSMJtBkkBiQh7tmCNZnJt6LJQP6uLD4Virb60o/2EoCf6oNO5tY49j7u
	CuAKM7gDOwJk5fQCJQ8eKj1zeloVYR0FdKhse12tVUveKJaztGMlE8N0OSppocSyz9Cd
	oZ5281sOf44tYrL/UDvpkBp6nFoi/47yRb3cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=5HDLwwBTAyql/+4BnbG/sLnZswSZ6X0nJ/4Smmy3G+o=;
	b=A5YFY6UMO95kXoB/7/BEC7hMuNUZ+/H9k4PwCakwUA1UCJ17dP6qIBiifMVIYs2TlY
	DcqAhn0SP3TWPBE4IJK1eT2hUmXb9bl/G5a09sRUg/zHeTkiFcLckZCwS0AtFA0mGChp
	h5rPcRbpbvlKHMfuL5sofRRzykJf12Vc+X6Fu6yExYf+3myR4VU5/4BAYd5K1BhzgUZd
	3eGZI+h3vcvCdcN+w/rYz0VTDBA6DNn8FvxqZDMkSgX5JshmwynEhpG0Ma2+erUb/E4X
	8uVQokvSg6gDTitgnTmvgQpBigj4fgJZJMAdBnxVZIhvNXa1YjY/onso4Upg+jAVyJwa
	U75g==
X-Gm-Message-State: AFeK/H1YYbgcqvlr95RtpKm/U8UR6z+gzgxhzqR83Xbyc2z6OfWo7vOLpeCT8hLsUPC4SA==
X-Received: by 10.28.203.197 with SMTP id b188mr9850530wmg.110.1490001464407; 
	Mon, 20 Mar 2017 02:17:44 -0700 (PDT)
Received: from [192.168.1.93] (p57bf9f95.dip0.t-ipconnect.de. [87.191.159.149])
	by smtp.googlemail.com with ESMTPSA id
	x23sm20154881wrb.49.2017.03.20.02.17.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 02:17:43 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1489793040-52384-1-git-send-email-denis@denix.org>
From: Phil Wise <phil@advancedtelematic.com>
Organization: ATS Advanced Telematic Systems GmbH
Message-ID: <f84482e5-e903-fb47-a803-c980d8f7ea77@advancedtelematic.com>
Date: Mon, 20 Mar 2017 10:17:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1489793040-52384-1-git-send-email-denis@denix.org>
Subject: Re: [morty][PATCH] file: update SRCREV for 5.28 to fix fetch fail on missing commit
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
X-List-Received-Date: Mon, 20 Mar 2017 09:17:44 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

I hit this issue when doing a build this morning, and filed this bug
before seeing your patches:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=11190

Cheers,

Phil

On 18.03.2017 00:24, Denys Dmytriyenko wrote:
> From: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> Machines that cloned a while ago will have the commit, but new
> deployments won't because it seems the upstream changed/rebased
> and the old commit ID has been garbage-collected away.  Hence
> the fetch fails to check out the named commit ID.
> 
> Both the old (gone) commit, and the "new" commit show the same
> dates and commit log and point at 5.28, so hopefully this is
> the right thing to do.  A git diff of the two seems to only show
> a blanket uprev of CVS tags and deletion of a couple autogen'd
> files, and no real source changes.
> 
> (From OE-Core rev: adb71e06768adadda7b69c3b5e81ca3ad67237f4)
> 
> Cc: Christos Zoulas <christos@zoulas.com>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-devtools/file/file_5.28.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/file/file_5.28.bb b/meta/recipes-devtools/file/file_5.28.bb
> index e64a89c..048fb8e 100644
> --- a/meta/recipes-devtools/file/file_5.28.bb
> +++ b/meta/recipes-devtools/file/file_5.28.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
>          file://0001-Add-P-prompt-into-Usage-info.patch \
>          "
>  
> -SRCREV = "3c521817322a6bf5160cfeb09b9145ccde587b2a"
> +SRCREV = "acbaf156236cbc54b3cf3bc6cbf05d80cb196451"
>  S = "${WORKDIR}/git"
>  
>  inherit autotools
> 

-- 
Phil Wise, ATS Advanced Telematic Systems GmbH
Kantstrasse 162, 10623 Berlin
Managing Directors: Dirk Pöschl, Armin G. Schmidt
Register Court: HRB 151501 B, Amtsgericht Charlottenburg


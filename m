Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F99E7D3D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 07:30:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h1so14644162wro.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2019 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=4a+ykvz+lo2laAwmZGbFRnOcWxA7vu0gaFGkh4FrBgA=;
	b=d7HJ16+VrTyW91MIflmAlc/728RXwKGyiEBPa6xDVhExOAHHmGNhg3zoetV0p4FMu+
	NBickfSqfMonb/t1YRUVJjpoWpp/HRNt/lIMypdJfYxRJnyMXtvZYaqDdQgqZVOqNNCG
	liLDyGSuJnxX1PqEDTZ/CdrP9I6LnDyvkZyWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4a+ykvz+lo2laAwmZGbFRnOcWxA7vu0gaFGkh4FrBgA=;
	b=D3Hc/UzTzthwMOHVUk3eU0u4ye5c9uZRTtuBMHTX3YRX5gTfebOX08m2UUSt9Drqpy
	FGeEO+L+uXL6UmOCOTuIEl9gdCmgbZ3Q0wBOYaN32ntEsQ3kwuf7+BgykWqsIRpa17/X
	nYIaU+F48iYaMaJUPAsmN7atpDXgYFZjx/jDEE9zu0yT9fR4u71vefY/tszCoaHIaUG4
	9gXZMZWVd7dKq0EAgsgoiSc5//d+VJRuN7p00t4IioLpgsjpEUC893QS+FT3NMdk9Ncv
	/QvohfCZ0IhAKZpVnuA7ubgldJBJ9Cx3K8qflILX/31O0YJtOa8EH4MDqrJRzV6Lms9r
	ICYA==
X-Gm-Message-State: APjAAAXDxosgsYehbMIV3rdhaW49kc1CEyyUzQRQPw4GQRkxy8sAZ8/i
	jGv5zohvYw29sySKUlLw+dHeJg==
X-Google-Smtp-Source: APXvYqyQrrxCdYaxgYuSSi+lJ8gePFFexmFOhr6tuwYBqlyiDBifPXqye2f/DZwfT0wHt1PI6S2cgg==
X-Received: by 2002:adf:e60f:: with SMTP id p15mr8454127wrm.332.1559633401651; 
	Tue, 04 Jun 2019 00:30:01 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j15sm5974306wrn.50.2019.06.04.00.30.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 04 Jun 2019 00:30:00 -0700 (PDT)
Message-ID: <e620b7a55a79992dfb63547081cf4b1b77d2a587.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 04 Jun 2019 08:29:59 +0100
In-Reply-To: <20190603152719.17295-1-JPEWhacker@gmail.com>
References: <20190531165734.14435-1-JPEWhacker@gmail.com>
	<20190603152719.17295-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] bash: Replace uninative loader path in ptest
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
X-List-Received-Date: Tue, 04 Jun 2019 07:30:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-03 at 10:27 -0500, Joshua Watt wrote:
> The Makefile used for bash-ptest can pick up the path to the
> uninative
> loader through BUILD_LDFLAGS. This includes the full path to the
> uninative loader, which is not reproducible. Replace it with
> /bin/false.
> It doesn't appear as if these native programs are used in the test
> suites and if there are likely to be other problems related to
> building
> them using the BUILD_* flags.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-extended/bash/bash.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-
> extended/bash/bash.inc
> index dbb803ddefd..27207c38853 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -78,6 +78,7 @@ do_install_ptest () {
>  	    -e 's|${DEBUG_PREFIX_MAP}||g' \
>  	    -e "s,${S},,g" -e "s,${B},,g" -e
> "s,${STAGING_DIR_NATIVE},,g" \
>  	    -e 's:${HOSTTOOLS_DIR}/::g' \
> +	    -e 's:${UNINATIVE_LOADER}:${base_bindir}/false:g' \
>  	     ${D}${PTEST_PATH}/Makefile
>  }

Even the UNINATIVE_LOADER reference causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/497

i.e.

 oe-selftest -r sstatetests.SStateTests.test_sstate_32_64_same_hash

still fails with this patch.

Cheers,

Richard



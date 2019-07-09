Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id E22E27D717
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 01:11:39 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m4so8556810pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 18:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=X+WzlXJL/0ZiqF9Uf6j9tqEzQbbzZZO4L1UqPZMZghU=;
	b=iXlropE+2X+bXWViBwPjZI/pszYBjfzEWHso3PlpC3HdP6unYaKrvwwRRk+FugVYV+
	6ZtY3WVzERtaa6Vps210Klyb7UswxHiHVJUsuTEeGXj6PagtIZi80U8s3unLm1O8a72S
	zwjcH9iOEf+g93J/VIGCFG83B652QA7kYbhITh3rDWS8wrrs/KyH09cY2L2sZxIFDdLz
	a5jp9xpwwA0FiRCNh6ur3xxzaLZqmnpROjghNWJSLkDfuGfF3R0ns1DyTFBELjaNxUZ1
	3W2wQ6mZZoZKfW2vqrSbnb9mN4m65H26oGIlJOhKkjgloY1YxIhQOWLe31SnT5vkck69
	hF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=X+WzlXJL/0ZiqF9Uf6j9tqEzQbbzZZO4L1UqPZMZghU=;
	b=YWM2n/vhG19sV1cAFYzlL1fE1YbxMF5oD2gFHUuK8jYWiqO7h+svEc0MtNNs704ORP
	pDu4HN/FjxUPz7Tu5vmvYnbWXCaCpuMkT4qY2EQ+TQSY7S88rXnFZmPGL2JoiP1yASwl
	YLR6tYOfrp8PrWN4Y1lMvb5XUyDnQyLUFq3qq+qQs+rK/Nh7RFDRBFqig+nn9rWRRRF7
	51oL3JXs4MIBTARSwiE0AycHnTKwc1GNrE4n13gKcVB0cR09uGwhOCCiXHEs79JGqwny
	xMEPwuVKbqXvpDppSstEpmd0aVXDVuKWbZXBUyzAB7lN1iAlFX5xcZTSDTt2a7poq0Xd
	ijuA==
X-Gm-Message-State: APjAAAXn/FGxib81Dp99HPVdtzGrWHTQIRtUiQoXik+IbtSP7kt6f4pw
	uUtH/tlndb/1AeyUcVeEELyZyIrKdQ/P5g==
X-Google-Smtp-Source: APXvYqx3ou74Zf89NNX5MDWnnJYuGbhSL102dHbjkUSzAuiWbnr26OiCSDHA1JuNZaZmSyv7qmYrSg==
X-Received: by 2002:a17:90a:dac3:: with SMTP id
	g3mr29246172pjx.45.1562634700858; 
	Mon, 08 Jul 2019 18:11:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:693b:41d3:261b:3345?
	([2601:202:4180:c33:693b:41d3:261b:3345])
	by smtp.gmail.com with ESMTPSA id
	q22sm10969281pgh.49.2019.07.08.18.11.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jul 2019 18:11:38 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20190708234643.15636-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ec99b2a2-dd19-e386-87bc-093e7e35aa47@gmail.com>
Date: Mon, 8 Jul 2019 18:11:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708234643.15636-1-ross.burton@intel.com>
Subject: Re: [PATCH] buildhistory: don't output ownership for the sysroot
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
X-List-Received-Date: Tue, 09 Jul 2019 01:11:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/8/19 4:46 PM, Ross Burton wrote:
> As the sysroot isn't ran inside pseudo the ownership is whoever is running the
> builds.  In a setup where multiple builders all contribute to a shared
> buildhistory writing the ownership data isn't useful, so just replace it with "-
> -".

Should this be backported?

- armin
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/buildhistory.bbclass | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index baa7c8e2799..5bf27268107 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -67,7 +67,7 @@ PATCH_GIT_USER_NAME ?= "OpenEmbedded"
>  
>  buildhistory_emit_sysroot() {
>  	mkdir --parents ${BUILDHISTORY_DIR_PACKAGE}
> -	buildhistory_list_files ${SYSROOT_DESTDIR} ${BUILDHISTORY_DIR_PACKAGE}/sysroot
> +	buildhistory_list_files_no_owners ${SYSROOT_DESTDIR} ${BUILDHISTORY_DIR_PACKAGE}/sysroot
>  }
>  
>  #
> @@ -537,6 +537,20 @@ buildhistory_list_files() {
>  	fi | sort -k5 | sed 's/ * -> $//' > $2 )
>  }
>  
> +buildhistory_list_files_no_owners() {
> +	# List the files in the specified directory, but exclude date/time etc.
> +	# Also don't output the ownership data, but instead output just - - so
> +	# that the same parsing code as for _list_files works.
> +	# This is somewhat messy, but handles where the size is not printed for device files under pseudo
> +	( cd $1
> +	find_cmd='find . ! -path . -printf "%M -          -          %10s %p -> %l\n"'
> +	if [ "$3" = "fakeroot" ] ; then
> +		eval ${FAKEROOTENV} ${FAKEROOTCMD} "$find_cmd"
> +	else
> +		eval "$find_cmd"
> +	fi | sort -k5 | sed 's/ * -> $//' > $2 )
> +}
> +
>  buildhistory_list_pkg_files() {
>  	# Create individual files-in-package for each recipe's package
>  	for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do



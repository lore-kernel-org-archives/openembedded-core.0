Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 520DA70B38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 02:47:12 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so4030417pdi.17
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 19:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=xQUTSOdyDIjkxMtKk5ilX/N4CJfzYoEL6x5UcFeyVIk=;
	b=QKZGJmIgCKCRig12ktK7Pa8wsm1HPg3uCsjafsaT/BYKu92+4kcaD4ZGAaMgjXK5ss
	ZPi6n77Z4CnJcYFG8sPI+6dZdz2ZtDkT7gk2P+3iy3S/cKEZ6p4HR6BsZCCAZm75q83a
	9uI17DFzsPlmiV0wcmXoWJmqgrKFeQHpB3eab1p1I2zZXncdnifqUPc1tmzceAQAQgvK
	7ABz6RnhA54VVAwNcngGQDEtl67p7IVONLUlewR5w/AFupOZ28bAOP0Xcfvb3gJ07zXp
	kF/CMTQ0qebsct62+cOb6k+qSyme7VV8u3TnRoNt3Ic3m4OQRkIIlueHcrkBJuAvcdBn
	/g0Q==
X-Gm-Message-State: ALoCoQlLvCfqWcMn5eSrrd6M6IiKBBflm2AHmFASW6hFoAnztQ7sMQ/WcH2SxUcgixXXb8AubMlL
X-Received: by 10.66.142.166 with SMTP id rx6mr498375pab.128.1407725234485;
	Sun, 10 Aug 2014 19:47:14 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:35b9:fa54:d802:ee1f?
	([2601:c:9380:601:35b9:fa54:d802:ee1f])
	by mx.google.com with ESMTPSA id
	os4sm15094074pdb.67.2014.08.10.19.47.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 19:47:13 -0700 (PDT)
Message-ID: <53E82EAF.6080603@mvista.com>
Date: Sun, 10 Aug 2014 19:47:11 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1407663535-6484-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1407663535-6484-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [daisy][PATCH 1/2] perf: explicitly disable libunwind
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
X-List-Received-Date: Mon, 11 Aug 2014 02:47:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/10/2014 02:38 AM, Martin Jansa wrote:
> * it's not included in DEPENDS and it's detected from sysroot
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Armin Kuster <akuster808@gmail.com>

> ---
>   meta/recipes-kernel/perf/perf.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 20968f9..9776943 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -76,7 +76,7 @@ EXTRA_OEMAKE = \
>   		CC="${CC}" \
>   		AR="${AR}" \
>   		perfexecdir=${libexecdir} \
> -		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
> +		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 NO_LIBUNWIND=1 ${SCRIPTING_DEFINES} \
>   		'
>
>   EXTRA_OEMAKE += "\
>


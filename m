Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 999C160557
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 16:18:09 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id ts6so11603133pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 09:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=dXCS7VMPob+A0VDb/RqkdOhzn6HU6S9ff02380A3D5k=;
	b=rpGwVIjpJ+54DqJTb638U9v6Xu4oex0im40tsa5v3BuHPALWCL12ugGiSBxIValSuI
	IACmTgtkMaxgIcBHZqVBNfBWhMQUZcmM2QWc9+aJHgNrv1VHBRwhPy//STgI1hyNxf4G
	XNmbGVNdj8sciU0GGj0uRa4WDeo4RUKMYK9MOa/xUnT5Jn+biY4V6VE0GivSDWXzao9Z
	HFTaYdDs2kw9sbz5OFsmHM+fTsVeEhuEkJX4JH6vSmNEltaC8UGWQeFXrVsVt80HoBQK
	KoKrJl68gWdF7sOS1bMmqnwwJJ5ZKPU7ohNseSEySvv828wHuOYfU4GxpguyolmHJLE6
	Q4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=dXCS7VMPob+A0VDb/RqkdOhzn6HU6S9ff02380A3D5k=;
	b=JBDElmYdzSncCydZ1feyiIu394fJt22JSJNi+Dy8Fl5ptgeUZM+f1KOicufbXBbZOE
	7t72DFBFBMOi1Mht5yl829RFCBmmCMn25oGknXcWkiO6aHEYSu6p55VAKHA4hywEQBTQ
	biUumcomL7HXyToNiGlndVEgVy/vtTfvZkVUgDFP8uMfSji8RzcE6rNZ3l4BDPUGWNbe
	K2C3bEumNd39ZeokmRrScQdPxXv95bRMXDmuTF0tvr0QanesO+NHOqabyL2XRus6uHf2
	NBMy7gz7U3xk8DL5C31kS39vnxbaIUY0NnJIDEPwN2LNJ4EarA+fwuqZahpd8nfOB3bE
	SKSA==
X-Gm-Message-State: ALyK8tLKGbEp2hktgTGz5V2iaFImBCVWaLpJ+qqaIJJJOAW3oZRBhe/vQiPmv1732bP7Hw==
X-Received: by 10.66.77.194 with SMTP id u2mr17881318paw.90.1466871489843;
	Sat, 25 Jun 2016 09:18:09 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:7088:5913:fd08:49ed?
	([2601:202:4001:9ea0:7088:5913:fd08:49ed])
	by smtp.googlemail.com with ESMTPSA id
	x67sm730290pfa.56.2016.06.25.09.18.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Jun 2016 09:18:08 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-core@lists.openembedded.org
References: <1466765910-22989-1-git-send-email-git@andred.net>
	<1466765910-22989-2-git-send-email-git@andred.net>
From: akuster808 <akuster808@gmail.com>
Message-ID: <576EAEBE.10108@gmail.com>
Date: Sat, 25 Jun 2016 09:18:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1466765910-22989-2-git-send-email-git@andred.net>
Subject: Re: [PATCH 2/4] uclibc: don't compile in mips16e mode
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
X-List-Received-Date: Sat, 25 Jun 2016 16:18:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Are these Krogoth worthy?

- armin

On 06/24/2016 03:58 AM, André Draszik wrote:
> From: André Draszik <adraszik@tycoint.com>
> 
> uClibc contains hand-written assembly which is not compatible with
> the MIPS16e mode.
> 
> Signed-off-by: André Draszik <adraszik@tycoint.com>
> ---
>  meta/recipes-core/uclibc/uclibc.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
> index 57f87fa..02cd8d1 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -63,6 +63,10 @@ EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
>  CFLAGS_remove_arm = "-fno-omit-frame-pointer"
>  UCLIBC_EXTRA_CFLAGS  = "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
>  
> +# Doesn't compile in MIPS16e mode due to use of hand-written
> +# assembly
> +MIPS_INSTRUCTION_SET_pn-uclibc = "mips"
> +
>  configmangle = '/^KERNEL_HEADERS/d; \
>                  /^RUNTIME_PREFIX/d; \
>                  /^DEVEL_PREFIX/d; \
> 


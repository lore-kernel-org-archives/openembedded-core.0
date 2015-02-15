Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0072B7350F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Feb 2015 00:19:26 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so22854569pdb.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Feb 2015 16:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=834isoOb3LOrtvMjgXusa2rwxC057mZRDXyZwkZTJ3E=;
	b=cwItAymfJXO0zxJ6GqD1d5HIazuPc8mYis01cxP+8WKcEvpFPLEkZFkf+6ofjyGZ7Y
	MRf47bacaLbHasdt96F11BJPrrP4DAgUSJ/J6W2LL+5cWCAQppqJdieIR2DbPzkZeE7y
	A0k209YQW9kq7TOzHmpl8myO/xEE/MNFnwNhOFnTO6K47ECzneQNQYlxkBiNnvmHJNmx
	+WE56zIcEZWifoA0tU0TXEco33T1x0DLZyqR8nw5IeZwhmipfgK/uSmEdHZfLLa74TUQ
	Cl4FH7vnMRUsTj4DsXIc9b5+Jkvlkzn67+RpvqqbzjEYn4oZyjdd03AVqkeShnMBcrxo
	mc8g==
X-Received: by 10.68.69.110 with SMTP id d14mr27103390pbu.3.1423959567454;
	Sat, 14 Feb 2015 16:19:27 -0800 (PST)
Received: from ?IPv6:2601:c:a740:854e:ec51:784:6500:b473?
	([2601:c:a740:854e:ec51:784:6500:b473])
	by mx.google.com with ESMTPSA id f10sm1215513pds.37.2015.02.14.16.19.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Feb 2015 16:19:26 -0800 (PST)
Message-ID: <54DFE60A.3080207@gmail.com>
Date: Sat, 14 Feb 2015 16:19:22 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1423602582-7123-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1423602582-7123-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH][dizzy] linux-yocto-tiny_3.17: Update to actually use 3.17 git repo
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
X-List-Received-Date: Sun, 15 Feb 2015 00:19:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

merged into staging.

thanks,
- armin

On 02/10/2015 01:09 PM, Saul Wold wrote:
> The named release was still using the -dev git repo which did not contain
> the SRCREV referenced in the numbered/named version.
>
> (From OE-Core rev: b4f2f39ce0f4690ed51d14d1034b9f5e21c0f5a0)
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
> index eae0854..5762f3b 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
> @@ -13,7 +13,7 @@ SRCREV_meta ?= "84b57b01050dd9e5a004e265e70120e2a792f38a"
>
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
> -SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>
>   COMPATIBLE_MACHINE = "(qemux86)"
>
>


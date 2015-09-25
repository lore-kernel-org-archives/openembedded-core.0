Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5F476FFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 23:34:20 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so118337916pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 16:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=UkaKi9fq+7rGQZXMHWCEMKjf4tdwluv0jojRnxffMBw=;
	b=D7gJc6lBpjFTbxswHBr0+PXm449FmNK6sHKd7LOpntULMPEgOHYI73eCl2HifmFKiX
	5CIwLj9Tt60GT6EajY1xQ+K35kkg2sQK+EpeUOjE+VLsxd0A+PDdgrsuQCFAnuCRFCGF
	BklSbHrDRWt7ReT3IUcU1No1ws7CfzpgOMUpxCQXfLzgR/HtCdFaWcs+ipNduP6rkql+
	OFhoaT6jBuOqqZ8F3J4uu4Pjjt46CUiD+aVb1DPiBWQlF/lmAN7zceYbger2rR2XpQdO
	CcQ9ViHLrspiNXfAnxh2Q1RvIT01brhLcVjNbP6/CUKDUszYHN5qhdMbcrH9gPqzDvnu
	Euxg==
X-Received: by 10.68.108.101 with SMTP id hj5mr10526098pbb.156.1443224060841; 
	Fri, 25 Sep 2015 16:34:20 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by smtp.gmail.com with ESMTPSA id
	tk4sm5893679pab.45.2015.09.25.16.34.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Sep 2015 16:34:20 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1443224061-4281-1-git-send-email-net147@gmail.com>
From: Jonathan Liu <net147@gmail.com>
Message-ID: <5605D9F6.2000500@gmail.com>
Date: Sat, 26 Sep 2015 09:34:14 +1000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443224061-4281-1-git-send-email-net147@gmail.com>
Subject: Re: [meta-oe][PATCH v2] opkg: create opkg.lock in /run instead of /var/run
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
X-List-Received-Date: Fri, 25 Sep 2015 23:34:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2015 9:34 AM, Jonathan Liu wrote:
> This avoids a "Could not unlink" warning when extracting a /var/run
> symbolic link pointing to /run from the base-files package as it is
> unable to unlink the /var/run directory when it contains opkg.lock.
>
> This also fixes an issue where /var/run is created as a directory
> instead of a symbolic link to /run.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> Acked-by: Anders Darander <anders@chargestorm.se>
>
Whoops. Wrong tag. Resubmitting for OE-core.

Regards,
Jonathan


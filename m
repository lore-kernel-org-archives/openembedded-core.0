Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id CD3B9600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 00:37:12 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so1735914qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jun 2015 17:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=jtJMuoYPPUjL3Lx5YR/RGf4D4XbdIFTgAvP4LfhNFvI=;
	b=mqdiK16h4Vd6E7GZIwwY7G69lQZBkeLKaHVJJH1OYA4iwJNzAwvr45u2EFM5Lbftgd
	XIt4DprCOvxqmNEkmheWJo2zV//Zob3qCSVNA/841uI9tzXRqeOeXNg6NocHbPohOi/5
	Ica5KV+aDlllg9BfHae/eoKaT6csc9QE1JpHgI4xB1aOSX+IE2Yz33eN472JCkuoHpBP
	lwZivtslE7QJ0escl9iIMzz7afR73A4Esb+b/Bfh1U/QPx8aTWRl0+l4W5GOwti+jMBH
	thIB4U+umf/yI1LFsA4dM47KtZt/jLLNalYYysVOBSP7yZ+Oz+rneGbw3aTnNdsRKwWd
	RSzg==
X-Received: by 10.55.25.134 with SMTP id 6mr37510178qkz.13.1433810233484;
	Mon, 08 Jun 2015 17:37:13 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:a919:2437:5eaa:b303?
	([2601:c:a700:3ba7:a919:2437:5eaa:b303])
	by mx.google.com with ESMTPSA id z13sm1973818qkg.44.2015.06.08.17.37.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jun 2015 17:37:12 -0700 (PDT)
Message-ID: <55763532.9010809@gmail.com>
Date: Mon, 08 Jun 2015 17:37:06 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1433771147.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1433771147.git.alejandro.hernandez@linux.intel.com>
Subject: Re: [PATCH 0/2][dizzy] python-nose and python-contextlib backports to dizzy
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
X-List-Received-Date: Tue, 09 Jun 2015 00:37:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Alejandro,

great.  I pull these in.


thanks,
- armin

On 06/08/2015 06:56 AM, Alejandro Hernandez wrote:
> I would like to backport both python-nose and python-contextlib to dizzy, they were
> added to master in the following commits respectively:
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7282635343e0ccf7a82ffdb35905bdc2db6093d3
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7f58a85337a0712802bdb604a58985a8800b6477
>
> I would like to include python-scipy, and these are build dependencies for it,
> more specifically for iot builds which currently use the dizzy branch
>
> The following changes since commit 9c4ff467f66428488b1cd9798066a8cb5d6b4c3b:
>
>    split_and_strip_files: regroup hardlinks to make build deterministic (2015-05-15 18:13:40 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib hsalejandro/iot_backports
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/iot_backports
>
> Alejandro Hernandez (2):
>    python-contextlib: backport to dizzy
>    python-nose: backport it to dizzy
>
>   meta/recipes-devtools/python/python-2.7-manifest.inc | 10 +++++++---
>   meta/recipes-devtools/python/python-nose_1.3.6.bb    | 16 ++++++++++++++++
>   scripts/contrib/python/generate-manifest-2.7.py      |  3 +++
>   3 files changed, 26 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-devtools/python/python-nose_1.3.6.bb
>


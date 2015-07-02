Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 43363607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 17:04:56 +0000 (UTC)
Received: by pdbci14 with SMTP id ci14so48112265pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 10:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Rad+3Vgz5QjTeDbqMj5kYZxlbkszMshqAfrZCvjjtYs=;
	b=Z/+9+P7Uo4vzA1RbDFVtqxoWxg/ah2ILN0f7ZaHW0/oOyqowXizzjBsF9bdNWUClfn
	R5ZFNY4p+aCPqPOB+os7yaOnN1gsdss0+335CBxwGF7/gL2eT8ZE82UIB8Cahwh2yzMC
	ZDUqs909vWhgNKFOr1BgFGaI6czRezP9pKEGptddDBPmZz894BvQGoXbd3u4oVVAaocK
	BaJuFttBRwB1UmsDjfS0tGqtQ7R4ebOeM+Wedee2a1jis2VlN+YNBL3IQZsiPGBeVsxj
	0Y6Bkd4yUmwDv0Gnt9jwTZ1P9of59uEpykNqpylttG2HTE5TP7cTYK04xkV4Cfcz/mHb
	L78A==
X-Received: by 10.66.221.39 with SMTP id qb7mr60980644pac.59.1435856696815;
	Thu, 02 Jul 2015 10:04:56 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:fd0f:148b:b7ea:7d8b?
	([2601:202:4000:1239:fd0f:148b:b7ea:7d8b])
	by mx.google.com with ESMTPSA id z6sm6265023pdi.88.2015.07.02.10.04.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jul 2015 10:04:55 -0700 (PDT)
Message-ID: <55956F2C.2040301@gmail.com>
Date: Thu, 02 Jul 2015 10:04:44 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Thu, 02 Jul 2015 17:05:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The current version of nettle 2.7 has one file that is GPL v3.
mini-gmp.*

so the license for 2.7 should be updated IMHO. So wont that put us in 
the same boat as the upgrade?

- armin


On 07/01/2015 03:42 PM, Burton, Ross wrote:
>
> On 28 June 2015 at 14:18, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     this requires the gnutls 3.4.1  update or the current gnutils build
>     will break.
>
>
> This appears to brake our partial support for building core-image-base
> without GPLv3:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/372/steps/BuildImages/logs/stdio
>
> Either we trim down what we consider buildable without v3, disable
> gnutls in iputils, or include the older versions in oe-core.
>
> Any thoughts?
>
> Ross


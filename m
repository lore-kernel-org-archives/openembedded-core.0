Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 26B09768B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 20:14:01 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so8545427igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 13:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=mBRVMvaUchZPaLmFGX/8QNh9H5Ucs306AWLeSSIf0wE=;
	b=MSL5zYXtt6UVEsiWsZ5M3RCHrJTXC+L+zwurybNeQB4KVbMN01f5i7VZFaS8L2UkQ0
	DgKD0b5jaVLVLFGluSDS86QDABtLBt0ITAx/9hFmTFmb2QUk8SO3QlYhaIuV6iQEOWj3
	x0dKjwtvaTftIfl83kFZsZ8FzeWYt/zn2ClrzNADck+weR01u/+jnMbMZ0BZQvoBTV4V
	FcTQLedbTIK6IY239wnuvv2NJBy2PcHFrQUexSJxSu4lomVHPgfoLFBblveGPVAa2CXt
	wc+Lo/5U5cRNh0g8A1uKBt/UdVFtiZ/L9Wnx1rdMi1o+gY6V8eyc7r4R6qUCo/hYgL3V
	TGcA==
X-Gm-Message-State: ALoCoQm7Rcf4F1c15lqAoAFeftsiON9HI3gB9+J5QPbNiukFuh6GjgRNdYEG+ZEoCHFzyZBjgO6c
X-Received: by 10.50.45.34 with SMTP id j2mr14411585igm.53.1439237641437;
	Mon, 10 Aug 2015 13:14:01 -0700 (PDT)
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com.
	[209.85.213.169])
	by smtp.gmail.com with ESMTPSA id v18sm6547009igr.3.2015.08.10.13.14.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Aug 2015 13:14:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbjg10 with SMTP id jg10so8544987igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 13:14:00 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.50.239 with SMTP id f15mr6211081igo.19.1439237640258;
	Mon, 10 Aug 2015 13:14:00 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Mon, 10 Aug 2015 13:14:00 -0700 (PDT)
In-Reply-To: <CAJTo0LZpPm1UGdw-ASy3bAH5RVZEHTwh_jEu34_mz3A2zkbn2w@mail.gmail.com>
References: <1439236066-20015-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LZpPm1UGdw-ASy3bAH5RVZEHTwh_jEu34_mz3A2zkbn2w@mail.gmail.com>
Date: Mon, 10 Aug 2015 17:14:00 -0300
Message-ID: <CAP9ODKqXYDCThwnMPHDHkzsHs-PH3HPSiddCqCsraprRzmT6GA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] mesa: Provide virtual/libopenvg
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
X-List-Received-Date: Mon, 10 Aug 2015 20:14:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 10, 2015 at 4:57 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 10 August 2015 at 20:47, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>
>> There are other GPU drivers which provide alternative implementations
>> for libopenvg thus a virtual/libopenvg should be available for proper
>> dependencies to be specified.
>
>
> As of mesa 10.6.x (queued in master-next) OpenVG support was removed, so
> this is obsolete now.

So it does not offer OpenVG support anymore? What about mesa-demos?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


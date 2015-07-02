Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 66E7065C60
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 22:02:37 +0000 (UTC)
Received: by pdjd13 with SMTP id d13so51800507pdj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 15:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=YdN70Bt7qTA0uYhmXqJHKKel1eQ+c4FpGQE0pBT7Alw=;
	b=gQ7NZjcJE/XZiIPXMOrTUWGYlvWB7jEjn7sTEEoEGtkX5zZKTpkMC2NOm8oJnR5RW1
	Rl3227Om8R/QpIx919neMfi5AdL98mHxrk7hZkBIwJBxdNvnKKFUVwFwyQlo13ip8++L
	St6ymgpuNMi7RNugOipHEUwkKtnB2Bz6vVP/ViMJ3732Uii8ljXQat/kWqg4VGZ8lf1e
	0w1eDjGbok3rZnEv3E92WYf5X1IvFaSHNON4U7Ka2swPHtEr5gbwMqNALp7v3+JaWJwN
	9yCfAHUB/oo9Occ8NkRcKABSHqdlE2Y4RO/hlGcicXvsT82OYKdC+4lQmzuQRjv2JFXS
	vOBA==
X-Received: by 10.66.66.197 with SMTP id h5mr71845462pat.29.1435874558011;
	Thu, 02 Jul 2015 15:02:38 -0700 (PDT)
Received: from Akusters-laptop-2.local
	([2601:202:4000:1239:e48a:78dd:6de2:ec73])
	by mx.google.com with ESMTPSA id oh4sm6747431pdb.42.2015.07.02.15.02.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jul 2015 15:02:36 -0700 (PDT)
Message-ID: <5595B4FA.7080908@gmail.com>
Date: Thu, 02 Jul 2015 15:02:34 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
	<55956F2C.2040301@gmail.com>
	<CAJTo0La4vOUHj6me+vw75u2AAdPvmGvJT8cx8wR_NP55AfE0=w@mail.gmail.com>
In-Reply-To: <CAJTo0La4vOUHj6me+vw75u2AAdPvmGvJT8cx8wR_NP55AfE0=w@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 Jul 2015 22:02:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 7/2/15 11:46 AM, Burton, Ross wrote:
>
> On 2 July 2015 at 18:04, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     The current version of nettle 2.7 has one file that is GPL v3.
>     mini-gmp.*
>
>     so the license for 2.7 should be updated IMHO. So wont that put us
>     in the same boat as the upgrade?
>
>
> Yes.  Ouch.

So what now then? meta-oe-core-GPLv3  ; )

- armin
>
> Ross



Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id B547060249;
	Wed,  6 Jan 2016 15:40:51 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id ik10so34477572igb.1;
	Wed, 06 Jan 2016 07:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Gvs3UDQ3SM2n0gRaf6h+XSNLNRoLUSm63JIwSySy3pI=;
	b=qmh/od/9LS5rg6m7drcAUArfcJlamq9v5OH108rIfW3ch5aR1uTeDEU8HAhPYqDpCx
	k+eVK/w4lapqmh51o7dax061mUuvs0lwOjwbKm8tzYlyc5f7jN/lNfdgqy56xSTAO1h3
	dM848sZIpJdNG8aYwDRVDNEII9vMah5ysvqViKANvD0QKcQGmdPWzznKPoS10GeIAT+K
	qfCVKX1GoZw0Xq8cZ/1ZqWULSfoKB93dhcMYLVFDE+XT+IWi3r7GeD+Fog6nehKme3us
	qpxiaZ95Iy/FXVH8P8VGyAti4zoqR9j/Soj55yzzJlN0rrc+cIEsvd5tNHKoaRRPX+N7
	5Q4g==
X-Received: by 10.50.137.98 with SMTP id qh2mr8748310igb.75.1452094851731;
	Wed, 06 Jan 2016 07:40:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 6 Jan 2016 07:40:22 -0800 (PST)
In-Reply-To: <CAJTo0LazG6N2L898BLyr0jCZ-Xv5UK=GBs0DoXP+AK4_geQouQ@mail.gmail.com>
References: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
	<CAJTo0LbB02LR=6Yyy0-3=Hg1tjcdX=DmMKN2MEJqctnvi5n0Kg@mail.gmail.com>
	<A374083C-8331-42F2-A3F5-9D5EB49538F7@gmail.com>
	<2007809.DSH5DR9lFx@peggleto-mobl.ger.corp.intel.com>
	<8AE765C7-71E0-46D1-A086-A86AEEFE3F6B@gmail.com>
	<CAJTo0LazG6N2L898BLyr0jCZ-Xv5UK=GBs0DoXP+AK4_geQouQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jan 2016 07:40:22 -0800
Message-ID: <CAMKF1sqcepBb723aJ7AAW50WyCmQT29QrJdO7QjQ3C_Lo-MxMg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFT] glibc 2.23
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
X-List-Received-Date: Wed, 06 Jan 2016 15:40:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 6, 2016 at 2:04 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 6 January 2016 at 03:16, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Same branch now has updated glibc patchset, if you have cycles please try
>> once more.
>
>
> Thanks Khem.  When meta-fsl-ppc doesn't cause several failures in every run
> I'll re-fire it so we can actually get an all-green build!

fsl ppc build fails are due to glibc or some other reason

>
> Ross


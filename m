Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E3199606CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 10:37:28 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f82so159675411wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 02:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sN9z6j/+QIE+183laaS+Thn1usZkN/9SRCdfGDEFqnQ=;
	b=h4qojXgpChOt7iPsyTnlEF3xxlGqbj5XjvzvcoM0+avNMl+nRFLauwKG6vBcTdzkmX
	ncLdw+SujaCL8f8a2LVIbZiL59xKt+ZCNQJRzEPEnqZn2r/u1D8jYwi8sci66HNBlVpd
	Er+OXT5Gfe0FX7ZJUEXzaaJCQyacfWM88ewzHrxQ7iQq5Q0o+UnK1dN4As9vQy4kubiC
	kHlDREWZQKDm7PNdnG+9j7NQme1HBKXlPUE/UGkx6pWz/PkXkf5qJu0KQBnvEkxYkDF9
	M7ycDRfbX78Zx3rIqhsjiz5yMdsPCESJgPgqyUwh39Wm4QwNVn66YuFK5Fwv/hdESJVv
	l7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sN9z6j/+QIE+183laaS+Thn1usZkN/9SRCdfGDEFqnQ=;
	b=EifKs0r5pdL8QqwwAMGiKN1VgkRZul209ijQ+21Hfk4HnEvbJcYVglK87sVE1YKCB2
	+c+O2DKEORI77JK290UncoN+jfGt6P4ktspMCAyHuXY90svkB9M5qYbdWNPett+wfo7g
	Dagg520Kdw3aS4IEeE6+1UvhFl0vjtpH6DjUEyEFqLzr5gxN7utAX4DEEV6OXjTY8Lfx
	okLdG2axi2jYbu/XOGD3Id07tKH9vlYsDMdrczPEB5waql4KDaChuGsvcAvbUMFhJOQ9
	psaBV47jNnoqN7KAHs1bLMV9xI9nRTPbvkGx6mQkA2pUhbtsc6kubV4HC++FLNA7tKv2
	8dlw==
X-Gm-Message-State: ABUngvf/kDKP51lvPCdXrS9XcScPVoqDdousxpTHk+8jULJy97ODjkkAcPNlueJmgDKhnBzaVrUiXr0Wku+9HA==
X-Received: by 10.194.41.163 with SMTP id g3mr22449135wjl.162.1479206248909;
	Tue, 15 Nov 2016 02:37:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Tue, 15 Nov 2016 02:37:08 -0800 (PST)
In-Reply-To: <CAJTo0LYeL-yaSsM2yp_Ss8FQAGbBGwaJCB=ZO4jEy1c_SSrUkg@mail.gmail.com>
References: <cover.1479201985.git.maciej.borzecki@rndity.com>
	<CAJTo0LYeL-yaSsM2yp_Ss8FQAGbBGwaJCB=ZO4jEy1c_SSrUkg@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 15 Nov 2016 11:37:08 +0100
Message-ID: <CAD4b0_K9M3ax=KkXKYdyxgzTsge3qqKssWPS2Uus1kzNKKs-CA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 00/11] wic: bugfixes & --fixed-size support, tests, oe-selftest: minor fixes
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
X-List-Received-Date: Tue, 15 Nov 2016 10:37:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 15, 2016 at 11:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 15 November 2016 at 09:52, Maciej Borzecki <maciej.borzecki@rndity.com>
> wrote:
>>
>> I have noticed that Ross has cherry-picked some patches into his
>> pull request to master. Just for reference, the patches are included in
>> this
>> series, but have not been changed since the previous version. The
>> patches in question are:
>>   oe-selftest: fix handling of test cases without ID in --list-tests-by
>>   wic: make sure that partition size is always an integer in internal
>>     processing
>>   wic: use partition size when creating empty partition files
>>   wic: check that filesystem is specified for a rootfs partition
>>   wic: fix function comment typos
>>   wic: add --fixed-size wks option
>
>
> These were simple and/or fixing serious problems, hope I didn't cause too
> much inconvenience doing this.

None at all. I was actually about to propose cherry picking those
patches along with `oe-selftest: enforce en_US.UTF-8 locale`, when your
pull request to OE-core came in.

-- 
Maciej Borzecki
RnDity


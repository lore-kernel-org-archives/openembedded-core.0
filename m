Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1E13E74765
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 21:01:58 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id t63-v6so14031146vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N50+6NHiFP96h1AMb7Wol+STHl+ZuMHR0G6u6zhVIhQ=;
	b=mb4HrjBk3ChhItqjWzhj/dLFVGAwrymbPaHj2VWdetLdWkUAw9xqBJa3YcYPdz5G/5
	+OizKHgZrfutWlltXD4POZlPz+kNrBUEwlSFfWCKK38biv32oioya6lk+aPsVwKj06eS
	tJYBs+RkD9F2lkrA5V8EbnqF1IieNAmrpg38UZkdMryKtmqA6j+DVMArWc0ySPUXdj93
	xvWg+wAR5QQYtJFqIgNSfEzDVX1Yy6xP2aRuzg4eGSOudOWp4lK+oEBARCXDxcZgV7Pe
	NEVRRtmYQG3uOx7G7pVHR15OLcGdcMlsFjkP3P/u1CTDsaTl7kag65RPpXA0qifsf6P3
	rieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N50+6NHiFP96h1AMb7Wol+STHl+ZuMHR0G6u6zhVIhQ=;
	b=IELI+B0p9gYBR1w5M8dM9cAZE62ozRIuZGIBfuSL0Pqi+w0ujENf6u8IyexaiVOxjz
	7Ionu9E5zogIafmNckf0LGleO7US0NBJFEkxd7IaIFHTpbme3kkJ/rOjBdHvvWHFJ0Ft
	+UJ/mb5YMCWACDSjaoPC/q9V5xmHgYnfMBGVBRgUiwSwzMss+hj9XJBfw7QDJc/Gfgkg
	kHXdujCf8LGICL/vwLKtyihC5eV4UdWpgjydCf/6DY3cZLictYNuRifNjUt/gEB8gzXm
	bkRpk0Pktgfv8zwvn0okqO+Rp2TSLb08bANztwK7eM1EQYpvH+xXNr2njJEGeUMt0uA6
	AoLg==
X-Gm-Message-State: ALKqPwe1/hgu5Hk7q3QWy9jU9WO5hsJ5CVbGAhhsyyG93Ye/hnnamNWK
	8LeJP7YaqJepBtUdN7JTon/9JNe7PKgn+t5BnNGwIA==
X-Google-Smtp-Source: AB8JxZpCbO2OW3T6FeJDIqtJKe5ZLyqko2gYE648iqCPI/jcs/z5z1oOSsA3HrDS6N0QvDpg0wlp7UZYyH3CeSCow1o=
X-Received: by 2002:a1f:9615:: with SMTP id
	y21-v6mr2886481vkd.154.1527109319541; 
	Wed, 23 May 2018 14:01:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Wed, 23 May 2018 14:01:58
	-0700 (PDT)
In-Reply-To: <e4c12866-e26b-c7b0-e70a-e0c4c6ebefb3@windriver.com>
References: <20180519162102.GL19965@denix.org>
	<CAMKF1srt3AbRBgdBZp2ya-VkWm1K6r8eywFbqr3nMFe7EqNuFw@mail.gmail.com>
	<20180519193341.GM19965@denix.org>
	<CAMKF1sqfpZhKJKjFoouGhpRbZEfJBqXJxmqunepAx2weVsQEnA@mail.gmail.com>
	<20180520005742.GN19965@denix.org>
	<e718c04f-fbe8-4235-aae7-1c2a335498b4@gmail.com>
	<e4c12866-e26b-c7b0-e70a-e0c4c6ebefb3@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 23 May 2018 14:01:58 -0700
Message-ID: <CAJ86T=WdrLA322wwwSNhCJ1f=rKsr3pnzE5t1p3Kn2t4wmgP1A@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: GCC 9 Drops Support For Older ARM Microarchitecture Versions
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
X-List-Received-Date: Wed, 23 May 2018 21:01:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 23, 2018 at 12:48 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 05/20/2018 10:59 AM, akuster808 wrote:
>>
>> Maybe a bug is in order and then we might be able to add it to the 2.6
>> planning?
>
> There is meta-qemuarma9:
>   https://github.com/OverC/meta-qemuarma9.git
> I'm not an arm man but would it make sense for oe-core to
> drop qemuarm and use qemuarma9?

Presumably that name was chosen just to avoid a clash with the qemuarm
machine name used in oe-core?

If/when we update the CPU used in the oe-core qemu ARM machine, I vote
we continue to just call it "qemuarm".


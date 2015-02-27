Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 169C572277
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 16:14:54 +0000 (UTC)
Received: by igkb16 with SMTP id b16so1545447igk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NitRt4Sdj1lMHg8WrlJlkH1Yvhwz6tV5oihRCxrFydk=;
	b=TDz1H2J9WTGTe5RxXwkSTXnDpSV5BHfS6MNkG/yp8Wdg4osbgfsNwhSrIitv2e479n
	a4pextC3H9/atuHhFqP8pxAmxlb3QmtFKQj9z0tuTf7zopGwVP1P2oS4R9lJcc6sLD9L
	vxNgj0Xg4nl5wFFVD0x6F/O5heqyTE4xX5jtW43HKFGpjaoQ8aPSFYHs5fr6jIY1f9MI
	kl1dEtOujhy8ZZMKB1Y6O2KWsI5zejuipDRNpuqJihltj0wEP1HKu8+RzVwUMadpdNol
	k+MMSWcm/Pk62Cke4yzATAnWAX864s52loVbTim+mOuyNFBtm/JRwHOactrFzPOQa3ir
	TNwQ==
X-Received: by 10.50.142.106 with SMTP id rv10mr5229946igb.18.1425053695330;
	Fri, 27 Feb 2015 08:14:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Fri, 27 Feb 2015 08:14:25 -0800 (PST)
In-Reply-To: <CAJTo0LYRKaBTMNUx_wuPJOSGx2-aJiBmDATsN+dkUEH=0SApQQ@mail.gmail.com>
References: <1424832475-20806-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0Lax5EpeTy2y0PUGt+x3hM90U6V=oMaTnLGgRi8LtPGikw@mail.gmail.com>
	<CAMKF1srCWK008StDy4q6-PKdqBaAhxdNPfu38SaBvQU5SEhHUg@mail.gmail.com>
	<CAJTo0LYRKaBTMNUx_wuPJOSGx2-aJiBmDATsN+dkUEH=0SApQQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Feb 2015 08:14:25 -0800
Message-ID: <CAMKF1srfUT-spNvexB96kWnFEzCyVumEQu-Hr=HctJgeh=pnzQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 218 -> 219
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
X-List-Received-Date: Fri, 27 Feb 2015 16:14:55 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 27, 2015 at 8:03 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 27 February 2015 at 15:49, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I did not see it yet, since they were not part of my distro
>>
>> Pushed a fix here please try it out
>
>
> I just sent a patch that does roughly the same thing apart from disabling
> iptables (well, libiptc) by default.  Does anyone have a strong preference
> either way?

I would be fine if it was a packageconfig and off by default.

>
> Ross


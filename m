Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id A383C609BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:22:20 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id i13so3860479qae.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gsBB5ZgeslEz7oyNsFVWHycqWxX2fChenFeWtmIFX2s=;
	b=jBnGch9JuS4KQHyp3GKcXa2Wvv22EQmCjTpwutPez8C2+blLpapTIrT5t7Jxb/FuU0
	GE/0BTMRB6M4jiHP6jwJQuoG9cuUxQg5/ncYoGMeoE1spIhEaEbEoJN9gS7zSHnIEHps
	s9+93QA/J+iLB1xI9WGTP+LHVQQ+Z1CC27w9+g//vC7AMrS2Uhug4wTZbFt05TZYxtII
	+wZZnKXOuIDd/MAujIJaSWPrVGUdrGIGQv7QRPh6ka69BZPL+UmghHTYGdmtYn6IWn4V
	5GIqngwSNNGWbWyAEV105cEVwLTeVH/BStLHT4hPOP5APFAE9KvAiP9nuP0EiugBNcRq
	3rMg==
X-Gm-Message-State: ALoCoQnMOM+oBkmhTL0eJV7jk7Rl09IcZmFqk87jmn8Nqb7NZWLQRrIeUfb95/LRchaZ02dmhdGH
X-Received: by 10.224.126.202 with SMTP id d10mr35624273qas.22.1410790940895; 
	Mon, 15 Sep 2014 07:22:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 07:21:51 -0700 (PDT)
In-Reply-To: <CAP9ODKqtnPzfJ2PwBPQcwQ-jF=yT3dxQiNjWvLB6K71woMX4Vg@mail.gmail.com>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0LaB+e=o02t4pbF6kSNKvy8R8YHT5tijT9T43U=6Y_yXdw@mail.gmail.com>
	<CAP9ODKqtnPzfJ2PwBPQcwQ-jF=yT3dxQiNjWvLB6K71woMX4Vg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 15:21:51 +0100
Message-ID: <CAJTo0LZur5=dt6pfPawcEAM50M9W7zd-0_uoDvj5s74RCgNubA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Mon, 15 Sep 2014 14:22:21 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 14:33, Otavio Salvador <otavio@ossystems.com.br> wrote:
> I am using 2014.07 in meta-fsl-arm for a while and I support the merge
> of this for 1.8.

But as we're post-freeze, endorsement doesn't qualify as a reason to
break the freeze...

(queued in my ross/unfreeze branch for when we've thawed)

Ross


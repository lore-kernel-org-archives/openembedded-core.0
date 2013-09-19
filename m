Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id DBDE561013
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 14:16:26 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id ij15so6371902vcb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 07:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AHn/a2HsiOdfYxtsTTWcvVrcWILu0fbQPjFwLsKJf/I=;
	b=MN2h7J/JAgBRC/eWQeZi9YaK65fQbu/C1+SUXU6w/hUOMqu52eEpi/7XmBNZ9ccUSg
	y7ZXqF9CHGZIVbGoLz9yJrGYTlHYtCV5eJ9FqNLlkFKWIGyjwzoIJo4nQ5Mj6yL6souX
	Y1bZYKTTa4KpnhWms4MJK0+o9dUSwcATd3VfQsKFXcPCrNB2UoZwrWgAv9lxYynTk5Sn
	tIibHOy/ZVBbz7o+6NQmqflsGP8KaP3Uo5UoGsJMJXhDVZDvRZaEr2dNVx//WhJAvBhV
	py75QGVgApqzyd4zq4+GZLRkZ/YKkCF5ICzYK1EKs2aDPb3CubyV63q1J5oY73DcnvP1
	lZWg==
X-Gm-Message-State: ALoCoQnoQIKucogrGhmdBVIKoIjfUp/fin49VBfrPhH7U2F991mNOOci3ZVfidtKpboK145XWRKu
X-Received: by 10.58.133.66 with SMTP id pa2mr1408109veb.18.1379600188486;
	Thu, 19 Sep 2013 07:16:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 19 Sep 2013 07:16:08 -0700 (PDT)
In-Reply-To: <523B05A7.9090201@linux.intel.com>
References: <1379585199-27059-1-git-send-email-ross.burton@intel.com>
	<523B05A7.9090201@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Sep 2013 15:16:08 +0100
Message-ID: <CAJTo0LYn=aAYq0ZJ-1JXGW6EWUNPw6SpWOBwLQfRwAQ_GJCXdw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x11vnc: respect zeroconf DISTRO_FEATURE to enable Avahi support
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
X-List-Received-Date: Thu, 19 Sep 2013 14:16:27 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2013 15:09, Saul Wold <sgw@linux.intel.com> wrote:
> Did you intend to move the DEPENDS line here and keep avahi as you have
> avahi in the PACKAGECONFIG below.

Not my month is it. V2 incoming.

Ross


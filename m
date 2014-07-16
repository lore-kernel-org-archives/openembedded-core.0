Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 80855705D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 20:38:20 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id i13so1159936qae.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 13:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+k7KnsS43k59jkvlzE8dqbcukaij4YxVLXKeGwfAldY=;
	b=ClKqaxNYBn6cJ7/8C+Dd7fokzEtGRW4eaSpl4L8EzWpJ0rLFJnvvMC42SlOt+gMmpN
	UvS9VyPi1DIWkisnQTS6XqghIjMyMcemOGdfU1ddvJBZzTk3ui1q9WW13X/eIeFhv5Pm
	R1//GzJeWghPLn0euoeuSTQ1SOtWxYFMh/vNwSDH+jkqm4ZMhRennYOzcjmwGiPqRq1u
	Ht5vqO04YxUIAVZFvC6YLbqGx6IL6/RzAFN71z+gaFUbDfgDrXMhy7d/qj4uR1C1IjLD
	8+Gbgz/r3HDIFeysMoLgVIGwdC3QLcOPQ5uSXUOfB1DRWzReBt+mPsb//YXdo+Xf7B8G
	Wthg==
X-Gm-Message-State: ALoCoQlfxlpqfd6S4CFuORhWxjCUUtPv56c1iC8PxzLaORpKaOe8NXwy1qMUhBpCtqXPqlq10E/r
X-Received: by 10.229.53.133 with SMTP id m5mr50794371qcg.19.1405543101071;
	Wed, 16 Jul 2014 13:38:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Wed, 16 Jul 2014 13:38:00 -0700 (PDT)
In-Reply-To: <742f62754f3a09352af1aa87c3072472f6e6549d.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
	<742f62754f3a09352af1aa87c3072472f6e6549d.1405527926.git.richard.purdie@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Jul 2014 21:38:00 +0100
Message-ID: <CAJTo0LYPQvPP0f_4w1bV=56KoUvMDCmwqpMp2Q8mHg+_krZ0Wg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/19] xserver-xorg: Fix build determinism problem
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
X-List-Received-Date: Wed, 16 Jul 2014 20:38:23 -0000
Content-Type: text/plain; charset=UTF-8

On 16 July 2014 17:26, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> WARNING: QA Issue: xserver-xorg rdepends on nettle but its not a build dependency? [build-deps]
>
> We list openssl in DEPENDS so we need to specify that as the sha1 provider
> rather that nettle which is autodetected.

If xserver is seeing both openssl and nettle installed but picking
nettle, should we switch the build dependency from openssl to nettle?
The nettle library is half the size of openssl and has saner
licensing, so this seems like a win to me.

Ross


Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id C5D0B60E82
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 11:15:26 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id lh4so3483436vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 03:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+59duOjlfrfiaJN8lI53pRQUI7GBdZmqHrCGRDWXsP8=;
	b=IyjG7ENT3ZJXxG9JGz/SX33nMsyyzOyaUZoTlN4XIJsvQhbVofTaM+1motHSO3o/mB
	PAFAaPIgRvBIwcUvR11fvcA20WwsRZcmFVVdvJjtZSreg7q1e8Xl+MIhEBjZg1Xu4FJH
	xukgtb1MGsb6FoIJyM6u7cb/1x13YON6kCE2ZzPf+YHuJoztzN/LGSiyDrwTBoEa0vK7
	2NqUvSbURe1dKXJXStWmrQS9aLtASzIqMroYpdKwpLl3B4bm3NqxqWyIMtszT0UlW4xt
	ki5xTxp9cUinOT4VdUFQ0uMmxpCgkKmnaA9Osavsnk8vWX12NdiCdPji2SjyFXfkdKYa
	eRkA==
X-Gm-Message-State: ALoCoQmFq88e5mkcjqZngBK8evd2POxaZfrOsstWE411Y3z6J7ALNYV4qFqbl8eYEj4YyRfMIZRW
X-Received: by 10.220.191.10 with SMTP id dk10mr69756vcb.29.1384773328014;
	Mon, 18 Nov 2013 03:15:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 18 Nov 2013 03:15:07 -0800 (PST)
In-Reply-To: <1384773018.6460.202.camel@ted>
References: <1384773018.6460.202.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Nov 2013 11:15:07 +0000
Message-ID: <CAJTo0LZWNbMFA1ogn2W7dvxtXh31LovO9QbYKcQsGpTR7C6KCg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: DORA RFC: FILESOVERIDES in dora
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
X-List-Received-Date: Mon, 18 Nov 2013 11:15:27 -0000
Content-Type: text/plain; charset=UTF-8

On 18 November 2013 11:10, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> a) Revert the change in the branch. Anyone who adapted to the correct
> behaviour on the branch would need to revert those changes

As there hasn't been a .1 of Dora yet this only impacts people who
have been tracking git, so I think it's probably best to apologise for
this merge and revert it, on the grounds that it's a serious behaviour
change.

Ross


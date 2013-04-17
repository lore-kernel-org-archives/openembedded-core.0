Received: from mail-vc0-f170.google.com ([209.85.220.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UST6U-0007rL-Hq
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 16:12:55 +0200
Received: by mail-vc0-f170.google.com with SMTP id lf10so1350743vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 06:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=e10F9TdWiAvGFPdLCEq9SW8XpeeyhNUGMZD6c3+5Qys=;
	b=FNq9wTgm+KxCvHmq8wl+IHF0sgymSJM09dttj1bH596vzePOptzmZniztj3nF4nhsM
	BikF4HcBwKwYXC/NF0YlacRMaTLWzTCcZpoQNciaozZICD2ZXHKZfe3u8kftjX/wtdvt
	QGjwQqrPxZPUUDS7SnB4A6mqbNUm9VJsdFosDfRUYF7NJtoRN8YdmdHcKsZuAUbsycWB
	uri4VLiiDblwdSYRiVgfelyQz2vja8bYJUfHDDZlF9+lVD/V0O5FXhIgo5AOIpnvF8sR
	UhUHN5SyTdk5ixCPStviqYI8+MpVyi1kK7uAqrhyDzcy3Auu7/9TZG8zxpG8zDBqJUD/
	WclQ==
X-Received: by 10.220.74.2 with SMTP id s2mr1904860vcj.53.1366206922491; Wed,
	17 Apr 2013 06:55:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 17 Apr 2013 06:55:02 -0700 (PDT)
In-Reply-To: <3AD2AB56-AC3B-4DFD-B9CE-96DB76244A8B@dominion.thruhere.net>
References: <1366205668-19096-1-git-send-email-ross.burton@intel.com>
	<3AD2AB56-AC3B-4DFD-B9CE-96DB76244A8B@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Apr 2013 14:55:02 +0100
Message-ID: <CAJTo0LYYjDkFrrrMADxYC62iPohKeyMpPECWoOUJBcy5UjfAxA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlORHLiEu8EbQg5t/xmfP81zV0gOunY53zetyle4vcB9ZBx/CowCD+Tm9w/7qIf3kMgeOch
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] png: fix over-zealous warnings about transforms
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 14:13:06 -0000
Content-Type: text/plain; charset=UTF-8

On 17 April 2013 14:48, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Any chance of 1.6.1 getting into the release to get the NEON filter fixes?

Not in Dylan, at least not right now.  I'm not going to be entirely
surprised if RP queues these for 1.4.1 as they're not critical, just
doing it right.

Ross



Received: from mail-ve0-f182.google.com ([209.85.128.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URl2t-0005tw-Mt
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 17:10:31 +0200
Received: by mail-ve0-f182.google.com with SMTP id da11so432698veb.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 07:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=7pQTf0qfHRaD2JyVvoQ2xnztBjLXWH03uAaDjaLQ84U=;
	b=MKrCCN9krR6QWf1xWqZlnbLJJEmfaNjNfnGMNxj6/rgFN3bJmq1Kan9JKUW9udO5Bn
	Q0p7Cv+2+ty0Qxbh3H8Ba4ugTAHupzWpLUlf8CBlyrbdfFVP5rYAsZj/xGUaOyVWwYqJ
	Nj42yPWqXGCaV/uCkBHzoXWYtpSRsy+177vZPawIiq5+2seuyZYsm9DI+BMOlXj+kUfq
	xcOME9qe7Jp7o0IVz1DdpKNSep0PUUaC3HK3wj+RIAuMsMMpYhuCywE1lasb0fYRyxvH
	ZrF2RdgsUmJjBU67OgENGfIDG1g/zlbPXKlPamZOOruRBcrc//pGNVrnJ5MsFZA3jUus
	A0dQ==
X-Received: by 10.52.23.115 with SMTP id l19mr14021393vdf.55.1366037565455;
	Mon, 15 Apr 2013 07:52:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 07:52:24 -0700 (PDT)
In-Reply-To: <kkh3q2$gl0$1@ger.gmane.org>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<kkh3q2$gl0$1@ger.gmane.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 15:52:24 +0100
Message-ID: <CAJTo0LY7XoYcC9F0N2qCPzQRF6-VPkR+MZUDvfMP=NNUp9a6LA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlHLYXYW+Kp0QVHGZU2G7jA0Z9z7qVmIeA+bJo9jQyLPYdabqlg7mpRXgQ4TzKcEw9J0PYN
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Mon, 15 Apr 2013 15:10:49 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2013 15:45, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Speaking of GNOME, I noticed that I have to manually (re)run postinst for
> gconf schemas after first boot to get the apps to work. Is anyone seeing the
> same?

Urgh.  No.  There was recent changes (breakage/fixage) to the postinst
stuff, are you totally up to date?

Ross



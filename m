Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URlZt-00017A-N3
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 17:44:35 +0200
Received: by mail-vc0-f182.google.com with SMTP id ht10so4041297vcb.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=0B3Q4oq8kqVUMDJ5j7VY1VC6t0SHGg4lvdFJKAKXQ7I=;
	b=JOpXkMJo/esu1MCMY66nZuOyrgwADCAQ6WMXQemoj+BXe+V7ALvAr7yI8l9og18RYm
	ASCm/q96W7GA3XL29ztb3syqAhO4aHFk0O9N9knnZL3vHo5H8jI/gNcCgbvIKX3COthZ
	nyM+cBx1Ggka9PzLxb5gy21Bir4KIz1NRtRvKsVqSp4eUPVAVhqIkcQHdPtB18WgkgG5
	YFaU3iTelGxVbvvCv/UTnOb3wMqoOakKgrNdnWiYWrhyu4TDCMAomniOhbB70DxOTWyA
	prKvw6k6lNUsgFc1z3JHcGLVNu2Ajn9wJw2uc17Q+RC3QDRH8g+Uu+TsfxIiq0reSU/9
	9vwQ==
X-Received: by 10.52.73.234 with SMTP id o10mr14082737vdv.29.1366039612366;
	Mon, 15 Apr 2013 08:26:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 08:26:32 -0700 (PDT)
In-Reply-To: <695A7205-3EAB-4CEC-82E3-3455F19D0024@dominion.thruhere.net>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<kkh3q2$gl0$1@ger.gmane.org>
	<CAJTo0LY7XoYcC9F0N2qCPzQRF6-VPkR+MZUDvfMP=NNUp9a6LA@mail.gmail.com>
	<695A7205-3EAB-4CEC-82E3-3455F19D0024@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 16:26:32 +0100
Message-ID: <CAJTo0LZSUZMf1xKP_mQAfspaAd_HKUCeQDJ5K8Ayrr1-28YcVg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnH5lnfDemueJJNNsaQEoRT4BFJLpgCP8EIoO+QVQa6w+d+dBRRMko7yfGog5l6wPYqWAD3
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 15 Apr 2013 15:44:39 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2013 16:13, Koen Kooi <koen@dominion.thruhere.net> wrote:
> that doesn't seem to have postinst fixed for opkg based systems.

Possible that there's another bug still out there - does anything run
on first boot?  The gconf stuff should have happened on the host so
this is a bit worrying.

Ross



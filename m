Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SWvah-0002lx-Ub
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 22:21:59 +0200
Received: by eekd49 with SMTP id d49so2132597eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 13:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Q8UYZZE4LMCaDYtSH4XKPdK+YxCzOCWJyeXttfZsebw=;
	b=Ebp4rcvyPegl0F1eG/ErXX+l9qWM/48cKd/cs2u/xxSZUuO+EaG6mrGT2PhLioAxTy
	X7UB6cNLIeTlJo8isRTRDzPLKS1GemFmKieHFBPl5KpCIzdKFCIy6A6Fu8IB4aBtnPRt
	8mCzCA/um1cVPEvJaGnSl2mdNDu4/sda3Ut93nMZE1EUEalzCGQuR88NxtiU6esbYvJc
	u7X7tYhP6RNJcXBe6z+2bZpGgI4M6asNsv7ZzRCQEhOEtUIK8vMdxpFy0NHb5swwcPVm
	n6ZyOq7/nvtdZl/9NsEuzjgWV4YVBZfRWR6JvvsA6ovdfXE0l3Ogdtha+0z9a8QLqRYJ
	52HA==
Received: by 10.213.20.72 with SMTP id e8mr153016ebb.85.1337717510437;
	Tue, 22 May 2012 13:11:50 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s47sm90560732eef.4.2012.05.22.13.11.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 May 2012 13:11:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <abbc4037f2e4206a877be42be6ca5c132dbfef01.1337714416.git.mark.hatle@windriver.com>
Date: Tue, 22 May 2012 22:11:47 +0200
Message-Id: <6CD637A1-63A6-44D7-B744-1C03442FCA03@dominion.thruhere.net>
References: <cover.1337714416.git.mark.hatle@windriver.com>
	<abbc4037f2e4206a877be42be6ca5c132dbfef01.1337714416.git.mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl72KP6f+5kWKfH+JdpBWfE0RPi6KlzcR7Ik2ae2AOOtYi42QZlzzxv86BGPNr/oOtMmutG
Subject: Re: [PATCH 01/30] update-alternatives.bbclass: Refactor the implementation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2012 20:22:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 22 mei 2012, om 21:30 heeft Mark Hatle het volgende geschreven:

> Refactor in order to:
>  * Deprecate the old interfaces, but keep them for compatibility
>  * Provide a new, interface -- capable of working with split packages
>  * Each update-alternative will not set proper "per-file" provides

'now' or 'not'?



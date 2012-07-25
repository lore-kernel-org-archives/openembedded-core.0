Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Su2Zp-0000bV-Vl
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 16:28:38 +0200
Received: by weyr6 with SMTP id r6so520045wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 07:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=+RDMZVdA+r4eKRmJjx44wPQM59fD1dGKNKHS/bG2+dI=;
	b=FAoBCSsn+s/l0qQNWnAFwmSIOZV4lkV7e/HfV8/JAPLAwIX0RYfrNDvtEI5yaIAT6g
	LjfBtPKMiDl53dhvfN44Dp6hH7yXT3Sm0EFLeg1DmgivjgK/IXfxGwYxdguKmvq1bR8w
	7BdHzoMRBsva+81wbNfGuh303kjVd6AcaR2KOSq2S2g7f3UfKrDz6y6utQY5lrSQcnhB
	DzS9HXIuOXIWTikD1m8TioR50PbKf6M1ChJUWvalk/x0xlVp7OtcSIw/Ny2waqfthtSX
	eg2+cC/xbqNuB0qO7RFCzkHtKbL4E/+2lDp962UX44WFDb1eYr0MwCOYOsKYn4OGV25A
	T+Ww==
Received: by 10.180.91.228 with SMTP id ch4mr5072479wib.7.1343225828475;
	Wed, 25 Jul 2012 07:17:08 -0700 (PDT)
Received: from [172.20.3.201] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fb20sm4357796wid.1.2012.07.25.07.17.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 07:17:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1343224702.5878.43.camel@phil-desktop>
Date: Wed, 25 Jul 2012 16:16:52 +0200
Message-Id: <53686C0C-3DCA-4900-A037-AA2EDDC9B2CA@dominion.thruhere.net>
References: <1343225031-19107-1-git-send-email-radu.moisan@intel.com>
	<1343224702.5878.43.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl78Ecqm/YOlmqxLM41Q7BqoZZmn1k5913XKlYEwQlz+l0+VLW/dY5JgbRNhwYuhrsPrhtY
Subject: Re: [PATCH] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Wed, 25 Jul 2012 14:28:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 25 jul. 2012, om 15:58 heeft Phil Blundell het volgende geschreven:

> On Wed, 2012-07-25 at 17:03 +0300, Radu Moisan wrote:
>> +# for compatibility
>> +RPROVIDES = "${PN}-x11"
> 
> ITYM RPROVIDES_${PN}.  Isn't that a QA error?

Sadly not, you need to run kergoths recipe_sanity manually to catch this one.



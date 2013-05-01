Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UXRWD-0002Ra-09
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 09:32:01 +0200
Received: by mail-wg0-f54.google.com with SMTP id y10so1120981wgg.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 00:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=aPxE42n3RoeE0NGL0p6tDWh7fDwRRjASxnQzslkAXh4=;
	b=WWmzyEgFAFB1INEwfWInlXFh+Ip0xW7RBZopv7yZFb1ahqHlCHyrOOwwnGpbYVjcVP
	aYjbwA3aH9OF2sqxAXQi4Nom8+KCjriWkmZhEV2nUNuWWBF5CkEUgSX1kMHVL468VMKY
	Y3fclSVyBlUXZjXle791jZf+AfOC3KKdqn1DUgYRJus2FDt5zJIhxSRw66mwYBYrx02k
	jrUFQuArktT0woLBkYM+m2kCVUUFp3mkV6uTKhwL82wgcC5VTkz1oDjrpUsSkwUfcXgR
	pFcQqwEc+cckusD83XQlXN4Ka5w2BpWgShA+VBye39OOC112vqUMp46nTUmVr9JeZfMZ
	dWDw==
X-Received: by 10.180.36.165 with SMTP id r5mr2799832wij.18.1367392449426;
	Wed, 01 May 2013 00:14:09 -0700 (PDT)
Received: from [172.20.0.3] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id c5sm6928189wiz.11.2013.05.01.00.14.07
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 May 2013 00:14:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1367340369.git.paul.eggleton@linux.intel.com>
Date: Wed, 1 May 2013 09:14:07 +0200
Message-Id: <901A6989-8E12-4FE6-864D-C5584284512F@dominion.thruhere.net>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkNdAP0dLRUNm9bGAKnP31Db27LrIJmqqPdOIrVctEvgIYix4wWq/5SJuxW+FzugFCi5NJC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] SERIAL_CONSOLES improvements
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
X-List-Received-Date: Wed, 01 May 2013 07:32:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 apr. 2013, om 18:52 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> Having two variables to enable essentially the same behaviour isn't
> really desirable, so fix up the handling of SERIAL_CONSOLES, set it
> from SERIAL_CONSOLE by default if not set and change everwhere we read
> SERIAL_CONSOLE to read from SERIAL_CONSOLES instead. This should allow
> us to deprecate SERIAL_CONSOLE whilst retaining compatibility with
> machine configurations that still use it.=20
>=20
> Note: I'm a bit concerned about the default setting of SERIAL_CONSOLE =
in
> systemd-serialgetty; I'm not sure why this is needed given that this =
is
> almost always going to be machine-specific. I've left it alone for the
> time being however.

It is always machine specific, but at the time of writing SERIAL_CONSOLE =
wasn't being set by all machines leading to parse failures.

regards,

Koen=



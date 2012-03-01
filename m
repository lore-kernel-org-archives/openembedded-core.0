Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S34zj-0004qu-U3
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 13:20:27 +0100
Received: by wibhq12 with SMTP id hq12so305721wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 04:11:58 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.138.129 as permitted sender)
	client-ip=10.216.138.129; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.138.129 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.138.129])
	by 10.216.138.129 with SMTP id a1mr2451904wej.49.1330603918502
	(num_hops = 1); Thu, 01 Mar 2012 04:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=OqfBH9Cszl1lqQTNhZrxqFazzPVY5tXbSfjZrD+ZQ0Q=;
	b=dKIOepgVDkYbU4hpW7YjM+oNZqdW8hDacvyM+c0M8mkTfs1aPnqM6AV9u2xhLceOiG
	V1rkfkhMA+8WOXGfcA5wIk2AeNMw8vHGek294GSDhKlK9o4tzJQcbwWNnJoHe8kwcmEI
	oKzzyR445uTlxG2HKLsL26cDMFGQlX4uhThV9jkBjCnvmBhSB+mCR91y2cB80Cu71swC
	aPbxeckBxQ5gB9QGE/iohApm85kZduPFc4gT0EbE0bcmz8Z2Pz8DeUq/0kxQ3Vggkvg4
	xxW8IYs759B1dLAxG+ihB4t6uBgyWmGoDcbexJWJT9FgFbTuF2ly2M6NLrWLOLiilROM
	ZxTw==
Received: by 10.216.138.129 with SMTP id a1mr1953412wej.49.1330603918362;
	Thu, 01 Mar 2012 04:11:58 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id cc3sm8874826wib.7.2012.03.01.04.11.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 04:11:57 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330602916.31767.3.camel@ted>
Date: Thu, 1 Mar 2012 13:11:47 +0100
Message-Id: <8F7AFDB0-51BE-4C02-AAEF-5C82EE7ED671@dominion.thruhere.net>
References: <cover.1330587785.git.sgw@linux.intel.com>
	<8166980a5f0696c1f88bce1fb9bdcff7089690b8.1330587785.git.sgw@linux.intel.com>
	<C2C41049-7169-4851-B07A-9CDDD5A5ED45@dominion.thruhere.net>
	<1330602916.31767.3.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmAera94e+dF/1kovkvRu2uOrLUYjw2YAEyU2N39CjEvUKnrTU3qMmLPJPmb1Z5F06d6JvE
Subject: Re: [PATCH] libx11-trim/diet: Add RPROVIDES for libx11-dev
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
X-List-Received-Date: Thu, 01 Mar 2012 12:20:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 mrt. 2012, om 12:55 heeft Richard Purdie het volgende geschreven:

> We have things that depend on libx11-dev, this patch ensures the -trim
> and -diet versions provide it. This resolves some multiple providers
> warnings.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>=20
> Koen/Saul: This is how I think we should be fixing the libx11 =
issues...

I'm going to say something shockingly out of character: I think the =
trim/diet/normal seperation should be done with DISTRO_FEATURES + =
PACKAGECONFIG. Due to shlib naming the 3 recipes cannot coexist in the =
feeds anyway.

regards,

Koen=



Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SzkMl-0003g2-Qb
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 10:14:43 +0200
Received: by eekb57 with SMTP id b57so278178eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 01:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=C6EkPV1HVcT8hAI9RaGXgghPSHQ6x22UukBH6s+Qi6c=;
	b=lwkCO5dIZ5bGtS+tCOZGXr3ZYGsL3vGm7N7jjxEFHMcGi9VXRucHKKaijQ3+USM7OP
	S79RoqGS0ptxi/NUU5eunnz+oaj1GLPZeqFJGwwvr9oryYMmGTDeo7TmYHlBnWr3+hnK
	5264CoZVJyUCh3YoS4q26xuzxz0QDfb68jtj9iGaIAQ+8NI11r+pBHkNk1LCE4VCHyPK
	o9twkIPVGHxYdNDe2IapTHzkWk+TswrZvSPWmcQs9GxKFVWtucocTFVQi3NTzo/F+sLu
	h+Xa7gRWfhvsQXKA7QhJzXzNrN23sZ5TZILjjllyNusG6XQcYm97iULuAFX0Z9bzD6CT
	tZKg==
Received: by 10.14.216.198 with SMTP id g46mr2108966eep.32.1344585774398;
	Fri, 10 Aug 2012 01:02:54 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id h2sm9377020eeo.3.2012.08.10.01.02.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 01:02:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 10 Aug 2012 10:03:06 +0200
Message-Id: <9145620D-0D9C-4269-9ED4-B0E2E81086E3@dominion.thruhere.net>
References: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmVwMcQfXq6I099SAw7fBlRyGQ/uRpOz1Y3Cb1rn14Tl45vg1GmeTdy7v/+lojJs2xrbFJC
Subject: Re: [PATCH 01/12] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Fri, 10 Aug 2012 08:14:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 9 aug. 2012, om 03:25 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

> svn tar balls are 96M as compared to 1.3G git tars
> its unnessary to suck in that much of data.

That's indeed a big difference and also expected, with svn you only get =
revision N and N-1, with git you get everything. But even so, I can =
fetch that 1.3GB a *lot* faster than that 0.1GB svn. Maybe I'm on the =
wrong side of the ocean, but that gcc svn server is =
sloooooooooooooooooooooow.

regards,

Koen=



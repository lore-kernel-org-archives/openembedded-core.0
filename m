Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ULDCu-00056R-2N
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 14:49:39 +0100
Received: by mail-ee0-f51.google.com with SMTP id c4so1728328eek.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 06:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=40PybP1ZvP5Wmrb9ajM5oU99dTUww0KpeObfdtrDR/8=;
	b=gdQGfDfeDunqWEtGzgq7JWbjEcS05f8aKQiSSdTpKruUgLkpQSFwt/zUHkgjQXGJu1
	XE6RIQ6h1lsxZZYipZSXDk0ikyGcGKcRVlGLn2Xhh52HaOqIf9eP03MtuLBnWGYP+L6p
	1w3sFgeKMeNlfmHqtOp97uIqqvKWl4+eBcPul8tBu85MYCr4JB6eQz5SAy8YW90cYjCS
	z45JeMgP/fI1yFSinP9riISyGggK1ehdJRsWLBTCiWQ/8F6ZY4zQOb7GukUR33mYH8ZD
	epqQvcTyFEAjEPmKSLGk1pJSLVNERB9ENk+liPbvqNx6gEv7mH2OS3JsVdeOlRkw5D8r
	BdIQ==
X-Received: by 10.15.81.136 with SMTP id x8mr67433881eey.9.1364477549514;
	Thu, 28 Mar 2013 06:32:29 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id s3sm37786610eem.4.2013.03.28.06.32.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 06:32:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1364477086.28471.148.camel@ted>
Date: Thu, 28 Mar 2013 14:32:28 +0100
Message-Id: <C4B03762-2006-4EE2-925C-881C2B51A3CE@dominion.thruhere.net>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<1364477086.28471.148.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQmIh9oLGAB6DBJnAHIFRcAzda0waYKwSEVlGrv8GeVieXO95gbIkAYOqmtsDcdowC9i8vPE
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
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
X-List-Received-Date: Thu, 28 Mar 2013 13:49:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 mrt. 2013, om 14:24 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Thu, 2013-03-28 at 00:48 -0700, Khem Raj wrote:
>> udevadm is now moved from /usr/bin to /bin
>=20
> This is setting off alarm bells. Are there any scripts that are going =
to
> break?

Only udev internal scripts are supposed to reference it, so this change =
should be safe.=



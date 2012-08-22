Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T4E34-0001ea-9e
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:44:54 +0200
Received: by eekb57 with SMTP id b57so336644eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 09:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=GlRI/VaAOJk/r8nsS2ViTI3svAXLV9jk2E8FJHfnXEI=;
	b=ByG3Rc0/UJxh7me/p277HXe7yDSG204VKWrsF3sSc0fHmLYiFEE1CC1TZG8kj+hGZ9
	OpWrE+xd5+B2RRQfdeA+EbVe2LJmaTsSi08ObH5Emf+vur9LvBgjXI5q0GtIGTxrFPnR
	Cx5WAlOjjKViUny693K08xrKR09Y8d/y+6//XEFwkflqw7mUYd23xgA6S09E3gfSxAQu
	y84orZLEkxbJZvTi0bfIDGHX6bJcQIKZ3b8xzzhKa5kIYq+TOn26ZQcfe/f18koDi+d6
	k/lVEW7Yo3UQWD9csArRHGiN8VZnAnndXMkfA94oeGJoSzgfb+PYj/w9tPzOqZ7eP1a3
	SRCQ==
Received: by 10.14.211.3 with SMTP id v3mr18958519eeo.43.1345653168913;
	Wed, 22 Aug 2012 09:32:48 -0700 (PDT)
Received: from ?IPv6:2001:610:612::60b0:c146:e06b:4c1d?
	([2001:610:612:0:60b0:c146:e06b:4c1d])
	by mx.google.com with ESMTPS id v3sm14277357eep.10.2012.08.22.09.32.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 09:32:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1840245.41xHr4Jb3c@helios>
Date: Wed, 22 Aug 2012 18:32:46 +0200
Message-Id: <F1032BDA-250C-4EB3-94F5-5FB12A9FE6FB@dominion.thruhere.net>
References: <1345650627-3232-1-git-send-email-paul.eggleton@linux.intel.com>
	<1840245.41xHr4Jb3c@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmdudVNjHsS8suo9V7F7lohtcQ96jc4ziinebTS7uOudwU/3PtwH54LClTndOwKl0rGYnys
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] zeroconf: remove - RFC
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
X-List-Received-Date: Wed, 22 Aug 2012 16:44:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 aug. 2012, om 18:11 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Wednesday 22 August 2012 16:50:27 Paul Eggleton wrote:
>> We already have avahi in OE-Core and some cursory research suggests =
that
>> avahi is preferred over this package, which has apparently not seen a
>> release since 2006. Nothing in OE-Core actually refers to it, so =
let's just
>> remove it.
>=20
> Hmm, this was meant to be an RFC - I would like to give people some =
time to=20
> respond.

IIRC gumstix used it for bonjour without bringing in the megabytes of =
support needed for avahi.=



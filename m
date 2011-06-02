Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QSFrI-0004kA-Ac
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 23:56:23 +0200
Received: by pvc30 with SMTP id 30so628731pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 14:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:organization:to:subject:date:user-agent:cc
	:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=2YgiVAfCaq37+L8wxrPl1J+IXkolLh6mHLcSN3N4xtk=;
	b=bNjC74MVJjPsV4PDBl1Zg91qAZEiT42H4WV+ZWffOjjahN9Wa8jnkq+aXRqx0tDg1a
	Y8ObJ/TukjcO4z4BnsqVwxnImAFDvEIc9h/GYrSqTue+ra4diZoqYloDbNJev37N+zjv
	XbAQPm2INdHZ4eNMAs8aOshF20lgxk3s/XO+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:cc:references
	:in-reply-to:mime-version:content-type:content-transfer-encoding
	:message-id;
	b=JJ/niT5v3QGji71mRQg746QdFfrnmN3ONjbk3SUHb/Q9DQ0Er35n8aBULPN12QOCGx
	25eLa68YU7i3Ot5vukm7NJgQm5o6ItjM4KyDUW2KnOmqU64t9iuOlXnhLrEH0pAj/6+A
	5fT5uyVibKeLkAIlNCzk+KEhZAArOerc7O5B8=
Received: by 10.142.172.15 with SMTP id u15mr230628wfe.16.1307051498204;
	Thu, 02 Jun 2011 14:51:38 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v6sm626900wfe.14.2011.06.02.14.51.36
	(version=SSLv3 cipher=OTHER); Thu, 02 Jun 2011 14:51:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Organization: Sakrah Inc.
To: openembedded-core@lists.openembedded.org
Date: Thu, 2 Jun 2011 14:51:34 -0700
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.3; i686; ; )
References: <1307040964-11468-1-git-send-email-Martin.Jansa@gmail.com>
	<F4784D59-72EE-4D32-8808-86885F447887@dominion.thruhere.net>
In-Reply-To: <F4784D59-72EE-4D32-8808-86885F447887@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201106021451.34780.raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] base.bbclass: add cleansstate task between clean and cleanall
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
X-List-Received-Date: Thu, 02 Jun 2011 21:56:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, June 02, 2011 12:19:05 PM Koen Kooi wrote:
> Op 2 jun 2011, om 20:56 heeft Martin Jansa het 
volgende geschreven:
> > * sometimes it's usefull to remove only sstate 
cache and keep downloaded
> > sources for rebuild
> 
> just what I needed!

very helpful in development of patches and making
sure that recipe is recompiled at will which is needed
during making patches

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-
bin/mailman/listinfo/openembedded-core



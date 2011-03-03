Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Pv9Kr-0001bW-65
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 15:16:59 +0100
Received: by wwe15 with SMTP id 15so1231397wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 06:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=eLTmsPId9QehJZh8mrsmca/aSaZCEiW/+Kj4CTldLeE=;
	b=tbxPUEfi/fNcC+ReE/21ebtEMD37QXqUey3r0CELfmOMz2z2ws4dtQZD5KzrNqIcLW
	Gw2awaopvW1JJH0MY/Dr2U2JHqfrg5lNYjjR96+2lFWb1GR5Wm36YWzpGV7ZHBqxt3z2
	DjKuOT8wB6FsGjhBC2OQWAjgf1gYGG5mAaTFs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=vB/VZmeI5yme9G+/+T6e5tCIQk8TM+8k+Cud+JzuW8CpW8lzIOrBqpdKNiqQNYLHfY
	lPL/Q2juKU7TxRO+d2q0tR1/Ys8SfuqpOFL2H/cy8cZekbK3zwv70JHhSGkpewwJWv7x
	zgDSipFoW4X+tF5XSRARA5QD2W+Blyl9uR1WI=
Received: by 10.216.28.19 with SMTP id f19mr886473wea.88.1299161725120; Thu,
	03 Mar 2011 06:15:25 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.246.11 with HTTP; Thu, 3 Mar 2011 06:15:05 -0800 (PST)
In-Reply-To: <E900D076-3678-445D-89D2-973EC3A558A8@dominion.thruhere.net>
References: <4D6E7EB1.5080602@windriver.com>
	<41F9E0FC-E0A1-4C7F-8999-3E1B53FDDEE1@dominion.thruhere.net>
	<1299157757.2550.5.camel@scimitar>
	<E900D076-3678-445D-89D2-973EC3A558A8@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 3 Mar 2011 07:15:05 -0700
X-Google-Sender-Auth: 3UCtUaLAcKBkkQ3MeIL7nG4fs88
Message-ID: <AANLkTi=wkV4Rdf74XA=q3jc42Ron6whrn21JCG8ZbcJS@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Thu, 03 Mar 2011 14:16:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 3, 2011 at 6:57 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> All these show that we need more and better tools to deal with layers. At the minimum bitbake should print out warnings about layer issues like bbappend a recipe that doesn't exist.
>

Agreed.  This particular case is why bitbake-layers exists.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics



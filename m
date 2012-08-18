Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1T2Ws9-0004ZH-2R
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 02:26:37 +0200
Received: by pbcwy7 with SMTP id wy7so4739488pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 17:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:reply-to:subject:date:message-id:organization
	:user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type;
	bh=KZaubkJBd2JDPYj82DXxEJtamiNZgpO2AVGp5hwn3cI=;
	b=fW4IEPIC39Hh9kdvtHXv2B/9uzR9LcHtgjpez+W3TppbZOvEREz+364mMJlUsqPcvU
	SQAU/Dg1ZgOAaaPvZoyAoUDhG5yRn0SzoPlKpR6TPlicvAwExtk6iMBMwnGJ4cFmNL0c
	h/Du/b7OJbNL277QJ/CUOGey00tvQ/rLS1vywcem8wqrP6DsFBaVY78tknQCbPb97xR7
	kHturO1F6UeaU5rdwjvIqWNj0Pfkan10/RQ0S4Sl7H6ISTXmGTLVl1ETa39gPVM8jkSb
	gLvI1n8OPZRR07RMaS9JmmqLr5C9NizH/l3LrhfwTjRSvy+vlZiOS4agTpa6TV2AzUIt
	Mpaw==
Received: by 10.66.77.101 with SMTP id r5mr9815044paw.79.1345248877053;
	Fri, 17 Aug 2012 17:14:37 -0700 (PDT)
Received: from dev1.localnet (220-244-174-13.static.tpgi.com.au.
	[220.244.174.13])
	by mx.google.com with ESMTPS id pg9sm5880103pbb.26.2012.08.17.17.14.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 17:14:36 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-core@lists.openembedded.org, ml@communistcode.co.uk
Date: Sat, 18 Aug 2012 10:08:17 +1000
Message-ID: <15307597.VS7AZRJMyx@dev1>
Organization: Creative Product Design
User-Agent: KMail/4.8.5 (Linux/3.1.10-1.16-desktop; KDE/4.8.5; x86_64; ; )
In-Reply-To: <502E03E4.2030009@communistcode.co.uk>
References: <1345162235-23835-1-git-send-email-marc@cpdesign.com.au>
	<502E03E4.2030009@communistcode.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH] avahi: fix packaging of avahi-autoipd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Marc Reilly <marc@cpdesign.com.au>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Aug 2012 00:26:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

> >   allows programs to publish and discover services and hosts running on a
> >   local network \ with no specific configuration. This tool implements
> >   IPv4LL, "Dynamic Configuration of \ IPv4 Link-Local Addresses" (IETF
> >   RFC3927), a protocol for automatic IP address \ configuration from the
> >   link-local 169.254.0.0/16 range without the need for a central \> 
> > -server."
> > +server."'
> 
> I might be being daft but is there an extra quote in here?
> 
> +server."'
> 
> should be:
> 
> +server.'

It was me who was daft, thanks.

Cheers,
Marc




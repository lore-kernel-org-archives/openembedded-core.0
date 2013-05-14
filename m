Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Uc4qr-0007mW-P7
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 04:20:30 +0200
Received: by mail-pd0-f177.google.com with SMTP id g10so4800021pdj.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 19:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=lWEoSClRrfquAwxR6WiXriyhSc7ob/d9xD10bC1HSew=;
	b=YS9yDGBntNj6OaVsxJHefaRIkZwUFPiBNUmY6ecYPzoanQCIWL079/9Rs6HApjV2Cb
	sSVY+JyQ5d3cKUAegvgdKeUj5XOb8ZGB6tn8Xlq16n20H0OHJ5azj46JYhKxglO+Fk9D
	fA/A49lLHBPRkAxuMn2nCnOgvc3I8a49tcj7NNmgzr1hQnpvoQdlnElxOH1zSHIKDoTj
	z0b7B08il8chmDph03rIqafOkd9BpCvHMk6fba6Cb+SLDGGZhBktssXM7iHS5iXXQDb7
	sTq9D6qa2RDBZlq1TddQ4s/bxeQVKGkhEYIfrQWLWvOQJ9wEOdJAAHvsfvXJZ8PRTN5Q
	UC4A==
X-Received: by 10.66.150.168 with SMTP id uj8mr31264755pab.34.1368496938632;
	Mon, 13 May 2013 19:02:18 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	gh9sm16004695pbc.37.2013.05.13.19.02.16 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 May 2013 19:02:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
Date: Mon, 13 May 2013 19:02:16 -0700
Message-Id: <83471DB4-C056-4995-9DCD-F3AD198F04A3@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<alpine.DEB.2.02.1305132059460.25048@oneiric>
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Tue, 14 May 2013 02:20:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

cool, keep tuned I might have narrowed it down

On May 13, 2013, at 7:01 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> By adding:
> 
>    PREFERRED_VERSION_linux-yocto := "3.8%"
> 
> to my conf/local.conf I was able to get the image to build/use 3.8.11;
> but I too am still seeing the kernel panic as described before (i.e.
> in reset_counters()).




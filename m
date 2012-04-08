Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SGmnO-0002CF-RP
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Apr 2012 09:44:22 +0200
Received: by wibhj13 with SMTP id hj13so1426753wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Apr 2012 00:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=C1E1YUfzBsBBw1b8aDL7gTJvbFDNWkOin7yXte1EYLY=;
	b=knVXiz3L+XSoofY2uo5GGo7SFd3TR31g+z09PzOocFFafpUQqEom2TAwiVW2EHpzp+
	z+oeuL9xm1J4Lb+jSGi5BvT0h002yFzOBlOsEhKxnXbCE8M92K1zzwBorfgNptVbAuAq
	Me+utjA0oFfIgxEQ/bmKVXdtcJSHnXfHCNAv7Hp5H6Hi6nwG7XeK4IEdr4WSn5yqc8DU
	kZTMQPVEvOuutIin3jwwt3cImUH2/Ks5KPGJWd0/IPtstbmXABijGEKFmyAEkl46WORr
	YdHfjBaGTIVmfpoXz53B9GsEKHER6vVGwN9tGJ+/kuGJt8N3dZJLWCQyPeRIThU59wQC
	qRzw==
Received: by 10.180.103.134 with SMTP id fw6mr9057035wib.0.1333870507861;
	Sun, 08 Apr 2012 00:35:07 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm33172086wib.9.2012.04.08.00.35.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Apr 2012 00:35:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F7FD863.3070702@gmail.com>
Date: Sun, 8 Apr 2012 09:35:14 +0200
Message-Id: <4C72D242-8365-4146-98D3-42BD5B99AF40@dominion.thruhere.net>
References: <20120403131537.5CE3310218@opal>
	<20120404165943.GE4181@jama.jama.net>
	<4F7C8796.9070705@opendreambox.org>
	<20120404174521.GF4181@jama.jama.net>
	<4F7C8B6A.1000008@opendreambox.org>
	<20120404180615.GG4181@jama.jama.net> <4F7FD863.3070702@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmb2fyZRw0KKFYOZYstcrKW2aJAQ7VX0sPbDiUc17ELNtAIZuPIXsLqyCr7mnOZ3M3MOwad
Subject: Re: [oe-commits] Andreas Oberritter : gdb: build with expat, add missing RRECOMMENDS_gdbserver
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
X-List-Received-Date: Sun, 08 Apr 2012 07:44:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 7 apr. 2012, om 08:02 heeft Khem Raj het volgende geschreven:

> On 04/04/2012 11:06 AM, Martin Jansa wrote:
> >>>>> 
> >>>>> -EXPAT = "--with-expat" +EXPAT = "--with-expat
> >>>>> --with-libexpat-prefix=${STAGING_DIR_HOST}"
> >>>>> 
> >>>>> helps..
> >>> 
> >>> OK. Can you please submit an incremental patch? I wonder why it
> >>> didn't happen on my system, although I have libexpat-dev
> >>> installed (Ubuntu).
> > I've tested it only with target gdb (so I don't feel comfortable to
> > send patch before testing -cross-canadian and -cross, but I don't
> > have time for it now).
> > 
> 
> This patch is good. So dont hesitate to send it.

Indeed, let's get it in before the yocto-1.2 releasebranch gets created.




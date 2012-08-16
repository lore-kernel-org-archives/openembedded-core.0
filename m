Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T1ytT-0004mn-Mq
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 14:09:43 +0200
Received: by eekb57 with SMTP id b57so639483eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 04:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version:x-mailer:x-gm-message-state;
	bh=oY5o+4ezk8TyaRxJR63aRfyGcajBiwqhWl0XXQFjyjg=;
	b=aq9gNQI2PbCvR1eNlxnZfL0eBLzYF7o6ujg0MOHXbE2ePgoZmZ0Q4ciQW+JnrjTt9i
	5MMCTKxXiXCWmstlgnHzdzdAuA6N+IIVVyGMHV+FwoWtJVkBAUAqkEQzaY0QNRWMDQGe
	L2vWWYjoYHwDUL79yt9rlownNYcCuvfKplGDiXDmpY35EQc9lsmR99XYJI1q7EfEL7XP
	+gAofT+PlGYP2xYvOXTPSVyX8UHCyqkVjM6U5Wz/1M3z+MV6dViSAo02NCmfS8be+joS
	alSjDXcfaQY/yBC0O/acuo5MdvdrLrLCEbKnP8Yf87VbMO9gVgiUETtCtk5dzwNU33Lf
	WsbA==
Received: by 10.14.4.201 with SMTP id 49mr1282849eej.0.1345118266379;
	Thu, 16 Aug 2012 04:57:46 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id m45sm11460548eep.16.2012.08.16.04.57.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 04:57:45 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Message-Id: <A2678AC1-3CB1-4405-BB18-8441249ED0EE@dominion.thruhere.net>
Date: Thu, 16 Aug 2012 13:57:44 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQlJY260f74oLXttePnN9dVwf7b1A+yFQ2bqtW9usLcpRLb14+6FXiCAMa09NZwj+hL/SsPd
Subject: How to override bitbake.conf defaults in layers properly?
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
X-List-Received-Date: Thu, 16 Aug 2012 12:09:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I spent the morning backporting kernel.bbclass changes to the meta-oe =
denzil branch and I've run into a problem: STAGING_KERNEL_DIR needs to =
change to match the updated class. In this specific case I can work with =
Scott and Eric to see if those kernel.bbclass changes can go into =
oe-core and meta-oe at the same time. That's something for next week :) =
In the meantime I'm wondering what the best way is to fix this in cases =
where you can't influence oe-core.

I see a number of options:

1) set STAGING_KERNEL_DIR in layer.conf. I don't know if that's parsed =
before or after bitbake.conf, but it feels like the cleanest solution
2) set it in $DISTRO.conf. Easy enough, breaks every other distro out =
there
3) copy over bitbake.conf. Might work with some BBPATH magic, but in the =
end doesn't scale when >1 layers do it
4) provide a custom denzil branch of oe-core, another easy way, but very =
antisocial

I'm not into the layering details enough to see what the effects of 1) =
would be, could the knowledgable people chime in please?

regards,

Koen=



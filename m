Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QKCER-0007GG-Qd
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 18:25:51 +0200
Received: by wye20 with SMTP id 20so569216wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 09:23:05 -0700 (PDT)
Received: by 10.216.156.70 with SMTP id l48mr702270wek.5.1305130984969;
	Wed, 11 May 2011 09:23:04 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g32sm170065wej.27.2011.05.11.09.23.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 09:23:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DCAB609.8030601@linux.intel.com>
Date: Wed, 11 May 2011 18:22:59 +0200
Message-Id: <C5BC5F51-14C1-45A6-91DE-9A48DDD565CC@dominion.thruhere.net>
References: <4DCAB609.8030601@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] RFC: create-pull-request / send-pull-request updates
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
X-List-Received-Date: Wed, 11 May 2011 16:25:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 mei 2011, om 18:15 heeft Darren Hart het volgende geschreven:

> Between myself and others, there are several outstanding proposals to
> modify the pull-request scripts. Patches have been sent, but nothing =
has
> been merged due to a lack of consensus. I thought I would summarize =
what
> I see to be the current weaknesses of the scripts and my proposal to
> address them. I would like your feedback to ensure we have tools that
> meet the needs of a broad user base. Once we agree, I'll be happy to
> write up the patches or help review those written by others.
>=20
> 1) send-pull-request is too aggressive with the auto-cc feature (Khem
>   Raj)
>=20
>   One of the reasons I wrote these scripts was out of frustration with
>   git-send-email which allowed for a cover letter, but didn't include
>   all the collected addresses on it. The current script sends every
>   message to all the collected addresses. Khem (and others) have found
>   this behavior to be sub-optimal, if not down right annoying.
>=20
>   I propose it be modified to only use the addresses local to each
>   patch for the patches and all the collected addresses only for the
>   cover letter.
>=20
>   a) Do people agree with this policy? If not, and people prefer the
>      cover-letter only be sent to the recipients specified on the
>      command line, then this script doesn't add any real value over
>      'git request-pull' and 'git send-email', and users can easily
>      wrap those on their own.

Correct me if I'm wrong, but the current script pick up address from the =
patches inside the patches as well. The CC: list should only contain the =
"OE" people involved, not random kernel hackers mentioning in the =
patches.

regards,

Koen=



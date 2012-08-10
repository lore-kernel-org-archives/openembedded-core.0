Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SzlYh-0004xl-9S
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 11:31:07 +0200
Received: by eaad12 with SMTP id d12so291442eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 02:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=1T/sYz5W4PKogkPQNzY0FkgZXb0l2sbhfFksukxLCtc=;
	b=gfTeyN0Pz2ma1DfLiC2Ds2IRXA+rvHKAdiTtXmImQb8ntouMsiD5Deje1+JXQ2WkaM
	M32CvhSczAXTuLG0yv9DlQLXOpXQh8Bshk5ZKB8IE8U+j/dX6TT1BBwhSzFn+YeIRZZ4
	XhPitjIY3m39G5j6zG7+fstHoL/OE79zoiZUoEGQPAWEU8ScfvMtDAxr5c78xG4aiIK5
	adq86dWxB7xRoNY0nrsRexn1sOOQ2HdHCI8761vEhhW2X1GyiuKQT2rzs6HsgKtcmQqc
	vEwitA7WTAirGHlqHGIV/MuksWa4+SuWm8nEuOd8DbP3yW6wWOtUXl7YJJxBjhEvl9K/
	AGHw==
Received: by 10.14.203.70 with SMTP id e46mr2487227eeo.2.1344590357762;
	Fri, 10 Aug 2012 02:19:17 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 8sm9833590eeg.16.2012.08.10.02.19.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 02:19:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1384904.B8yRp5DXBX@helios>
Date: Fri, 10 Aug 2012 11:19:32 +0200
Message-Id: <794EFCCB-8E33-4348-A94E-7F6563DF960B@dominion.thruhere.net>
References: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
	<9145620D-0D9C-4269-9ED4-B0E2E81086E3@dominion.thruhere.net>
	<1384904.B8yRp5DXBX@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQl9xGhwb+by1o36YGEj+300QQYTmWPh+jnApLecabRXLQum8O6WHGz0x2wxoPwUdMrlmnCX
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 10 Aug 2012 09:31:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 aug. 2012, om 10:47 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Friday 10 August 2012 10:03:06 Koen Kooi wrote:
>> Op 9 aug. 2012, om 03:25 heeft Khem Raj <raj.khem@gmail.com> het =
volgende=20
> geschreven:
>>> svn tar balls are 96M as compared to 1.3G git tars
>>> its unnessary to suck in that much of data.
>>=20
>> That's indeed a big difference and also expected, with svn you only =
get
>> revision N and N-1, with git you get everything. But even so, I can =
fetch
>> that 1.3GB a *lot* faster than that 0.1GB svn. Maybe I'm on the wrong =
side
>> of the ocean, but that gcc svn server is sloooooooooooooooooooooow.
>=20
> FWIW the git option was much, much, much slower for us here in the UK.


I had similar problems as well when I worked for TI UK, it turned out to =
be proxy end point issues. After manually assigning an endpoint that was =
close by things improved a lot. The geo-ip based CDNs worked properly =
from then on.=20
It might be that github suck in the UK, I only have one datapoint for =
the gcc stuff, which is my own connection at home. I only need to fetch =
gcc once, so I don't have a strong opinion on this switch, I just wanted =
to add some anecdotal evidence that the 1.3gb git download isn't all bad =
:)

regards,

Koen=



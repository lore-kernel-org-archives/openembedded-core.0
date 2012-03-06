Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4tSO-0004UI-VD
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 13:25:32 +0100
Received: by wgbdr12 with SMTP id dr12so3943667wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 04:16:57 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.138.129 as permitted sender)
	client-ip=10.216.138.129; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.138.129 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.138.129])
	by 10.216.138.129 with SMTP id a1mr7866218wej.49.1331036217580
	(num_hops = 1); Tue, 06 Mar 2012 04:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Y+t/lT1q1zCLooDnl6d1kgR0pDZ95yxQvs+JQ8g36yw=;
	b=Szq3uqJNX90epHBCLmR+ebNcTCDB5WH3E4OcPQxcDWEIDGUXgrYJeR5HbA+kB2l7w2
	07q9uNKqUdgsh4f2fwzQjwalUtXOZ+37aPedyOzuleoJGJjZCr6NL71Egk9XgCvx1G54
	d1YoAjiDmxuZNmhkKGJ4mzWEoB7zHcNSy9ghUPyGx+04Th0FXmA+EGmBH/IaTXrcFlIG
	a9y32FX9iWLA29rD1TLdHtdmimvqoNWC0S882iXjINB7g4cFDgvYn3YSeOa382RjdFof
	DUDDd/0rYZpnlcXwPNJSu+DrVqpWet3HAzhjYvYF2AtxGe8iZucAmisQh/sjPKsTugfq
	G5YA==
Received: by 10.216.138.129 with SMTP id a1mr6247592wej.49.1331036217454;
	Tue, 06 Mar 2012 04:16:57 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id r8sm52386329wiw.10.2012.03.06.04.16.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 04:16:56 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1331035711.6166.25.camel@mattotaupa>
Date: Tue, 6 Mar 2012 13:16:55 +0100
Message-Id: <C236B415-C095-440F-AAF5-97AC46584A63@dominion.thruhere.net>
References: <1331035393-27558-1-git-send-email-koen@dominion.thruhere.net>
	<1331035711.6166.25.camel@mattotaupa>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlP19i7/5wN8Hw/fD1yHr3kdV6GeKRh6IZ5kMFPOpXsDw59j9WbVCgAHHLdcmZNPDFLEF4A
Subject: Re: [PATCH] xz: split out liblzma as seperate packages
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
X-List-Received-Date: Tue, 06 Mar 2012 12:25:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 mrt. 2012, om 13:08 heeft Paul Menzel het volgende geschreven:

> Dear Koen,
>=20
>=20
> Am Dienstag, den 06.03.2012, 13:03 +0100 schrieb Koen Kooi:
>=20
> sep*a*rate in the commit summary.
>=20
>> As usual, this creates problems for upgrade paths, but splitting out =
the lib is worth the short term hassle
>=20
> Is there some documentation what distros or users should do facing =
this
> hassle?

$packagemagager upgrade --$forceoverwrite-switch or ensure xz is =
upgraded first. I know opkg gets this wrong most of the time.

regards,

Koen=



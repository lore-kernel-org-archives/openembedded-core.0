Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S27B9-0004CF-EK
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 21:28:15 +0100
Received: by wera1 with SMTP id a1so923030wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 12:19:49 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.97.196 as permitted sender)
	client-ip=10.180.97.196; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.97.196 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.97.196])
	by 10.180.97.196 with SMTP id ec4mr31609092wib.11.1330373989084
	(num_hops = 1); Mon, 27 Feb 2012 12:19:49 -0800 (PST)
Received: by 10.180.97.196 with SMTP id ec4mr25066815wib.11.1330373989033;
	Mon, 27 Feb 2012 12:19:49 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm59947436wib.4.2012.02.27.12.19.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 12:19:47 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKr5_P=62V2TstE_bX8-jn6RXxcs2swT6E9ojGox6diRhA@mail.gmail.com>
Date: Mon, 27 Feb 2012 21:19:45 +0100
Message-Id: <F4D2D55E-949A-4796-8AA1-FA6765861446@dominion.thruhere.net>
References: <20120222221309.69BFD10336@opal>
	<20120227103306.GG3859@jama.jama.net>
	<06A495EB-6F73-4325-A055-EEEBC01D93A4@dominion.thruhere.net>
	<1330344828.4593.14.camel@ted>
	<4FDB63C3-5AB6-45B2-8662-D302D8936B2A@dominion.thruhere.net>
	<CAP9ODKr5_P=62V2TstE_bX8-jn6RXxcs2swT6E9ojGox6diRhA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkmcjCR3WTWTJC99UjzwUV8dhBAXtKSY8i+oo6Jp05U4jAniDgI5gvVfIQgy7vOX3OmEa7s
Subject: Re: [oe-commits] Joshua Lock : netbase: remove redundant assignments
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
X-List-Received-Date: Mon, 27 Feb 2012 20:28:15 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 27 feb. 2012, om 14:31 heeft Otavio Salvador het volgende geschreven:

> On Mon, Feb 27, 2012 at 10:26, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> 1) a package with /etc/rpc, /etc/hosts, /etc/protocols and =
/etc/services
>> 2) a package with /etc/network/interfaces
>> 3) a package with the initscript (probably move that into the =
ifupdown package)
>=20
> I like this idea a lot :-D

Any suggestions on how to do the split? This is going to be a painfull =
change by the looks of it, so I'd like a lot of input before I go spin a =
patchset :)

regards,

Koen=



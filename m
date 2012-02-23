Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S0cqb-0001yq-S7
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 18:52:53 +0100
Received: by werc1 with SMTP id c1so970696wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 09:44:32 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.101.228 as permitted sender)
	client-ip=10.180.101.228; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.101.228 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.101.228])
	by 10.180.101.228 with SMTP id fj4mr5346881wib.4.1330019072535
	(num_hops = 1); Thu, 23 Feb 2012 09:44:32 -0800 (PST)
Received: by 10.180.101.228 with SMTP id fj4mr4372924wib.4.1330019072288;
	Thu, 23 Feb 2012 09:44:32 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gd8sm5779673wib.2.2012.02.23.09.44.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 09:44:31 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2346347.g99Y6mRhMf@helios>
Date: Thu, 23 Feb 2012 18:44:29 +0100
Message-Id: <6C81C8C1-7D50-4B8E-9E72-68E5982D3709@dominion.thruhere.net>
References: <11CBD2DA-EE9C-4062-AA95-7B1FAE68E82D@dominion.thruhere.net>
	<2346347.g99Y6mRhMf@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnFX18KVkCbiIxvJdgBynBHh0pQVr66dg64nq1dXj8XXPODC+lpJiuZVgcBpds0sZ8DJcjJ
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: libsdl patch failure
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
X-List-Received-Date: Thu, 23 Feb 2012 17:52:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 feb. 2012, om 18:05 heeft Paul Eggleton het volgende geschreven:

> On Wednesday 22 February 2012 17:40:03 Koen Kooi wrote:
>> Is anyone else seeing this:
>>=20
>> OTE: package libsdl-1.2.14-r5: task do_unpack: Started
>> NOTE: package libsdl-1.2.14-r5: task do_unpack: Succeeded
>> NOTE: Running task 1611 of 1622 (ID: 1,
>> =
/OE/tentacle/sources/openembedded-core/meta/recipes-graphics/libsdl/libsdl=
_
>> 1.2.14.bb, do_patch) NOTE: package libsdl-1.2.14-r5: task do_patch: =
Started
>> ERROR: Command Error: exit status: 1  Output:
>> Applying patch add.XGetRequest.symbol.patch
>> missing header for unified diff at line 11 of patch
>> can't find file to patch at input line 11
>=20
> FWIW I did just build libsdl-nativesdk and did not have this =
problem...

Are you using 'git' as PATCHTOOL or plain patch? 'patch' on my debian =
system chokes, while 'git apply' works fine. I've sent a patch to make =
it work with either.

regards,

Koen=



Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QkHVo-00067z-I5
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 17:19:36 +0200
Received: by wwi18 with SMTP id 18so1924750wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 08:15:27 -0700 (PDT)
Received: by 10.216.79.4 with SMTP id h4mr242008wee.71.1311347727518;
	Fri, 22 Jul 2011 08:15:27 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z83sm1608539weq.20.2011.07.22.08.15.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 08:15:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311347496.2344.144.camel@rex>
Date: Fri, 22 Jul 2011 17:15:24 +0200
Message-Id: <0F43B6DD-9EBD-47CE-AF50-F267C6AD270F@dominion.thruhere.net>
References: <aeea22da699b276a97ca1a17e3c53176c9afd9de.1311345613.git.richard.purdie@linuxfoundation.org>
	<3a3c69a1bc3cf0b6f6a3b13d86c12ed21798d48e.1311345613.git.richard.purdie@linuxfoundation.org>
	<29D487E1-5E59-4A53-B518-3692FF11C70C@dominion.thruhere.net>
	<1311347496.2344.144.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 3/3] conf/machine/include: Set TUNE_CCARGS instead of TARGET_CC_ARCH
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
X-List-Received-Date: Fri, 22 Jul 2011 15:19:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jul. 2011, om 17:11 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-07-22 at 16:54 +0200, Koen Kooi wrote:
>> Op 22 jul. 2011, om 16:49 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> Since we're updating the tune file format, it makes sense to =
abstract
>>> the compiler tune arguments at this point too. This means that =
should
>>> these need to be overridden at any point, the original values can
>>> still be obtained in a similar manner to the other TUNE* variables.
>>>=20
>>> Whilst this isn't strictly necessary for any current need, its =
likely
>>> good practise to standardise this behaviour.
>>=20
>> So if I'm reading the patch correctly this doesn't result in a
>> behaviour change, it just shuffles the definitions around in
>> preparation for Mark's tune overhaul.
>=20
> Yes.
>=20
> I'm trying to split the work Mark and I have done into logical chunks =
we
> can review and these are the pieces to setup the externally facing
> variables we need.
>=20
> I've not yet finished the patches which change the tune files =
themselves
> but we have a pretty good idea of what the finished result needs to =
look
> like to get all this working which we have experimented and tested =
with.


After some changes to meta-ti to move aside the tune files in there =
'bitbake -e' is functionally the same. So for arm926 and cortexa8:

Tested-by: Koen Kooi <koen@dominion.thruhere.net>

regards,

Koen=



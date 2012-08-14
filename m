Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T1GlM-0004BR-Nw
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 15:02:24 +0200
Received: by eekb57 with SMTP id b57so111508eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 05:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=SX+pKgfx/Mb6lpruw9vH1hF82ZV+4ZSKWmVvns7ZAS4=;
	b=K5DR8/R5+Mf0qLtEvONouFRa1AQCbSyF6KSnTGbyPs9YUKrpVcD8BpUt5O6bq62bHF
	U2HMAb/rTEQ1MgxJ8UZw/HxbOnvzZpGS1hZjubqlAgGkdv91WuIWcqu4bT8iM9iSXZDU
	oZFUthC2Ey+3WLNRISUORNJ1/W4wTwWX/JntRwTmELvuTS+0RbVuaVQ3YLdJqafTAPC0
	eiL0V4dGhO2OzV0+to9w1FO/FxtpnVxn60X/R8eGsaGE8lDzqKewc/ewx0laqSZ1lMbL
	ZTfm2RUgnXGcJjDnbAA8u7MtN8B/hd+s4RZVY9iQ80eSYVJi7qHnqy54Q6L2ptPppdq8
	5xng==
Received: by 10.14.184.133 with SMTP id s5mr19281839eem.31.1344948630149;
	Tue, 14 Aug 2012 05:50:30 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6507:c9b9:4609:2873?
	([2001:610:612:0:6507:c9b9:4609:2873])
	by mx.google.com with ESMTPS id l42sm6665536eep.1.2012.08.14.05.50.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Aug 2012 05:50:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <502A3D34.6080208@linux.intel.com>
Date: Tue, 14 Aug 2012 14:50:28 +0200
Message-Id: <15973ABB-4725-4BA6-9C5A-59DFFC274EB8@dominion.thruhere.net>
References: <CAK18fxFfWO0ZG2tisaROTuJ-FSgLoqMW4cUgTpNq3DNeqFpNqg@mail.gmail.com>
	<502A3D34.6080208@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQl64gYMqMl0RsEIPUyLivQS353QyeLwzt2Y5YlJqPZ076lvJYu3zRtwaG3r2MwEZdaeM3kW
Subject: Re: dbus with tests
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
X-List-Received-Date: Tue, 14 Aug 2012 13:02:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 aug. 2012, om 13:57 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> On 08/14/2012 02:11 PM, Andrei Gherzan wrote:
>> In the process of updating dbus, tests (in my opinion) are mandatory.
>>=20
>> While compiling dbus with tests, dbus and dbus-glib are needed. To
>> compile dbus-glib, dbus is needed (obviously). The only solution (to
>> compile dbus with tests) that i found is to create a new recipe named
>> dbus-tests where to compile dbus with --enable-tests
>> --enable-embedded-tests, skip write to sysroot (noexec) and just =
package
>> dbus-tests.
>>=20
>> 1. Do you guys know a better solution for this?
>=20
> We have started to think/chat about this, there was another patch on =
the list recently that Mark Hatle and I talked about tests.
>=20
> I think having the tests enabled with DISTRO_FEATURE would allow for =
the flexibility of enabling then without always incurring the cost =
/overhead of longer compile times.
>=20
> Can you incorporate the changes to the core recipe with out having to =
add a new dbus-tests recipe if you use DISTRO_FEATURE?
>=20
>=20
>> 2. What would be a good path to use for installing tests?
> Same here, disucssion started.I would like to see tests go into =
${datadir}/${BPN} (/usr/share/${BPN}

$datadir is not for executables, but for data

> .  /opt was discussed, but I think we want to leave that clean and =
empty.

/opt is for 3rd party binary-only stuff, it should *never* show up in a =
system package.=



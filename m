Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UFByh-0004EM-3U
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 00:17:59 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so4259955pbc.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 16:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=9n3wluyDV7d5OFWZidMm9I43zjDCfxZK6RiKFza8SpY=;
	b=NpB7xVNlaksR2KnbyLAijPUGp9kZUHhQ1Yn3KfQ2A56KsZ9buf+vJa9wMqHn1lUqKW
	9RL8UfdVXlefyFIcIl4OsXkSbwMNYDChrbCimhrU/CyKWH1Ul/TDtFGtpveHtHn2GENY
	OdxppvagmdaNsJ4742zWFAWKCISoffva4ebTvprCMWOJRKnwDcXA7JvcvKoS3TA9rw6s
	g0EIT/rNxY2sjg8Zbuoe5i/pI5vBnx3eWlwgT4JI7eaRk7l/ln25+MX5Ll/5+ZLF07Ej
	Fk0Yd5rRrYE5J/dr1iszWCxXpBP81PtWCDM7AW1d0B7JQgsXcMGeyt8ZT+uQW6c23iX3
	Xkdg==
X-Received: by 10.68.225.195 with SMTP id rm3mr31786271pbc.188.1363042879740; 
	Mon, 11 Mar 2013 16:01:19 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ab1sm22204963pbd.37.2013.03.11.16.01.18
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 16:01:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <24D6D4AF-8B91-49F9-A3AF-DE07D2BE4117@dominion.thruhere.net>
Date: Mon, 11 Mar 2013 16:01:17 -0700
Message-Id: <96882115-3BB0-4912-8909-DE7BFB91DB97@gmail.com>
References: <f805a0ed9311848da0a412346bc8c0baf8473d2e.1362873102.git.raj.khem@gmail.com>
	<4a7f6b52607ac6dfd7651f1d740e1c8f436884c0.1362873102.git.raj.khem@gmail.com>
	<24D6D4AF-8B91-49F9-A3AF-DE07D2BE4117@dominion.thruhere.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1499)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] systemd: spin libnss_myhostname to package of its own
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
X-List-Received-Date: Mon, 11 Mar 2013 23:18:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 11, 2013, at 7:02 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:

>> python populate_packages_prepend (){
>> -    systemdlibdir =3D d.getVar("base_libdir", True)
>> +    systemdbaselibdir =3D d.getVar("base_libdir", True)
>> +    do_split_packages(d, systemdbaselibdir, '^lib(.*)\.so\.*', =
'lib%s', 'Systemd %s library', extra_depends=3D'', allow_links=3DTrue)
>> +    systemdlibdir =3D d.getVar("libdir", True)
>=20
> libnss-myhostname is not a systemd library, but a plugin for the =
nameservice switcher, it is the proper way to get localhost to resolve =
so you don't need to hack netbase like =
this:http://git.linaro.org/gitweb?p=3Dopenembedded/meta-linaro.git;a=3Dcom=
mitdiff;h=3Dd1fe025991f73b1cdc53d18af8afdf6d650b3b14
>=20

True yes. I was lazy and saw that same mechanism from packaging pov =
could be used.
main intent was to package it as a separate package. I can redo it to =
package it differently
to make the semantics of plugins Vs. core lib clear.

>=20
>=20




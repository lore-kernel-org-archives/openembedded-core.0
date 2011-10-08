Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RCUDY-0004fg-1g
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 12:33:20 +0200
Received: by eyx24 with SMTP id 24so2607814eyx.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Oct 2011 03:27:41 -0700 (PDT)
Received: by 10.223.91.87 with SMTP id l23mr17847659fam.5.1318069661598;
	Sat, 08 Oct 2011 03:27:41 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f10sm17851627fac.14.2011.10.08.03.27.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 08 Oct 2011 03:27:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318061333.8533.58.camel@ted>
Date: Sat, 8 Oct 2011 12:27:39 +0200
Message-Id: <5F487E45-9539-4DE6-AF5F-5664351F86C9@dominion.thruhere.net>
References: <D3F85958-4E8C-4D2C-B8BD-C7AF341FAF47@dominion.thruhere.net>
	<1318061333.8533.58.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Bitbake dependency failure with git fetcher
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
X-List-Received-Date: Sat, 08 Oct 2011 10:33:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 okt. 2011, om 10:08 heeft Richard Purdie het volgende geschreven:

> On Sat, 2011-10-08 at 01:29 +0200, Koen Kooi wrote:
>> Everytime openssl and a git recipe get changed at the same time, I =
end
>> up with:
>>=20
>> | =
/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/g=
it.real: error while loading shared libraries: libcrypto.so.1.0.0: =
cannot open shared object file: No such file or directory
>>=20
>> Why is bitbake not resolving the git-native -> openssl-native dep
>> before invoking the git fetcher?
>=20
> I suspect you're using rm_work?

Yes I do=



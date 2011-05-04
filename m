Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QHXDr-0007Lb-6Y
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 10:14:15 +0200
Received: by wwb17 with SMTP id 17so762161wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 01:11:36 -0700 (PDT)
Received: by 10.227.198.133 with SMTP id eo5mr838675wbb.38.1304496696273;
	Wed, 04 May 2011 01:11:36 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id o6sm523091wbo.54.2011.05.04.01.11.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 May 2011 01:11:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1304495408.21461.151.camel@rex>
Date: Wed, 4 May 2011 10:11:32 +0200
Message-Id: <A1059C12-0EA6-4CA1-A8AA-C212B31D73F7@dominion.thruhere.net>
References: <cover.1304465724.git.sgw@linux.intel.com>
	<1304495408.21461.151.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/33] Consolidated Pull Request
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
X-List-Received-Date: Wed, 04 May 2011 08:14:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mei 2011, om 09:50 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-05-03 at 16:44 -0700, Saul Wold wrote:
>> This has a dependency on your tweaks to gettext.bbclass
>> and base.bbclass.  Otherwise this set has been well tested.
>> It also contains patches that need to backported to bernard.
>=20
> I merged these apart from:
>=20
>> Koen Kooi (1):
>>  git: make it work on the target
>>=20
>> Saul Wold (5):
>>  git: Disable gitk from by default
>=20
> Since I don't think having tcltk-native as a dependency for git-native
> is particularly desireable (but its ok for the target package) yet the
> attempt to change this above still needs work.

The first patch doesn't change anything related to tcltk(-native), since =
it's still disabled in configure. So only if someone adds tcl(-native) =
to DEPENDS and enables it in EXTRA_OECONF the gitk bits will get built.

I'm not sure what the second patch tries to accomplish, though.

regards,

Koen=



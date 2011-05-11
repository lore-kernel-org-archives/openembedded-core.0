Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QK7uJ-0000BO-Mb
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 13:48:47 +0200
Received: by wye20 with SMTP id 20so326915wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 04:46:00 -0700 (PDT)
Received: by 10.227.197.205 with SMTP id el13mr9782424wbb.84.1305114360683;
	Wed, 11 May 2011 04:46:00 -0700 (PDT)
Received: from [172.20.0.95] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id s20sm44411wbh.40.2011.05.11.04.45.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 04:45:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305111264.30391.338.camel@rex>
Date: Wed, 11 May 2011 13:45:58 +0200
Message-Id: <7FB783C6-3AD6-45DD-A957-40E4AA393F58@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<4B81AF14-3B09-4B77-884C-AAF3BE237FA9@dominion.thruhere.net>
	<1305107117.30391.325.camel@rex>
	<D098457C-E05A-40F8-A61C-36604A51A2E1@dominion.thruhere.net>
	<1305111264.30391.338.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082.1)
Subject: Re: [PATCH 0/6] RFC Distro config changes
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
X-List-Received-Date: Wed, 11 May 2011 11:48:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 mei 2011, om 12:54 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-05-11 at 12:13 +0200, Koen Kooi wrote:
>> Op 11 mei 2011, om 11:45 heeft Richard Purdie het volgende =
geschreven:
>>> For the uclibc bits, I'm proposing
>>> to add:
>>>=20
>>> +DEPLOY_DIR_append =3D "-uclibc"
>>> +STAGING_DIR_TARGET_append =3D "-uclibc"
>>> +STAGING_DIR_HOST_append =3D "-uclibc"
>>> +SSTATE_MANIFESTS_append =3D "-uclibc"
>>>=20
>>> to tclibc-uclibc.inc.
>>=20
>> Can we use _append_libc-uclibc =3D "uclibc" or even plain ${TCLIBC} =
in a
>> generic include file? That would be a lot more readable and fix glibc
>> vs eglibc.
>=20
> Changing uclibc around is ok as its not something that has worked well
> in with OE-Core for a while. What I'm trying to avoid is having to =
bump
> all the versions of the sstate files, the sysroot layout and =
associated
> version numbers which is what would have to happen if we change the
> eglibc layout :(.
>=20
> Obviously, if angstrom switches layout its pain for you though so I
> suspect someone loses with this either way :/.

I would think consistency is best, so either set always append TCLIBC or =
never. This isn't a lot more pain than the '-' to '_' change in machine =
names a while ago. And that even had runtime pains!

regards,

Koen=



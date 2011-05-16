Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QLxdR-00076d-KR
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 15:15:00 +0200
Received: by wye20 with SMTP id 20so3786718wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 06:12:02 -0700 (PDT)
Received: by 10.227.200.212 with SMTP id ex20mr4260931wbb.52.1305551522509;
	Mon, 16 May 2011 06:12:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l24sm3139310wbc.13.2011.05.16.06.11.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 06:11:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305546068.3424.33.camel@rex>
Date: Mon, 16 May 2011 15:11:52 +0200
Message-Id: <982B5C11-301B-48C4-91A9-E73BF47FEF8D@dominion.thruhere.net>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<13617913-C458-40F1-AA46-489ACEADF340@dominion.thruhere.net>
	<BANLkTik7k7pd5+cc+5-K3-Di7+hdryow9Q@mail.gmail.com>
	<1305546068.3424.33.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
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
X-List-Received-Date: Mon, 16 May 2011 13:15:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mei 2011, om 13:41 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-05-16 at 02:55 -0700, Khem Raj wrote:
>> On Sun, May 15, 2011 at 11:58 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>=20
>>> Op 16 mei 2011, om 08:04 heeft Khem Raj het volgende geschreven:
>>>=20
>>>> Do not define DEPLOY_DIR_IMAGE
>>>> Append -uclibc to STAGING_DIR_TARGET only for target recipe and =
cross
>>>> recipes
>>>> Append -uclibc to STAGING_DIR_HOST only for target recipes.
>>>>=20
>>>> These changes make sure that we still share the native sysroot
>>>=20
>>> I still stay we append tclibc unconditionally.
>>=20
>> yes thats would simplify things if we agree to use TCLIBC in =
bitbake.conf
>=20
> We can't depend on TCLIBC in bitbake.conf since someone still has the
> option of not using the standard configuration boilerplate we're
> providing.

So we can't add TCLIBC ??=3D eglibc to bitbake.conf?=



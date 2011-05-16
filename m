Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QLzzx-0001GN-EO
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 17:46:21 +0200
Received: by wye20 with SMTP id 20so3931798wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 08:43:29 -0700 (PDT)
Received: by 10.227.182.135 with SMTP id cc7mr3920607wbb.91.1305560608944;
	Mon, 16 May 2011 08:43:28 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o23sm3222454wbc.10.2011.05.16.08.43.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 08:43:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305553841.3424.76.camel@rex>
Date: Mon, 16 May 2011 17:43:26 +0200
Message-Id: <28BB305A-8F6D-413B-A590-D1592E8416CE@dominion.thruhere.net>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<13617913-C458-40F1-AA46-489ACEADF340@dominion.thruhere.net>
	<BANLkTik7k7pd5+cc+5-K3-Di7+hdryow9Q@mail.gmail.com>
	<1305546068.3424.33.camel@rex>
	<982B5C11-301B-48C4-91A9-E73BF47FEF8D@dominion.thruhere.net>
	<1305553841.3424.76.camel@rex>
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
X-List-Received-Date: Mon, 16 May 2011 15:46:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mei 2011, om 15:50 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-05-16 at 15:11 +0200, Koen Kooi wrote:
>> Op 16 mei 2011, om 13:41 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Mon, 2011-05-16 at 02:55 -0700, Khem Raj wrote:
>>>> On Sun, May 15, 2011 at 11:58 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>>=20
>>>>> Op 16 mei 2011, om 08:04 heeft Khem Raj het volgende geschreven:
>>>>>=20
>>>>>> Do not define DEPLOY_DIR_IMAGE
>>>>>> Append -uclibc to STAGING_DIR_TARGET only for target recipe and =
cross
>>>>>> recipes
>>>>>> Append -uclibc to STAGING_DIR_HOST only for target recipes.
>>>>>>=20
>>>>>> These changes make sure that we still share the native sysroot
>>>>>=20
>>>>> I still stay we append tclibc unconditionally.
>>>>=20
>>>> yes thats would simplify things if we agree to use TCLIBC in =
bitbake.conf
>>>=20
>>> We can't depend on TCLIBC in bitbake.conf since someone still has =
the
>>> option of not using the standard configuration boilerplate we're
>>> providing.
>>=20
>> So we can't add TCLIBC ??=3D eglibc to bitbake.conf?
>=20
> No, I can just see the bug reports for uclibc building in a directory
> called XXX-eglibc as the user had only set the PREFERRED_PROVIDER
> variables.

Do you really care about such usecases? Someone who thinks he is too =
smart to use the includes can 'fix' the paths himself, no?=



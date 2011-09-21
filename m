Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6T3A-0004N9-3m
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 22:05:44 +0200
Received: by fxi1 with SMTP id 1so2037395fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 13:00:25 -0700 (PDT)
Received: by 10.223.54.66 with SMTP id p2mr1571973fag.143.1316635225351;
	Wed, 21 Sep 2011 13:00:25 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f25sm5216115faf.7.2011.09.21.13.00.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 13:00:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALT56yOoWAWsGL3_bTmHQud38LxNbtLrKaDLjvLr8Zy6CRodPQ@mail.gmail.com>
Date: Wed, 21 Sep 2011 22:00:22 +0200
Message-Id: <E3278E49-FE63-494F-8448-D32326100715@dominion.thruhere.net>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
	<1316630404-10336-9-git-send-email-dbaryshkov@gmail.com>
	<87BDFF4B-3B1E-4245-BF80-7E784EFBB705@dominion.thruhere.net>
	<CALT56yOoWAWsGL3_bTmHQud38LxNbtLrKaDLjvLr8Zy6CRodPQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 09/17] dbus-glib: disable bash-completion
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
X-List-Received-Date: Wed, 21 Sep 2011 20:05:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 sep. 2011, om 21:57 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:

> On 9/21/11, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>=20
>> Op 21 sep. 2011, om 20:39 heeft Dmitry Eremin-Solenikov het volgende
>> geschreven:
>>=20
>>> Bash completion stuff isn't packaged and used. Stop building it by
>>> passing --disable-bash-completion to configure
>>=20
>> A better idea would be to package it
>=20
> Then we need bash-completion. Would you like it in =
meta-oe/recipes-extended?
> meta-oe/recipes-support? meta-oe/recipes-whatever?

Bash itself is in oe-core, so let's keep it in oe-core.=



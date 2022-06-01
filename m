Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDF3C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 15:14:16 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.web08.8895.1654096448800581925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.194,
 mailfrom: marcel@ziswiler.com)
Received: from [10.10.1.194] ([81.221.243.92]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MZSPL-1oEvSr1SrF-00LBxY;
 Wed, 01 Jun 2022 17:14:04 +0200
Message-ID: <ae6dd0c4f06337b9551e6b08da78851eb4c9be97.camel@ziswiler.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use
 aaf config for alsa-plugins
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Peter Bergin
	 <peter@berginkonsult.se>
Date: Wed, 01 Jun 2022 17:14:01 +0200
In-Reply-To: <20220601154815.085aa68d@booty>
References: <20220531213206.7119-1-marcel@ziswiler.com>
	 <20220531213206.7119-2-marcel@ziswiler.com> <20220601154815.085aa68d@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (by Flathub.org)) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:vvs3h8ry5lK+X+1Dzu2s4exlPtqpQcyjlu3qH02V3lihFTQSgBm
 rwtqxLfMaWRkJc814X/6Wab5xcHsqzGV+09R8Gd8YvgDcCTzMLrx8ILM9DBhcM3WAPEl7xV
 jfuZBrlZASE3lZv9nI13S6CyTcCZkccNilBY8R9Jtt5RAzMYlxlWZtUOygRcAsrhQHhgqm2
 tYKeAq3gWneS1p25StTeg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WOdC30c+LGg=:AOOTkC4QeQ12DoNHNCsQCk
 BO4OCXSt1bSrYOWgyeO4/LUaBPBV0a/ABbU607+/VUZABO2iFUCtkQTWQJlMvcqjXwabH8hKe
 3/ovnPtTti+byaCuCg47WMB89Xs8075Byzl3VR4KVbn0QJndKvHP/3qRJultPDdULEOFuMggE
 pZKltDaIN6ixMMPDCvPHpVUqMPAIZjrFgVzuEhyWMCRARErdq3c4y1T4z71B/qf/32s5vwG8f
 jcQoWYeQ7nrGKUqI53a7ds6waN5EHpgeiVEQ1JTCS0EICgumKO7bZq3p3ecTNtSvY3acVNXch
 xpuuB9SFfu88Z6HT9RCRpp4u7EPDzkWnZ0lMSOJK5baUgTYAG30rf9sJun/Q1NA7xoNFkc5L0
 bfiJg2fdoAHaDORTX749qM3M8I4LlKG8CVu3v4FzOrs5tL/iqDNiU61MByGoYFsIZ1g48l02K
 Lnin3Sxxw0BV4NaIPsfyVUujh3+RWZlccqjBD5zI3oivGyonhICZIuHokz6qknaQJ6Aboz5Vb
 mzgGaJ4kg/Obf4rxQbM+6hvmmJrScpg4gjfXpJat/MICKdzr+wpUkPK8Gr4CFEI8kf8vTwCJL
 2XcYuIT/wkb2EDVW3Oi9ODD1wfkF3mdfZU+jWwVvTPe2ExC5wrnpd7AzPHF1odg4WEmNQXov7
 UwqZIyk5OYj33ee7/daVZWyXaVICqAQ6ULIDXi9CaI66kBpIH+DdNFEh0e0Tin7juGOCMv7kY
 7j/qPXtoFFkilyAh1Bjv6U7Mg7UnoUzWTyB5Sw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 15:14:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166386

On Wed, 2022-06-01 at 15:48 +0200, Luca Ceresoli wrote:
> Hi Marcel,
>=20
> On Tue, 31 May 2022 23:32:06 +0200
> "Marcel Ziswiler" <marcel@ziswiler.com> wrote:
>=20
> > From: Peter Bergin <peter@berginkonsult.se>
> >=20
> > In order to enable configuration option aaf (AVTP Audio Format)
> > used for AVB the library libavtp is a dependency but no recipe for
> > this library was present. aaf support for alsa-plugins was
> > introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> >=20
> > Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> This patch is failing on musl builds:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5308/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5294/st=
eps/12/logs/stdio

To be honest, I don't know nothing about musl and will need to get familiar=
 with that topic first. If anybody
has some suggestions that would be highly appreciated. Thanks!

Cheers

Marcel


Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qc3LP-0000MR-0a
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 00:34:51 +0200
Received: by wwi18 with SMTP id 18so1436591wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:31:08 -0700 (PDT)
Received: by 10.216.177.1 with SMTP id c1mr2073777wem.17.1309386668189;
	Wed, 29 Jun 2011 15:31:08 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm1207336wbb.48.2011.06.29.15.31.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 15:31:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309277475.20015.320.camel@rex>
Date: Thu, 30 Jun 2011 00:31:04 +0200
Message-Id: <FF13454D-FEB4-4166-BAD7-5E2DA0E4F4DA@dominion.thruhere.net>
References: <1309275023-2626-1-git-send-email-koen@dominion.thruhere.net>
	<1309277475.20015.320.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc-locale: fix localedef packaging
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
X-List-Received-Date: Wed, 29 Jun 2011 22:34:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 18:11 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-06-28 at 17:30 +0200, Koen Kooi wrote:
>> the ${PN} still needs some checking, since it will now inheriting the =
default FILES_${PN}
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> I merged a different version of this which drops PN-locale and fixes
> glibc too.

It's getting late here, so I haven't double checked the bug, but:

 * check_data_file_clashes: Package eglibc-utils wants to install file =
/usr/bin/localedef
        But that file is already provided by package  * localedef

This seems fixable by a strategically placed 'rm' in eglibc-package.inc=



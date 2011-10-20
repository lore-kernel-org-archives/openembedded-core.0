Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGm8C-00006K-40
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 08:29:32 +0200
Received: by eyd9 with SMTP id 9so2474894eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 23:23:40 -0700 (PDT)
Received: by 10.223.17.11 with SMTP id q11mr16364478faa.13.1319091820084;
	Wed, 19 Oct 2011 23:23:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v20sm16123087faf.1.2011.10.19.23.23.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 23:23:38 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKopjm-bJY3WJriMiQDtwZcsOWeqZkqnm7F2PwiZvWY0bg@mail.gmail.com>
Date: Thu, 20 Oct 2011 08:23:32 +0200
Message-Id: <67E90C92-F94E-4FF2-ADA5-A5295C4F1279@dominion.thruhere.net>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
	<CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
	<0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
	<1317221697.12332.13.camel@ted>
	<89CD0BCB-1457-4C76-87BA-5ED03454C343@dominion.thruhere.net>
	<1317239461.12332.55.camel@ted>
	<CAP9ODKopjm-bJY3WJriMiQDtwZcsOWeqZkqnm7F2PwiZvWY0bg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Thu, 20 Oct 2011 06:29:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 28 sep. 2011, om 22:04 heeft Otavio Salvador het volgende geschreven:

> On Wed, Sep 28, 2011 at 16:50, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>> This patch improves the current situation and I don't foresee the
>>> autoPR code working soon
>>=20
>> Which is why we need to switch to that model and shake out the issues
>> sooner than later. Enough is enough with the PR madness and we need =
to
>> get to grips and fix it.
>=20
> I fully agree this is the way to go but this doesn't mean we ought to
> hold this patch until all this happens. This patch allows the removal
> of the kernel.bbclass from meta-oe so reducing the delta between
> oe-core and meta-oe.

So a month later and no sign of the mythical working auto-PR-incrementer =
or work on it. So can this patch go in? It would mean we can drop =
kernel.bbclass from meta-oe.





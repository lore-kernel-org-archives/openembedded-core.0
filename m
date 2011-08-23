Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qvq99-00077z-8c
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 14:31:59 +0200
Received: by wyf19 with SMTP id 19so40437wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2011 05:27:14 -0700 (PDT)
Received: by 10.227.29.91 with SMTP id p27mr198861wbc.11.1314102434160;
	Tue, 23 Aug 2011 05:27:14 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id el9sm106915wbb.41.2011.08.23.05.27.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Aug 2011 05:27:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201108231318.10118.paul.eggleton@linux.intel.com>
Date: Tue, 23 Aug 2011 14:27:11 +0200
Message-Id: <63FF64B9-6C5E-4C87-9DFD-7AD9A88A5DD1@dominion.thruhere.net>
References: <cover.1314096402.git.xiaofeng.yan@windriver.com>
	<2a8e8dd160c4dba319dbbd7864d33cecd681b08c.1314096402.git.xiaofeng.yan@windriver.com>
	<201108231318.10118.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Tue, 23 Aug 2011 12:31:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 aug. 2011, om 14:18 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 23 August 2011 11:57:35 Xiaofeng Yan wrote:
>> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>>=20
>> [YOCTO #999]
>>=20
>> Copy metadata of qt4e-demo-image from OE for easy testing qt4embeded =
on
>> embedded platform. This image was tested on qemuarm and can run =
program
>> "qtdemoE".
>=20
> I don't think we should pull in qwt in OE-core (or at least, we =
shouldn't drag=20
> it in just for this.) Also I would recommend trying to make the image =
inherit=20
> from core-image as well to avoid much of the generic boilerplate =
that's in=20
> there.

I would lean toward a seperate meta-qt layer, not sure if it should be =
hosted in the oe-core git repo, meta-oe or a completely seperate git =
repo.

regards,

Koen=



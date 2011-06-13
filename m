Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QW9Pp-0004tz-6A
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:51:01 +0200
Received: by wwb17 with SMTP id 17so4167818wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 08:47:37 -0700 (PDT)
Received: by 10.227.180.130 with SMTP id bu2mr5363131wbb.71.1307980056926;
	Mon, 13 Jun 2011 08:47:36 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm4349829wbb.48.2011.06.13.08.47.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 08:47:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTikZxd4Gg0b0nanMupmdYBf-3LUp7g@mail.gmail.com>
Date: Mon, 13 Jun 2011 17:47:34 +0200
Message-Id: <09A32280-131B-4201-8E32-AFA6A6FD78CA@dominion.thruhere.net>
References: <33AB447FBD802F4E932063B962385B3554AE4989@shsmsx501.ccr.corp.intel.com>
	<BANLkTikZxd4Gg0b0nanMupmdYBf-3LUp7g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] RFC - combo layer repo tool
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
X-List-Received-Date: Mon, 13 Jun 2011 15:51:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jun 2011, om 17:33 heeft Otavio Salvador het volgende geschreven:

> 2011/6/13 Yu, Ke <ke.yu@intel.com>:
> ...
>>    Combo layer tool provides three functionalities:
>>    - init: when the combo layer repo and component repo is not =
existed,
>>      init will "git init" the combo layer repo, and also "git clone" =
the
>>      component repo
>=20
> I think it is duplicating many features of git submodule. It seems
> more logical to put a script above git submodule rather then use a
> full repository for it.
>=20
> Am I missing anything?

The fact that git submodules:

a) universally suck
b) behave wildly different between git versions

The first version of the angstrom setup scripts used git submodules, but =
I quickly found that I as well as my coworkers are too stupid to deal =
with them properly, so we wrote an awk script to manage the layers. It's =
a red flag that only very recent git versions have the 'git clone =
--recursive' feature. It shows that git developers are either really, =
really disciplined or don't use submodules themselves.=



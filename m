Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qcdsy-0005cz-8I
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 15:35:56 +0200
Received: by wwi18 with SMTP id 18so2737573wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 06:32:11 -0700 (PDT)
Received: by 10.216.79.74 with SMTP id h52mr3265384wee.33.1309527131614;
	Fri, 01 Jul 2011 06:32:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w58sm1641249weq.1.2011.07.01.06.32.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 06:32:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <b95079d9c51457835439610ee63c51b1821d3976.1309525642.git.anders@chargestorm.se>
Date: Fri, 1 Jul 2011 15:32:04 +0200
Message-Id: <6E60DDFC-9F26-4239-A322-685CF0597C8D@dominion.thruhere.net>
References: <cover.1309525642.git.anders@chargestorm.se>
	<b95079d9c51457835439610ee63c51b1821d3976.1309525642.git.anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH v5 7/8] task-base: remove modutils reference.
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
X-List-Received-Date: Fri, 01 Jul 2011 13:35:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul 2011, om 15:08 heeft Anders Darander het volgende geschreven:

> Also remove the other kernel24 references.
> Make everything dependent on kernel26 default.
> Move the RDEPENDS- and RRECOMMENDS_task-base-kernel26 to _task-base.
>=20
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
> meta/recipes-core/tasks/task-base.bb |   49 =
++++++++++-----------------------
> 1 files changed, 15 insertions(+), 34 deletions(-)
>=20
>  #
> # linux-hotplug or none
> #
> -HOTPLUG ?=3D "${@base_contains("MACHINE_FEATURES", "kernel24",  =
"linux-hotplug","",d)} "
> +HOTPLUG ?=3D ""

I think this one can go completely


> #
> # pcmciautils for >=3D 2.6.13-rc1, pcmcia-cs for others
> #
> -PCMCIA_MANAGER ?=3D "${@base_contains('MACHINE_FEATURES', =
'kernel26','pcmciautils','pcmcia-cs',d)} "
> +PCMCIA_MANAGER ?=3D "pcmciautils"

This one can get folded into the task directly

regards,

Koen=



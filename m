Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKOnF-0005SC-A1
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 08:55:09 +0200
Received: by wgbdr12 with SMTP id dr12so5928047wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 23:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=uQquqgsmIc1vGIk4XXUK6CVxwrJn4sPU7pC9dicK4bo=;
	b=LW99lDYDunPc90r+Mnp8jXF3G/eyKeR9yOXqhqgUTlpKVOH8i0Y9Yu6kB1UlSaAJg6
	9dkMc0XIapS0bfjVvVlwHeEYHVOAty317ZPNTrSBz8qqtz4OEWpqjzwBVXhoPhXbQliI
	68LUXyXMBGGqdXRCWaZfDM3EEKBFO5Q5QxwwqYKolrOUH3528bjfM4Xt4F0F+QgJWZ0o
	/gEApLUJHwqJCi1RBemr2N/x8w/5XpNM/Hh9w84032v6qMZeEgEsBeQqe8gQoR7KEAfp
	u2qNLDepIgyCPnGsSZEh9UUrDwoGeIJsp63b42Sw2Hq6/FoMO1BGsM49Kch7Tq8UbIuH
	6v+g==
Received: by 10.180.104.137 with SMTP id ge9mr3180294wib.20.1334731542525;
	Tue, 17 Apr 2012 23:45:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 17sm33024037wis.0.2012.04.17.23.45.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 23:45:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <e460168fadf49a885a9451239c3d0b50cf6f468d.1334699033.git.sgw@linux.intel.com>
Date: Wed, 18 Apr 2012 08:45:40 +0200
Message-Id: <B6B1872A-CE88-4136-82C8-236A65AD2AAA@dominion.thruhere.net>
References: <cover.1334699033.git.sgw@linux.intel.com>
	<e460168fadf49a885a9451239c3d0b50cf6f468d.1334699033.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmOVMEER9GTyTf7LI1fEnslCtHinCaPfYSZEzHognE4D3MTqZ5qCMFpBgrXAPqCrQ1bS6Ga
Subject: Re: [PATCH 2/3] task-self-hosted: Add LSB for distro info
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
X-List-Received-Date: Wed, 18 Apr 2012 06:55:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 apr. 2012, om 23:46 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-core/tasks/task-self-hosted.bb |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-core/tasks/task-self-hosted.bb =
b/meta/recipes-core/tasks/task-self-hosted.bb
> index 5588cd3..5d4e153 100644
> --- a/meta/recipes-core/tasks/task-self-hosted.bb
> +++ b/meta/recipes-core/tasks/task-self-hosted.bb
> @@ -44,6 +44,7 @@ RDEPENDS_task-self-hosted-host-tools =3D "\
>     kernel-module-iptable-nat \
>     kernel-module-iptable-mangle \
>     kernel-module-iptable-filter \
> +    lsb \
>     mc \
>     parted \
>     pseudo \

MIssing PR bump=



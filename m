Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZRRn-0008WI-EW
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:42:39 +0200
Received: by wwg12 with SMTP id 12so922694wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:39:04 -0700 (PDT)
Received: by 10.216.253.215 with SMTP id f65mr1007664wes.14.1308764305529;
	Wed, 22 Jun 2011 10:38:25 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g2sm439207wes.10.2011.06.22.10.38.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2011 10:38:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <9b4ad047cdca6bcdc7fbb851e83bcb0440bb5b6f.1308763995.git.mark.hatle@windriver.com>
Date: Wed, 22 Jun 2011 19:38:19 +0200
Message-Id: <FAAA265A-D558-42D6-8F5B-82341F619274@dominion.thruhere.net>
References: <cover.1308763995.git.mark.hatle@windriver.com>
	<9b4ad047cdca6bcdc7fbb851e83bcb0440bb5b6f.1308763995.git.mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 13/40] python: Switch to using the default -dbg package
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
X-List-Received-Date: Wed, 22 Jun 2011 17:42:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jun 2011, om 19:36 heeft Mark Hatle het volgende geschreven:

> Python was missing a lot of debug information.  Switch to use the =
default
> -dbg package.  Also add some additional debug information to the -dbg =
package.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> .../python/python-2.6-manifest.inc                 |    8 ++------
> meta/recipes-devtools/python/python.inc            |    2 +-
> meta/recipes-devtools/python/python_2.6.6.bb       |    4 ++--
> 3 files changed, 5 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python-2.6-manifest.inc =
b/meta/recipes-devtools/python/python-2.6-manifest.inc
> index e4e503c..e3ebe41 100644
> --- a/meta/recipes-devtools/python/python-2.6-manifest.inc
> +++ b/meta/recipes-devtools/python/python-2.6-manifest.inc
> @@ -5,9 +5,9 @@


The top of this file says:

# WARNING: This file is AUTO GENERATED: Manual edits will be lost next =
time I regenerate the file.




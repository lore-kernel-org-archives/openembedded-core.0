Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMJxI-0004Ka-Ea
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 15:04:57 +0200
Received: by wye20 with SMTP id 20so384607wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 06:02:02 -0700 (PDT)
Received: by 10.217.6.198 with SMTP id y48mr3520973wes.81.1305637081161;
	Tue, 17 May 2011 05:58:01 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w25sm317969wbd.39.2011.05.17.05.57.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 05:58:00 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305635487.2429.196.camel@phil-desktop>
Date: Tue, 17 May 2011 14:57:54 +0200
Message-Id: <51CEB658-A6DF-4AA6-8C42-7291824E9E75@dominion.thruhere.net>
References: <1305635487.2429.196.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] image.bbclass: use soft assignment for LDCONFIGDEPEND
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
X-List-Received-Date: Tue, 17 May 2011 13:04:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 17 mei 2011, om 14:31 heeft Phil Blundell het volgende geschreven:

> This allows distros that don't want ldconfig to turn it off.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
> meta/classes/image.bbclass |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index b2325b3..346dd5e 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -23,7 +23,7 @@ PID = "${@os.getpid()}"
> 
> PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> -LDCONFIGDEPEND = "ldconfig-native:do_populate_sysroot"
> +LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
> LDCONFIGDEPEND_linux-uclibc = ""
> LDCONFIGDEPEND_linux-uclibceabi = ""

The 2 last lines need to switch to _libc-uclibc overrides as well



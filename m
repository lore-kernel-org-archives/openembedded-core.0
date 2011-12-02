Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RWV6K-0003tC-Sm; Fri, 02 Dec 2011 16:32:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB2FPsKi031017;
	Fri, 2 Dec 2011 15:25:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30424-07; Fri,  2 Dec 2011 15:25:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB2FPjOJ031011
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 2 Dec 2011 15:25:46 GMT
Message-ID: <1322839555.18900.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Dec 2011 15:25:55 +0000
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pB2FPsKi031017
Cc: openembedded-core@openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/18] Updates & Kernel FLAG DAY
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
X-List-Received-Date: Fri, 02 Dec 2011 15:32:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-12-01 at 22:55 -0800, Saul Wold wrote:
> Anders Darander (1):
>   busybox: update to 1.19.3
>=20
> Bruce Ashfield (7):
>   kern-tools: add pre_config and merge_config.sh to the list of tools
>   kernel-yocto: support allnoconfig base configuration
>   linux-yocto: remove 2.6.34 recipes
>   linux-yocto: v3.0.9 + enhancements
>   linux-yocto: v3.0.10 + rt27
>   linux-yocto: prefer in-tree tools to external ones
>   kern-tools: use Makefile provided install rules

I took these (with a slight reordering)

> Eric B=C3=A9nard (1):
>   base-passwd: fix race between the populate_sysroot and package

This isn't needed as an alternative similar fix already merged.

> Saul Wold (8):
>   resolvconf: Update to 1.62
>   psmisc: Update to 22.14
>   sysstat: Update to 10.0.3
>   sqlite3: Update to 3.7.9
>   less: Update to 444
>   ubootchart: update to svn R12
>   distro tracking updates
>   kernel-yocto: fix extra CR in do_kernel_checkout
>=20
> Stefan Schmidt (1):
>   logrotate: Add dependency on popt lib.

I merged these, thanks.

Richard




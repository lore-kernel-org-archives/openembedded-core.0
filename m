Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RnAXs-0000Cj-PY for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 16:01:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HEsKDg005798
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 14:54:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03805-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 14:54:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HEsDqv005792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 14:54:14 GMT
Message-ID: <1326812058.2933.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jan 2012 14:54:18 +0000
In-Reply-To: <5e9bdd7a86b53c5462f17d4c62fa8d510ff82341.1326786990.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
	<5e9bdd7a86b53c5462f17d4c62fa8d510ff82341.1326786990.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 52/62] tcmode-eglibc: Fix PREFERRED_VERSION of eglibc
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
X-List-Received-Date: Tue, 17 Jan 2012 15:01:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-17 at 00:32 -0800, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 5bb253e..8de26ad 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>  GCCVERSION ?= "4.6%"
>  SDKGCCVERSION ?= "4.6%"
>  BINUVERSION ?= "2.22"
> -EGLIBCVERSION ?= "2.13"
> +EGLIBCVERSION ?= "2.15"
>  UCLIBCVERSION ?= "0.9.32"
>  LINUXLIBCVERSION ?= "3.1"
>  

We deliberately stayed on 2.13 for various reasons. Have those reasons
changed now? If so I'd prefer to see this as a definite change rather
than a "fix"...

Cheers,

Richard




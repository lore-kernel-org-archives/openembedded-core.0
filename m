Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHwca-0000cG-6V for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 13:21:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45BIjGb010302;
	Thu, 5 May 2011 12:18:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10001-05; Thu,  5 May 2011 12:18:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45BIVnQ010296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 May 2011 12:18:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <7f6d6ff09b1e1f426a7280dcdd8e4a7d4a1aab57.1304581770.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
	<7f6d6ff09b1e1f426a7280dcdd8e4a7d4a1aab57.1304581770.git.sgw@linux.intel.com>
Date: Thu, 05 May 2011 12:18:30 +0100
Message-ID: <1304594310.20791.16.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Kyle McMartin <kyle@redhat.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kroah-Hartman <gregkh@suse.de>,
	Arnaldo Carvalho de Melo <acme@redhat.com>, Greg,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: Re: [PATCH 12/26] Remove machine-specific metadata for machines no longer in oe-core
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
X-List-Received-Date: Thu, 05 May 2011 11:21:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-05 at 00:57 -0700, Saul Wold wrote:
> From: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb |   19 +++++++++++++++++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 4445081..c80faaa 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -131,6 +131,25 @@ do_install_basefilesissue () {
>   	fi
>  }
>  
> +<<<<<<< HEAD
> +=======
> +do_install_append_nylon() {
> +	printf "" "" >${D}${sysconfdir}/resolv.conf
> +	rm -r ${D}/mnt/*
> +	rm -r ${D}/media
> +	rm -rf ${D}/tmp
> +	ln -sf /var/tmp ${D}/tmp
> +}
> +
> +do_install_append_slugos() {
> +	printf "" "" >${D}${sysconfdir}/resolv.conf
> +	rm -r ${D}/mnt/*
> +	rmdir ${D}/home/root
> +	install -m 0755 -d ${D}/root
> +	ln -s ../root ${D}/home/root
> +}
> +
> +>>>>>>> d67f12d... Remove machine-specific metadata for machines no longer in oe-core
>  do_install_append_linuxstdbase() {
>  	for d in ${dirs3755}; do
>                  install -m 0755 -d ${D}$d

Er, I didn't take this ;-)

Cheers,

Richard




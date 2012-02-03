Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RtLqL-0001T7-9X for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 17:18:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13GAZaW022070
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Feb 2012 16:10:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21253-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2012 16:10:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13GAToF022064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Feb 2012 16:10:30 GMT
Message-ID: <1328285435.3895.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 03 Feb 2012 16:10:35 +0000
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/14] Self-Hosted Fixes and Package Updates
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
X-List-Received-Date: Fri, 03 Feb 2012 16:18:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-02 at 15:47 -0800, Saul Wold wrote:
> Richard,
> 
> This is a patch of updates and self-host-image fixes.
> I also added the gnupg version that is gplv2 to go along
> with the libzypp changes from Steve.
> 
> Sau!
> 
> The following changes since commit 70e1226e8c10bf07d6c7b1e13d745ad603f2ec73:
> 
>   meta-yocto/local.conf.sample.extended: add LICENSE_FLAGS_WHITELIST section (2012-02-02 22:04:54 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/updates
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates
> 
> Saul Wold (14):
>   task-self-hosted: add disk partitioning tools
>   task-self-hosted: add python-pkgutil since it's required
>   self-hosted-image: add package management for correct installation
>   openssl: Update to 1.0.0g
>   openssl: Update to 0.9.8t (gplv2)
>   gnutls: Update to 2.12.16
>   rxvt-unicode: Update to 9.15
>   gnupg: Add gplv2 version 1.4.7
>   file: Update to version 5.10
>   libidn: Update to 1.24
>   libdrm: Update to 2.4.30
>   xinit: Update to 1.3.2
>   xf86-input-keyboard: Update to 1.6.1
>   distro_track: Track Updates

Merged to master, thanks.

We need to look into the input-keyboard but that doesn't invalidate the
update.

Cheers,

Richard




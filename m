Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVlu2-0005Rv-J2 for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 16:16:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUFADQI000750
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:10:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32633-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:10:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUFA6QU000744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:10:07 GMT
Message-ID: <1322665815.12609.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 15:10:15 +0000
In-Reply-To: <cover.1322642187.git.wenzong.fan@windriver.com>
References: <cover.1322642187.git.wenzong.fan@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2 0/5] add autotools nativesdk to meta-toolchain
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
X-List-Received-Date: Wed, 30 Nov 2011 15:16:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 16:45 +0800, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> v2 updates:
> 1) Extend m4 recipe with 'BBCLASSEXTEND="nativesdk"' instead of add
> new *-nativesdk.bb files;
> 
> 2) Add more comments to the commit messages.
> 
> [yocto #1603]
> 
> Add automake-nativesdk and autoconf-nativesdk into meta-toolchain to
> help users process any new libtool m4 macros in their projects, such
> as fix the configure issue:
>     WARNING: unrecognized options: --with-libtool-sysroot
> 
> Also add m4-nativesdk and gnu-config-nativesdk which required by
> autoconf-nativesdk.

Second version looks good, merged to master, thanks.

Richard




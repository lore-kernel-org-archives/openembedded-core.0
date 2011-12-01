Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RWDY6-0005i9-CY for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 21:48:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1KfPHa020041
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 20:41:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19009-07 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 20:41:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1KfIrD020035
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 20:41:19 GMT
Message-ID: <1322772088.17484.151.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 20:41:28 +0000
In-Reply-To: <cover.1322594901.git.nitin.a.kamble@intel.com>
References: <cover.1322594901.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Misc recipe fixes
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
X-List-Received-Date: Thu, 01 Dec 2011 20:48:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 11:30 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Earlier libtool commit is reworked to keep the SUMMARY line and clean up 
> the white space changes
> 
> gmp commit is also reworked to simplify the changes as per Phils feedback.
> 
> Nitin
> 
> The following changes since commit cf02474bda67f4f1043b2e95e1b371b2354585a7:
> 
>   qt-mobility: Add missing patch (2011-11-29 14:36:18 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/misc
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
> 
> Nitin A Kamble (4):
>   gmp: also generate the libgmpcxx library & package it properly
>   binutils: fix for .debug files QA warnings
>   libtool: Upgrade from 2.4 -> 2.4.2
>   libx11-trip_1.4.4: fix the source tarall checksums

Merged to master (apart from the libx11 change which I'd already merged
a different patch for), thanks.

Richard




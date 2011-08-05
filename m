Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpN2f-0004hG-Es for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:14:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GA82h013718
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:10:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13182-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:10:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GA1LJ013706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:10:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <95e88a0886564c48642a8c32fbe8ee78b19e3c55.1312469790.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<95e88a0886564c48642a8c32fbe8ee78b19e3c55.1312469790.git.nitin.a.kamble@intel.com>
Date: Fri, 05 Aug 2011 17:09:39 +0100
Message-ID: <1312560579.14274.129.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 05/10] toolchain-scripts & other classes: add TARGET_LD_ARCH & TARGET_AS_ARCH vars
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
X-List-Received-Date: Fri, 05 Aug 2011 16:14:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> This is comming from x32 need to pass special parameters to ld & as.
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/classes/allarch.bbclass           |    2 ++
>  meta/classes/cross-canadian.bbclass    |    2 ++
>  meta/classes/cross.bbclass             |    2 ++
>  meta/classes/crosssdk.bbclass          |    2 ++
>  meta/classes/native.bbclass            |   10 +++++++---
>  meta/classes/nativesdk.bbclass         |    4 ++++
>  meta/classes/toolchain-scripts.bbclass |    9 +++++----
>  meta/conf/bitbake.conf                 |   23 +++++++++++++++++------
>  8 files changed, 41 insertions(+), 13 deletions(-)

Merged to master, thanks.

Richard




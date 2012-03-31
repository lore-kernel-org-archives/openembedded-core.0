Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SE1qV-0000Wr-7Z for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 19:12:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VH36Zt025083
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 18:03:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24555-05 for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 18:03:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VH2u8g025077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 18:02:57 +0100
Message-ID: <1333213376.18082.251.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 31 Mar 2012 18:02:56 +0100
In-Reply-To: <512eae1ae0678b247076db900304725702acc91e.1333145263.git.nitin.a.kamble@intel.com>
References: <cover.1333145263.git.nitin.a.kamble@intel.com>
	<512eae1ae0678b247076db900304725702acc91e.1333145263.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] nasm: fix issue with repeat configure
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
X-List-Received-Date: Sat, 31 Mar 2012 17:12:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-30 at 15:28 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> This Fixes bug: [YOCTO #2176]
> 
> This fixes the following issue as mentioned in the bug:
> If nasm-native has to be rebuilt (due to a signature change) it will fail:
> 
> | checking for a BSD-compatible install... /usr/bin/install -c
> | /media/large/tmp/work/x86_64-linux/nasm-native-2.07-r1/nasm-2.07/configure:
> line 4261: syntax error near unexpected token `-W'
> | /media/large/tmp/work/x86_64-linux/nasm-native-2.07-r1/nasm-2.07/configure:
> line 4261: `PA_ADD_CFLAGS(-W)'
> | ERROR: oe_runconf failed
> NOTE: package nasm-native-2.07-r1: task do_configure: Failed
> 
> The failure appears to be caused by do_patch_fixaclocal being run a second time
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-devtools/nasm/nasm_2.07.bb |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)

Merged to master, thanks.

Richard




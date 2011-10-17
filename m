Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RFmco-0005p5-8p for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 14:49:02 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HCnvpP008606 for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:49:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5Nsjwt14ahCq
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:49:57 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HCntSg008602
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:49:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 17 Oct 2011 13:43:09 +0100
In-Reply-To: <9b6df8992d50fe277f28786dec2a13c75d09ad95.1318843077.git.xiaofeng.yan@windriver.com>
References: <cover.1318843077.git.xiaofeng.yan@windriver.com>
	<9b6df8992d50fe277f28786dec2a13c75d09ad95.1318843077.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318855398.21775.8.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] lsb: Change link of ${baselib} to lib64 for 64bits system
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
X-List-Received-Date: Mon, 17 Oct 2011 12:49:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-17 at 17:24 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> Correct two faults:
> 
> 1 Binaries of lsb test suite need ld-linux.so* in /lib64.
> for example:
> Target$ ./lsbcmdchk
> -sh: ./lsbcmdchk: No such file or directory
> Target$ strings lsbcmdchk | grep "ld-"
> /lib64/ld-lsb-x86-64.so.3
> 
> "lsbcmdchk" from lsb test suite is a binary program.
> A new modification to lsb_1.4.bb caused that binaries from lsb test suite can't run
> because binaries of lsb test suite need ld-linux.so* in /lib64.
> But the link is changed due to adding multilib. I changed this link again.
> 
> 2 correct mandir
> Waring will appear when running task task do_populate_sysroot
> 
> NOTE: package lsb-1.4-r2: task do_populate_sysroot: Succeeded
> WARNING: For recipe lsb, the following files were installed but not shipped in any package:
> WARNING:   /{datadir}/man/man1/lsb_release.1.gz
> 
> I changed mandir=${D}/man to mandir=${D}/${datadir}/man
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-extended/lsb/lsb_1.4.bb |   12 ++++++++----
>  1 files changed, 8 insertions(+), 4 deletions(-)

Merged to master, thanks.

Richard




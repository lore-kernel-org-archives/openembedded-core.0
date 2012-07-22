Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ssrpx-0003KC-Ds for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 10:48:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6M8b0xE026798
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 09:37:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19951-06 for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 09:36:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6M8aocU026792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 09:36:51 +0100
Message-ID: <1342946215.21788.53.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 09:36:55 +0100
In-Reply-To: <9c2d0c1746a945290b6c64551fc6ca2e5e043028.1342939738.git.jackie.huang@windriver.com>
References: <cover.1342939738.git.jackie.huang@windriver.com>
	<9c2d0c1746a945290b6c64551fc6ca2e5e043028.1342939738.git.jackie.huang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] useradd.bbclass: use locking of bb.utils to avoid lock race issue of useradd/groupadd
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
X-List-Received-Date: Sun, 22 Jul 2012 08:48:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-07-22 at 14:53 +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> A race condition can occur when adding users and groups to the
> passwd and group files, in [YOCTO #1794], 10 times retry added
> but it is not fixed completely.
> 
> This fix re-writes the useradd_preinst and useradd_sysroot with
> python and use locking of bb.utils to lock the passwd and group
> files before executing useradd/groupadd commands to avoid the
> lock race themselves.
> 
> [YOCTO #2779]
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/classes/useradd.bbclass |  284 ++++++++++++++++++------------------------
>  1 files changed, 124 insertions(+), 160 deletions(-)

Please resend this with the whitespace issues resolved. Its near
impossible to review as it stands :(

Cheers,

Richard




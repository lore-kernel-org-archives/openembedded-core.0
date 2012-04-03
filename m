Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SFAeL-00036X-C8 for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 22:48:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q33KdBQT025123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 21:39:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24480-04 for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2012 21:39:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q33KcrCO025115
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 21:39:02 +0100
Message-ID: <1333485531.11559.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Apr 2012 21:38:51 +0100
In-Reply-To: <f0dc600fd3f7638b0cd378f3fbdc4bc47da5aab9.1333460617.git.paul.eggleton@linux.intel.com>
References: <cover.1333460617.git.paul.eggleton@linux.intel.com>
	<f0dc600fd3f7638b0cd378f3fbdc4bc47da5aab9.1333460617.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] elfutils: disable lzma (and bzip2 for native)
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
X-List-Received-Date: Tue, 03 Apr 2012 20:48:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-03 at 14:44 +0100, Paul Eggleton wrote:
> Fix some library dependency issues:
> * Disable lzma as xz-native is unstated in DEPENDS
> * Disable bzip2 for native as it is in ASSUME_PROVIDED and thus isn't
>   available when elfutils-native is normally built, but if it gets
>   rebuilt the link will be made; plus we don't need it.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.148.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard




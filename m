Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qlj6s-0006Hp-4g for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 16:59:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QEreGZ022398
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:53:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22177-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:53:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QErWJd022392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:53:32 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <ecf0ccbec73c85ee2e5bbbe9828468fcd995c88c.1311653945.git.josh@linux.intel.com>
References: <cover.1311653945.git.josh@linux.intel.com>
	<ecf0ccbec73c85ee2e5bbbe9828468fcd995c88c.1311653945.git.josh@linux.intel.com>
Date: Tue, 26 Jul 2011 15:53:24 +0100
Message-ID: <1311692004.2344.259.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] classes/image_types: IMAGE_TYPES was missing some entries
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
X-List-Received-Date: Tue, 26 Jul 2011 14:59:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 21:21 -0700, Joshua Lock wrote:
> Some of these entries are required by the GUI to enable the expected workflow
> of the ADT, namely a compressed rootfs image.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/classes/image_types.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

I've merged this since its obviously correct, we probably do need to
think about better ways to generate it though as Tom mentions...

Cheers,

Richard




Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPzRE-00010p-3l for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 17:59:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RFtq0x003884;
	Fri, 27 May 2011 16:55:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03786-02; Fri, 27 May 2011 16:55:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RFtinb003877
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 May 2011 16:55:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1306475241.git.raj.khem@gmail.com>
References: <cover.1306475241.git.raj.khem@gmail.com>
Date: Fri, 27 May 2011 16:55:38 +0100
Message-ID: <1306511738.27470.277.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Khem Raj <kraj@juniper.net>
Subject: Re: [PATCH 0/3] Fix uclibc build in thumb mode
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
X-List-Received-Date: Fri, 27 May 2011 15:59:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 22:48 -0700, Khem Raj wrote:
> slugos uses uclibc in thumb mode. These patches fix the build of uclibc in thumb mode
> and additionally fixes shared-mime-info which failed to build with -j4
> 
> The following changes since commit 31b3d1f9aa6fa1640874f7da9cce37f4aa13eab1:
> 
>   uclibc_git.bb: Fix compilation on arm when using thumb instruction set (2011-05-26 22:44:50 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-thumb
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-thumb
> 
> Khem Raj (3):
>   uclibc_git.bb: Fix compilation on arm when using thumb instruction
>     set
>   uclibc.inc: Set COMPILE_IN_THUMB_MODE in .config if
>     ARM_INSTRUCTION_SET != arm
>   shared-mime-info_0.90.bb: Fix more parallel build issues

Merged to master, thanks.

Richard




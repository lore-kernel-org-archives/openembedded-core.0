Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QQbbN-0004e1-Tc for openembedded-core@lists.openembedded.org;
	Sun, 29 May 2011 10:44:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4T8ejBs021596
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2011 09:40:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21352-05 for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2011 09:40:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4T8ebVl021590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2011 09:40:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1306550616.git.raj.khem@gmail.com>
References: <cover.1306550616.git.raj.khem@gmail.com>
Date: Sun, 29 May 2011 09:40:27 +0100
Message-ID: <1306658427.27470.324.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] misc fixed to compile uclibc in thumb mode and fix prserv
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
X-List-Received-Date: Sun, 29 May 2011 08:44:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 19:44 -0700, Khem Raj wrote:
> The following changes since commit ae1ba18f70c0dac5bed376f6677258c33290ce30:
> 
>   uclibc: Add disabled COMPILE_IN_THUMB_MODE to uClibc.machine for all ARM configurations (2011-05-27 19:41:33 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes
> 
> Khem Raj (2):
>   uclibc: Add disabled COMPILE_IN_THUMB_MODE to uClibc.machine for all
>     ARM configurations
>   package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"

Merged to master, thanks.

Richard




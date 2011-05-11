Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QKBAP-0003fu-Qr for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 17:17:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BFEmFT020969;
	Wed, 11 May 2011 16:14:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20697-05; Wed, 11 May 2011 16:14:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BFEgNK020963
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 11 May 2011 16:14:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTimnZyL-Jr0Dyd-CgPKk9k_n_HBT-g@mail.gmail.com>
References: <1305039119-1469-1-git-send-email-otavio@ossystems.com.br>
	<4DC99913.1060403@linux.intel.com>
	<BANLkTimnZyL-Jr0Dyd-CgPKk9k_n_HBT-g@mail.gmail.com>
Date: Wed, 11 May 2011 16:14:37 +0100
Message-ID: <1305126877.30391.371.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] cmake.bbclass: fix qmake and rpath issues
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
X-List-Received-Date: Wed, 11 May 2011 15:17:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 17:04 -0300, Otavio Salvador wrote:
> On Tue, May 10, 2011 at 16:59, Saul Wold <sgw@linux.intel.com> wrote:
> > In Richard's email he proposed one or the other be set, why do you need to
> > set both here?  If both need to be set then you don't need the override.
> 
> Because they're different no? Otherwise native.bbclass has those for others too:
> 
> ...
> PACKAGES = ""
> PACKAGES_virtclass-native = ""
> PACKAGES_DYNAMIC = ""
> PACKAGES_DYNAMIC_virtclass-native = ""
> ...
> 
> Seems logical, no?

What I'm proposing is that native.bbclass should probably set the
override even when its not being used as a BBCLASSEXTEND.

All things considered lets make that a separate change and I'll take
this as is though because as you point out, there are other variables
with this issue too.

Cheers,

Richard






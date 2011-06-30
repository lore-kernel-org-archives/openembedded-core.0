Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QcJJC-0000x6-00
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 17:37:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jun 2011 08:33:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,450,1304319600"; d="scan'208";a="22392519"
Received: from unknown (HELO helios.localnet) ([10.255.17.99])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jun 2011 08:33:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 16:33:48 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201106301633.48933.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Thu, 30 Jun 2011 15:37:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 30 June 2011 16:11:29 Koen Kooi wrote:
> These were turned off by:
> 
> 	commit fae8d5e985e9b05ce90f1eca434ad4dbf2259725
> 	Author: Richard Purdie <rpurdie@linux.intel.com>
> 	Date:   Thu Jul 8 23:51:06 2010 +0100
> 
> 		insane.bbclass: Relax fatal errors for now until we get have time to 
work
> through the backlog
> 
> The current metadata triggers so many of these that they need to be made
> fatal so people will actually fix them.
...
>      return not error_class in [0, 5, 7, 8, 9]

So in principle I can agree that making these fatal again will make people 
sort out the problems that they are flagging up. However, why is class 7 - 
.desktop files being "invalid" - a fatal error, considering there are many sub-
classes of "invalidity" being tested for with varying levels of significance?

(This has probably been discussed on the OE list before but IMHO it merits 
revisiting if so.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



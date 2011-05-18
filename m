Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMgsJ-0001E3-Kj for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 15:33:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4IDUPsg028372;
	Wed, 18 May 2011 14:30:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27964-08; Wed, 18 May 2011 14:30:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4IDUGie028356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 May 2011 14:30:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Date: Wed, 18 May 2011 14:30:13 +0100
Message-ID: <1305725413.3424.316.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: Re: [PATCH 00/15] 18-May-2011 Consolidated Pull
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
X-List-Received-Date: Wed, 18 May 2011 13:33:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-18 at 01:17 -0700, Saul Wold wrote:
> This requests includes the removal of clutter, yaffs and older
> gcc version, along with the GCC 4.6 Update for x86 and arm.
> 
> There is the start of the meta-skeleton layer, which I believe
> we want to be part of oe-core for solid examples to developers.
> 
> As of this writing there is a problem with perl which I think a
> change to the utils.bbclass might fix (adding readlink -fn $0), but
> I am still testing this.

I merged this with the exception of the change to gcc 4.6 by default.
I'm a little hesitant to make that switch until a few more people have
tried using it (e.g. I noticed Bruce was having problems yesterday).

Cheers,

Richard






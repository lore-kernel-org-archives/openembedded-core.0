Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QBgWP-0007Pb-Gp for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 06:57:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I4soVU008132;
	Mon, 18 Apr 2011 05:54:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07459-07; Mon, 18 Apr 2011 05:54:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I4sg87008126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Apr 2011 05:54:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Date: Mon, 18 Apr 2011 05:54:35 +0100
Message-ID: <1303102475.5518.31.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 00/58] Consolidated Updates and Bug Fixes
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
X-List-Received-Date: Mon, 18 Apr 2011 04:57:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-15 at 23:53 -0700, Saul Wold wrote:
> Folks have been busy while we were away at ELC!
> 
> There are package updates, patch classifications, and bug fixes 
> including some CVEs that need to be back ported to 1.0.1
> 
> I still don't have access to openembedded-core-contrib, so please 
> find these in the poky-contrib area.
> 
> Clutter-1.6 has a dependency on json-glib, which Joshua will be fixing
> next week, it's not an issue for most builds right now.
> 
> I did rejects some patches due to issue with build or patch classificiations.
> 
> Hope we can get these in for next week.

I took these with the exception of:

[PATCH 37/58] gnu-config-native: add dependency on perl-native

which I've commented on and:

[PATCH 47/58] setuptools: Make options for setup.py more flexible

which I agree shouldn't be merged.

Cheers,

Richard




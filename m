Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rq45L-0003ci-TA for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 15:44:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PEafvA010863
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 14:36:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10534-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 14:36:37 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PEaYfr010857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 14:36:35 GMT
Message-ID: <1327502196.19643.234.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2012 14:36:36 +0000
In-Reply-To: <cover.1327426808.git.raj.khem@gmail.com>
References: <cover.1327426808.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/7] uclibc update and misc fixes.
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
X-List-Received-Date: Wed, 25 Jan 2012 14:44:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-24 at 09:42 -0800, Khem Raj wrote:
> Hi
> 
> Follwing patches have been tested on uclibc using all qemu
> machines.
> 
> The following changes since commit a4a98b6d6273d4e716afbff0880d0ac2ff7be0a9:
> 
>   gcc-common.inc: Fix comment (2012-01-24 14:38:31 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes
> 
> Khem Raj (7):
>   ltp: Update recipe and fix building on uclibc
>   gdb-common: Drop elfutils from DEPENDS
>   task-core-tools: Divide it into 3 recipes
>   uclibc: Dont package all .a in uclibc-dev
>   eglibc-2.15: Add upstream status for x86_fenv.patch
>   uclibc-git: Update to latest RC
>   util-linux: Change SRC_URI to a fetchable location

For the gdb-common change there is no indication of why the change is
being made. I've also held off the task-core-tools change right now
until we figure out what the .bbappend is doing and why.

I merged the others, thanks.

Richard




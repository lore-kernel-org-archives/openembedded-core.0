Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RWAYw-0007xV-9w for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 18:36:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1HU35n018435;
	Thu, 1 Dec 2011 17:30:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17962-05; Thu,  1 Dec 2011 17:29:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1HTr3T018424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Dec 2011 17:29:54 GMT
Message-ID: <1322760602.17484.144.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <darren@dvhart.com>
Date: Thu, 01 Dec 2011 17:30:02 +0000
In-Reply-To: <cover.1322756466.git.dvhart@linux.intel.com>
References: <cover.1322756466.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] trace-cmd: Fix build failure due to blktrace_api change
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
X-List-Received-Date: Thu, 01 Dec 2011 17:36:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 08:22 -0800, Darren Hart wrote:
> From: Darren Hart <dvhart@linux.intel.com>
> 
> The following changes since commit 2ebfb9d9ed7554180c3c077b14291a1853f8e2ef:
> 
>   puzzles: Ensure to link against libm for math functions (2011-12-01 14:30:49 +0000)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/user-contrib/dvhart/oe-core trace-cmd
>   http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=trace-cmd
> 
> Darren Hart (1):
>   trace-cmd: Add blktrace_api compatibility for TC_BARRIER

I tested this and found it needed a couple of tweaks (fix the SRC_URI
and add PR bumps). I fixed that and have merged it.

Cheers,

Richard




Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1TgUc5-0006dT-LB
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 07:07:18 +0100
Received: from [0.0.0.0] (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id E9BAA2137C;
	Wed,  5 Dec 2012 21:52:49 -0800 (PST)
Message-ID: <50C032B1.90501@windriver.com>
Date: Wed, 05 Dec 2012 21:52:49 -0800
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1354208369.git.elizabeth.flanagan@intel.com>
	<037305f0450c08ec555f5588ad6f3600d2d4a2c8.1354208369.git.elizabeth.flanagan@intel.com>
	<50C02651.30201@linux.intel.com>
In-Reply-To: <50C02651.30201@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 06:07:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2012 09:00 PM, Saul Wold wrote:
> This patch is still having problems, see the Autobuilder recently build (link below).  This is on MUT with the updated binutils, I am not sure if that is part of the problem or not, but binutils was working before.

Ah, fun fun.  It's not binutils.  Something (I'm not sure what -- is
"yocto-autobuild" a recipe?)  is pulling in the cross-canadian
toolchain, and I had missed the appended architecture in the
license.bbclass test.  I'll get you a fixed and tested patch tomorrow
morning.

But there's a serious question here: *should* this have worked?  The
toolchain is GPLv3, and a canadian cross toolchain is presumably
intended to be distributed (because by defintion, it doesn't run on
the local machine), no?

Andy




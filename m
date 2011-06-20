Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QYU2a-00016E-TV
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 04:16:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5K2D8BY025379
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2011 19:13:08 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 19 Jun 2011 19:13:08 -0700
Message-ID: <4DFEACB3.7090405@windriver.com>
Date: Sun, 19 Jun 2011 21:13:07 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308249837.git.scott.a.garman@intel.com>	<3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>	<4DFA97A1.9090909@gmail.com>	<4DFB820B.9070303@intel.com>	<BANLkTi=_Moowev-2U0tmYiuNwAt2BD9WXA@mail.gmail.com>	<4DFB8CAE.8030100@intel.com>	<BANLkTin19xUSV4Rg7u16e3C_s9xkKieasQ@mail.gmail.com>
	<4DFB98A2.9040303@intel.com>
In-Reply-To: <4DFB98A2.9040303@intel.com>
Subject: Re: [PATCH 1/1] base-passwd: disable problematic	login.defs options
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
X-List-Received-Date: Mon, 20 Jun 2011 02:16:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/17/11 1:10 PM, Scott Garman wrote:
> On 06/17/2011 10:22 AM, Otavio Salvador wrote:
>> On Fri, Jun 17, 2011 at 17:19, Scott Garman<scott.a.garman@intel.com>  wrote:
>>> Sorry, I forgot to mention that shadow-utils-native is what is used to
>>> modify the passwd/group files in the target sysroot. It seems that having a
>>> -native recipe install files into a target sysroot would be worse than
>>> including an optional file with base-passwd that may or may not be used in
>>> target systems.
>>
>> Why not make an shadow-target package with this?
> 
> To just install a login.defs file? I'm open to it if a few more people 
> think this is a better idea.

The file is needed in order for the utilities that add, remove and modify
users/groups to function properly.  The full version from shadow utils is used
so we are sure we can dead with both shadow-less and shadowed filesystem images.
 (It's also more full featured then busybox, yet busybox is still compatible
with it.)

As for the separate package, that should be fine.. but remember this is a very
small file, so is it worth "another" package?  (If so, then base-files likely
should depend on it for build-time, but not run-time.)

--Mark

> Scott
> 




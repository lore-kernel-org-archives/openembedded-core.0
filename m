Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QnvQQ-0007VE-D4
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 18:33:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p71GSjcR013785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 09:28:45 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 1 Aug 2011 09:28:44 -0700
Message-ID: <4E36D43B.2060207@windriver.com>
Date: Mon, 1 Aug 2011 11:28:43 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <55CEBFCA-8098-4A58-BC84-0C88D2484ED3@kernel.crashing.org>
In-Reply-To: <55CEBFCA-8098-4A58-BC84-0C88D2484ED3@kernel.crashing.org>
Subject: Re: lib64 not getting picked up
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
X-List-Received-Date: Mon, 01 Aug 2011 16:33:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/1/11 11:15 AM, Kumar Gala wrote:
> I'm trying to build a powerpc 64-bit system and for some reason everything is still in /lib instead of /lib64.
> 
> I'd expect things in /lib64 based on how arch-powerpc64.inc has:
> 
> BASE_LIB_tune-powerpc64 = "lib64"
> 
> any ideas on what to look at for why this isn't happening?
> 
> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

in bitbake.conf try changing "baselib" to:

baselib = "${@d.getVar('BASE_LIB_tune-${DEFAULTTUNE}', True) or 'lib'}"

--Mark



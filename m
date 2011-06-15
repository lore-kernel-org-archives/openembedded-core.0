Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QWsju-0007pi-Ir
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 18:14:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5FGBJQj008377
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 09:11:19 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 15 Jun 2011 09:11:19 -0700
Message-ID: <4DF8D9A6.3020606@windriver.com>
Date: Wed, 15 Jun 2011 11:11:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4DF8D848.9000605@linux.intel.com>
In-Reply-To: <4DF8D848.9000605@linux.intel.com>
Subject: Re: [RFC] DISTRO_MIRRORS / DISTRO_PREMIRRORS
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
X-List-Received-Date: Wed, 15 Jun 2011 16:14:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/15/11 11:05 AM, Saul Wold wrote:
> 
> Folks,
> 
> Recently we have seen a number of fetch failures, due to upstream sites 
> being down or deprecated (tinylogin, pscmic and others).
> 
> The issue is that oe-core as a non-distro does not have a default set of 
> mirrors, which causes the fetcher to fail as there is no fall-back 
> mirror to distrubte the source code.
> 
> As has been pointed out, different projects and distributions (Yocto 
> Project and Angstrom) both have upstream source mirrors which could be 
> used. Currently the Yocto Project defines it's MIRRORS and PREMIRRORS in 
> meta-yocto/conf/distro/poky.conf.
> 
> I propose that we add a list of DISTO_MIRRORS and DISTRO_PREMIRRORS with 
> default settings pointing to the current autobuilder.yoctoproject.org 
> source site.  These would be added to the mirrors.bbclass, so that 
> oe-core will have a default set of mirrors that can be overridden by a 
> distro or layer.
> 

...

> 
> Thoughts, ACKs, NAKs??

The only concern I have is that we may miss when an upstream source location
changes, thus not fixing a recipe when a package moves, disappears and otherwise
can't be downloaded.

--Mark

> --
>      Sau!
> 
> Saul Wold
> Yocto Component Wrangler @ Intel
> Yocto Project / Poky Build System
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




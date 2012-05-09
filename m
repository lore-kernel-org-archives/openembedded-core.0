Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SRvqs-0001zS-Me
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 03:38:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q491S8rF012937
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 May 2012 18:28:08 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 8 May 2012 18:28:08 -0700
Message-ID: <4FA9C827.3050304@windriver.com>
Date: Tue, 8 May 2012 20:28:07 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FA9C638.2000502@intel.com>
In-Reply-To: <4FA9C638.2000502@intel.com>
X-Enigmail-Version: 1.4.1
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: RFC: Who wants/cares about SLiRP networking for QEMU?
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
X-List-Received-Date: Wed, 09 May 2012 01:38:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/08/2012 08:19 PM, Scott Garman wrote:
> This is an inquiry to see if there's much interest in adding an 
> alternate networking capability for our QEMU setups. Currently, we use 
> tun/tap devices, which need root privileges to be created. Hence, our 
> runqemu script requires sudo access.
>
> I'm curious to know who would like to see us use an alternate mechanism 
> (most likely SLiRP) to get around the need for sudo access. Is this much 
> of a problem for anyone, or would the team's resources be better spent 
> on other bugfixes?
>
> Secondly, does anyone have any war stories about using SLiRP for this 
> purpose? Is there a better way we should consider doing this?

We have QEMU + UserMode NFS + SLiRP for years in Wind River Linux products.   In that period I have sent upstream most of the patches dealing with problems.  There remain a few patches to the User Mode NFS service which are not currently in the Yocto project.  I also have a patch that is not in the QEMU mainline that deals with syn packets where QEMU violates the RFC that was never merged upstream for some reason.  I imagine that you will probably want all those patches if that is going to be your mode of operation.

You will also want to create a mechanism to easily add port redirections.  Typically we have always used what we call an simulator "instance" number so we know the ports are at generally fixed locations and for each instance number all the port redirections are incremented by 100.

Cheers,
Jason.



Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q7UJ5-0006mM-Vc for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 17:06:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36F410x019861
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Apr 2011 16:04:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19202-10 for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2011 16:03:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36F3rrg019855
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Apr 2011 16:03:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1302087686.git.josh@linux.intel.com>
References: <cover.1302087686.git.josh@linux.intel.com>
Date: Wed, 06 Apr 2011 08:03:48 -0700
Message-ID: <1302102228.22904.69.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Fix elfutils-native with GCC 4.6
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
X-List-Received-Date: Wed, 06 Apr 2011 15:06:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-06 at 12:10 +0100, Joshua Lock wrote:
> From: Joshua Lock <josh@linux.intel.com>
> 
> Unfortunately I'm currently unable to test this on a machine with GCC version
> other than 4.6 but thought it was worth getting this patch out there as I'll
> be in the air and travelling until next week.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: josh/elfutils
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/elfutils
> 
> Thanks,
>     Joshua Lock <josh@linux.intel.com>
> ---
> 
> 
> Joshua Lock (1):
>   elfutils: remove unused variables to fix compilation with GCC 4.6

Merged to master, thanks.

Richard




Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q8BZh-0003dc-G5 for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 15:18:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p38DFpWT007131;
	Fri, 8 Apr 2011 14:15:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06904-05; Fri,  8 Apr 2011 14:15:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p38DFa00007124
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Apr 2011 14:15:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1302211549.git.sgw@linux.intel.com>
References: <cover.1302211549.git.sgw@linux.intel.com>
Date: Fri, 08 Apr 2011 06:15:32 -0700
Message-ID: <1302268533.22904.119.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 00/11] Recipe Update and Distro Tracking
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
X-List-Received-Date: Fri, 08 Apr 2011 13:18:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-04-07 at 14:37 -0700, Saul Wold wrote:
> From: Saul Wold <sgw@linux.intel.com>
> 
> Richard,
> 
> This is a bacth of recipe updates done by me since these
> do not have maintainers currently.  I started adding 
> Upstream-Status:.  
> 
> This also contains distro_tracking_fields.inc updates.
[...]
> 
> Darren Hart (1):
>   Update trace-cmd and kernelshark distro_tracking
> 
> Paul Eggleton (1):
>   Update distro-tracking-fields.inc for recent qt4 changes
> 
> Saul Wold (9):
>   createrepo: Update to 0.9.9
>   directfb: Update to 1.4.6
>   qmmp: update to version .4.3
>   mc: update to version 4.7.5.1
>   gthumb: update to 2.12.1
>   chkconfig: Update to 1.3.49
>   liburi-perl: update to 1.58
>   distro tracking update
>   lsb: fix lic_files_chksum

I took these and noticed you'd changed the directfb commit. I had to
edit chkconfig and gthumb to contain the right versions in the commit
messages though ;-)

Cheers,

Richard




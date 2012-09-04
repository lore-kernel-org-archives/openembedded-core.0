Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T8tfP-0002Bb-W9 for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 15:59:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84DlNm2017530;
	Tue, 4 Sep 2012 14:47:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17016-04; Tue,  4 Sep 2012 14:47:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84DlCDI017524
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Sep 2012 14:47:13 +0100
Message-ID: <1346766432.30964.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 04 Sep 2012 14:47:12 +0100
In-Reply-To: <cover.1346762109.git.bruce.ashfield@windriver.com>
References: <cover.1346762109.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/6] linux-yocto/kern-tools: consolidated pull request
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
X-List-Received-Date: Tue, 04 Sep 2012 13:59:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-04 at 08:40 -0400, Bruce Ashfield wrote:
> Saul/Richard,
> 
> This is largely the same pull request that I sent a week ago, and
> I've had things fixed for a bit, but I didn't want to send it 
> again during my travel .. and then a long weekend.
> 
> So here's the request again. 
> 
> It is a content update to 3.4.9 + some tool tweaking for problems 
> found by Khem, Matthew Foster and Tom Zanussi. With the tools fixes,
> we have all known use cases back up and working.
> 
> The content update has been tested for 2 weeks now and is safe,
> we do know that the -rt kernel has some issues at the moment, and
> once this pull request is sent, I'll do a refresh on -rt and get
> that problem fixed.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit bb86a22ba6f90902644c11f984ae4c171ba36624:
> 
>   yocto-docs/.gitignore: Final fix to ignore mega-manual. (2012-09-04 12:55:03 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (6):
>   kern-tools: fix forced branching
>   linux-yocto: fix unapplied patch error message
>   linux-yocto: check for bad SRCREV before branch checks
>   kern-tools: fix non-inheriting branch names
>   linux-yocto/3.4: v3.4.9, unionfs, perf and configuration changes
>   linux-yocto/3.2/3.4: arm: Fix linking errors with binutils 2.23

Merged to master, thanks.

Richard




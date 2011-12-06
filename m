Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RXw5i-0001IJ-Ob for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 15:33:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6ER7P2003898
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 14:27:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01056-10 for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2011 14:27:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6EQxLw003892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 14:27:00 GMT
Message-ID: <1323181630.19363.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 06 Dec 2011 14:27:10 +0000
In-Reply-To: <cover.1323162150.git.lei.mei@intel.com>
References: <cover.1323162150.git.lei.mei@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1]Fix inappropriate default protocal in distrodata.bbclass
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
X-List-Received-Date: Tue, 06 Dec 2011 14:33:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-06 at 17:09 +0800, Mei Lei wrote:
> Hi all,
> 	Some git repo recipes use rsync protocal as their default protocal, this will lead errors when checking upstreawm version.
> 	Change default protocal from rsync to git for those git recipes.
> 
> Thanks,
> Lei
> 
> The following changes since commit 0a7a8597be05c8def8af58eecab49d963dc9d757:
>   Richard Purdie (1):
>         libsdl: Disable pulseaudio explicitly
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib lmei3/fix-protocal
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/fix-protocal
> 
> Mei Lei (1):
>   distrodata.bbclass:Fix some recipes upstream version check issue.

Merged to master, thanks.

I believe I have previously asked we look at getting fetcher like
functionality merged into the fetchers and I'd like to mention this
again and ensure its not forgotten. Perhaps we need to file an
enhancement bug in the bugzilla for this?

Cheers,

Richard




Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBCoZ-0006tC-2e for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 23:46:16 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94Ll675024829; Tue, 4 Oct 2011 22:47:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CFspEYuQe4oZ; Tue,  4 Oct 2011 22:47:06 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94Ll04O024813
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 4 Oct 2011 22:47:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 04 Oct 2011 22:40:30 +0100
In-Reply-To: <cover.1317762176.git.bruce.ashfield@windriver.com>
References: <cover.1317762176.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317764439.14671.114.camel@ted>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto: update live boot configuration
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
X-List-Received-Date: Tue, 04 Oct 2011 21:46:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-04 at 17:08 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> Apologies to anyone that prefers these to be pushed out on top of oe-core,
> but my machine with those repos went down today and I wanted to get these
> out quickly, so this is based on top of my yocto/poky tree. I've also had
> to do this on top of my master branch (hence why you see the distro
> version patch), if we do need this on another branch let me know and I'll
> spend the time to re-create my environment on another machine to get
> things staged differently.
> 
> This is a series of changes from Tom to synchronize live boot settings
> across more machines, which are nicely isolated to a few boards.
> 
> Cheers,
> 
> Bruce
> 
> cc: Tom Zanussi <tom.zanussi@intel.com>
> 
> The following changes since commit c88b9915267f9a89983bb58faf3c30fe1dcdab43:
> 
>   poky.conf: Increment DISTRO_VERSION (2011-10-04 18:33:54 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (1):
>   linux-yocto: update live boot configuration

Merged to master, thanks.

Richard




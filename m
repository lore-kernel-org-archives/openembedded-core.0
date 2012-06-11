Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Se4Ey-00027r-GB for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 15:01:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BCoT1a014856;
	Mon, 11 Jun 2012 13:50:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13232-08; Mon, 11 Jun 2012 13:50:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BCoJIO014849
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 11 Jun 2012 13:50:20 +0100
Message-ID: <1339419022.30460.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 11 Jun 2012 13:50:22 +0100
In-Reply-To: <cover.1339169970.git.bruce.ashfield@windriver.com>
References: <cover.1339169970.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-libc-headers: set default LINUXLIBCVERSION to 3.4
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
X-List-Received-Date: Mon, 11 Jun 2012 13:01:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-08 at 11:42 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> Fresh of my typo success of my last series .. I rebuilt core-image-minal
> for all qemu machines from scratch with this in place. No issues were
> seen here, and I'm not sufficiently paranoid for 10 people.
> 
> The 3.4 kernel is released, and is the default for qemu* builds, so
> we can safely update the default libc-headers version to 3.4.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit 0612cf3fcb3365e7721a2d5c331f8cd2647ae60b:
>   Kang Kai (1):
>         hob2: create a standalone deploy image tool
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib zedd/libc-headers
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/libc-headers
> 
> Bruce Ashfield (1):
>   linux-libc-headers: set default LINUXLIBCVERSION to 3.4

Merged to master, thanks.

Richard




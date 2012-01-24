Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RpeGc-0005Y0-Qj for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 12:10:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OB2YXQ027207;
	Tue, 24 Jan 2012 11:02:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25428-07; Tue, 24 Jan 2012 11:02:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OB2Q7f027201
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Jan 2012 11:02:27 GMT
Message-ID: <1327402947.19643.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 24 Jan 2012 11:02:27 +0000
In-Reply-To: <6bcfd05bd269dcceaf8629f22900e4a12650cf3b.1327341147.git.bruce.ashfield@windriver.com>
References: <cover.1327341147.git.bruce.ashfield@windriver.com>
	<6bcfd05bd269dcceaf8629f22900e4a12650cf3b.1327341147.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] linux-yocto/qemuppc: fix console and ethernet
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
X-List-Received-Date: Tue, 24 Jan 2012 11:10:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-23 at 12:54 -0500, Bruce Ashfield wrote:
> Two issues are fixed with this commit, the ability to use the keyboard
> on a graphical qemu boot and enabling ethernet by default on a 3.0
> kernel.
> 
> The keyboard is fixed via the same method as the other simulations with
> the addition of console=tty on the qemu command line.
> 
> Ethernet is fixed by adding a dependency of PCNET32 to the qemuppc
> configuration, which allows us to build ethernet directly into the image.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
>  scripts/runqemu-internal                        |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Merged to master, thanks.

I can confirm qemuppc now has networking as well as graphics which is
great progress :)

Cheers,

Richard




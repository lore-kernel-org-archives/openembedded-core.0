Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1Ieo-0004Jn-3y for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 15:59:14 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87E031E031089; Wed, 7 Sep 2011 15:00:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LhCektuzbjCt; Wed,  7 Sep 2011 15:00:03 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87DxtgI031046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 7 Sep 2011 14:59:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
In-Reply-To: <cover.1315328841.git.bruce.ashfield@windriver.com>
References: <cover.1315328841.git.bruce.ashfield@windriver.com>
Date: Wed, 07 Sep 2011 14:53:52 +0100
Message-ID: <1315403632.13021.4.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/2] linux-yocto: re-enable systemtap and utrace
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
X-List-Received-Date: Wed, 07 Sep 2011 13:59:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-06 at 13:09 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> Just a couple of changes from Tom in this request. Updated support
> for utrace and systemtap that went mysteriously missing when I
> did the bulk update.
> 
> I did my own round of build testing and everything is fine from
> my end.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit dbff56238e083d0110eb13c1f5a07716340fdfe4:
> 
>   icu-3.6: fix building with big make -j (2011-09-06 16:37:02 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
> 
> Bruce Ashfield (2):
>   linux-yocto: re-enable systemtap
>   linux-yocto: re-enable utrace

Merged to master, thanks.

Richard




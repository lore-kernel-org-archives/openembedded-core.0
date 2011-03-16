Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PzrEA-00015M-EZ for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 14:57:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GDtkZC003062;
	Wed, 16 Mar 2011 13:55:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02929-03; Wed, 16 Mar 2011 13:55:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GDtLIK003023
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 16 Mar 2011 13:55:22 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yu Ke <ke.yu@intel.com>
In-Reply-To: <cover.1299919648.git.ke.yu@intel.com>
References: <cover.1299919648.git.ke.yu@intel.com>
Date: Wed, 16 Mar 2011 13:53:07 +0000
Message-ID: <1300283587.30423.1884.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 0/1] Fix bug 658: bottom icons are cut-off in qemu
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
X-List-Received-Date: Wed, 16 Mar 2011 13:57:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-03-12 at 16:55 +0800, Yu Ke wrote:
> the reason of the abnormal matchbox desktop icons is that: desktop is
> not resize after window manager decorate it. there does has resize logic
> in the root window PropertyNotify event handler, however, for some unknown
> reason, the PropertyNotify event does not deliver to the root window.
> 
> this patch fix this issue from anotehr side. Since window manager also
> send configure event to desktop window after decoration, it also works to do
> resize in configure event handler. so this patch add configure event handelr
> to fix this issue.
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: kyu3/bug658-desktop
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/bug658-desktop
> 
> Thanks,
>     Yu Ke <ke.yu@intel.com>
> ---
> 
> 
> Yu Ke (1):
>   matchbox-desktop: add configure event handler to fix bug 658

Merged into master, thanks.

Richard




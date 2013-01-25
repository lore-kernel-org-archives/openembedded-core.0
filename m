Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tysc4-0006pj-4U for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 00:23:12 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PNBobp004221; Fri, 25 Jan 2013 23:11:51 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tr811ZHsh6lB; Fri, 25 Jan 2013 23:11:50 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PNBhmK004162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 25 Jan 2013 23:11:46 GMT
Message-ID: <1359155241.13917.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 25 Jan 2013 23:07:21 +0000
In-Reply-To: <1359153142-13425-1-git-send-email-otavio@ossystems.com.br>
References: <1359153142-13425-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Improve DRI handling support flexibility
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
X-List-Received-Date: Fri, 25 Jan 2013 23:23:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-01-25 at 20:32 -0200, Otavio Salvador wrote:
> There're some processors which provide binary blobs for DRI and GPU
> support which need to be build in BSP; to avoid some dirt and ugly
> hacks in BSP we ought to be flexible.
> 
> We splitted the glx and dri PACKAGECONFIG options and added a
> virtual/dri provider so BSP can override it, if need.
> 
> Otavio Salvador (2):
>   mesa: Add virtual/dri provides
>   xserver-xorg: Split 'glx' and 'dri' PACKAGECONFIG options
> 
>  meta/recipes-graphics/mesa/mesa-common.inc          |  4 ++--
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 13 ++++++++-----
>  2 files changed, 10 insertions(+), 7 deletions(-)

I didn't see the patches here but this would suggest the xserver and
mesa plus anything that depends on them becomes machine specific.

Cheers,

Richard






Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDMti-00015o-Ly for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 23:28:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLJhHW005534
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:19:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05108-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:19:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLJWxh005528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:19:33 +0100
Message-ID: <1333055971.18082.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 22:19:31 +0100
In-Reply-To: <1333032004-16287-1-git-send-email-gary@mlbassoc.com>
References: <1333032004-16287-1-git-send-email-gary@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gstreamer: Provide easy way to enable runtime debugging
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
X-List-Received-Date: Thu, 29 Mar 2012 21:28:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-29 at 08:40 -0600, Gary Thomas wrote:
> The gstreamer framework has a very useful debugging setup which is
> essential for debugging pipelines and plugins.  This patch makes
> it simple to enable this (disabled by default).  To enable debugging,
> just add this line to local.conf
>   GSTREAMER_DEBUG = "--enable-debug"
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  .../gstreamer/gst-ffmpeg_0.10.13.bb                |    3 ++-
>  meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    3 ++-
>  meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    3 ++-
>  .../gstreamer/gstreamer_0.10.36.bb                 |    3 ++-
>  4 files changed, 8 insertions(+), 4 deletions(-)

Merged to master, thanks.

Richard




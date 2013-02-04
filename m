Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U2Lho-0004b7-Is for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 14:03:36 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14CqcKJ002887; Mon, 4 Feb 2013 12:52:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id byQItKgnWEh4; Mon,  4 Feb 2013 12:52:38 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14CqT4F002872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Feb 2013 12:52:32 GMT
Message-ID: <1359982034.14071.156.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: igeiser@devonit.com
Date: Mon, 04 Feb 2013 12:47:14 +0000
In-Reply-To: <1359919022-13375-1-git-send-email-igeiser@devonit.com>
References: <1359919022-13375-1-git-send-email-igeiser@devonit.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH ] add shutdown hook for udev
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
X-List-Received-Date: Mon, 04 Feb 2013 13:03:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-02-03 at 14:17 -0500, igeiser@devonit.com wrote:
> From: Ian Reinhart Geiser <igeiser@devonit.com>
> 
> In cases where other initramfs modules need to rely on
> udev running (ie in my case I have to load firmware on
> a device that is slow to start) there needs to be a way
> to keep it running during the lifecycle of the initramfs
> but still be shut down before swith_root is called.  I
> added a  module_pre_hook that will shut down udev before
> the finish module is called.
> 
> Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
> ---
>  .../initrdscripts/initramfs-framework/udev         |   12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

I've merged this but in future can you please put a suitable prefix on
the subject line so people know which area the patch changes
("initramfs-framework: " in this case). I believe the commit message
guidelines mention this if its unclear.

Cheers,

Richard




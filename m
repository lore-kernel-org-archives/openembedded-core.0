Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPpyG-0006Wp-Fr for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 10:01:35 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3A7tL7f029018; Wed, 10 Apr 2013 08:55:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BDnZgsMuJ95w; Wed, 10 Apr 2013 08:55:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3A7tGrk029010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 10 Apr 2013 08:55:19 +0100
Message-ID: <1365579840.12407.123.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 10 Apr 2013 08:44:00 +0100
In-Reply-To: <1365578806-1907-1-git-send-email-koen@dominion.thruhere.net>
References: <1365578806-1907-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] bitbake.conf: include machine name in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Wed, 10 Apr 2013 08:01:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-10 at 09:26 +0200, Koen Kooi wrote:
> This allows a clean seperation between all image outputs and making it
> possible to have convinience symlinks to make it ready to deploy. And
> while it isn't a valid reason, it must be mentioned: BSP layers which
> do use convenience symlinks already don't step on files owned by
> others anymore.
>
> I assumed this was the default behaviour in OE-classic, but as it
> turns out every DISTRO set it to deploy/images/$MACHINE on its own.
> 
> Code inspections shows that the all references to the image deploy dir
> in classes and scripts in OE-core do the right thing and parse the
> DEPLOY_DIR_IMAGE variable.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I'm pretty sure someone proposed something like this (relocating output)
just before danny. Changing something like this just before release is a
*really* bad idea. It breaks the docs and the assumptions the
autobuilder and several scripts (e.g. runqemu and the qemuimage testing)
make about where output ends up.

So as I said last time, if we want to do something like this, lets do it
at the start of development of a release, not the end.

Cheers,

Richard





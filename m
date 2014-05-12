Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6CFB760167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 21:43:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4CLguMj009971; Mon, 12 May 2014 22:42:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iFJY40VIQhq1; Mon, 12 May 2014 22:42:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4CLgqf5009968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 12 May 2014 22:42:54 +0100
Message-ID: <1399930965.31891.143.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "\\Drew Moseley" <drew@moseleynet.net>
Date: Mon, 12 May 2014 22:42:45 +0100
In-Reply-To: <1399925446-28631-1-git-send-email-drew@moseleynet.net>
References: <537110BF.3000109@linux.intel.com>
	<1399925446-28631-1-git-send-email-drew@moseleynet.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa-demos: Specify the lib dir properly.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 May 2014 21:43:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-05-12 at 16:10 -0400, \Drew Moseley wrote:
> From: Drew Moseley <drew_moseley@mentor.com>
> 
> Use STAGING_EXECPREFIXDIR to specify the location of glut
> header files and libs rather than STAGING_LIBDIR.
> 
> Also revert the previous unneeded change to glut.patch.
> 
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> ---
>  meta/recipes-graphics/mesa/mesa-demos/glut.patch |    2 +-
>  meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb   |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Is this change multilib safe?

It looks to me like this hardcodes "lib" and things like "lib64" or
"lib32" would be an issue since it wouldn't honour $libdir?

Cheers,

Richard



Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGRrL-0005R4-Mb for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 11:55:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8P9gSQx006863;
	Tue, 25 Sep 2012 10:42:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04326-09; Tue, 25 Sep 2012 10:42:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8P9gJ9J006852
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 25 Sep 2012 10:42:20 +0100
Message-ID: <1348566140.8662.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>
Date: Tue, 25 Sep 2012 10:42:20 +0100
In-Reply-To: <1348513241-18271-1-git-send-email-kergoth@gmail.com>
References: <1348513241-18271-1-git-send-email-kergoth@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add and use 'localedir' variable
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
X-List-Received-Date: Tue, 25 Sep 2012 09:55:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 12:00 -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This avoids the hardcoding of ${libdir}/locale which is all over the place,
> and will facilitate use of ${exec_prefix}/lib/locale instead of
> ${libdir}/locale.
> 
> This doesn't actually change any output at this time. Verified this with
> buildhistory against the packages produced from core-image-base.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/libc-common.bbclass            |    2 +-
>  meta/classes/libc-package.bbclass           |   27 ++++++++++++++-------------
>  meta/conf/bitbake.conf                      |    1 +
>  meta/recipes-core/eglibc/eglibc-locale.inc  |    6 +++---
>  meta/recipes-core/eglibc/eglibc-package.inc |   11 ++++++++---
>  meta/recipes-core/eglibc/eglibc.inc         |    1 +
>  6 files changed, 28 insertions(+), 20 deletions(-)

I appreciate the buildhistory tests :)

Merged to master, thanks.

Richard




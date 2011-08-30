Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyVjF-0002Y2-Js for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 23:20:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ULFNlF001777
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:15:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01531-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:15:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ULFEFh001763
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:15:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <49f8f9a5fd900d9ae64d1bb347ab0117efa434a1.1314345568.git.xiaofeng.yan@windriver.com>
References: <cover.1314345568.git.xiaofeng.yan@windriver.com>
	<49f8f9a5fd900d9ae64d1bb347ab0117efa434a1.1314345568.git.xiaofeng.yan@windriver.com>
Date: Tue, 30 Aug 2011 22:15:03 +0100
Message-ID: <1314738903.5939.429.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] eglibc-locale.inc: Add eglibc-binaries, eglibc-localedatas, eglibc-gconvs and eglibc-charmps to variable PACKAGE
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
X-List-Received-Date: Tue, 30 Aug 2011 21:20:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-26 at 17:29 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> There are no locales resources in an lsb image because the locale resources were splitted from eglibc-package.inc \
> and putted into a new file "eglibc-locale.inc". So the above variables lost their function in eglibc-package.inc and
> caused no locale resources in an lsb image. The purpose of moving the above variables from eglibc-package.inc to \
> eglibc-locale.inc is to make the above variables to take effect.
> 
> eglibc-binaries include packages "eglibc-binary-*"
> eglibc-localedatas include packages "eglibc-localedata-*"
> eglibc-gconvs include packages "eglibc-gconv-*"
> eglibc-charmaps include packages "eglibc-charmap-*"
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-core/eglibc/eglibc-locale.inc  |   20 ++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc-package.inc |   20 --------------------
>  2 files changed, 20 insertions(+), 20 deletions(-)

Merged to master, thanks.

Richard




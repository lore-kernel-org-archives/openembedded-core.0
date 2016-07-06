Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 93F2B60119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 16:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u66Gm80b020673; Wed, 6 Jul 2016 17:48:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Gs3XpObwSUYW; Wed,  6 Jul 2016 17:48:07 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u66Gm55V020663
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 6 Jul 2016 17:48:06 +0100
Message-ID: <1467823685.8590.217.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe MacDonald <joe_macdonald@mentor.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 06 Jul 2016 17:48:05 +0100
In-Reply-To: <1467812717-26591-1-git-send-email-joe_macdonald@mentor.com>
References: <1467812717-26591-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] dpkg-deb: strip virtual/ package prefix in control files
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
X-List-Received-Date: Wed, 06 Jul 2016 16:48:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-07-06 at 09:45 -0400, Joe MacDonald wrote:
> If a recipe provides a 'virtual/foo', dpkg-deb will fail as '/'
> characters
> are not allowed in any of the Depends, Recommends, Suggests, etc.
> fields.
> The intent of these in the Debian package system and the few cases
> where
> they are used in Yocto layers seems like throwing away the 'virtual/'
> prefix preserves the intent, while not requiring it to be removed for
> package systems that allow it (eg. opkg and rpm).
> 
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  meta/classes/package_deb.bbclass | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Our virtual/ namespace is only used in DEPENDS, not in the runtime
package namespaces (RDEPENDS, RRECOMMENDS and friends). We therefore
shouldn't need this patch...

Cheers,

Richard






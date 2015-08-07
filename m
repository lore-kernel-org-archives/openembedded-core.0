Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E68CD7673D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 11:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77B5Tfd020322; Fri, 7 Aug 2015 12:05:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mowGfK628bQh; Fri,  7 Aug 2015 12:05:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77B5EJ2020306
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 7 Aug 2015 12:05:27 +0100
Message-ID: <1438945513.30467.35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rongqing.li@windriver.com
Date: Fri, 07 Aug 2015 06:05:13 -0500
In-Reply-To: <1438838323-25159-1-git-send-email-rongqing.li@windriver.com>
References: <1438838323-25159-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][v2] attr: drop sstate fix and narrow relative-libdir.patch to target
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
X-List-Received-Date: Fri, 07 Aug 2015 11:05:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-08-06 at 13:18 +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> The relative-libdir.patch is no longer needed for native since fix_symlink
> for native has been added to revert what it done, Also this patch and
> fix_symlink add a race condition since both libacl.so and libattr.so were
> created, then removed, and then recreated.
> 
> So Only keep relative-libdir.patch for the target.
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta/recipes-support/attr/ea-acl.inc | 23 ++---------------------
>  1 file changed, 2 insertions(+), 21 deletions(-)

Failed on the autobuilder with:
http://errors.yoctoproject.org/Errors/Details/14224/

Cheers,

Richard



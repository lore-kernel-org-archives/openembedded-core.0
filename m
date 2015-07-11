Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 06C686017E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jul 2015 22:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6BMdm05006336; Sat, 11 Jul 2015 23:39:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2G_jseZ-IPsx; Sat, 11 Jul 2015 23:39:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6BMdWxt006332
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 11 Jul 2015 23:39:44 +0100
Message-ID: <1436654372.3310.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Li Zhou <li.zhou@windriver.com>
Date: Sat, 11 Jul 2015 23:39:32 +0100
In-Reply-To: <1432085475-24806-1-git-send-email-li.zhou@windriver.com>
References: <1432085475-24806-1-git-send-email-li.zhou@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: Change alternatives lib path from /usr/lib/opkg to /var/lib/opkg
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
X-List-Received-Date: Sat, 11 Jul 2015 22:39:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-05-20 at 09:31 +0800, Li Zhou wrote:
> When update-alternatives is moved from opkg to opkg-utils, a line in
> the file is changed
> from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
> to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
> But opkglibdir doesn't equal to "/usr/lib" here, but equal to "/var/lib"
>  in oe-core build by configuring --with-opkglibdir.
> opkg-utils can't get the var value in opkg, so here define opkglibdir to
> set the path.
> 
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    3 +++
>  1 file changed, 3 insertions(+)

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/387/steps/BuildImages_3/logs/stdio

Seems related to this :/

Cheers,

Richard



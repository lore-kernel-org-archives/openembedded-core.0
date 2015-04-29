Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D2B0A6AC38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 21:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3TLuoF3025517; Wed, 29 Apr 2015 22:56:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zZRLn-WUyS99; Wed, 29 Apr 2015 22:56:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3TLua0V025497
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Apr 2015 22:56:48 +0100
Message-ID: <1430344596.19130.46.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Apr 2015 22:56:36 +0100
In-Reply-To: <1430261178-3911-1-git-send-email-Martin.Jansa@gmail.com>
References: <1430261178-3911-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] e2fsprogs: install populate-extfs.sh
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
X-List-Received-Date: Wed, 29 Apr 2015 21:56:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-04-29 at 00:46 +0200, Martin Jansa wrote:
> * install populate-extfs.sh from contrib, be aware that in order
>   to use it you need to set DEBUGFS shell variable, otherwise it will
>   try to use debugfs from relative path which is almost always
>   incorrect:
>     CONTRIB_DIR=$(dirname $(readlink -f $0))
>     DEBUGFS="$CONTRIB_DIR/../debugfs/debugfs"
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 2 ++
>  1 file changed, 2 insertions(+)

Do we need this now we have support proper in mkfs.ext for populating
root filesystems?

Cheers,

Richard



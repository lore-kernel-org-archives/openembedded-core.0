Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C9EA1727DA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Apr 2015 12:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3JCZxPj022258; Sun, 19 Apr 2015 13:35:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AQaXQY-jDj9K; Sun, 19 Apr 2015 13:35:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3JCZgrw022247
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 19 Apr 2015 13:35:54 +0100
Message-ID: <1429446942.6976.218.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>
Date: Sun, 19 Apr 2015 13:35:42 +0100
In-Reply-To: <1429026839-19421-1-git-send-email-akuster808@gmail.com>
References: <1429026839-19421-1-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lz4: update package to 128 and SRC_URI
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
X-List-Received-Date: Sun, 19 Apr 2015 12:36:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-14 at 08:53 -0700, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> The main reason for the update is to use github
> as the project moved away from googlecode.
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-support/lz4/{lz4_svn.bb => lz4.bb} | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-support/lz4/{lz4_svn.bb => lz4.bb} (78%)

Failed on the autobuilder:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=7b96cb9585c3ce735689146ed8f08b13ff8bc05e

Cheers,

Richard



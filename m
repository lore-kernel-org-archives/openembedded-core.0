Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 19013607BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 10:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4JAo8fs008219; Tue, 19 May 2015 11:50:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jJIwnt7yvpAU; Tue, 19 May 2015 11:50:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4JAoDcX008233
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 19 May 2015 11:50:24 +0100
Message-ID: <1432032613.32616.26.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rongqing.li@windriver.com
Date: Tue, 19 May 2015 11:50:13 +0100
In-Reply-To: <1432016139-20019-1-git-send-email-rongqing.li@windriver.com>
References: <1432016139-20019-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][V2] sqlite3: upgrade to 3.8.10
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
X-List-Received-Date: Tue, 19 May 2015 10:50:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-05-19 at 14:15 +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> upgrade to include CVE fixes

No mention of the additional patch?

> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../files/0001-using-the-dynamic-library.patch     | 28 ++++++++++++++++++++++
>  .../{sqlite3_3.8.7.4.bb => sqlite3_3.8.10.0.bb}    |  8 ++++---
>  2 files changed, 33 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
>  rename meta/recipes-support/sqlite/{sqlite3_3.8.7.4.bb => sqlite3_3.8.10.0.bb} (64%)
> 
> diff --git a/meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch b/meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
> new file mode 100644
> index 0000000..5818aa2
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
> @@ -0,0 +1,28 @@
> +[PATCH] using the dynamic library
> +
> +Upstream-Status:  Inappropriate [configuration] 
> +
> +using the dynamic library, not link statically

This says what you've done but not why? Why do we need to do this?

Cheers,

Richard



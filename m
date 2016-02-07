Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 361087326E;
	Sun,  7 Feb 2016 22:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u17MhS1I009615; Sun, 7 Feb 2016 22:43:28 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jGAkcs0lZh9l; Sun,  7 Feb 2016 22:43:28 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u17MhNg1009612
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 7 Feb 2016 22:43:24 GMT
Message-ID: <1454885003.27087.344.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org, liezhi.yang@windriver.com,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Date: Sun, 07 Feb 2016 22:43:23 +0000
In-Reply-To: <1454270130-11287-1-git-send-email-akuster808@gmail.com>
References: <1454270130-11287-1-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>
Subject: Stable branch rules [Was: Re: [PATCH][jethro] glibc-locale: fix QA warning]
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
X-List-Received-Date: Sun, 07 Feb 2016 22:43:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-01-31 at 11:55 -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> WARNING: QA Issue: glibc-locale: /glibc-binary-localedata-sd
> -in/usr/lib/locale/sd_IN/LC_CTYPE is owned by uid 1000, which is the
> same as the user running bitbake. This may be due to host
> contamination [host-user-contaminated]
> 
> fix type
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-core/glibc/glibc-locale.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Enough is enough.

I cannot tell whether these patches are in master or not or whether
master needs them or not. Master needs this one, its not in master, its
only being proposed for jethro. Its a mess.

I am therefore not taking any more stable branch patches at all until
we amend the stable branch rules to state that pull requests and
patches clearly state which branches need a fix, or clearly state why
they don't.

Cheers,

Richard




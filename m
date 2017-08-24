Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D127D782B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 10:18:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7OAIo21003795
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 24 Aug 2017 11:18:51 +0100
Message-ID: <1503569930.32591.188.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 11:18:50 +0100
In-Reply-To: <20170824091924.25945-1-git@andred.net>
References: <20170824091924.25945-1-git@andred.net>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 24 Aug 2017 11:18:51 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] bitbake.conf: Add run-parts to HOSTTOOLS
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
X-List-Received-Date: Thu, 24 Aug 2017 10:18:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-24 at 10:19 +0100, André Draszik wrote:
> From: André Draszik <adraszik@tycoint.com>
> 
> ca-certificates runs a postinst task, update-ca-certificates,
> which ultimately wants to execute run-parts.
> 
> Signed-off-by: André Draszik <adraszik@tycoint.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 334ba2361f..8011689118 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -469,7 +469,7 @@ HOSTTOOLS += " \
>      fgrep file find flock g++ gawk gcc getconf getopt git grep
> gunzip gzip \
>      head hostname install ld ldd ln ls make makeinfo md5sum mkdir
> mknod \
>      mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd
> python python2 \
> -    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh
> sha256sum \
> +    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen run-
> parts sed sh sha256sum \
>      sleep sort split stat strings strip tail tar tee test touch tr
> true uname \
>      uniq wc wget which xargs \
>  "

We definitely should not be doing this, there is clearly a dependency
missing somewhere else. ca-certificates should depend on whatever
provides that...

Cheers,

Richard


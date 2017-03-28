Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BBD0777A0C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 13:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2SDYm3a020359; 
	Tue, 28 Mar 2017 14:34:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zhEv4sK92BFo; Tue, 28 Mar 2017 14:34:57 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2SDYsRU020504
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 28 Mar 2017 14:34:55 +0100
Message-ID: <1490708094.13980.286.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Elizabeth 'pidge' Flanagan" <pidge@toganlabs.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 14:34:54 +0100
In-Reply-To: <1490701251-20408-2-git-send-email-pidge@toganlabs.com>
References: <1490701251-20408-1-git-send-email-pidge@toganlabs.com>
	<1490701251-20408-2-git-send-email-pidge@toganlabs.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] bitbake.conf: Add aws-cli support
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
X-List-Received-Date: Tue, 28 Mar 2017 13:34:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-03-28 at 13:40 +0200, Elizabeth 'pidge' Flanagan wrote:
> This commit adds aws-cli support to bitbake in order to support
> the s3 fetcher in bitbake.
> 
> Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
> ---
>  meta/conf/bitbake.conf | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index fa5445b..f21b8d3 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -458,8 +458,8 @@ HOSTTOOLS += " \
>      bash sh cut sed gcc ld git rm install which find xargs cat true mktemp \
>      grep tar gzip touch cp mv basename dirname tr getopt sort awk head tail \
>      mkdir patch uniq perl python chmod python3 ar strip expr ls make as \
> -    ranlib egrep echo chown cpio tee wc wget bzip2 stat date rmdir od diff \
> -    md5sum dd chrpath file pod2man gunzip python2.7 ln g++ [ false true \
> +    ranlib egrep echo chown cpio tee wc wget aws bzip2 stat date rmdir \
> +    od diff md5sum dd chrpath file pod2man gunzip python2.7 ln g++ [ false true \
>      uname test hostname nm objdump objcopy cmp printf env readlink gawk fgrep \
>      expand pwd sleep diffstat chgrp flock ldd strings rpcgen du makeinfo \
>      getconf mknod cpp readelf split \

Adding to HOSTTOOLS means *all* systems have to have this available
else the build fails. This for example would breaks all our
autobuilders. Past feature freeze point this tends to upset me a bit
even more than usual.

You want to add this to HOSTTOOLS_NONFATAL below.

Your patch also doesn't apply against master either.

Cheers,

Richard


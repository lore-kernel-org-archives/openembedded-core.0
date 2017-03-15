Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 34F386079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 21:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2FLhgGS015854; Wed, 15 Mar 2017 21:43:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id y6Vb3mAKPBTW; Wed, 15 Mar 2017 21:43:42 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2FLhd8R015850
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Mar 2017 21:43:41 GMT
Message-ID: <1489614219.13980.74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 21:43:39 +0000
In-Reply-To: <1489601805-20482-1-git-send-email-jslater@windriver.com>
References: <1489601805-20482-1-git-send-email-jslater@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] build-compare: add date to PV
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
X-List-Received-Date: Wed, 15 Mar 2017 21:43:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-15 at 11:16 -0700, Joe Slater wrote:
> We want PV values to be easily ordered, so
> use the latest entry in build-compare.changes which
> will also match the date of SRCREV.
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../build-compare/build-compare_git.bb             |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb 
> b/meta/recipes-devtools/build-compare/build-compare_git.bb
> index eb12e40..c80ebd4 100644
> --- a/meta/recipes-devtools/build-compare/build-compare_git.bb
> +++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
> @@ -17,8 +17,10 @@ SRC_URI = "git://github.com/openSUSE/build-
> compare.git \
>             file://functions.sh-improve-deb-and-ipk-checking.patch \
>             "
>  
> +# Date matches entry in build-compare.changes and date of SRCREV.
> +#
>  SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
> -PV = "git+${SRCPV}"
> +PV = "2015.02.10+git"

I think you either want:

"2015.02.10"
or
"2015.02.10+git${SRCPV}"

but not the one above! :)

(since this matches the style in the other git recipes)

Cheers,

Richard






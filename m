Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsBaq-00013R-9g for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:14:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07Bx69K004236;
	Mon, 7 Jan 2013 11:59:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04131-01; Mon,  7 Jan 2013 11:59:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07Bwx0u004228
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 11:59:00 GMT
Message-ID: <1357559941.25855.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marko Lindqvist <cazfi74@gmail.com>
Date: Mon, 07 Jan 2013 11:59:01 +0000
In-Reply-To: <1357516181-5358-5-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 04/15] file: replace obsolete automake macros with working ones
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 12:14:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-07 at 01:49 +0200, Marko Lindqvist wrote:
> Add obsolete-automake-macros.patch that replaces automake macros
> no longer supported by automake-1.13 with modern constructs.
> 
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  .../file/file/obsolete_automake_macros.patch            |   15 +++++++++++++++
>  meta/recipes-devtools/file/file_5.11.bb                 |    3 ++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/file/file/obsolete_automake_macros.patch
> 
> diff --git a/meta/recipes-devtools/file/file/obsolete_automake_macros.patch b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
> new file mode 100644
> index 0000000..8b0d34c
> --- /dev/null
> +++ b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Fixed in file-5.12

Can we use a standard syntax for this, something like:

Upstream-Status: Backport (fixed in file-5.12)

(as mentioned in
https://wiki.yoctoproject.org/wiki/Contribution_Guidelines#Patch_Header_Recommendations)

for the same reasons as I just mentioned to Marcin - so we can tell from
scripts what status patches have and it helps reviewers in future know
this can be dropped. The aim is to push patches upstream and standard
syntax means we can get real numbers for how many patches we're
carrying.

I appreciate you can read and tell from the above what it means but I
really want to try and use a consistent syntax.

Cheers,

Richard





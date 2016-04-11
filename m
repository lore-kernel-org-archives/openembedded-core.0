Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF9C6E6B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 14:08:44 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 7C90568A019; Mon, 11 Apr 2016 15:08:44 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id AE30468A01C;
	Mon, 11 Apr 2016 15:08:40 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 362CB6740509;
	Mon, 11 Apr 2016 16:08:40 +0200 (CEST)
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1460372872-7074-1-git-send-email-jussi.kukkonen@intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <570BAFE7.7080908@mlbassoc.com>
Date: Mon, 11 Apr 2016 16:08:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1460372872-7074-1-git-send-email-jussi.kukkonen@intel.com>
Subject: Re: [PATCH] glib-2.0: Put glib-compile-schemas back in -utils
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
X-List-Received-Date: Mon, 11 Apr 2016 14:08:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-04-11 13:07, Jussi Kukkonen wrote:
> Commit cc97d576 moved a bunch of development tools to the -dev
> package. glib-compile-schemas is actually used in postinst by
> gsettings.bbclass so it needs to be available on target at package
> install time: Move the tool back to glib-2.0-utils which
> gsettings.bbclass depends on.
>
> Fixes [YOCTO #9431].
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

Looks like this fixes it, thanks.

Acked-by: Gary Thomas <gary@mlbassoc.com>

> ---
>
> I also reviewed again the other tools that were moved in cc97d576:
> this one seems like the only one that is needed at postinst.
>
> Possibly glib-compile-schemas should be installed with the library
> (like qio-querymodules now is) but I'd rather not do that at this
> point in the release as it would mean other changes like moving
> the binary install location.
>
> This commit is also available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib jku/glib-compile-schemas
>
>
>   meta/recipes-core/glib-2.0/glib.inc | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 3a03191..e764fad 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -57,7 +57,6 @@ FILES_${PN}-dev += "${libdir}/glib-2.0/include \
>                       ${bindir}/glib-genmarshal \
>                       ${bindir}/glib-gettextize \
>                       ${bindir}/glib-mkenums \
> -                    ${bindir}/glib-compile-schemas \
>                       ${bindir}/glib-compile-resources \
>                       ${datadir}/glib-2.0/gettext/po/Makefile.in.in \
>                       ${datadir}/glib-2.0/schemas/gschema.dtd"
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


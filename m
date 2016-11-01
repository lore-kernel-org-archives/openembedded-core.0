Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 868B5719C5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 10:20:02 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 18CA568A01C; Tue,  1 Nov 2016 10:20:03 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id B548B68A019;
	Tue,  1 Nov 2016 10:20:02 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 52C4A6740334;
	Tue,  1 Nov 2016 11:20:02 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1611010545380.25706@ca624034.mitel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <df783f19-0a54-efd5-fa17-a25da1c4bcef@mlbassoc.com>
Date: Tue, 1 Nov 2016 11:20:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1611010545380.25706@ca624034.mitel.com>
Subject: Re: some pedantic questions about layer.conf "best practices"
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
X-List-Received-Date: Tue, 01 Nov 2016 10:20:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-11-01 11:04, Robert P. J. Day wrote:
>
>   updating a tutorial about writing a proper layer.conf file, so some
> nitpicky questions about recommended style.
>
>   first, when appending to BBFILES, is it recommended to explicitly
> use separate wildcard patterns of "*.bb" and "*.bbappend", or just get
> lazy and use "*.bb*"? i realize that, in the end, it makes no
> effective difference; i just happen to prefer the more explicit
> pattern; just wondering if anyone has any preferences on this either
> way. (i did say "nitpicky.")

"*.bb*" also matches "*.bb~" and "*.bbappend~" (I use emacs which makes
these backup files) that could be WAY confusing...

>
>   next, what is best practice for naming a layer, since standards seem
> to differ. if i create a layer named "meta-rday", i've seen standards
> where the layer is "named" with one of:
>
>   BBFILE_COLLECTIONS += "rday"
>   BBFILE_COLLECTIONS += "meta-rday"
>   BBFILE_COLLECTIONS += "rday-layer"
>
> amusingly, some freescale layers bounce around:
>
>   BBFILE_COLLECTIONS += "freescale-layer"
>   BBFILE_COLLECTIONS += "fsl-arm"
>   BBFILE_COLLECTIONS += "fsl-ppc"
>
> even the meta-openembedded (sub)layers don't have a consistent style;
> some examples, which show all three styles:
>
>   meta-filesystems/conf/layer.conf:BBFILE_COLLECTIONS += "filesystems-layer"
>   meta-initramfs/conf/layer.conf:BBFILE_COLLECTIONS += "meta-initramfs"
>   meta-webserver/conf/layer.conf:BBFILE_COLLECTIONS += "webserver"
>
> is there an encouraged style?
>
>   finally, is it necessary to have LAYERDEPENDS include "core"? isn't
> that automatic? how could you possibly have a viable build system
> without the oe-core layer (unless this gives you the freedom to
> replace it with a custom one, which i don't see the value of).
>
>   i think that's it for now ... thoughts?
>
> rday
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC7F719AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 10:31:55 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 6CE4768A01C; Tue,  1 Nov 2016 10:31:56 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 0E43C68A019;
	Tue,  1 Nov 2016 10:31:55 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 2BE426740318;
	Tue,  1 Nov 2016 11:31:54 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1611010604480.25706@ca624034.mitel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <ded90a7f-d736-d89d-b11d-661140f3fd10@mlbassoc.com>
Date: Tue, 1 Nov 2016 11:31:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1611010604480.25706@ca624034.mitel.com>
Subject: Re: curious about inherent value of dynamic layers
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
X-List-Received-Date: Tue, 01 Nov 2016 10:31:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-11-01 11:18, Robert P. J. Day wrote:
>
>   more pedantry: i notice that a small number of layers (eg,
> meta-freescale, meta-mentor) include "dynamic" layers, so that some
> sublayers are included only conditionally if others layers are
> included. from meta-freescale's layer.conf:
>
> ///// start
>
>   # The dynamic-layers directory hosts the extensions and layer specific
>   # modifications related to Freescale products.
>   #
>   # The .bbappend and .bb files are included if the respective layer
>   # collection is available.
>   BBFILES += "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.bbappend' % layer \
>                for layer in BBFILE_COLLECTIONS.split())}"
>   BBFILES += "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.bb' % layer \
>                for layer in BBFILE_COLLECTIONS.split())}"
>
> ///// end
>
> where the "dynamic-layers" directory in that layer contains further
> recipe directories with .bbappend files related to other layers:
>
>   drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 browser-layer
>   drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 efl-layer
>   drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 filesystem-layer
>   drwxrwxr-x. 4 rpjday rpjday 4096 Jun 26 06:36 networking-layer
>   drwxrwxr-x. 6 rpjday rpjday 4096 Jun 26 06:36 openembedded-layer
>   drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 qt4-layer
>   drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 qt5-layer
>   drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 virtualization-layer
>
> seems like an interesting idea ... opinions on whether this is a
> useful approach? or possibly overly confusing? is this approach
> mentioned in any OE/YP doc?

It's very useful if they have .bbappend files in these directories
as that will cause problems building if you don't include the corresponding
layers.


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


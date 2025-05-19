Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00611C54756
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 10:52:43 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.48324.1747651956020894078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 03:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cavWuPBc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D046043A03;
	Mon, 19 May 2025 10:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747651954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fQW1whJLVMbFxoSChSrRn6W1NoOYCKUIsMKT+XkMoUs=;
	b=cavWuPBcMTxePWiKoPTcTFGJtxPXNG66V0YSlH93TF+bHbW7Lik0wtxGzc27H9SDWY9RJq
	p+X0cZynr4twYU9qBJs8nMvp+8+jayOTBYbUd5oDS/pOTPbBZpEh3cGMSAPl9I5D76lNW0
	f3kdOkhUkB44jVOXguTTtFKJEpovwxzBEMCwfgKkjM1VhWlXwMGEc9EUdppVHRvogJEuMs
	Rmlrq3LqFwMi/ozsorHE2EEA8QU+3udufWdRCsZ094VedzuuGq0MDwFjF1CeH3SzVPHa/l
	35jOgIyGB/HXCe5ydDAbAAhVIYagU2xmWkTI6ffwAl7afBYssr0E3j464aIjUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 12:52:29 +0200
Message-Id: <DA02WU2YGQPI.3KXN4YKUA7LDR@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/4] libxml2: upgrade 2.13.8 -> 2.14.3
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250519081000.2298461-1-hongxu.jia@windriver.com>
In-Reply-To: <20250519081000.2298461-1-hongxu.jia@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeugffhgfetteehtdffudfhteelleegvdejvdekudeukeeuvdelffdtuddvieefieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgnhhomhgvrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohephhhonhhggihurdhjihgrsegvnhhgrdifihhnughrihhvv
 ghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 10:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216835

On Mon May 19, 2025 at 10:09 AM CEST, hongxu via lists.openembedded.org wro=
te:
> - Rebase install-tests.patch
> - Remove --enable-ipv6, due to upstream [build: Remove check for IPv6 ][2=
]
>
> License-Update: Mention contributors in Copyright [1]
>
> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752=
e0daac3a189d2fec8f7
> [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/dc6f55cf6e03ae63a40e3=
af9ad6879821558d6a7
>
> Release notes: https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14.3
> Regressions
>
>     reader: Fix reading compressed data
>     parser: Make undeclared entities in XML content fatal
>     save: Fix XML escape table
>     save: Fix xmlSave with NULL encoding
>     Revert "valid: Remove duplicate error messages when streaming"
>
> Bug fixes
>
>     save: Fix serialization of attribute defaults containing &lt;
>     io: Fix linkage of __xml*BufferCreateFilename functions
>
> Build systems
>
>     cmake: Fix installation directories in libxml2-config.cmake
>     meson: Install libxml2.py
>
> Improvements
>
>     parser: Make xmlCtxtGetValidCtxt depend on VALID_ENABLED
>     html: Avoid HTML_PARSE_HTML5 clashing with XML_PARSE_NOENT
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi,

Thanks for your patches.

It looks like the libxml2 upgrade is breaking the build of lttng-tools:

ERROR: lttng-tools-2.13.15-r0 do_compile: oe_runmake failed
ERROR: lttng-tools-2.13.15-r0 do_compile: Execution of '/srv/pokybuild/yoct=
o-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnu=
eabi/lttng-tools/2.13.15/temp/run.do_compile.60377' failed with exit code 1
...
| In file included from /srv/pokybuild/yocto-worker/qemuarm-alt/build/build=
/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/lttng-tools/2.13.15/recipe-=
sysroot/usr/include/libxml2/libxml/parser.h:25,
|                  from ../../../../lttng-tools-2.13.15/src/common/config/s=
ession-config.c:29:
| /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/cortexa15t2h=
f-neon-poky-linux-gnueabi/lttng-tools/2.13.15/recipe-sysroot/usr/include/li=
bxml2/libxml/encoding.h:173:7: note: declared here
|   173 |     } input XML_DEPRECATED_MEMBER;
|       |       ^~~~~
| ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:432:15=
: error: called object is not a function or function pointer
|   432 |         ret =3D handler->input(out_str, &out_len, (const xmlChar =
*) in_str, &in_len);
|       |               ^~~~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1633

Can you look at this failure please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



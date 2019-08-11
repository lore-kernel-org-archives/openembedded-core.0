Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id D5D757F220
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Aug 2019 16:20:12 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id r6so75367643qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Aug 2019 09:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=deYkuTWfS9OR13DrT2Kge43ONr/goZIuZYPgiIXVy+w=;
	b=gAnULoYfTrqxaB9xYlwwWLE98WYMGJpqxjB5mWUJFW+b3No0eCG8Q7fOWEsEOEvDb2
	JgAEE1kUAD3jR7M+QMD2g5fGcGzMmxjNNDuOjNbrNLBz+tHHxUeDfynah642pQd2FSGK
	f5ndaU68fyuoSxOp7AG2VOzXQdM120uvbNwoCgy+7chqYT4MHQfOOgkTSU25XERB3XG/
	yUlAFPfSRgtcLomK1S75dpWaxt9e1BIzJATlqmSexfS4AXxRhR9yBXpcqcNsuXmLLm3b
	b0TegvLibnbfTgWs4nkIBw57qtoc7GbSt9Sum4UodhLcfm/KI2D1fjDHM1Q39EsbK5CX
	SPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=deYkuTWfS9OR13DrT2Kge43ONr/goZIuZYPgiIXVy+w=;
	b=OKrpkH4lyjeTRcPzdcczvr/NMu4c1KvLU0VSiUjTDFeYt16JNv3tv5W+2f76nco4Xp
	SmOJOYf4o0gE8vLqPcZ31GO8Xotyd5Sc+XGwhnEwsTgYMmgao1XRi5+QEpvc4F1DaYQA
	8QBbReujScnVyj7GdH11DHUITAtd/wwRYEoCtTB7mBzP3CQ9TWNgUwG30WfZgfM1qZFH
	hI3Q3ADD9PT/ayZWKPt/3iOPkP9fyc35aZluJcAxsZTr0hYVbZY6L09qvTXTEAmdDLXN
	J8hQmerSBGtSPEHG2YEz+Od7uofnCOhTVKgyxlJg77kariF61EqQH8A38rk/Z3EmiWjm
	C/YA==
X-Gm-Message-State: APjAAAVxbaE+WlL5tzHOzCev0M1TzrovpnvC7fUeKSZy6/D1si/aon+f
	2VHAkSA6hVTFpub1ooYWoBkyqbsHKUtPeT8NBjs=
X-Google-Smtp-Source: APXvYqxF/NRKEhC07xqwq1yMBbuPEuC4WXOXbjUL3Hi3aFHv6aY7kuol+qFK7kYH0kGJiMI2if0SzvpizVtMK9CuJ/E=
X-Received: by 2002:a37:7083:: with SMTP id l125mr26060847qkc.71.1565540413369;
	Sun, 11 Aug 2019 09:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <AA9B40170ABA1047B45E714CB2B866B706BC13BE@PGSMSX103.gar.corp.intel.com>
In-Reply-To: <AA9B40170ABA1047B45E714CB2B866B706BC13BE@PGSMSX103.gar.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Aug 2019 09:19:57 -0700
Message-ID: <CAMKF1so90EMEMM6qk91mZVRXhRxbDo=N=xmDig8+J1MaVx-NaA@mail.gmail.com>
To: "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-dbus: Add native and native-sdk support
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
X-List-Received-Date: Sun, 11 Aug 2019 16:20:13 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard

Can this patch be applied ? there are recipes in meta-oe which are
waiting for this fix.

On Wed, Jul 24, 2019 at 12:06 AM Chan, Aaron Chun Yew
<aaron.chun.yew.chan@intel.com> wrote:
>
> From: Chan, Aaron Chun Yew
> Sent: Wednesday, July 24, 2019 3:02 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Chan, Aaron Chun Yew <aaron.chun.yew.chan@intel.com>
> Subject: [meta-oe][PATCH] python3-dbus: Add native and native-sdk support
>
> From: Aaron Chan <aaron.chun.yew.chan@intel.com>
>
> Signed-off-by: Aaron Chan <aaron.chun.yew.chan@intel.com>
> ---
>  meta/recipes-devtools/python/python3-dbus_1.2.8.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.8.bb b/meta/recipes-devtools/python/python3-dbus_1.2.8.bb
> index 923da3c..2fb1eae 100644
> --- a/meta/recipes-devtools/python/python3-dbus_1.2.8.bb
> +++ b/meta/recipes-devtools/python/python3-dbus_1.2.8.bb
> @@ -22,3 +22,5 @@ EXTRA_OECONF += "--disable-documentation"
>  RDEPENDS_${PN} = "python3-io python3-logging python3-stringold python3-threading python3-xml"
>
>  FILES_${PN}-dev += "${libdir}/pkgconfig"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>


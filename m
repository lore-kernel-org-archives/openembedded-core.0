Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 77EE271408
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 09:14:24 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id m5so10500470qaj.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 02:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9O6/85POnJ+UD9wQaIKg7L0NIN+aioMlEC/wnb/xTRU=;
	b=T2er/oE8tRgSS1pMzt6e1WMaNLd60VpY12dfM/Nvy3QUMrFu0o3wp7bYwAhU0/sl8O
	LhIktWRCP/lVxfq3y5p4iwKXxZvg/erjreNBRwBoQD2HZvb6klkDgs3/MrmYUifYCklb
	TYrZTfqN+jA0L1QQXnGC35pj23jvNFhKh/JZ9Eu6nmj9oYpQgbsjFE6nhGHJFKbY6uRO
	ZHVJPoUhC9x6hooZM+isc3VOG8hMGqkEb5qIUh80xVpvSE4Iz+3Kw81xS+8FKNgVBBzE
	eddTg2j8Bj9oNcA4iAeR3wK9a/HldrBjLi1X41prLL/VWJJ5iWPrweE1DRnXS817eeLo
	6PpA==
X-Gm-Message-State: ALoCoQlcBT+SS79jGXGKU6KrrWBOetQiv3Tc46ythBfYOrlPznV85UQ56k/L+94YElef9TmMQmBh
X-Received: by 10.140.27.173 with SMTP id 42mr15417557qgx.59.1409908465966;
	Fri, 05 Sep 2014 02:14:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 5 Sep 2014 02:14:05 -0700 (PDT)
In-Reply-To: <CACS+7ZQq_tHp0vA0FA8e1W+iLhuzEA3tov0B5QGFaUvGp_cgNg@mail.gmail.com>
References: <CACS+7ZQq_tHp0vA0FA8e1W+iLhuzEA3tov0B5QGFaUvGp_cgNg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Sep 2014 10:14:05 +0100
Message-ID: <CAJTo0Lb8TdnZqDObaNS5JQROLYF9MG-67+W5i=kFBF8TE+s8-Q@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Use ${ROOT_HOME} instead of /root
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
X-List-Received-Date: Fri, 05 Sep 2014 09:14:25 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2014 20:57, Dan McGregor <danismostlikely@gmail.com> wrote:
>   sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
> + sed -i -e 's:"/root":"${ROOT_HOME}":g' \
> +        ${S}/src/core/unit-printf.c \
> +        ${S}/src/nspawn/nspawn.c \
> +        ${S}/src/shared/util.c

Sedding service files is one thing, but entire C files is another.
Can you please sent this change as a patch to the source?  FWIW for
patches where the context isn't that relevant I've started using
patches without the context lines so there's more chance of them
applying in future releases.

Ross


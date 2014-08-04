Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id E798E65C7C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:38:18 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id uq10so69303igb.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=omV6fxXh7y+lPDxaB5k6PbA6NEXZAXVENlQ96tzr6hA=;
	b=D34AN8ACn2pXXwfchlr0NF9htUCeGpGriFAJQF3yEaMlL7QYSPgQAPEvAC7nWM1M6P
	ZJpA3vo/wsjJ3Pjhv8JZkdJmiAALVQDOlbILMumNl4FE3fV9UXyc3ciR1mylzMQWWHyD
	h4suKhOGcreeEEUmDrrSsy1XSWUlWlfg93M6bEhCWEnMnuT2uL2BWCf0L/S9kamM7gOD
	FBSTX1ihHtnqh3vZME9Texmk2BChuPK9JCQ1thBeSJQGo7SwktRsYzhkF5C5RSlbspGi
	PnkwvL1GbwhCLsmAh4juIlboDXzvGua1V9zZZkXQXabu/CPR2s/JmBkCv+QyhvvizwGo
	llyA==
X-Received: by 10.42.65.200 with SMTP id m8mr11360348ici.29.1407181099125;
	Mon, 04 Aug 2014 12:38:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Mon, 4 Aug 2014 12:37:49 -0700 (PDT)
In-Reply-To: <1407143720-1213-1-git-send-email-yaoxp@cn.fujitsu.com>
References: <1407143720-1213-1-git-send-email-yaoxp@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Aug 2014 12:37:49 -0700
Message-ID: <CAMKF1sobWSsxUU+tFP4erdxYYo+xcLN9yu1xnDF44_Roh5zDKw@mail.gmail.com>
To: Yao Xinpan <yaoxp@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcp-wrappers: install /etc/hosts.allow and /etc/hosts.deny
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
X-List-Received-Date: Mon, 04 Aug 2014 19:38:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 2:15 AM, Yao Xinpan <yaoxp@cn.fujitsu.com> wrote:
> +
> +       install -d ${D}${sysconfdir}
> +       touch ${D}${sysconfdir}/hosts.allow
> +       touch ${D}${sysconfdir}/hosts.deny
>  }
>
> +FILES_${PN} += "${sysconfdir}/hosts.allow ${sysconfdir}/hosts.deny"

these are dynamic files I dont think its the right place to put them.
probably a image post processing function would be ok


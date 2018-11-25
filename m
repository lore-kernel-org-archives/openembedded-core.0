Return-Path: <gizero@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id DF5006C5C8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 15:28:52 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id x1so9765374vsc.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 07:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=e8eGU6FMA4xPdNKigJx/2kW7+QFW5LxynJjmDXsj+OY=;
	b=aIbF8WGhaMV5rDHF0CjMNdLA6m1V26wkjzYMHAy6hDIKxJc8Cy8logm9NhYrMDrrr2
	TbNHYlohZRF8ZRVgKfVVczAPMdA8HJkVNbQ0u58gO7Yo6g3UprgzLSpJO9YkUzdE8wWA
	WwB5XbSCpbh4bEfrph4NSVMnzSArJf47MPpspTH9jh31lYZk+6aTvwdAYyGwEZzu2yVE
	26g3RCIRyPjXlbfECG3H5UYY3FHjM8xBeA6vEvOAuC7FkUXoftyzZGuFGIRUHLLgC3Qi
	JZ0SkwL13d1xrbjMx2feuk9ILJrj/wXQg+zsIS2mXi28fZDYYTD6OcTkgZIzkEJJcYGo
	QrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=e8eGU6FMA4xPdNKigJx/2kW7+QFW5LxynJjmDXsj+OY=;
	b=kGkgWvHrdJKiWtoC37UiRgmijr9JxGHbWvWMk143GacS8AYkv/rtIGbKUBKqHtlwBz
	G6Yc7sDIiDqgzU1HAeevEZBxXPJT+bY/fFMWZUhBfIBWIKLVvI+WAz6XeFaP2aDoiTBb
	Ajyk0mSW7PHGsNMMHoJK2ljCfCMz3EU8KVvfZTmyNLv4RnbYV3OYcThBQSxBDZU/Swz4
	05IYbfFS8Lrs2wBQFNI/Mxz9Bc1HRnLztMqzrCidpN6QRy4SZ+p6MQbbLyjbpCKKhOpB
	J1qsfOG7Acf93vAasS6Rm5RuK30hSbw9dJuxRFdIF8IiRqdn4xlYh4DBSrUnl1skfiOY
	SPDw==
X-Gm-Message-State: AGRZ1gK3MKbZHJiKstlmswBoWxs6lY2UHfnVtX7mTc73kGQKoguRdGP8
	IoJ/U0DnfK9CnE3q9qwOKThiJK/6M44BW+bP3/g=
X-Google-Smtp-Source: AJdET5fKRFVAjJXhlCX5jlwKxB8TAqHFgKAPPrevgNXSfbkflLbHli7cey4Qr6Kr60s4em8Zs/vW5RY92I/13s97FOc=
X-Received: by 2002:a67:7ed8:: with SMTP id z207mr8966608vsc.159.1543159733620;
	Sun, 25 Nov 2018 07:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20181122082807.39508-1-abrodkin@synopsys.com>
	<CAP9ODKo46bnbLLBrhUJHPa1QYKSc0c_TtFVd2Q-Tv7j193K+ug@mail.gmail.com>
	<5c54f25000309545ee74be3bc5f3e1b73296f675.camel@synopsys.com>
In-Reply-To: <5c54f25000309545ee74be3bc5f3e1b73296f675.camel@synopsys.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Sun, 25 Nov 2018 16:28:42 +0100
Message-ID: <CAC+thW1Dt93n9sX6Nw9QU-P3xvKQrx8Pk8aJokeagiP48=LY4Q@mail.gmail.com>
To: alexey.brodkin@synopsys.com
Cc: marex@denx.de, linux-snps-arc@lists.infradead.org,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Sun, 25 Nov 2018 15:28:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2018 at 10:47 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Hi Otavio,
>
> On Thu, 2018-11-22 at 07:30 -0200, Otavio Salvador wrote:
> > Hello Alexey,
> >
> > On Thu, Nov 22, 2018 at 6:28 AM Alexey Brodkin
> > <alexey.brodkin@synopsys.com> wrote:
> > > This utility is used for creation of images containing
> > > usable in run-time U-Boot environment.
> > >
> > > As of today this utility is added per-board like here [1]
> > > for Intel Edison board.
> > >
> > > [1]
> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__git.yoctoprojec=
t.org_cgit_cgit.cgi_meta-2Dintel-2Dedison_tree_meta-2Dintel-2Dedison-2Dbsp_=
recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dtools-5F2014.04.bb&d=3DDwICAg&c=3DDPL6_X_=
6JkXFx7AXWqB0tg&r=3DlqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=3D0oSj04b=
iS8fsfFjYHNTIfKozS-TUjseTTeyuKHHcljA&s=3DhpwGEnrX5gArYJHLxYhMZ4x6s3irTZyCMj=
jnFipip7k&e=3D
> > >
> > > Given there're quite some U-Boot tools that we may want to add later
> > > this recipe name switch from "u-boot-mkimage" to generic "u-boot-tool=
s"
> > > still for compatibility we provide "u-boot-mkimage" with help
> > > of PROVIDES as well as proposed "u-boot-mkenvimage".
> > >
> > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Cc: Otavio Salvador <otavio@ossystems.com.br>
> > > Cc: Martin Jansa <martin.jansa@gmail.com>
> > > Cc: Ross Burton <ross.burton@intel.com>
> > > Cc: Marek Vasut <marex@denx.de>
> >
> > Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> >
> > I'd like to thank you to keep the pace until it was ready. I know it
> > may be challenging to contribute to new projects and OpenEmbedded is
> > no different.
> >
> > You were very welcoming to comments and change requests and I believe
> > it was a great thread of changes which lead to a good patch. I look
> > forward to the new patches you'll start submitting from now on :-)
>
> I'd like to thank you guys as well for being patient and providing
> meaningful comments for my naive and sometime silly changes.
>
> And sure there will be more patches as now we start using OE
> for quite some projects basically trying to get ARC up to speed
> in OE as good as possible and given our architecture differs a bit
> from others (as any other arch) we're not only adding features but
> more fix issues that were not seen before due to pure luck...
> like we typically have 8k MMU page a bit exotic int64_t alignment
> by 32 bits etc so there'll be more stuff from us in the foreseeable
> future :)

Looking forward to show the iterations behind this series to
contribution newbies. It's a good example of when things work well
both sides! I had this little piece of u-boot-tools flying around in
several projects, but never found the time to figure out a reasonable
approach to reconcile it cleanly with the other u-boot components. Of
course, I'm first of all showing myself that I'd have better
contributed it at first to leverage all suggestions that came out of
this discussion. Thanks Alexey for taking care of this all!


Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id E5F6672917
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 19:01:10 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id q200so1718102ykb.35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 11:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ALEJpbVWEvDkFzkNDwpEVG9GVnb6u9k8PJVIIq1iJdQ=;
	b=KZ4GD1/fbH4rPh+KV8I108/DrT1WyE5Ggsibg8nu8FbU6yeNJa3MIdBA/KRFSKaC6m
	bTKg7pNAZrf7SuvsUKs1jqscPI5wfOS1fgc1vwoXMtbYP6HOifhJME9UjTUI1akNXK+k
	9UQiU7ba81QqtS8xfK37IVzt2ntR+jaw9PIpo7LVmYDdEwa5Imm/FgDUImgF6pY8r1bM
	0nCOgMlLvwdIbTGrIjKZXUGyq+Jyo8vUPfULohOkA/H/1wZT5Mi8JJkGZgTjRx9FsIvl
	iTjtiY+GMrRXi44GCaJ0GLdrlDnZex8RWegvKIAn1IVHTHKSMDiqQexptzoGpXc+Ra+7
	udjQ==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr14746698yho.104.1419188470839;
	Sun, 21 Dec 2014 11:01:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Sun, 21 Dec 2014 11:01:10 -0800 (PST)
In-Reply-To: <1419180761.13316.61.camel@linuxfoundation.org>
References: <1419180761.13316.61.camel@linuxfoundation.org>
Date: Sun, 21 Dec 2014 17:01:10 -0200
X-Google-Sender-Auth: oPMSMfz0t3HiGIUmoeOYc2QNjYU
Message-ID: <CAP9ODKqQdMX2DD7bnNGheZv=b+WbjihvDU09PtmX04JL7k640Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-imx issues with make 3.82
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
X-List-Received-Date: Sun, 21 Dec 2014 19:01:14 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 21, 2014 at 2:52 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> It seems linux-imx is continuing to fail on some autobuilders but not
> others (hence I thought we'd fixed it). It seems the problem is old
> kernels with make 3.82. Would you be able to apply something like the
> patch in:
>
> http://www.gossamer-threads.com/lists/linux/kernel/1263151
>
> to linux-imx so it works with make 3.82?

Sure. I have applied it and pushed it to master and master-next.

The build has succeed in my local builder so I does not harm anyway.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


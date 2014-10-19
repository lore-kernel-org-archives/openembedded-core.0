Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id F13BE60557
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 19:25:36 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id z6so2046388yhz.27
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 12:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=EQrHkdCnMAswCMLn53JJsQrgOJQ5x985ymgkj1Bc5xE=;
	b=rzm+nPMuswsNxWbp/m2/StWjuyf/+ihc+blBFglhTyz9BZPsRTMxXquuGoZBAGipnt
	rV5pLX2Iu/e34FvqZfHerb4BvEUUOA3P8EBOUFdyp3G6jjiQFnURNJLLr0t7zPJKBXHX
	L6KyFcBuLFBM79VNwq2AQCsFS+qd9HdThh4uVmKprBQNrWyCE4WN9WJ8a/5S3wXrEKfQ
	es6MtJLRsdn8FT4JCnl5pJBtul2dqO7pguz10RRzS1ADZT+OByy2Wj9ttkEkKldoQZOX
	MPqHqIeTpm3u+P28n0IGUYcP43dzZIRMLsz9eF23s2D1XzjnETm34hIZTqyxnfMlHteS
	hAGA==
MIME-Version: 1.0
X-Received: by 10.236.47.196 with SMTP id t44mr31487089yhb.59.1413746736731;
	Sun, 19 Oct 2014 12:25:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Sun, 19 Oct 2014 12:25:36 -0700 (PDT)
In-Reply-To: <1413746147-7120-2-git-send-email-marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<1413746147-7120-2-git-send-email-marex@denx.de>
Date: Sun, 19 Oct 2014 17:25:36 -0200
X-Google-Sender-Auth: kwZWg6YhPAS8PA-3tUqQqcBBIpI
Message-ID: <CAP9ODKqaBcGWTh3e2-TQzqdr7SRFfSRc91R9_ZX=YALOnFhRzw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Marek Vasut <marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Sun, 19 Oct 2014 19:25:41 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 19, 2014 at 5:15 PM, Marek Vasut <marex@denx.de> wrote:
> Remove the lambda function setting KERNEL_IMAGETYPE_FOR_MAKE and instead
> set it in the anonymous python function. This also allows us to handle
> image types which are not supported directly by kernel, but require some
> other kernel target to be built. This is the case for example with the
> fitImage, which is the uImage successor.
>
> There is no functional change.

This is not really what the code shows; your regexp is more permissive
than the previous lambda.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


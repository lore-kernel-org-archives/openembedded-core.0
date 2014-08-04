Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7B96862252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:44:51 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id f10so4613917yha.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=0o3L2dqz9udGFukiU69vUgV6H44b0+3vPlXYbFuAfa8=;
	b=Xm/S6/PNNWsm6MAqkKGxf0HzzTS0YTLsQR2QMMebx245Pxb0WDhwsMLw8af+OZPn+0
	0gXlkVUV9fVvzpcKwp/ab//Inl/bwI6ZoJgUhClyXeCR9IlNuoZtFxvJO3okmOePPcYa
	zsjbMYkYLd11p2Oob5DKLVvM1Bg7rozbQjWcxefJ+NZN3bCvxfofS8jAb2dOycof3EgH
	7vca1tqEjjHXdaVupissLa7CVsKhqtEFzkJ+qOxjks/L0JW7jcSKvgETPJkVh7JrrL7Z
	gtqRBTNb69mK7Ic3WzJCqmkTi6DYfBtrjjHcPcVb2VbXqDkHPP1AQvB2TzSQ+k6Czoyw
	pHuQ==
MIME-Version: 1.0
X-Received: by 10.236.162.7 with SMTP id x7mr40156496yhk.6.1407181492831; Mon,
	04 Aug 2014 12:44:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 12:44:52 -0700 (PDT)
In-Reply-To: <8823f277843a307b6ddd3c46b4b57c9efc54bf64.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<8823f277843a307b6ddd3c46b4b57c9efc54bf64.1407177403.git.ben.shelton@ni.com>
Date: Mon, 4 Aug 2014 16:44:52 -0300
X-Google-Sender-Auth: vSkVgPbr99QV8MlgceOLF2BqwCI
Message-ID: <CAP9ODKqdVF5_PJVbxGmn472y+meMdQi6y7H1uMUSfnq7oYrXEQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/20] udev-cache: parametrize tar options
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
X-List-Received-Date: Mon, 04 Aug 2014 19:44:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 3:41 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>
> The options to pass to `tar` for cache create/extract are likely to
> change due to system configuration circumstances (e.g. using busybox tar
> instead of GNU tar). So move the more detailed options into
> the defaults file to allow for easier overrides.
>
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58620
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>

Same comment as 10/20.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


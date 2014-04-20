Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id B116F65D52
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Apr 2014 20:30:07 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id b6so2942937yha.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Apr 2014 13:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=DDZj1NCfQafBv8dX9kH+WZ6PK0a9sy084tBZ/gFVtPY=;
	b=IZqJdphKlr+NKn+2oZ2hLw2iLu82pSxlXKeBlkL+IzPYmjJh7MGiJM1L9rIUZe1z1Y
	vVdveJHVOuGt0C9YuE39umZQJIcCSPjecyOUKChVLDlWIhTAkSEsqMWfeE+5EGMJNttx
	BTuyBMIi8BBTycKYrB8oW+uOvBgLnnHvTYD9uapJ5n2s/qgXeV3I+gcWeDS0p+cQ81eI
	VK2ie3lRoGSc5POAlZ7HUoMW4f5160Ll20d72n9p8P5BTiei4exkrUyg95oc4gPDhn8P
	8tUXkD98bANVLlaFixyF5DKfls/haqf3cbeYFx4JGXLVxn+TQSL6Rq+gUspe+qER5vpy
	y10g==
MIME-Version: 1.0
X-Received: by 10.236.149.211 with SMTP id x59mr47695869yhj.34.1398025808351; 
	Sun, 20 Apr 2014 13:30:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Sun, 20 Apr 2014 13:30:08 -0700 (PDT)
In-Reply-To: <1397997578-3623-1-git-send-email-mike.looijmans@topic.nl>
References: <1397997578-3623-1-git-send-email-mike.looijmans@topic.nl>
Date: Sun, 20 Apr 2014 17:30:08 -0300
X-Google-Sender-Auth: 7zx3a2Og7NR-Bj-GqAK5hvprLWA
Message-ID: <CAP9ODKrnuFmJcsAmgNV0BdeB8mJnW2nNGq_Cto7oggN6r3+R+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mike Looijmans <milo-software@users.sourceforge.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] PR bumps to remove PRINC use in meta-openpli
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
X-List-Received-Date: Sun, 20 Apr 2014 20:30:12 -0000
Content-Type: text/plain; charset=UTF-8

Hello Mike,

On Sun, Apr 20, 2014 at 9:39 AM,  <mike.looijmans@topic.nl> wrote:
> From: Mike Looijmans <milo-software@users.sourceforge.net>
>
> Resolves warnings of this kind in the OpenPLi layer:
>  WARNING: Use of PRINC * was detected in the recipe *

I am afraid this won't make Daisy (Richard, could you confirm?),
anyway a remark below..

> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
>  SECTION = "base"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -PR = "r154"
> +PR = "r153"

Please use 155 and don't go backwards.




-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


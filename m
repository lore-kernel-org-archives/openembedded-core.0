Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5FD7D6E7AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 18:15:06 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id l6so7059801oag.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=XSJ0V9q0Xk/JFaVW9f5ccDjBcF/QDAgRYpGoTyNVTK0=;
	b=NdvgjoeZdMMThB1XAocacIhmmzo3Wsd7tFc2rrWoU+t1XfstBFThLvwkFbEe2DSV5C
	E+N+9at7McE7kDe3bG7WYeH6nhTapzkogVTzmGWctYL6lUUNhj1lab90chm/SvUv3Lqq
	ZO0xMAHpb5l1J63uuPpIYBalncz8hkC8uSm3PPr7E3tXyRQr9nntSpCxOd5pZwL7R/l8
	G6zWzszDzfGgBxCe5gJLEhwBhKczBe6IeW8StxZw+WXc86MdnwgNF1xOnKEPG+XQV/Hq
	nWzd0e+twvtPQUUM4cUDEqfxRtneGN4SPu45rgXLARrmi2ogt9kAdagHnhUgjP1WZDhE
	qLrQ==
MIME-Version: 1.0
X-Received: by 10.182.148.106 with SMTP id tr10mr1052990obb.65.1390846507238; 
	Mon, 27 Jan 2014 10:15:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 27 Jan 2014 10:15:07 -0800 (PST)
In-Reply-To: <1390479065-24299-1-git-send-email-otavio@ossystems.com.br>
References: <1390479065-24299-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 27 Jan 2014 16:15:07 -0200
X-Google-Sender-Auth: D_mdQh18KZhT6xj6gZ8ZRfjfstk
Message-ID: <CAP9ODKqc617WdkCbkZirzW9JG1x40_1hmBt6Kj+wVe9NguZDqQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] buildhistory.bbclass: Improve robustness in image file listing
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
X-List-Received-Date: Mon, 27 Jan 2014 18:15:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 10:11 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The filenames sometimes may have strange names. With the 'awk' script
> it handled a limited number of spaces in the filename and a package
> installing a file named "test file with spaces" would have its name
> truncated.
>
> This patch uses the find's printf formating to simplify the code and
> proper handle this case. From a testing image, the only diff produced
> is:
>
> ,----[ files-in-image.txt diff ]
> | --rwxr-xr-x root       root                0 ./usr/bin/test\ file\ with\
> | +-rwxr-xr-x root       root                0 ./usr/bin/test file with spaces
> `----
>
> The options used are available since findutils 4.2.5, released in 19
> Nov 2004, making it available in all supported host distributions.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

ping?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


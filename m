Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id EE02A60671
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 19:32:10 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id z6so2050877yhz.27
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=grNaOMZBIKuSZ8wLAVjHSA6KTPY6fJdKRFc0roY/K90=;
	b=uyNintxXUZBvYXjnyMfKjAEe3S7sUB+pbCjejWBQfkr/bW31OZfV/83OogyonQNVNo
	FF38keAYWUMlGXXFqeQ39UAy13Uz3DgDm2cyvWIbvAS4+5fmXcmnU4Kuptr7QodWGI1y
	4pBhwQcIrb/G5WrY/A17ivPcKwyB3XlX7wBVKjO9PxXU+AUg3BHh6uLFRksfvpdpPDa1
	jV8LAEBxrnPHe+U9LOByfG7UgAPHxjXafipj4arCZeU3ZudeNW1PhX+BvtYhiYicpDyF
	Zxq01TE8Aoc4yCPw/10niOorRF3S74IEB/HBfS/FNKz2g8qtAsbF3+3mQUQhy9Vy8TAb
	3fjw==
MIME-Version: 1.0
X-Received: by 10.236.226.109 with SMTP id a103mr30402265yhq.21.1413747131571; 
	Sun, 19 Oct 2014 12:32:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Sun, 19 Oct 2014 12:32:11 -0700 (PDT)
In-Reply-To: <1413746147-7120-1-git-send-email-marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
Date: Sun, 19 Oct 2014 17:32:11 -0200
X-Google-Sender-Auth: WKwoKMjsmFU-I226UZeE7-MlLkY
Message-ID: <CAP9ODKoAJsQM77j_NFpM3B3R9MzuBrX5a51ZSpeuQPkphpLyxA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Marek Vasut <marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] Add basic fitImage support
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
X-List-Received-Date: Sun, 19 Oct 2014 19:32:17 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 19, 2014 at 5:15 PM, Marek Vasut <marex@denx.de> wrote:
> This series cleans up the code in kernel.bbclass and
> separates out the uImage generation. The last patch
> in this series then adds support for generation of the
> advanced successor of the uImage, the fitImage.
>
> This series adds only very rudimentary support for
> generation of fitImage. The advanced features might
> be added in subsequent patches.
>
> I would also like to thank Richard for explaining to
> me how to properly do the implementation and I hope
> this series is at least close to that.

I really liked the series and I will start testing it; the only remark
I had is the first patch which says it has no functional change but
uses a more permissive regexp.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


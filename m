Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id B7B1F65C7C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:29:44 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id f10so4599716yha.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=2zlW4sb/hS3sqtSrcaDQscb9L2TH9L2Gp8e8qmudgBw=;
	b=WhD1LzaVvCApxuU9IMlldiz9oFo8w7562GZKUDaVugBXSBlRrA3JoydQFU1nHQcNgd
	jte+MIOgmI2N6GOIVYHdYPCxDhGiLofrA0G8i4luFyBvwCvWJiwo/r2Cq0RDcOktPVac
	hB1gRNo3AUfdxgZv9+60DLajEiKVLjVnh0fzl7ofdXJ2SnQWmRE2pbcZujSk9Rd9nzae
	W6tMht3dLQ6GK+J6UlKqMdt2AfsA4EpeRBDaGtXGsdo2pFuJuzcMljbpsX44O9es07Xy
	lsrgEUJd3uGY3Ahf5eEUNGkoQulNeVHOlHQgFf/JkHyWbJGOZvd+++a8AGvr5my/plUc
	g7PQ==
MIME-Version: 1.0
X-Received: by 10.236.29.171 with SMTP id i31mr42444335yha.37.1407180585563;
	Mon, 04 Aug 2014 12:29:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 12:29:45 -0700 (PDT)
In-Reply-To: <78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
Date: Mon, 4 Aug 2014 16:29:45 -0300
X-Google-Sender-Auth: we0nKtp3GG7EdB2uVovSbbsiqHs
Message-ID: <CAP9ODKpQLwLf4r2JSvvYEcT6hGd-a6sY2Uoa4dCPgNFp8FhOcw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/20] udev-cache: Compress the cache
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
X-List-Received-Date: Mon, 04 Aug 2014 19:29:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 3:40 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>
> $DEVCACHE is observed to be 100k uncompressed; compressing it reduces
> its size to ~5k.
>
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58620
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


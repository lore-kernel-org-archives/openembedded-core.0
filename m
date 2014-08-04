Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id B301B65C7C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:35:11 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 9so4410716ykp.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=AAZGyl+w6bDueb0yyVnC2BMAt7UuoTC73q8XwQdcn9I=;
	b=ewq1ukCgfvFXVacQPHFtiWOgsxuR9EGDwbbSwB2zCV2FQUv55jhdkULwetoGG8kfkB
	rKNcSXdI82k/lI7SNnjuWe31A0jpiaZbE/z1OqiYpOAyyi77oDHjxKBwxt/hzUemrAQH
	PsHzwmoiks1EWKHBVFH7xtiB7kFZH/ONQimpsUyaW6fh5uNqXN2RFAXqvuKlpKue1A2W
	esLQxgsqgyULyAHyl12YjQjnaS6NBhQooctLZmwF1QKJ9GMCdzkfPoxrHpIU1WSGc+dV
	siF1Tkth0rb8Ka8QdPYbUhgRrdJysggdVBeG675ofM63o2M+DhqNDT0Dst/JmaHIKMl1
	tBSg==
MIME-Version: 1.0
X-Received: by 10.236.103.135 with SMTP id f7mr41327159yhg.102.1407180912257; 
	Mon, 04 Aug 2014 12:35:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 12:35:12 -0700 (PDT)
In-Reply-To: <02ffdae63da4c286825773a18ab377d8027ae6c0.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<02ffdae63da4c286825773a18ab377d8027ae6c0.1407177403.git.ben.shelton@ni.com>
Date: Mon, 4 Aug 2014 16:35:12 -0300
X-Google-Sender-Auth: a_zKVWbQr-uySOmlwlapoopbrak
Message-ID: <CAP9ODKoqCVWrg4deaqFDCN+DKaevkyPtwtgiCHO5b2BoqmYcHA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/20] udev-cache: Update cache tarball atomically
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
X-List-Received-Date: Mon, 04 Aug 2014 19:35:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 3:40 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>
> Overwriting the tarball in-place could cause a partial write, if the
> system stops at an inopportune time. This is mitigated by first writing to a
> temporary file, then moving that file on top of the final location.
>
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58620
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

As an improvement, this could be written in tmpfs so it avoid
duplicated writting. For NAND devices without much free space this
might matter.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id EECE97953E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 18:13:59 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id 13-v6so23302471ois.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 11:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=JYVxorPLhCl9YFVx/Tc/3jBnolSuOuBG5kgNgm+8nA8=;
	b=buE9Nv44/VndFaosJy/Xlru2j9nwiRVziFu/nf6TjLACGJP6uOkuwi6TsB3gTlX0mI
	cvRH9I9mieOfevsatMsTx3yeBI8Gd0lvDlKT6lmQRL6UHqsZsQa2fNr8+Tsw2fGA31XN
	eAax2lP2ErVrHSCDfjT+Gdlpd5ISeJJVaJ6OWXQHXxlWHNhh5BJ2NEH+LhYUeecJygUe
	F+SrkVAGYW5tgXfqii4IiVjfEqJgFSzBuF6vwexZF8gJ37XD/ZMjEM34jp0xjnRLdTeY
	l6gJkjh+EFDEDtHsFRwOedqsl3KrRxESf45/A0XXoDYRvxqKhb7HEi5X7S7ZG5HlKsz+
	2ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=JYVxorPLhCl9YFVx/Tc/3jBnolSuOuBG5kgNgm+8nA8=;
	b=QEvXESy+UA9IbOaMpNlLwr/3Ki2HCVUAtdp5IWGHnc99IvUJlyFlxRzRVOdO+d+nKq
	jlvrP5HeXGAvN+dieFZ03v9z4HK/DqNyJznzIHVxBSY2Qw6QGYlF796ISYXLUpzNJpUC
	ta9/NrEc7+SHLQwVKXQOXdkUgMyQFgz0eT4kf63tmhg55Cgtp7jOfAtPDCsW4TmfVWlI
	73pgKyib2fcp1pic8WPkL8l0MGkGGu0v+uIoVClSBo6LeDG2nXHIPOxFii35FY4Gwhr/
	X3+CjA6Gp6CjPiiPwNNh/kPjXEB6ufXAewp1qnifAxnzFEmj9TBmqsShrMyoE6Jqizei
	NNFQ==
X-Gm-Message-State: APzg51C5NP4BTLso3Q6zcr/f2TOpxgEYDb0Cvjn82R+2vEpFq86D98Gf
	vEhX6+Hm2BobmQAozg6vkU0XvoEI6jXV6w==
X-Google-Smtp-Source: ANB0Vdb8bNcO3XKhutshl738HxXfQE0O2/9ZicN0Blk27CUdQEFwbVb1C50G6PkBRBUM4NQifiJsuQ==
X-Received: by 2002:aca:ba57:: with SMTP id
	k84-v6mr8723907oif.10.1535739240510; 
	Fri, 31 Aug 2018 11:14:00 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41]) by smtp.gmail.com with ESMTPSA id
	d5-v6sm5227124oia.57.2018.08.31.11.13.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 11:13:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id k81-v6so17144284oib.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 11:13:59 -0700 (PDT)
X-Received: by 2002:aca:3546:: with SMTP id
	c67-v6mr8824826oia.249.1535739238927; 
	Fri, 31 Aug 2018 11:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20180830232604.10850-1-otavio@ossystems.com.br>
	<CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
In-Reply-To: <CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
Date: Fri, 31 Aug 2018 15:13:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
Message-ID: <CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Update 3.11.4 -> 3.12.1
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
X-List-Received-Date: Fri, 31 Aug 2018 18:14:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 31, 2018 at 1:19 PM Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Aug 30, 2018 at 4:26 PM Otavio Salvador <otavio@ossystems.com.br> wrote:
> > This updates CMake to the 3.12.1 stable release. All patches were
> > rebase on top of the new source file and all them applied without
> > changes.
> >
> > The number of patches has changed as all them were applied on the Git
> > tree and re-exported, to avoid any fuzzy warnings.
> >
>
> This is a major version update and cmake is quite deep in foundation of build
> there are large packages outside OE-Core which depend on it. Can you give
> some details on testing to make us feel comfortable ?

I did basic testing but all patches applied fine. If desired, it can
be postponed to next release as it is indeed not critical.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


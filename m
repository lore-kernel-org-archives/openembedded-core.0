Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5501678442
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 11:58:52 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id a81so8330429oii.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 03:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Z8Ge0dlPRq2Z4i+0y7tpJZcbwh+w3FIOqtuKpstqqck=;
	b=jWEl7P47Irk4QYFe+5p+lsjpGR28TqQQ2l7iehICkPGAAmiZEqwZgyy71TpmewFT5r
	D1NbTIfOpkqkvH14ZNbrjxE0sBkApjvW6bfOi7enRYn7OiZhdIdVxcSdiR5vpVaLzdFp
	xwh/u3IiEpxvkiXMjqRdSwE26ZdsMAKPqO0VB1orT6dY7ahGASDM93V473bd4BPXAD6a
	xVqaieiUwkswpjORSY5V7ngy/fiVWIy5alax6VagVPQO6a8HuG+4FDuJx1yuMKo4a0K1
	Qn4nKSs4RR0mcYhesJvLzMjPcki9jfNOu2dg3YRqc58YSVTZF+c4Nq16zS9sv99gyHj1
	IJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Z8Ge0dlPRq2Z4i+0y7tpJZcbwh+w3FIOqtuKpstqqck=;
	b=dMzNP9s5LZDDgTOyRfjf+xl539rCWv8CF2vqxb/jgAh0Jxyx5MdO3bL6LWAYBVme7u
	4bnIUrooDI25ApPH/LdWEigD6Uhlj7spTWqpNgkNnRUkdTwzwrikrj+n4NJLWs1C6hi5
	l2W89PruNbVs6IgIzQpXevDv/BMwr3TBQ8WbTspZKKVulFPSEsBX6scFHpYMTK07UylW
	JJR6NXX4lujAuubyrg1xyN1PGQ9/Av1iQDBvpiVO1LWje46LK+bCbt031/xGaZiViOkD
	+x64i84+1NX1uM7Innkk4mTVdpC1MOhHlUo2xv8vZn0BwP5ZxiMsQHdmS+Muyo6NB7Wb
	bWcw==
X-Gm-Message-State: AJaThX66nwOFKSBzI9U3CQeLec8+7FTzNssxSebpHmy+tgKuYyoGXsE6
	xDWm3+4FHa3780s64RZaphr1Tc6Q
X-Google-Smtp-Source: AGs4zMYC3S7l2cx8lnQLthpllEUAACT9erDyCP57S15wK39AdKetUSiTyhebrg5Fqt7OwBhZCcJGiQ==
X-Received: by 10.202.173.210 with SMTP id w201mr9311637oie.190.1511265533843; 
	Tue, 21 Nov 2017 03:58:53 -0800 (PST)
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com.
	[74.125.82.173])
	by smtp.gmail.com with ESMTPSA id 23sm5840087otv.63.2017.11.21.03.58.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 03:58:52 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f173.google.com with SMTP id d27so10277008ote.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 03:58:52 -0800 (PST)
X-Received: by 10.157.34.200 with SMTP id y66mr9886768ota.276.1511265532298;
	Tue, 21 Nov 2017 03:58:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 21 Nov 2017 03:58:51 -0800 (PST)
In-Reply-To: <cover.1511207344.git.Martin.Jansa@gmail.com>
References: <cover.1511207344.git.Martin.Jansa@gmail.com>
Date: Tue, 21 Nov 2017 09:58:51 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrVe=GTLqtXjF54a4sHoRymY85Q6y4=mN++-twUPHYk9Q@mail.gmail.com>
Message-ID: <CAP9ODKrVe=GTLqtXjF54a4sHoRymY85Q6y4=mN++-twUPHYk9Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/5] Kernel artifacts naming changes
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
X-List-Received-Date: Tue, 21 Nov 2017 11:58:53 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Martin,

On Mon, Nov 20, 2017 at 6:11 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
...
> This RFC doesn't implement it all, but it makes naming all the artifacts in
> consistent way a bit easier. If there is an agreement that OE should support
> the naming scenario described above, I'll submit the rest of the changes.

I think it all makes sense and if we preserve current behavior as
default I see it as a very good addition :-)

I didn't test the patches myself and I'd like to do a more extensive
test once you send the full patchset.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


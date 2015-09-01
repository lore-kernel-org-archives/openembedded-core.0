Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 30FC276B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 22:05:05 +0000 (UTC)
Received: by ioii196 with SMTP id i196so17989788ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 15:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=hi47aO45lmiCu0NIjZw1lUXK0+z2/u2ead3Yu8BZM1I=;
	b=CvGYsU0VWALjZwn4K6FiB+q4Mzvpw4V3C/g2/3oY5xWeDdTRrMPm0ZusebR5yzTXQB
	NebI927Q6L70v4mN6cVrb565hz/eYwNRAtcIrrHRYPYNVx65u2/Cu1nP06Os/MHctdWa
	OKu6+hExutkBE/TryMF/qAInXnTaic3FIrPXBJOiz7pZta/KdPyn9CAHWJrWs/wXMuVB
	3dpepKM7eQF1jxWUe+N/Gs2cLdGFJTnD538FEYP8L6KUjx/MMMv64Muohc/NTel/Ko8v
	7v02HcpzZKbOaWc8YIG8DB5IDyOh61GnaJgfE0ZTDGwYMFouvesCwzMqf/2cOxtd7jnO
	qFoQ==
X-Gm-Message-State: ALoCoQmv4NuVBFAMeuslkGHdgvPEARyFBQF5um2YQ3i85xStrm+HE77pq6IJKCvMK5O6MFs4+K2k
X-Received: by 10.107.132.35 with SMTP id g35mr5080438iod.175.1441145105257;
	Tue, 01 Sep 2015 15:05:05 -0700 (PDT)
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com.
	[209.85.213.175])
	by smtp.gmail.com with ESMTPSA id je3sm259379igb.9.2015.09.01.15.05.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 15:05:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so12181250igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 15:05:03 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.102.4 with SMTP id fk4mr490093igb.46.1441145103749; Tue,
	01 Sep 2015 15:05:03 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 1 Sep 2015 15:05:03 -0700 (PDT)
In-Reply-To: <20150901215512.GE2458@jama>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<20150901215512.GE2458@jama>
Date: Tue, 1 Sep 2015 19:05:03 -0300
Message-ID: <CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Tue, 01 Sep 2015 22:05:09 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 1, 2015 at 6:55 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I hate to say it, but for meta-oe and meta-qt5 I would like to use
> gerrit - it's great to see all related information (all revisions of the
> patch, all review comments, all results of verification builds) in
> single location from where you do the actual submissions to official
> branch when all criteria are satisfied.

Me too; we have been using Gerrit for patch management for a while and
it works very well.

If you want, we can host it at our server, by the way.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


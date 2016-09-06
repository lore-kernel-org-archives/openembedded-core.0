Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 21F4C7755B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 11:35:16 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w207so18003054wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 04:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0q5nOzdJtlaZiGFizG/gykftiHndySbCzfERym6mkFk=;
	b=mMwIygZY/6awYJmxKSs3ef1dLh+FxJ/KwjPbjDchkD/YD94mXdD0VDGoHqamsc2wGC
	BhKLsx7Gsg55sd3adlA9qhGQ86tBsafEH2co6VYewDqwH7ytxeUeJISKjDwuMEopijsH
	zNJyuGuaJpex1eAHmQA+TTrAQejYAqidWBRmUXVPpslHZV9hqVwqbZ8M8NSxY8cJBPCn
	WRkTXZaN76MrkDQ7nbsEf6y+EpqTB6u7uAWCmQfpEVmpy+G9BTgfyCz/LXcbtxmfcbaZ
	0Pi6Oaz0w9zwQ1/rBByHS6h9Lx0jdMOnvZUMz2PI/oCni+er96BPcaQdx/9kuN1reJ+x
	khkQ==
X-Gm-Message-State: AE9vXwPDGA7wSaNIL77VBktNOF2GJlBzWliQDLK6xR2nyQ9EOfyRYINsdDjXVgGfwcwbSQ==
X-Received: by 10.28.238.87 with SMTP id m84mr21225169wmh.44.1473161717410;
	Tue, 06 Sep 2016 04:35:17 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	wc3sm32908101wjc.47.2016.09.06.04.35.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Sep 2016 04:35:16 -0700 (PDT)
Message-ID: <1473161713.3374.3.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Date: Tue, 06 Sep 2016 12:35:13 +0100
In-Reply-To: <1472913207.20786.6.camel@andred.net>
References: <1472832102-8067-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1472832102-8067-4-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1472913207.20786.6.camel@andred.net>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libffi: Add patch for MIPS soft float
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
X-List-Received-Date: Tue, 06 Sep 2016 11:35:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sa, 2016-09-03 at 15:33 +0100, André Draszik wrote:
> It looks like you are a few days to late - a slightly different patch was
> applied upstream:
> 
> https://github.com/libffi/libffi/pull/272
> 
> It'd be good if you could update your OE patch to reference that one
> instead, so that we get a real backport (unless it has problems of
> course...)

I took the liberty to do just that
http://lists.openembedded.org/pipermail/openembedded-core/2016-September/126
183.html

Thank you for starting this thread :-)

Cheers,
Andre'

> > > > 
> > 


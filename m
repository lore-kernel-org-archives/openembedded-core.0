Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1C6606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 10:52:43 +0000 (UTC)
Received: by iodt126 with SMTP id t126so146887014iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 03:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=C5O0QeKpaCmBvG91DukzME+E+Gv1CapRuN6azEqbFM0=;
	b=iRMLWMq1DdEQ4Q9qe1fBM2qiYzPNrXamKhLuzxGqKaj8l9Pq+W8UIN2Rs5QujF29HC
	dUw/snk5MTb7L0P+t1Y9xw4GII65YOG5wOBUhA0aF/PxzfsUnVuQEE0YpPcuiUTMNHDs
	ONsDQfLQPJnVCGWG8CCN4gQqoVhtCizgeIN5ltvNn/082PuuRwaWFWJcPIZZvoOha06n
	82nh/w3BULZU5E9vf02z070B6Sa9fyeB6GKvn8wlkZyOuzXDfaNWxzmuyGfeSAYqNsii
	/dag3UiaS9YMzKOSnSORrRhdIOc/QFnbqZQ7DWw5Qg8DmPAPHPctfeFJldE14MFIC+Cr
	XY3A==
X-Gm-Message-State: ALoCoQliJzivoCUd4hqaCh6zdc3Cs3PA6DjWSb3cPBi4GGsl2fhXIKWuyQgaiLFU/v/CG8bdlo5Z
X-Received: by 10.107.130.153 with SMTP id m25mr648415ioi.192.1439808764135;
	Mon, 17 Aug 2015 03:52:44 -0700 (PDT)
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com.
	[209.85.213.169]) by smtp.gmail.com with ESMTPSA id
	vk8sm10018324igb.4.2015.08.17.03.52.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Aug 2015 03:52:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igfj19 with SMTP id j19so54079465igf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 03:52:42 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.88.8 with SMTP id bc8mr16929534igb.46.1439808762392; Mon,
	17 Aug 2015 03:52:42 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Mon, 17 Aug 2015 03:52:42 -0700 (PDT)
In-Reply-To: <20150817061425.GA6102@loska>
References: <1439303596-18965-1-git-send-email-ed.bartosh@linux.intel.com>
	<1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
	<20150812094953.GL6102@loska>
	<CAMKF1squ7h9gzvrX8u3m2_K_BeO7gto_ji5f4UBdJxnuNMyLZA@mail.gmail.com>
	<CABcZANmtCK18u2m2R51SmZN3Xrq7+FxY8PXMXJ4Y6-WVA3tGMQ@mail.gmail.com>
	<CABcZANkHBUNH5Zo3opKT-uwfneMYghTBTJCV8awOm-6D_0SK1w@mail.gmail.com>
	<20150813062742.GN6102@loska>
	<CABcZANkKkXbb+5BFYBARLOTGKBdaon_+4cvQDGDZw8WWqSmt_g@mail.gmail.com>
	<CABcZANkBfrtA86wHOEnXY=2vKb6QLerR8OG7njcQRbVqsDV+-g@mail.gmail.com>
	<20150817061425.GA6102@loska>
Date: Mon, 17 Aug 2015 07:52:42 -0300
Message-ID: <CAP9ODKqXDej63zLcCCjPxeUADT6+ZV5mww=b3-wdkzjNJ0bmTw@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: shell script guidelines in oe-core? (was Re: [PATCH v4] create-pull-request: cleanup bashisms)
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
X-List-Received-Date: Mon, 17 Aug 2015 10:52:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 17, 2015 at 3:14 AM,  <Mikko.Rapeli@bmw.de> wrote:
> On Sat, Aug 15, 2015 at 06:38:18PM -0700, Christopher Larson wrote:
>> Update: checkbashisms and shellcheck both check for this now.
>
> This is great! How about formulating that oe-core shell scripts should
> pass shellcheck and checkbashisms checks without warnings?

I second this; the more picky we are now, less bashism we have to handle later.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


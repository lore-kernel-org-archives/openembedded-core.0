Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id EA51876F8A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:55:12 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so17368359igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=kcyp/WpeC7iDWeeXMhYMmcNPUJFM+90lCTYZgrHhoE8=;
	b=XAaCRnOLBU+0RveTROETo1T0yzSmMYTR774ne3bwY+stK0kgwU8lR+mPXkGBFv+TG3
	8xPqDqcVPtL6smk5xENhORqnzgRxAuwK2apmGNDNZlMbsKDa6WraiHr732nEfFBOWSKx
	bWAsZvAugO14n898WIf68XVg5kjZObRknSM2yATKySh5ouQL3R2oGQabwekcYpBfPCzi
	mQC/wJeMuW+VLrU89ystFOdqryhL7rtRPgxX3EAGr9YJ+ap19GtMkJM+crvkrSDGCwOt
	NWOokMQztbU4tuPQDG9pL/uZBa+jqaUCsPjGn1uKCL9Vismq/pJEkrKHJfS5qYJEw8f3
	KTFg==
X-Gm-Message-State: ALoCoQn3oqWt4g2peJEhzCDgmNPXbKetsJPMb2oLneXkJ3rcObuM9bU9koXfmeDGTo/zg8gpxmAX
X-Received: by 10.50.73.97 with SMTP id k1mr3632810igv.61.1441209312680;
	Wed, 02 Sep 2015 08:55:12 -0700 (PDT)
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com.
	[209.85.223.179]) by smtp.gmail.com with ESMTPSA id
	hj18sm2477090igb.7.2015.09.02.08.55.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 08:55:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so25356210iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:55:10 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.7.225 with SMTP id g94mr4151713ioi.28.1441209310921;
	Wed, 02 Sep 2015 08:55:10 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 2 Sep 2015 08:55:10 -0700 (PDT)
In-Reply-To: <1441143270-27322-2-git-send-email-jslater@windriver.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
Date: Wed, 2 Sep 2015 12:55:10 -0300
Message-ID: <CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Wed, 02 Sep 2015 15:55:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 1, 2015 at 6:34 PM, Joe Slater <jslater@windriver.com> wrote:
> Implements ifup and ifdown.
>
> Copied from https://github.com/WindRiver-OpenSourceLabs/meta-overc.git
> as of commit aa89eebffe06e4aa04701eae9691cb3049cbaef9.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>

I think this belongs to meta-networking. Also, what this one provides
which is not provided by the busybox one?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


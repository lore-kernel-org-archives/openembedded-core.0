Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id D29FB7D5B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 14:45:43 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id r185so29388411iod.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 07:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4IEPspriczCQ9gs6c5E6aKgmugmmgxth4S7dq/75MVs=;
	b=mnLFgg0b2eyuc0ifXrq0cbrnxuG/w4cRUWRVez9+halP03txfDNZ/hxb0jhWVMeeT8
	c0jdDPlgnhWmoR7xBaCH2BwtQoMl4J7C47PKxlkjL9rSNkixwluvYyxyahSdx11P+auR
	VeQ6LOqYjkUADepTYxm83cbKDKL5xwNB87lFSHgaesz0DsM4wtgtfbQDF5Gaji7y/i6C
	8EaIoSjnA93FAFq/R16Yg+gGHlTy1Hl791VDH1PCKcEqu7pAYHXZqclQD54XaTU8sq5v
	2xNABheuCaWItoXbktexbaRGrz1/YMjRdNGERHJ9/7ZIqss3KJAX6oKNN4rf8GI3UXI+
	j7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4IEPspriczCQ9gs6c5E6aKgmugmmgxth4S7dq/75MVs=;
	b=R4ZAg/RbNeDWzQaRId6hEeMs/R3LelCYyeb3BS0ASwoS/UIe1UvviDEtsQSz2zl7JH
	fxsqHzRmnmR6DGsrXoOtST/yxzrFt3txGXrUwAOog76i/DOlolxxqDbbTLSVtSUNCmXN
	MV9Sj2M/V6mmsuF3zg0XeC4dveKK2X3zX5AQd3+xQEVYNLA5FYW2TvGh953HLXToY+xI
	t1fFqZacapvYRn2sCZCrl0EJvlVLzr1WyMwAoxO/wWqL9UCr6ci7gB7MvPhVbQPx3vQI
	aojj+MIic5DaVU70VBSgnakOf0SqT/idcWfUX8Z/i7126C14pQb+Q5IZmpiJHugYVXNQ
	V+iw==
X-Gm-Message-State: APjAAAV0BTewcIVoCp/qh21Aj2VrJqWSpK4Si8dDwOs121pqISVoxQ7R
	6I+q1mrSb7reqc7xGZ9wFKD8O9wU9+wC84DctQlfGQ==
X-Google-Smtp-Source: APXvYqywy6XKK9JgC3P2YO/Gj2h9TsAanwkBcQYgYK6/oGBBqpODIYjkeA4KbfvZRHoau6pW6i+t4eJAleA5OSzNmRM=
X-Received: by 2002:a6b:8bce:: with SMTP id
	n197mr22407689iod.299.1561992344901; 
	Mon, 01 Jul 2019 07:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190628075701.78128-1-mingli.yu@windriver.com>
	<9b5dca23cf1d8a90466bc084236599487726f4b6.camel@linuxfoundation.org>
	<5D196A07.7040304@windriver.com>
	<CAGgRHJqeFE75tXJ7qB4gyxkZaWsLmFozY+1YoJLUPXzG9Q+fOA@mail.gmail.com>
In-Reply-To: <CAGgRHJqeFE75tXJ7qB4gyxkZaWsLmFozY+1YoJLUPXzG9Q+fOA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2019 15:45:33 +0100
Message-ID: <CAJTo0LbKNdCiC5Ti3Z7P2ntzsucmya5k-DH6SLTyBUqosnQ3CQ@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-dep: disable PTEST_ENABLED
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
X-List-Received-Date: Mon, 01 Jul 2019 14:45:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jul 2019 at 13:00, Matt Madison <matt@madison.systems> wrote:
> As for Richard's initial question, go.bbclass inherits ptest to enable
> the mapping of go's built-in test builds automatically. In hindsight,
> maybe this wasn't the best choice, and it was overly optimistic to
> think that because go supports separate compilation and execution of
> tests, that packages would generally support that by default.

Maybe the ptest pieces just need to be split out to a separate class
go-ptest.bbclass, so that recipes where it *does* work can simply
inherit that too.

Ross


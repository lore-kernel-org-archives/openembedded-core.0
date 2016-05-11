Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 951BC605BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:55:47 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id k142so55110991oib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xRZSaCa4blq6x629ddC+fuNUxZHQ1TiUqwYUSNOkZOM=;
	b=P+7L+hglfR9pfF94/Ap2AAThCaJ7OhUO1dh9SZYvUve9xi1vXKwFgwaUsVS2CYr0r+
	9f79DhYeLgfuTt9Nrs7WLhKihYqBo3qFAN886v3vKemEF1vUJxq69/VjAuu8VKYEXWpA
	oBKOXtRcW82ylpZSqDMStWLvMJtbshf1lgwQVygJbueOC9EpghMBjsMlHyU5SWGbXLzV
	JTz2D0hYYmrAYLCpCtNiSGhlOM/N73Hjc6SLsrLIxIbwTY+Ez+/WXdPY9eFJJYwQzCxl
	rKcOZDBnwtEKCAHOQkTluCI2U16fj72iQrj/Ef+Yu3KYtoOp4rGaOFy36vsdO2xtZ55W
	9ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xRZSaCa4blq6x629ddC+fuNUxZHQ1TiUqwYUSNOkZOM=;
	b=Rd32CnObjj4k1FlhR66PvUeFmoSxewUsf93A0qCweA70nv7j71ViP2df2VwxxxngGq
	kM8TkNubdki+3v1CEDzYDQYEg44QPjrLUTgpmYaDhcwcY8RLGOgvn9/i+U05x7QCvAqF
	7KwdtkWboUjOJEylTuQj34/d/V06SwjRLSNPc80EZQq+vyM81euH+wMDNhngahCiB8bV
	lRQIsdMMNEzuu9O1jpyRh9Th9MLj0CxZXBhmJEPorw1hA0DXGatLN8WROFQ+ggSIkuuI
	+A10+OZYkTOYGVjQEL7qghHrT6EPzhwF/BlyaNNimZNoI3T2kQYx6tLAz1QWaStH8QDc
	gAcQ==
X-Gm-Message-State: AOPr4FWN+M0rtv1ina0WDjtKfAZ7EwyYL3PQIbdow6NskBs13UGMzmNnmFUGzAYSVG4ar/BOIhvHvtgkajW1WiVs
X-Received: by 10.202.197.70 with SMTP id v67mr873626oif.63.1462953348280;
	Wed, 11 May 2016 00:55:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Wed, 11 May 2016 00:55:18 -0700 (PDT)
In-Reply-To: <CAHiDW_ESd2Zju37mQAmXx8Xkj3kgE9YtCReXFGK2kWGi5HatyQ@mail.gmail.com>
References: <cover.1462935990.git.liezhi.yang@windriver.com>
	<0ef7c0f30456cc242de331b273b92c1dfe835350.1462935990.git.liezhi.yang@windriver.com>
	<CAHiDW_ESd2Zju37mQAmXx8Xkj3kgE9YtCReXFGK2kWGi5HatyQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 11 May 2016 10:55:18 +0300
Message-ID: <CAHiDW_GtC6NXX+8WVhFDTKTa-A9cJVuRKdYP0BfzmaNb_fQOXg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] glew: Correct version in autotooling patches
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
X-List-Received-Date: Wed, 11 May 2016 07:55:48 -0000
Content-Type: text/plain; charset=UTF-8

On 11 May 2016 at 10:53, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> This patch was made obsolete in February when Ross modified the recipe
> (and upgraded to 1.13) or am I missing something here?

Ah, I see I'm missing "[jethro]" in the cover letter, sorry.

Would be nice to have it in the patch titles as well.

Jussi


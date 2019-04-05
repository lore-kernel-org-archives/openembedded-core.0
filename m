Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDCE7D66C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 17:01:46 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w10so8867302wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=MrA4QWHGZyTdAJnsztk+jDrt5ECBHd+CENK1brEc34Q=;
	b=O6r/bT92TkOEs+9jYIUcBuUCi3EXiyflXQHldqYImL+2HarzEUaT4TtHGuZPV1W22Y
	Ic7+1dGwSBjMuSC+V8lmVB++A2O4M1/PWvkIsAT2XtFFqP/fZRyEdC5Ar79Vg4eg2VBw
	Dk0TkxH0ubNEU7NnKGESJqkYioiMt118aX8oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MrA4QWHGZyTdAJnsztk+jDrt5ECBHd+CENK1brEc34Q=;
	b=QGk3GO55ra/gSk8+bKqIkYdvxuQChkpNEkimo2XJdFe4ETrvQQ+U5uCUc0Iddtvma3
	xZLDunzMnhSuWnIfwcftqkLCbfm52wFWaQIxCAjKpy6YBlsmm/Sa9n0LjeXNqYmHpgEI
	4blK/45GT0FsUyEs5IN8pqgnpOJsqGPFO3oONeWE8kcJyQMne09eU1MMaphB+pz9UOKi
	7/6+he9LxQcUUdpnCftgme8DmEayQrFIYUJjYWr8W/i30gXuXrf4bCBGhVUwmofTRONz
	dSgCLSgn4Og3WJ96XN2jMzSLjsiAJu0zjF432URmFQGcBZcN/3xKi9Y4Jp752Eb5B0sR
	l9PQ==
X-Gm-Message-State: APjAAAW+FXdWPaaYhBncdocdyUt2nBcFSEJgSqtm15k18QlbHTM8ryYv
	piMbVPtDUlzmVE/4JG8Rjkf4dw==
X-Google-Smtp-Source: APXvYqyzp2dNdO1+f9HsWSpikgPmmbAMN8Zf/IyfO22+IKWBfqUaRYHlpYiSSNnbHlvjyH91yx2crQ==
X-Received: by 2002:adf:8bc5:: with SMTP id w5mr8698151wra.226.1554483706464; 
	Fri, 05 Apr 2019 10:01:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u17sm4773529wmu.36.2019.04.05.10.01.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Apr 2019 10:01:45 -0700 (PDT)
Message-ID: <134736ff908c53c1cc916afb737da7ce367fbd2b.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
Date: Fri, 05 Apr 2019 18:01:43 +0100
In-Reply-To: <20190404214743.9827-1-jonathan.rajotte-julien@efficios.com>
References: <20190404214743.9827-1-jonathan.rajotte-julien@efficios.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] lttng-tools: improve ptest and test suite
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
X-List-Received-Date: Fri, 05 Apr 2019 17:01:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-04 at 21:47 +0000, Jonathan Rajotte wrote:
> Multiple patches are to be applied to improve the current ptest
> suite.
> 
> 0001-Fix-tests-link-libpause_consumer-on-liblttng-ctl.patch
> 0002-Fix-test-skip-test_getcpu_override-on-single-thread-.patch
> 0003-Fix-test-unit-the-tree-origin-can-be-a-symlink-itsel.patch
> 0006-Tests-check-for-lttng-modules-presence.patch
> 
> All deal with problem in the test suite. Most of these are already
> accepted upstream and will be removed on the next recipe update.

Just wanted to say thanks for working on this. Its made a significant
improvement to the overall ptest execution time without the timeout and
the test results, both of which are hugely useful to us.

I think there was one failure in last night's test of these patches
which is great compared to where we were! :)

Cheers,

Richard



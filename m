Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC96719D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:55:06 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id n125so721172vke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 12:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gxK+NeS1oY5D9tGTYwNzDaD5nfxWE5WRxyhV51a7H8k=;
	b=kwbJUaBxNy3nyyAOcepEVrHzMA0sLlg1gfRVckb5oWTzt/n5KBA5okdYhQcJuSdVDG
	fEH9eBGk33LfXEtJFctZP0MU1SeBa1jtEgTz/S/Kgpewt7lm/6AfN9K0pRpwUUKkHF5N
	G5U5F94afywLxek4p2pxZ+Juo4sMneMBvTIC0ktCxlS/7jxkJAeXUkLQTzbOLeBnG1PY
	McjhZB41Feoh72PFJNDQCByLvSJxwMXiUubeN3Jy/EwVEIg4ZplHx+IzA1WDxycpMoe0
	wN8r9HiDSwt0PpQknt1ecuigMeBnyuZmloqUjbv+oTPs5LcDA8FjsGCjHMTA4SaPe5J/
	ckoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gxK+NeS1oY5D9tGTYwNzDaD5nfxWE5WRxyhV51a7H8k=;
	b=n78H1vEjxBC0ByqCfs5eVzoajtOJ39ggrHIf8tBA2KaUhCBhBIYPVzXQO/FE5sGzC7
	BvoRkYZT18qu1G0MYa7lIf+2x36dtt2/hHxF+It9UNPE+d9rAERQZ39Ygr/+6al45lJs
	bDqAhja3orZ2bGJZMhqcYJbmGfP14JznFGzlHfQvBd/Oees4guT+2DBIWfRazf8WKlJ2
	jdN+RiKB1dbHHQ0SZtvirgwUJRqCHL/05kTkEfALag1QbZLoswWZHMgmzViCu8SVlcOu
	UIorQspeEq+N5/mZIA96WV+ajBHwcPHWmjwEejNz1vBpFbZDt609GqT3UiR/464RGQgH
	MTcg==
X-Gm-Message-State: AMke39nA2mRSK2d89o4gtug/dnQqOLtF56Fdf8LHYuAg1Gvz0RIRiUku9beANnvdkKVuYbh8NoI8cLIhWSdnFw==
X-Received: by 10.31.168.145 with SMTP id r139mr5530267vke.148.1486414507484; 
	Mon, 06 Feb 2017 12:55:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 6 Feb 2017 12:54:37 -0800 (PST)
In-Reply-To: <1486400123.22715.15.camel@pbcl.net>
References: <1486120259.13882.26.camel@pbcl.net>
	<1486120807.14144.68.camel@linuxfoundation.org>
	<1486124973.13882.29.camel@pbcl.net>
	<1486388525.22715.2.camel@pbcl.net>
	<1486391230.14144.82.camel@linuxfoundation.org>
	<1486392281.22715.7.camel@pbcl.net>
	<1486400123.22715.15.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Feb 2017 12:54:37 -0800
Message-ID: <CAMKF1sqKHdzCP3BW1AWZ+cVq+jhoL9=rTvnexKJz3bXyD59Ytw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RSS difficulties
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
X-List-Received-Date: Mon, 06 Feb 2017 20:55:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 6, 2017 at 8:55 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Mon, 2017-02-06 at 14:44 +0000, Phil Blundell wrote:
>
> But sadly the contents of libecj-bootstrap-native doesn't actually show up
> in gnujaf-native's recipe-sysroot-native.
>
>
> A bit of further sleuthing reveals that although this problem only started
> with rss the blame lies somewhere else. It transpires that meta-java's
> java-library.bbclass contains the somewhat epically unhelpful (in this
> context) fragment:
>
> # Java "source" distributions often contain precompiled things
> # we want to delete first.
> do_removebinaries() {
>   find ${WORKDIR} -name "*.jar" -exec rm {} \;
>   find ${WORKDIR} -name "*.class" -exec rm {} \;
> }
>
> addtask removebinaries after do_unpack before do_patch
>
> And, since recipe-sysroot-native is inside ${WORKDIR}, this blows away
> everything that rss carefully placed there. Doh.

good job. yeah this pre-rss assumptions, I also had another issue
where clang cross compiler was happily searching native sysroot for
headers. Not rss fault but exposed a latent problem.


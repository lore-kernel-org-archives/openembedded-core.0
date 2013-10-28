Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 046FD6D2B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:04:02 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id o9so3942794oag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=1qPaT+ovv3/3+e1mRrUhvys8jqvpceuJjuUKtOWkpLM=;
	b=k/ziKM87Tspcf0Op5M5IBNuxZgh1voGHlDfd3ygBnfzG03VTDYix05D93SPMdux5il
	bJtmn+NnHOOYhwnKpsnQ8Z7Gzf/KtoMhxC6PGG3R+fQm0SMunF+jH4gsScDWyFOpzgPQ
	Yy3Yc8OomMMp+k6KhZF7v4V0b/vgDGi28UsO5ircpsOIHCsszYveznjutRXSqogLQjgr
	ZFwYxdDjD/QNXB0tPw+IAX1agjKYuHpb8Akh6k/wN7/WgRHmqeMhnSaJ9a6RFyU1FQ+n
	w7jLsvcbNXL+rlEt/UV0voRLwZWqRXjjuvu8FJbjmFxWOUPYp3zlfORkT/8K32IEEWo8
	nv3A==
MIME-Version: 1.0
X-Received: by 10.182.22.18 with SMTP id z18mr15349619obe.42.1382979844590;
	Mon, 28 Oct 2013 10:04:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 28 Oct 2013 10:04:04 -0700 (PDT)
In-Reply-To: <526E9358.2070901@communistcode.co.uk>
References: <526E9358.2070901@communistcode.co.uk>
Date: Mon, 28 Oct 2013 15:04:04 -0200
X-Google-Sender-Auth: vgA--KCb_B74zB88muLAMXjcFds
Message-ID: <CAP9ODKqfcScfVk=ScwTJyJfy_v=VhSvCsoAzA-f0xmupmv7LOA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why is i586 the default tune?
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
X-List-Received-Date: Mon, 28 Oct 2013 17:04:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 28, 2013 at 2:39 PM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Can anybody shed any light on why i586 is the default tune, rather than
> i686, and for that matter why there is no i686 tune?

i586 offers the widest compatibility with less performance penalty.

> Would there be any objections to creating an i686 tune and setting it to
> default?

I don't think it'd be a problem.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


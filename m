Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 48C5360EAB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 08:31:48 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id w12so1619619wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 00:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=r2oXIJlFMQAHdsXs+e16YJXwwF6Pklua/l+SHATQ/LM=;
	b=LId2QgACGVaiUnJjmKLVBXVxrzYTXPdDE7y2q4XhAn3wg+FQCMItBB++3VLEd2d0LN
	YoATuWo4K7uKbUxkGFRvuAqbe95Zsp0AlMPCWUcEvwOu86EVDbfIv2gaWkOnJ0pDGP70
	nBrx73SsMVdeQvDypiQKvcr7SzjVgoO+1gnbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=r2oXIJlFMQAHdsXs+e16YJXwwF6Pklua/l+SHATQ/LM=;
	b=hHGIZ7Xzz09VVvRJV5OqW5TkzBTNmqqlOrVk4lxWNTHKBwE2wAQl35zD2Qx/xRoVe8
	C3cO2OO6GQjEomgb0PIpwHvxp8VnEsIT8MH/NXVgXRnUEQOvcYtCLuwbYaqZaspRrUs9
	Tef2cu+KlrJIYqovRcwF0p4eAXZEzxhGCgWPnaDeNZLOWpzsXeBReLew+eoqsVvTaQxv
	bcePL/s6bz9rMvWKHw3PF7mYVubraOlw9AOImjm8m6FKBSG2aRafI3y8n1nSUUCOlVvl
	QJe4olEPqgl9CoSmlZBvfieyjCGH7bzfiofCoODKtyyJKxT1bgR1iiVVCSxlfygLm3SU
	rm6A==
X-Gm-Message-State: APjAAAWIE6UPwuh7do96/OQ1qEcQVXHSFzWT8P2aeRyIlszYFkZPMxEu
	e83usqNRHkyhh1azf7lhsSmO4Sm+wMI=
X-Google-Smtp-Source: APXvYqyaAZtpLwfma0BqsgD1T+XJfEd0/fjRfgF1Ev2y3ZXmjBVJQd2gIF8SpaZoxL2cwTRQyc0xyw==
X-Received: by 2002:a5d:4289:: with SMTP id k9mr3429745wrq.280.1581064308996; 
	Fri, 07 Feb 2020 00:31:48 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s8sm2477779wmh.26.2020.02.07.00.31.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 00:31:48 -0800 (PST)
Message-ID: <ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Feb 2020 08:31:47 +0000
In-Reply-To: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
References: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Cache unihash ... doesn't match BB_UNIHASH ...
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
X-List-Received-Date: Fri, 07 Feb 2020 08:31:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-07 at 08:16 +0000, Alex Kiernan wrote:
> Hi
> 
> We've got a couple of multiconfig builds with different
> configurations in one bitbake run (whether it needs to be like this a
> different question - I suspect we had something that worked and
> stopped there!)
> 
> However, for sometime we've been seeing errors like this on master
> (the recipes vary):
> 
> ERROR: mc:forensic:ca-certificates-20190110-r0
> do_deploy_source_date_epoch: Cache unihash
> 37d2546973a2b7c16fbcb1a8dd4939e4a1bba8c3d6d2dfb6e7204ca08d437ace
> doesn't match BB_UNIHASH
> 09baf78bd9316acdd308980c42ea4ed1eacea61bcc0d840c36293d1a5a22db69

This is an internal sanity test. It means the hash that it had in the
task/worker context didn't match what the server thought the unihash
should be. There have been changes in this area to try and fix various
things, I'm wondering if we introduced a bug with multiconfig handling.

There are some patches in master-next related to this area so it would
be interesting to know if that made things better/worse.

> Coupled with deadlock messages:
> 
> WARNING: Runqeueue deadlocked on deferred tasks, forcing task
> mc:factory:virtual:native:/var/lib/jenkins/workspace/nanohub_master/b
> uild/../poky/meta/recipes-
> support/sqlite/sqlite3_3.31.1.bb:do_populate_sysroot

This happens if a build has multiple different components with matching
hashes. It builds the "first" one and defers the others since they
could become available in sstate after the first one builds.

You should see messages from runqueue.py:

bb.note("Deferring %s after %s" % (tid, sqdata.hashes[h]))

The behaviour should be to therefore prioritise one multiconfig. I
worry that the sorting isn't quite right and its building bits of
several multiconfigs and deadlocking?

Do you have the logs with the Deferring XXX after YYY messages in you
could share? I suspect its a sorting problem.

Cheers,

Richard



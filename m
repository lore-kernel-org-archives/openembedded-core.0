Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3627E6BC89
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 18:26:22 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id z5so5029662wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 10:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=8fqYFbukwbymyJQRr+he027/ordkxs7S8DwB/0K2n+8=;
	b=UlUAzVrP/Twv9AEY6jUysBXEfWQ1XdIV5PKJvBH5n7G52RN01K3VuWQ60evNLwus4w
	e1eaujQdjJz8v6UCGhuJIP3lLOr2udKvZbC9BaMzAIevsB6Zz+tgAUkYpsB3If/w0aHQ
	OidmfaEQGOyMU9hSdn8CYBwZCbZacjUCnhyNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8fqYFbukwbymyJQRr+he027/ordkxs7S8DwB/0K2n+8=;
	b=BbjqFmI9f5QdVIydHFo9mJF4zwnA+yW7F4yhlz6zTE9zUCGub/Ax84aErSrLza+8QM
	DdnEiRVSoBsRn/anm0Aawgbe7o26X74OGy1YHmKOEAHJ5ScQxZBuB2eE0t1xgvZ6D8iM
	LM7cYPMzDnioxCHbhV5e3MEDZf4jB9kla3H/9QJBJev1ftohLXmptL52NZ9U9GxLEclw
	o9/GLtTYlU0o0RL8TqZ/pI7ZCc1+/VnuI1nMMHmmc8Ck/2DrhepnHFGjFUqj2Fqm5pJq
	uUPRqE2O4PAsK1Y0RfqFzIjNvK4nZYDkj3jA/hBYquf7aVJMRRHS36aa8+QeHs6Eu1W5
	p+4Q==
X-Gm-Message-State: AJcUukfcv0C2y8kvnM+1Lv4Uu1mkgulEZpjrwSHwcOmb6vrBLQUOzAY+
	4urWyOfnX3jOk8q8RHpKWwsZ2w==
X-Google-Smtp-Source: ALg8bN5ErB5e9Beo/Ff9LRoBmKzrJlDWX73aQsqxmFdyHktWCJLIGeiliV4sjBbk4OpXaePGjCNkNA==
X-Received: by 2002:adf:e44c:: with SMTP id t12mr2255081wrm.89.1546971982757; 
	Tue, 08 Jan 2019 10:26:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y145sm9395682wmd.30.2019.01.08.10.26.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 Jan 2019 10:26:22 -0800 (PST)
Message-ID: <26b33c4efb48aaae0bd4662b88bfdfd428b95478.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 08 Jan 2019 18:26:20 +0000
In-Reply-To: <CAKf6xpv2UAGbBr5wOqQdZNgNe5Hra6+bF+OWy_tTD5v3wyobhw@mail.gmail.com>
References: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
	<08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
	<CAKf6xptMbAqnZ34ONNXLzQMjFoDjePH8dz3bXmiTMvoBMu4wsg@mail.gmail.com>
	<50b88771577229c99a2c9e26b6224a5f038e7bab.camel@linuxfoundation.org>
	<CAKf6xpt_RoLVg3ou2zKL2g=0GsjDXpCk73q83pmb4Reer9YgdA@mail.gmail.com>
	<a0e331f39da396ea39ea37539f6c1ea193b055b1.camel@linuxfoundation.org>
	<CAJ86T=V-xs=M2DfsHHtOe=j77bqsn=MgMojue5mc=2ouwwTd+A@mail.gmail.com>
	<731530484e0135bb200df4da388982b2a7957ea1.camel@linuxfoundation.org>
	<CAKf6xpv2UAGbBr5wOqQdZNgNe5Hra6+bF+OWy_tTD5v3wyobhw@mail.gmail.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Mis-generation of shell script (run.do_install)?
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
X-List-Received-Date: Tue, 08 Jan 2019 18:26:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-12-18 at 12:45 -0500, Jason Andryuk wrote:
> I can definitively state I have a hash in bb_codeparser.dat with an
> incorrect shellCacheLine entry and I don't know how it got there.
> 
> The bad hash is 3df9018676de219bb3e46e88eea09c98.  I've attached a
> file with the binutils do_install() contents which hash to that
> value.
> 
> The bad 3df9018676de219bb3e46e88eea09c98 entry in the
> bb_codeparser.dat returned
> DEBUG: execs [
> DEBUG: execs rm
> DEBUG: execs install
> DEBUG: execs test
> DEBUG: execs sed
> DEBUG: execs rmdir
> DEBUG: execs bbfatal_log
> DEBUG: execs mv
> DEBUG: execs /home/build/openxt-compartments/build/tmp-
> glibc/work/core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-
> native/usr/bin/python-native/python
> DEBUG: execs find

This is useful data (along with the attachment), thanks.

I agree that this looks likely to have come from a core2-32 tuned
machine (e.g. genericx86) from python-async do_install.

How old was this build directory? Can you remember any details of the
update history for it?

I'd be very interested to try and reproduce that hash. I locally
blacklisted your collision from my cache and tried to reproduce this. I
can generate a matching hash for the binutils do_install but I can't
produce one matching the above.

Can you remember the history of this build directory and which updates
it may have had? The python-async recipe is confined to OE-Core so its
probably the revision history for the oe-core repo which is most
interesting. Anything in the .git/logs directory for that which would
help us replay the different versions you might have built?

Cheers,

Richard



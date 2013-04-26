Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVgJU-0000u7-J8
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 12:55:37 +0200
Received: by mail-vb0-f43.google.com with SMTP id q13so2518163vbe.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 03:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=I2CvOl8wMRgucaNAtSCb7EJCHTwOIm7LzX575mCTM4w=;
	b=HjGC5cAbGu4TJ8kUoUG6Bbj/AXnOnx7LZ4MrORyfz7UVU+eTLDT0ksOMXy3W1g3a7m
	u+TJXZFI1xyA0dXUdsEayhDGURjOXhBmyK6egzZ0meTtVTepdYLlkV9NYjnzguhjJ33J
	8pwZL44RjignZWtMoYZlGq8M8V2joOZmzd9LvyKZukeGhwHe8HV7aAcFd9OPbCFMLt9V
	1jR8sL71Cqbz24h2BNHlr/jxuFdkKguy/uMOggllpyJ+mPj3QSapTm3cbP6v9Fia4UW1
	VXppJVYGHf6aEsMve7WR8ORQc8rMeEvJ47rm3TfUPHYy+iU2lY1LGcDD0yELI8aRDtPi
	zJcA==
X-Received: by 10.220.155.8 with SMTP id q8mr22821037vcw.42.1366972671218;
	Fri, 26 Apr 2013 03:37:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 26 Apr 2013 03:37:31 -0700 (PDT)
In-Reply-To: <517A5647.5000800@communistcode.co.uk>
References: <1366970771-9959-1-git-send-email-ml@communistcode.co.uk>
	<20130426101627.GM5538@jama.dyndns-home.com>
	<517A5647.5000800@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Apr 2013 11:37:31 +0100
Message-ID: <CAJTo0LbOHWWEvM_s4mxV4ORACTSvaGCtQvVdfYR6XDYZC0gu+w@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQnbflYaW9+1GYZf2IGQ9MhYP4Uaf5HWRb7/WGzMc6rQH3IDe0fLsoMP8y0zdLwEqsFoyJjo
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: make tist functionallity a PACKAGECONFIG option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 10:55:38 -0000
Content-Type: text/plain; charset=UTF-8

On 26 April 2013 11:26, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Something like:
>
> PACKAGECONFIG ??= " \
> ${@base_contains('DISTRO_FEATURES', 'wifi','wifi', '', d)}\
>                   "
>
> PACKAGECONFIG[wifi] = "--enable-wifi,--disable-wifi,"
>
> Or were you thinking of another method?

That's right.  Would be nice if we had a more concise method, but
that's idiomatic at least.

Ross



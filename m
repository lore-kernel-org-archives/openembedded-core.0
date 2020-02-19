Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2B20C6059D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 22:28:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so2428082wru.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 14:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=m4qU2l8R/hhf/0BM/7AakOCypAfNmvyVDt0JRnTQVH0=;
	b=QIzgamgTyHc3G8QQ1U0gACzXRQ5u7AvJd9XKfKnUHtLlgzlviXGZV3A3gV9dLhSqv8
	6GfGHksLQeQA9nK8QuvBXEBfTRtO/bBixV7lESIMo/20plnhNUI6l1xF6faTPUBkrZKR
	a70fuZZ9QpvZQP6S+1LgXNrVTSUo2q3gV3AcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=m4qU2l8R/hhf/0BM/7AakOCypAfNmvyVDt0JRnTQVH0=;
	b=Ev+G7WVSUi39M62Pl2eKu8suqPjXj612bF+ezDh6Z1i8lunyMDYdFMJOc+UXNEiOHI
	/pQ4z8w+uPqYYvHS9h2yZPox9zj7sNV4WaIaFTzk1OgxSutWc+KYkAzWNA+EFfrppIwq
	9hP9xwTFhYBNX1iKoOpOISrdZ71R2VwuJNMMAKxrwTvi7kSSibWgGyClA6qNpvkH/gic
	8maGJ58yR5yicdI2zDBTc9sK36e95IgN8soVjHalh36CyXf+40KDatjo5iD6lpAh++wc
	glpFVnsud0qq/l7u8bGapkqbpQHrmr8NtOADisOsVmJ962lur/PY5lQku6ucwzPjHp0h
	GG8g==
X-Gm-Message-State: APjAAAU/s/tsjqRzsXJIwNrGWk8lTh/mT1bpZvU7ryCwdYSVwDBnbTVN
	75BW1YFrnOn1frGoSLTcn229LA==
X-Google-Smtp-Source: APXvYqxyPO7CN3G5+5MAWnPQ1cgQ7VrUDY7+6JKrOtMRlJ7aQO7xnEuTB/DP/javAg7Th+3cV+Hg7g==
X-Received: by 2002:a05:6000:1252:: with SMTP id
	j18mr40470194wrx.103.1582151310851; 
	Wed, 19 Feb 2020 14:28:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f65sm1662220wmf.29.2020.02.19.14.28.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 14:28:30 -0800 (PST)
Message-ID: <ebdc25b73de411d372cb332d91b31ba09db017e0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 19 Feb 2020 22:28:29 +0000
In-Reply-To: <d19c8ec2557b4e008b2965247c7c6225@XBOX03.axis.com>
References: <20200219183817.130495-1-richard.purdie@linuxfoundation.org>
	<20200219183817.130495-3-richard.purdie@linuxfoundation.org>
	<d19c8ec2557b4e008b2965247c7c6225@XBOX03.axis.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] oeqa/selftest: Drop 'backup' code and SIGTERM	handler
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
X-List-Received-Date: Wed, 19 Feb 2020 22:28:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-19 at 22:26 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <
> > openembedded-core-bounces@lists.openembedded.org> On Behalf Of
> > Richard Purdie
> > Sent: den 19 februari 2020 19:38
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 3/3] oeqa/selftest: Drop 'backup' code
> > and SIGTERM handler
> > 
> > Now selftest is using its own copied build directory, we can stop
> > worrying about
> > copying files around as backup, and drop the SIGTERM handler to try
> > and restore
> > them, simplifying the code.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/lib/oeqa/selftest/case.py    | 30 +-------------------
> >  meta/lib/oeqa/selftest/context.py | 47 ++-------------------------
> > ----
> >  2 files changed, 4 insertions(+), 73 deletions(-)
> 
> [cut]
> 
> > @@ -329,18 +311,9 @@ class
> > OESelftestTestContextExecutor(OETestContextExecutor):
> > 
> >          return rc
> > 
> > -    def _signal_clean_handler(self, signum, frame):
> > -        if self.ourpid == os.getpid():
> > -            sys.exit(1)
> > -
> >      def run(self, logger, args):
> >          self._process_args(logger, args)
> > 
> > -        # Setup a SIGTERM handler to allow restoration of files
> > like local.conf and bblayers.conf
> > -        # but don't interfer with other processes
> > -        self.ourpid = os.getpid()
> > -        signal.signal(signal.SIGTERM, self._signal_clean_handler)
> > -
> 
> What's the point of the first patch in this series, when you just 
> remove it all again here in the third patch?

The bug affects stable series builds as well as master. We're probably
unlikely to accept 2/3 or 3/3 into stable builds? I therefore wrote it
as a series, just in case the stable maintainers do pick up 1/3 which
I'd figured out before writing 2/3 and 3/3.

Cheers,

Richard




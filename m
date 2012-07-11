Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Sp2Le-0004WU-8C
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 21:13:18 +0200
Received: by lbol5 with SMTP id l5so2075408lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 12:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=7Spi0nAFSRF4A2ZpIJTnPs58HGtpWt/vlXjh+p7B5iw=;
	b=Z4IxVsgdDkFywC4OZv+XQfL7bgPFJii/lXddnvyqY7i67f0nBzIqz+TYye57+dEg/u
	cxqZMBse4pKxa5KGihr4tyvIFkccv00ffRxCcny/jeA62x1xIUuvaFH49mG+c2ziJ8Xe
	4BnlGY+JXpCsOW6bnZW1uuPVKJO9VRKsC+MuhGXbZIJyHUc6YvRAK3oV96UrxMjzQ766
	qzTmqmtnyzmakIsnECHR6HvOAzHuMNrRMxQQqqsHQu2qQ8dLFdsz2bgKjt3gpBIlXmpf
	lAaHPJKEV/7mUVzf1AThRQsTrTI40GnV3rpsJVRarILbKzV7XUJ1Wz4Rcc/ZGs6uF1QY
	O8GA==
Received: by 10.152.104.47 with SMTP id gb15mr49956209lab.45.1342033326123;
	Wed, 11 Jul 2012 12:02:06 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Wed, 11 Jul 2012 12:01:45 -0700 (PDT)
In-Reply-To: <20120711135455.72b90a06@wrlaptop>
References: <cover.1342022120.git.peter.seebach@windriver.com>
	<22e5e5adc39fb855badc6d1260fbd4b30d966530.1342022120.git.peter.seebach@windriver.com>
	<1342023149.11939.22.camel@ted> <20120711113333.76632780@wrlaptop>
	<1342028210.11939.35.camel@ted> <20120711135455.72b90a06@wrlaptop>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 11 Jul 2012 12:01:45 -0700
X-Google-Sender-Auth: FEZWYUbIbqnyP3tIXU6Du25CUsM
Message-ID: <CABcZANmXGq8kccKxaqtwG7ekBqSsEzCwmwjTHSbXo9c5VsS-Pg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] package.bbclass: Allow overriding of debugedit starting path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2012 19:13:18 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 11, 2012 at 11:54 AM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> Okay, crazy thought.  Imagine that we were to make a modified parser,
> with the following behavior:
>
> Whenever reading a python function, count the indentation of the first
> line (N), then replace every N spaces of indentation with 4 spaces.
>
> If this worked, it would make it possible to start fixing stuff.

That's one possibility. The other would be to treat _append/_prepended
functions as independent entities. Rather than concatenating
functions, it'd add them to the prefuncs/postfuncs or equivalent.
Without concatenation, there'd be no issues with mismatches.
-- 
Christopher Larson



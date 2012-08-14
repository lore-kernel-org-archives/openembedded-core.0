Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1KgL-0000q4-PW
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 19:13:30 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 14 Aug 2012 10:01:33 -0700
Received: by obceq6 with SMTP id eq6so690875obc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 10:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=SEQSO+WXTjg29q+mf7DWejmeiNPLqhaMDWrOO39Jlc0=;
	b=UWRf+UT9R0Fl5W5Az6BIjsibT7t5QK2CRXsJhRXmhg1r153z4vA6JUBIsawI5x2LCm
	IyiKzWIX4HirLnnpCEpqE4vfrspTC5NTohN/WUkvQhUwhoY0fZkP52OWm855CVHcdltU
	TjxLjbDdi79ea1DpEgJwSVUoNjTAMruW2yzyqNzfbPFDuJNLjncAwPE3RTyiH98YTLCZ
	aZn66vYvm12P50Tm0/W0ZxVoP234iLwHHtHJCwomH4uHy409lZm5aD4FRQE1LBy5GnwO
	XgePuRe5EwUN3BPLzwD+6qrnu+tNHFCdyU5PGeFvWKcMjwh8w5g5Oen16mlXxo/TISwi
	W/ag==
Received: by 10.182.159.42 with SMTP id wz10mr20436655obb.49.1344963692896;
	Tue, 14 Aug 2012 10:01:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Tue, 14 Aug 2012 10:01:12 -0700 (PDT)
In-Reply-To: <5CB37A1B-9FC1-42AC-BF8E-291E3440A2C5@dominion.thruhere.net>
References: <CAK18fxFfWO0ZG2tisaROTuJ-FSgLoqMW4cUgTpNq3DNeqFpNqg@mail.gmail.com>
	<1EE0C4BA-A5E0-42FC-B354-89B29C5C6C22@dominion.thruhere.net>
	<502A7BB0.4050708@linux.intel.com>
	<5CB37A1B-9FC1-42AC-BF8E-291E3440A2C5@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Aug 2012 18:01:12 +0100
Message-ID: <CAJTo0LbOzh24SETaa0iYSYuXsS6iuZQSN=6FemUQWdEeDPWQLg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl8vjDjG17hWCgsWXrWxow38+84R1FmCRwhjElT+UsnxZl4fNJJxbwMoDV9osqX8XruwiOa
Subject: Re: dbus with tests
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
X-List-Received-Date: Tue, 14 Aug 2012 17:13:30 -0000
Content-Type: text/plain; charset=UTF-8

On 14 August 2012 17:53, Koen Kooi <koen@dominion.thruhere.net> wrote:
> I wanted to suggest libdir/BPN, but since that's one of those new-fangled things adopted by systemd I thought people would have a knee-jerk reaction, kinda like the big players threatening to back out of yocto if systemd ends up in oe-core.

Debian's (and others) been using /usr/lib/$package instead of
/usr/libexec since, well, forever.

Ross



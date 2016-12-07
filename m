Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 36A1871B42
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 23:50:51 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n204so50822650qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 15:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pZOCndABfD7LywRTGtuQamsCW7nVim2QJxOlQJ8Hnms=;
	b=ZlOY67SECxWZNGoTPD5oS2xCoG1UIW9BaiaFMZ4Q5jgjg187vTVGG0R8/N3GExOR+2
	Ea5CHQ2cXJs1j1Drn1j5fbfLX+DmwqnfxSsw4G7MsaGcS4VKJd7mGnSTdQeod+ooVDhr
	hpDwn6Dw3aAy/4W7x0EkyMs8g1P63AsgIcxrBzWXkbNttDFqCok7KYWV12aPAtfrwypd
	+6M7V5odHj8+Ify7gSGl17zF+nq+5Qff4wrt+fQ3pK89+jNglCcMsTodZNUdWcHHU+QP
	+PHt3PQ31sCx4eEjG25kgTPB/Dg4zaN+p8iii4ulBvzPLI6zi15dYVLfy7S+HS4qa6jI
	j0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pZOCndABfD7LywRTGtuQamsCW7nVim2QJxOlQJ8Hnms=;
	b=eSt0/s1wdZN/nqyYQNzXV0qyAikkQluy6vf60U+oMNbpAbhH/ToSAGaYJ4uPEgCqP2
	PxAG1b7Iu56Z9Qgs0dKcP1gt/cuHO3te/bczPc8IcGhFNKd+TvmaYkKFPoIG7mbif/4N
	0neNJaxU9r3qxQWZ4by7X62AdgGBbT3H8+Z010adVsnH7mjkM9nIMXBFcLbOg3H1UoXU
	RqUXIPElyysiq0g/Am6gTJWsVB3Zt51qeUij3Ws2Cxz411OfpDtUvUCiOfOFFDPEqCcI
	f7+PDZ1eU3BkJA4kJsbvUSYJ4nVjFISzg4YW28Jj7b4Q36AJ55DfJOpZUHpETIyr0YAP
	L4eQ==
X-Gm-Message-State: AKaTC01S6rwZkaM/WQJZauIurbvy7ZlhKVNtAGhD3tGjLnxIbjK5mzZGgIOJA99sRqeKWMUH0vU/SA4V3nADxQ==
X-Received: by 10.55.94.135 with SMTP id s129mr58847650qkb.124.1481154652950; 
	Wed, 07 Dec 2016 15:50:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.46.162 with HTTP; Wed, 7 Dec 2016 15:50:52 -0800 (PST)
In-Reply-To: <CAHUNapSr5a2cuKN1xiK=2K0S+zkwMA7J0ALfe1hUZAVgXv2Fpw@mail.gmail.com>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
	<48f1e3e16ca28e1194d6024689d000cb6ffc303c.1480711764.git.bruce.ashfield@windriver.com>
	<1481058881.17535.58.camel@intel.com>
	<20161206230222.5411d7b6@nuc.betafive.co.uk>
	<CAHUNapQ847n7e=acLQ+hkLqziqaP8EQg5_0wrw5oJ9i9+Tw6tg@mail.gmail.com>
	<78eef00e-4156-bdbf-cda1-688ae0495414@windriver.com>
	<CAHUNapSr5a2cuKN1xiK=2K0S+zkwMA7J0ALfe1hUZAVgXv2Fpw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 7 Dec 2016 18:50:52 -0500
Message-ID: <CAHUNapQxmOANi1FinaTiXH+J2VdyvH4g5y2zRJydBso6epf00A@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] kern-tools: fix processing for no branch meta-data
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
X-List-Received-Date: Wed, 07 Dec 2016 23:50:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 7, 2016 at 1:05 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Wed, Dec 7, 2016 at 11:18 AM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> With the attached patch, I see nothing else that is named  in /tmp/
>>
>> If you have the cycles, can you give it a try and let me know ?
>
> Yes, I'm giving it a whirl right now. Thanks!

That patch looks good, how soon can it land? ;-)

I'm sure there's still something in the build that is creating
temporary files in /tmp. I'm not sure which process is doing it, I
have no reason to suspect it's the kernel tools (in fact I think it
happens too early in the build to be the kernel tools), and the tmp
files that are created are named with temporary names (e.g.
/tmp/tmp.2wavbhTlDU) so they shouldn't interfere with multiple users
building on the same machine. Each build appears to create two such
temp files that aren't cleaned up at the end of the build. Not a big
deal. I don't think it's something new that was introduced recently
(but I'd have to do more investigation to verify).


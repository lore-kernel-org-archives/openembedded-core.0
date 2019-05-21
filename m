Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 396E87E12C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 04:49:37 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id v7so12832912iob.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 21:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hdJnqS5UdFzek4VRxr6XLIl/mUqoHMr0lVS4Fiy85oY=;
	b=WxlTNNO4enTp4uNEUknk8WMfLBRsZr/G5dbRZRBNu0Uu9egh/vbrNhSDJDKU8bAo6d
	jITORXDDfSaXOwgbu8sjz9xr4xa9D41ikf/Uj2vVQH0xfWblrUoDvOUAmA2fkyFpW09E
	xnGAHjDYDP3iBR2pOEu+novoiiuIWHFcDZipqgAyFdP/X02iKr+ift58ETuWTks4PEGv
	0CCHtbg+Hroyl7ZKoi9AqCNug5aCCqbcEaCKPjmjOTxqJ1IezPx6EY1NZ+pWE0xCoGUE
	0aeXob3UgqpJ8mCq5f/OzPyIggc0cDoCIoNcktgxuqQ9V0lIrFwbNwTPLtmn9zhmsxqo
	QPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hdJnqS5UdFzek4VRxr6XLIl/mUqoHMr0lVS4Fiy85oY=;
	b=Js56ncHbJTtf217s6gXf8hqM+CzHGiITAzqWkQhmzIPwG8MLLyhdD3jfvwCdxT2nk7
	Kc2lliwV/vlZrpo+NWD8YZm+lK3bn11jyLelKUD61coleqIZcVl7utO3KuBFg8+jPp7n
	j+W6JzuX4q7WDUDmIh5iox00LPX+JhXikTSYJTZcnwUl78bbk/+w9hORR1yyLVxLknN/
	gEOzERViyMxiYFnppJJiCcpN3/d2P7yWQ/Df7Jabz/mSL97I2ZN3IoYMinuuPWJhok/p
	IUgfKvg/vgZHJl6tkLdNP9S6f/XJ3yKrfkEadoQtbIeViU5Y8ZlFRs8qEvsLlU11ehN4
	Wr/g==
X-Gm-Message-State: APjAAAXvt9vruEvfMD7nqTTBYNW85BPA0TrmUaRlYbQ7HZW3xngORUDs
	+9Rio3+tZ5bDGOhWZC7Kn31gLi8nyBpaMp/UYJ0=
X-Google-Smtp-Source: APXvYqxyNUPspgYd+i55lEGbNghSTKL67VUbQd4NfSg3Jxvh6fU0/6UV/gMN2/xDYaLkJMy1qcEqukPB56IWH7Gjisk=
X-Received: by 2002:a6b:dc0d:: with SMTP id s13mr16524395ioc.144.1558414178146;
	Mon, 20 May 2019 21:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190520094621.94652-1-kai.kang@windriver.com>
	<20190520094621.94652-2-kai.kang@windriver.com>
	<CAO5Uq5TMy73eTwm538936eSY7NtA=aaGGAHX0TZo5xMRFESiYg@mail.gmail.com>
	<135a9bc7-29ac-7b7c-c005-8b679f724414@windriver.com>
In-Reply-To: <135a9bc7-29ac-7b7c-c005-8b679f724414@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 21 May 2019 05:49:25 +0100
Message-ID: <CAO5Uq5QjL0sy4SeMc1AemLmLGVuQ4OC+gSM_0cWQXeStEvkjkQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: paul.eggleton@linux.intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Tue, 21 May 2019 04:49:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 2:34 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/5/21 =E4=B8=8A=E5=8D=881:45, Alex Kiernan wrote:
> > On Mon, May 20, 2019 at 10:47 AM <kai.kang@windriver.com> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Add a configure file for systemd.networkd to configure wired network
> >> interfaces with dhcp. It works with common network interfaces such eth=
0
> >> and eno1.
> >>
> >> [YOCTO #13057]
> >>
> > I'm really not convinced about this - yes it's initially surprising,
> > but should base packages have this kind of assumptions/policy baked
> > into them?
>
> I have considered whether systemd or systemd-conf should contain such
> configure file. Compare to Fedora and Debian,
> no such kind of pre-configured network setting provided by systemd, so I
> added the configure file to systemd-config.
>
> If systemd should be preferred, I'll update in v2.
>

No, systemd-conf is the right place for it, since this is machine
specific configuration. My question is really if this piece of
configuration should exist at all in OE-Core; but I'm not totally
opposed to it.

I could live with the kind of construction in meta-yoe (but with the
files added to systemd-conf as you already have)

--=20
Alex Kiernan


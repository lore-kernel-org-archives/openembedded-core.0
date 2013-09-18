Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5A99260664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 16:34:02 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wp4so8049308obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 09:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=i/XBTAVyGGZsfpbAz/zVrMbyZ/C3HJXzKqiIql4dW2A=;
	b=l4TmYjw/oKFdEhOAVtlHOlmlyoPPr+cNWpmboFsbOHm3hGu7h8s5UU3pRjpTtaytQp
	MhJlmKQvG3N/vu2zmID/NURtG1n1PLnLgg8jhuxxubgoJtvJtCl48aK6nCA7/DzYyIFo
	seQShwDWuJQhK95adOp0clnPtNsywa5z1/b/8dtZSI8XeafBx9LPrrPvqpU34rXvaWaF
	Jybv+AhTj83DVPkzzWzTj+HE3uxTSYwntggTLmkyma9N/fLuUdk3kXD/ALZ6f80DO+T0
	vAaURxGjo+oNGzEth1yf1NaSSxWPo8x5UwmOy5FjHHJ7x/Nwkyy/oxmY2Ii6A0pz3PWx
	fKYQ==
MIME-Version: 1.0
X-Received: by 10.182.80.196 with SMTP id t4mr35319870obx.1.1379522043628;
	Wed, 18 Sep 2013 09:34:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 18 Sep 2013 09:34:03 -0700 (PDT)
In-Reply-To: <CADkTA4Mou5h59ME-wGoOKRjaJURtx7nM6d2dwG+YVHFY2zNufA@mail.gmail.com>
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
	<ly38p2urzf.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4N+LdRpRW-497U0K8ZTFbFvy5Yr+2QznKbcg0yxSaBPww@mail.gmail.com>
	<lytxhitawh.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAP9ODKqWGteXc+_kR5o6rmifWXmnKD3vUjQkOUzxR1Fp+Bkqmg@mail.gmail.com>
	<lyli2ut9r0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4PEPFjA5Adi_NJm8gXof4HNcr6AC5XqvJHhWBY5js5tVw@mail.gmail.com>
	<1379520153.18603.27.camel@ted>
	<CADkTA4PiypPNYUnx6h_MrijUpo_AL5w09KR+m6Ks_cuJMuOuvg@mail.gmail.com>
	<1379521400.18603.33.camel@ted>
	<CADkTA4Mou5h59ME-wGoOKRjaJURtx7nM6d2dwG+YVHFY2zNufA@mail.gmail.com>
Date: Wed, 18 Sep 2013 13:34:03 -0300
X-Google-Sender-Auth: EDl-jW6JC9fNrJ1DDw7MMEtEluI
Message-ID: <CAP9ODKoy4DgeNEHeoNsQpMmh26ZtQkkeCy3h2Fv9G4-pzFR9Jg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 16:34:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 18, 2013 at 1:27 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Sep 18, 2013 at 12:23 PM, Richard Purdie
...
>> Isn't that what the patch at the start of this thread is doing though
>> (clobbering, not adding)?  :/
>
> It definitely is, and I had put in the bugzilla that it is a compromise for now,
> since perf only offers EXTRA_CFLAGS and not EXTRA_LDFLAGS. I'll see
> about addressing that upstream once we get out of this fix :)

For now, this seems to address all urgent issues; so please pick this one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1666F60B05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 16:58:09 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id v1so1339537yhn.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=OXD6f9KeKUFq4KIuab54q5a3oxb9WdC/JyJSaMDYRJU=;
	b=mBimtD1GrWoFhXfg9+sqf2gQtisnul8fjw1SdJKki7nx+CpW4bzV0AakwGcJnBshlN
	uifqaWXRge5jyHJ/nhN9CRNAUNMNbCjqRv6JOrtwwwkyCUUN1j4RpvcP2CNKM/V4zaHO
	3GEs4E+omI+7XCJobwheS7ViDp9pYRQdGgWBbKtnjKANMt7KnFeKFF/OEaHKi3DOudYT
	Fw5t/zDk3pwXWO6HpE/JMbGDKpTvXHk8W+w+D6Tv1ln8K/WNGZbKWFqMYGkOWub5QQnt
	wDwJ88+pUKRjkaQPy3/wcy3pYudYmAcbiMwTe2mQtOQEtf8IGHGKWmQGM+R+TlA69WF/
	oUsw==
MIME-Version: 1.0
X-Received: by 10.236.142.13 with SMTP id h13mr4329756yhj.155.1403715490315;
	Wed, 25 Jun 2014 09:58:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Wed, 25 Jun 2014 09:58:10 -0700 (PDT)
In-Reply-To: <8902442.ZlenMckcFY@peggleto-mobl5.ger.corp.intel.com>
References: <1403011013-29977-1-git-send-email-meier.dennis@siemens.com>
	<CAP9ODKo_tNpKNkOpr9mwFGosmuXiKfXQuNnTURaZzptsamSyzA@mail.gmail.com>
	<6F22A92316C68C42A591A48A6291DA9DD95C99@DEFTHW99EI0MSX.ww902.siemens.net>
	<8902442.ZlenMckcFY@peggleto-mobl5.ger.corp.intel.com>
Date: Wed, 25 Jun 2014 13:58:10 -0300
X-Google-Sender-Auth: IkfEMYQQSJBIIRAyEa-CP4wfMyg
Message-ID: <CAP9ODKojs=gfs0tYNxxGv23c0iX61cjWLPLJryey+Wfx-9YV0g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: add auto-completion in setup
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
X-List-Received-Date: Wed, 25 Jun 2014 16:58:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 25, 2014 at 1:26 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 24 June 2014 10:01:36 Meier, Dennis wrote:
>> > -----Original Message-----
>> > From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On
>> > Behalf Of Otavio Salvador
>> > Sent: Dienstag, 17. Juni 2014 16:40
>> > To: Meier, Dennis
>> > Cc: Patches and discussions about the oe-core layer
>> > Subject: Re: [OE-core] [PATCH] populate_sdk_base: add auto-completion
>> > in setup
>> >
>> > On Tue, Jun 17, 2014 at 10:16 AM, Dennis Meier
>> >
>> > <meier.dennis@siemens.com> wrote:
>> > > Signed-off-by: Dennis Meier <meier.dennis@siemens.com>
>> >
>> > I do like the idea but how portable is it?
>> >
>> > For example in my envinronment it does not work as I use zsh.
>>
>> Yeah that's what I was afraid of. We figured that the script might still be
>> invoked by bash because it starts with "#!/bin/bash" and thus it might
>> work, but if you tested it and it didn't work for you I think it doesn't
>> make sense to apply this patch.
>
> Well, it depends - Otavio, when you say "it does not work" did you test it?
> #!/bin/bash should ensure bash is actually used.

Having the shebang should be fine. I tried it byhand to check if it
was compatible.

So I am fine with the patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


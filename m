Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SU4H4-0005n2-VK
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 01:01:55 +0200
Received: by yhjj56 with SMTP id j56so5052948yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 15:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=22IRq8G4+JJAgDWBwSU7/k0hg+Zj9On96eLJOELMer0=;
	b=f595oHVxNI0uYZFbAzsaXt/3GOgu+/kqXrArgK0JXC/RdKW2KhA7J/nfU7a5NV8jJI
	g1tSbZ8pnX7adL8T2Vsdx5qieJH4Fg/gmPs7hWjJ/VtuWv7p2tWjBRZ8BHSYp5+Q+mJ6
	xK6NGrKhrHKJMNHz2RGUmzfQn3Hc9W54VZ0FT1f9GHPbfND+BeVIoGZm6/fKO5Uz3ysI
	N5d67/uYnJgON09wb+ftsKPjguFnWCOfkti2pd4VYMb0HlE998mkaEvNQF5YSABNgCjd
	hkLy1XYvyzulnlRe95JCfBLEoBLrZ8UdsR27f8nRgGxKWo7qdLeIXxTmzhHJgyQPOPE5
	zDFw==
MIME-Version: 1.0
Received: by 10.50.104.133 with SMTP id ge5mr567361igb.21.1337035914893; Mon,
	14 May 2012 15:51:54 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Mon, 14 May 2012 15:51:54 -0700 (PDT)
In-Reply-To: <4FA8611B.8060609@intel.com>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
	<4FA8611B.8060609@intel.com>
Date: Tue, 15 May 2012 01:51:54 +0300
Message-ID: <CAF6bG8dN1ZF_khQQirs1OysQP1BUiESrTqT3ucn9YexKN1WvXw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] runqemu: Use OE_TMPDIR
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
X-List-Received-Date: Mon, 14 May 2012 23:01:55 -0000
Content-Type: text/plain; charset=UTF-8

On 8 May 2012 02:56, Scott Garman <scott.a.garman@intel.com> wrote:
>
> I can understand why we're trying to ensure our build system doesn't require
> /bin/sh to be bash, but I think support scripts like runqemu might be a
> special case.
>
> What do other people in the community think of this? The runqemu script
> isn't trivial, and it has to run in a lot of different contexts. Should we
> put the time in to make it shell-agnostic, or allow it to require bash?

 1) Do not require /bin/sh to be bash
 2) It's ok, and for "right tool for the job" -reasons often prefered,
to require that development machine has also bash installed.

 So I'm happy with how runqemu currently has #!/bin/bash shebang. It
requires bash to be present, but not necessarily as /bin/sh


 - ML



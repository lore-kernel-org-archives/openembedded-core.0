Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 71F6579CD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 17:31:27 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id q15so8248043vso.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 10:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r7CQnk74q0DIjsu+aNDFdYs/bKqOKSxe+byRtNJe0FI=;
	b=krVqmvAMDirq1Q3Opkz5aoWd7sdQFN0h4vYnMpewF2sGXOAE+FYdEOCJD/juLtjF4D
	5uh+vJXU74jD7boyFkH/XHKQwZbG+9Cz/lNgCYYHHG9DwT9LOj6GuG5ijEsFVQzKUj90
	Mz4dXV99i80jc3XyVy1l9HkmfP0k57PRl5uSwzHjK6d9Js0oj0NJLkJORXsdikji64x5
	Q8fu7KTDb61L80yNdHjdjGKbuoRsTs1MQwuKJQz8VxvdYVCYxzQSUtdl5naib4QqP7wE
	HthRRTz2FRqPh8jfcY7kJrQPpbJpGbEDAp2QywcMr6ZgAPWT6bCFoKrWxYwhj0MxcyP/
	2/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r7CQnk74q0DIjsu+aNDFdYs/bKqOKSxe+byRtNJe0FI=;
	b=Adj3Z4NA+g6Ogu5J50+vK0ZrvXffckndJ3fl226BJM93JRbKtIHozduneO98zHLj6a
	5RkuvxMcTZMoNOEB1YoL6WeILBGGWUadprq2FX9NoPVxr8xCthRTMs+5RvfHZWVwmKnM
	2zDAe/LTrUH3DdohGx/Qq5KCf1cYMBntqe+Ozf+IGZgoFEJeyLtVC+1XDUMlksWCUfkN
	hpIYf7Zz0pE6lLLbyQbUoxm4gbMmR/XrCVqHENyPNInBrS9L8iayo2pnvk1Sze3spvXm
	fGm6Z5TH7r3mDRUg80fF3JVsbIqEJtJi5e7Lp2Fe5HV8p0OzFN3zMo+3VfRPAVpHjD+U
	BZcg==
X-Gm-Message-State: AGRZ1gJzZplcNFxehFANdLGqkIbALBG468cwZKuxSv4IGTLJu5ZUPaMt
	OCo2L7RYP2TOP1KKsmyF6vdZSpadshiycC1tshU=
X-Google-Smtp-Source: AJdET5cCXUjExPy7XAGsawgAHelvA7ahmEGHAHW17dHRXNQEdxZ+t5fnUVIBgq7HEypP9H45ZutjUiZbC2eFyMm6Qhg=
X-Received: by 2002:a67:7344:: with SMTP id o65mr8263580vsc.223.1540920687902; 
	Tue, 30 Oct 2018 10:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <1540870764-17849-1-git-send-email-bruce.ashfield@windriver.com>
	<CAJ86T=VNvLG06TaqUFpjJ6gqrY=H=eGrW5=FH+QxoCt5hbP0Pw@mail.gmail.com>
	<8b1fa587-7104-b842-72a5-7a175e9f137f@windriver.com>
In-Reply-To: <8b1fa587-7104-b842-72a5-7a175e9f137f@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 30 Oct 2018 10:31:16 -0700
Message-ID: <CAJ86T=Wwwzjyp5bY1bsjHVD0dgoLCPJgFdTo_M1z0iWywEnkPw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2][master-next] kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
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
X-List-Received-Date: Tue, 30 Oct 2018 17:31:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 30, 2018 at 10:17 AM Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
>
> On 10/30/18 1:02 PM, Andre McCurdy wrote:
> > On Mon, Oct 29, 2018 at 8:39 PM Bruce Ashfield
> > <bruce.ashfield@windriver.com> wrote:
> >>
> >> As was warned by commit 312ee68752fa [kconfig: announce removal of
> >> oldnoconfig if used], oldnoconfig has been removed from the 4.20 kernel.
> >>
> >> So we switch our default mode to olddefconfig.
> >>
> >> commit fb16d8912 [kconfig: replace 'oldnoconfig' with 'olddefconfig',
> >> and keep the old name as an alias] introduced olddefconfig in the 3.10
> >> kernel, we shuffle oldnoconfig to the fallback target.
> >>
> >> The fallback mode allows kernels between 3.10 and the currently listed
> >> oldest kernel of 3.2 to continue to configure.
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> ---
> >>
> >> v2: Tweaked to add a fallback mode as suggested by Andre McCurdy
> >>
> >> Not for the release, just wanted to get this in the queue for
> >> when master reopens so we'll be ready for 4.20+ kernel versions
> >>
> >> Bruce
> >>
> >>
> >>   meta/classes/kernel.bbclass | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >> index e04d2fe00434..8fe207165ae8 100644
> >> --- a/meta/classes/kernel.bbclass
> >> +++ b/meta/classes/kernel.bbclass
> >> @@ -492,7 +492,7 @@ sysroot_stage_all () {
> >>          :
> >>   }
> >>
> >> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
> >> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig || yes '' | oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" oldnoconfig"
> >
> > There's no "yes" needed with oldnoconfig. The new fallback should just
> > be the existing default command.
>
> *shrug*
>
> I'll leave this as is, since it works as tested. Feel free to
> send followups.

"make oldnoconfig" without the "yes" has been well tested for the past
few OE releases so it's just odd you decided to change it. Why did
you?

> >>   python check_oldest_kernel() {
> >>       oldest_kernel = d.getVar('OLDEST_KERNEL')
> >> --
> >> 2.5.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


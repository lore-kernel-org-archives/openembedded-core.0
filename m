Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Ss0m3-0005Lv-PX
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 02:08:51 +0200
Received: by yhjj56 with SMTP id j56so3219751yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 16:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=R8lwuaBRCaBfjPA+D56nWZnHtcBAjVcTk3DjCU2OljY=;
	b=r5DfgGXigknTafQQOpetKyJhJ8Ymbmoi2bcG9Ah4H/0RDGoDz0kEdAxHc2/2/wCzuC
	t9g0SOg343r39FBefmR1gBwz7x4kPQi56X6sYDvp18+Rf6jUVv1f7oBrd6F0cTLPHlfB
	Up1OjclQngGzClXUzFwzkuiSPHOLx8gE7j16P/o2S7cVJ43l5MS74NfUJil2hae9nkjJ
	/CBMvGz6q2mTfHMbvg1SYnkrvDhi10w8/yAvoHsR63R20LaVIkP1k19obayq6RRORNBh
	HkREVIBrjd/VGc0TMXam4EoKFD0B81qkBp9cRkproSHgTy65aDW67nAjwL1+BX5ob0aI
	5rDQ==
MIME-Version: 1.0
Received: by 10.50.203.41 with SMTP id kn9mr2968155igc.72.1342742248631; Thu,
	19 Jul 2012 16:57:28 -0700 (PDT)
Received: by 10.231.239.131 with HTTP; Thu, 19 Jul 2012 16:57:28 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207191738300.22542@oneiric>
References: <alpine.DEB.2.02.1207191738300.22542@oneiric>
Date: Thu, 19 Jul 2012 19:57:28 -0400
Message-ID: <CADkTA4MBfe8uW4k8t-975hixqPCT5Q-_t4wXYh0vKvk7B8W_QA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: what are the major phases of do_patch() for the kernel?
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
X-List-Received-Date: Fri, 20 Jul 2012 00:08:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 19, 2012 at 5:50 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   short version: what happens during each major processing step of the
> do_patch function for the kernel?
>
>   longer version: i'm stepping through what happens when i do a
> "bitbake linux-yocto", and documenting what happens at each step --
> currently looking at do_patch().
>
>   after having run the previous validate_branches target, what i
> appear to have is the source directory containing the kernel source
> with the (for me) standard/arm-versatile-926ejs branch checked out,
> and no top-level "meta" directory.  so far, so good.
>
>   now, i'm building core-image-minimal for qemuarm, so i'm being as
> unexciting and non-exotic as possible -- not selecting any special
> parameters or corner cases or anything.
>
>   so as i peruse do_patch() in kernel-yocto.bbclass, i'm following
> along to functions like createme and updateme and patchme, and with
> createme, further into decheckpoint and check_defconfig and ... you
> get the idea.  and i'm kind of getting lost in the weeds of details.
>
>   given that i'm building an absolutely stock target with a supported
> machine, all i really need for the moment is a very high-level
> explanation of what each of those main routines does.
>
>   so if my initial understanding is correct (that before i start
> do_patch), i have the stock yocto kernel checked out to the
> appropriate machine branch and nothing else), what does each
> subsequent step accomplish?
>
>   don't need horrific detail, just one line or less as to what's
> accomplished by each step like:
>
>   * createme
>     * decheckpoint
>     * checkdefconfig
>     * check_branch
>     * metaize
>   * updateme

Most of this is already covered in the kernel architecture manual that you
can find on the yocto pages .. I'd suggest starting there.

This is all significantly more detail than anyone needs, and we've moved
these docs from being the first thing that people see ..

Cheers,

Bruce

>
> ... etc, etc.  and at the end of the patch step, i know that i'll have
> that untracked top-level "meta" directory, still not sure what will
> have been done with it yet.  i guess that's for the next step, which
> appears to be "kernel_configme".  but one thing at a time.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



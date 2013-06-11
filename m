Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 900AE6A5B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 02:48:54 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id y6so5489708lbh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 19:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WPyabpl1IbmsHzFdyT1KMezXL2SmcphLTlMqTA5h6vs=;
	b=mZwqeMlS78n+u6+KJFSEh3gg9LcQ13h4gFEW0r8aBw6/FLuwRfjAIXEaS0nIJgmcYZ
	Yjprk2DPWvSLa6BtTag4JBY4QklGBluqQg1qWxJqWYmtovS+rbPND7a76fxwQfwTVWsm
	l8rX6dbjVUDrRlDn7C3hr02tlEMF6GSCHMOhtm5xdCJaa/67vgH0a6+RstEs3zMeuJ5B
	n9bFTIU1TrDxd90vM73nH/OT3Tl7pf1pjSAvjAgUEC5bQfg50fLQACNMHVrSmraejy6s
	kUGJnW/e6e2Y8BduoADl5UZnpvJ7nVB4mLHwNvbA8ff1cbdn4X/FWVZi8Zb5APJvuHCr
	qPEQ==
X-Received: by 10.152.7.39 with SMTP id g7mr6209978laa.72.1370918934779; Mon,
	10 Jun 2013 19:48:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.4.66 with HTTP; Mon, 10 Jun 2013 19:48:34 -0700 (PDT)
In-Reply-To: <CDA933DF-D293-44E1-958E-55F51953C35F@gmail.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
	<1103bc7c76faba1db73f4c4f4b8439aa03258c3d.1370906102.git.chris_larson@mentor.com>
	<CDA933DF-D293-44E1-958E-55F51953C35F@gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Mon, 10 Jun 2013 19:48:34 -0700
Message-ID: <CABcZANnnrLYgE1Bh-1Q6Mu2SdtYNLtKtKopm_sY-x9090rKfsw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/4] packagegroup-core-tools-profile: don't exclude mips
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
X-List-Received-Date: Tue, 11 Jun 2013 02:48:55 -0000
Content-Type: multipart/alternative; boundary=001a11c285141f9c2b04ded7f0a4

--001a11c285141f9c2b04ded7f0a4
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 10, 2013 at 7:27 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Jun 10, 2013, at 4:15 PM, Christopher Larson <kergoth@gmail.com> wrote:
>
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Now that liburcu supports mips, this packagegroup can pull in lttng
> recipes
> > (lttng-ust, lttng-tools, lttng-modules, babeltrace) on that architecture
> as it
> > does for the others.
>
> it still does not work on mips64 though. but thats another patch probably.


Good point, indeed.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c285141f9c2b04ded7f0a4
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Mon, Jun 10, 2013 at 7:27 PM, Khem Raj <span dir="ltr">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="im">On Jun 10, 2013, at 4:15 PM, Christopher Larson &lt;<a href="mailto:kergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<br>


<br>
&gt; From: Christopher Larson &lt;<a href="mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; Now that liburcu supports mips, this packagegroup can pull in lttng recipes<br>
&gt; (lttng-ust, lttng-tools, lttng-modules, babeltrace) on that architecture as it<br>
&gt; does for the others.<br>
<br>
</div>it still does not work on mips64 though. but thats another patch probably.</blockquote></div><br>Good point, indeed.<br>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>

Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a11c285141f9c2b04ded7f0a4--

Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 670D460290
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jul 2016 23:31:25 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id u25so7845148qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jul 2016 16:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=fKIgFMvwYzSCbHkFE27EM9Vq6sofWJRJu+0+os9Av/k=;
	b=YOPQbhNE3S+GTo/jDLjNqVmuzBTIE47cQvHUbSQwZnNhYM44PT7ctmooDPNjBAYdpP
	fcEAo0g6AkE2Q9ny0uZ0pAlovlWMvQhuCC/RwFgCql+9EJF6Pp5TsLU/nMTpnQUjP3GA
	qq6Th8wcVw0qlDQkUrppbDiVGddcB0zfwW86YY4T46rRoHhmOKskqgWaAaIihRsz6oJ1
	ZmDY/DdQZFgLykEmR5JhxWg4KMhFj50pMt+MJHgqjpBBsdctP7YPXc00hLy9qiMIm5Rg
	Zedq8jJvbSjHF9Shu1gdMm/JOOj+N17/Lw6xspLX65B7pfx/jj1OYCaTaHfPuwqrut+r
	ekVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=fKIgFMvwYzSCbHkFE27EM9Vq6sofWJRJu+0+os9Av/k=;
	b=hYOUYMv7q6CDplwfVGmufoVl31iJ3uqE5b0DM2BkpoeD8iZPb8My4eZSChnUytHaCu
	TEztFEEzCBMTbCJs5HkTtGqn0vJFX2DIK/I3qTXBrZNgHpM6ywSuD4JrfZscwZ6i1HrF
	wDf7u8eXzWwVNdrtiHmsfbfs8t0RCwJlZqzLlX1g2GifWvo+HzCwQwX4nyCdjkkTFiz9
	x+KhB5gTqVx7JrLgQ1rgwnJ60o0FhwugWBAOXr51Iljz+zxItLLCRL5MxVNrAv906xtN
	5p+POt7WJyFwDDKwkV5j/vF/BTY1Hdw15Qdz+p/bMdttyxZdxhWolhDmdRi+0lL9oXFx
	dBcA==
X-Gm-Message-State: AEkoouu2ljfaY8heVGD/g85Sb8KzKD3yn0+Uo9Sb8uXlRFZ8za3vl3be1YX9c6bKI5rMwmksKyfwMoftm2BxKg==
MIME-Version: 1.0
X-Received: by 10.200.38.107 with SMTP id v40mr25272726qtv.76.1469403086119;
	Sun, 24 Jul 2016 16:31:26 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Sun, 24 Jul 2016 16:31:25 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Sun, 24 Jul 2016 16:31:25 -0700 (PDT)
In-Reply-To: <1789904.LeABdRZOVU@peggleto-mobl.ger.corp.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
	<CAJTo0LZZD0poopBgYb9BbeJ_UUaJc5KZxTXSV5jndnLJC8EiCQ@mail.gmail.com>
	<1493839.LtSXxTmLfS@peggleto-mobl.ger.corp.intel.com>
	<1789904.LeABdRZOVU@peggleto-mobl.ger.corp.intel.com>
Date: Sun, 24 Jul 2016 16:31:25 -0700
Message-ID: <CAMKF1srZ-awc8w5_BKeQ524VfR0vfof+=1rQiik8hLRmks6c_Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Extensible SDK improvements
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
X-List-Received-Date: Sun, 24 Jul 2016 23:31:27 -0000
Content-Type: multipart/alternative; boundary=001a1140300cfae88005386a10ea

--001a1140300cfae88005386a10ea
Content-Type: text/plain; charset=UTF-8

On Jul 24, 2016 2:43 PM, "Paul Eggleton" <paul.eggleton@linux.intel.com>
wrote:
>
> On Sat, 23 Jul 2016 13:11:39 Paul Eggleton wrote:
> > On Fri, 22 Jul 2016 23:31:38 Burton, Ross wrote:
> > > On 22 July 2016 at 13:38, Paul Eggleton <paul.eggleton@linux.intel.com
>
> > >
> > > wrote:
> > > > Some fixes and enhancements centered around how the toolchain is
> > > > incorporated in the eSDK, as well as a couple of tweaks for
buildhistory
> > > > that I found we needed during development.
> > >
> > > This is happening in mut, could your branch be responsible:
> > >
> > > http://errors.yoctoproject.org/Errors/Details/73022/
> > >
> > > Ross (who will look further when its not 23:30 on Friday!)
> >
> > Hmm, it will be, but I can't tell immediately from the error message
what
> > could be wrong...
>
> Just noticed something that looks odd - why do all these paths have a
literal
> TOPDIR at the start? Is that normal?

Its normal. Used To hide the person paths.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1140300cfae88005386a10ea
Content-Type: text/html; charset=UTF-8

<p dir="ltr"></p>
<p dir="ltr">On Jul 24, 2016 2:43 PM, &quot;Paul Eggleton&quot; &lt;<a href="mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, 23 Jul 2016 13:11:39 Paul Eggleton wrote:<br>
&gt; &gt; On Fri, 22 Jul 2016 23:31:38 Burton, Ross wrote:<br>
&gt; &gt; &gt; On 22 July 2016 at 13:38, Paul Eggleton &lt;<a href="mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; Some fixes and enhancements centered around how the toolchain is<br>
&gt; &gt; &gt; &gt; incorporated in the eSDK, as well as a couple of tweaks for buildhistory<br>
&gt; &gt; &gt; &gt; that I found we needed during development.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This is happening in mut, could your branch be responsible:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href="http://errors.yoctoproject.org/Errors/Details/73022/">http://errors.yoctoproject.org/Errors/Details/73022/</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Ross (who will look further when its not 23:30 on Friday!)<br>
&gt; &gt;<br>
&gt; &gt; Hmm, it will be, but I can&#39;t tell immediately from the error message what<br>
&gt; &gt; could be wrong...<br>
&gt;<br>
&gt; Just noticed something that looks odd - why do all these paths have a literal<br>
&gt; TOPDIR at the start? Is that normal?</p>
<p dir="ltr">Its normal. Used To hide the person paths.<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Paul<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; Paul Eggleton<br>
&gt; Intel Open Source Technology Centre<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br></p>

--001a1140300cfae88005386a10ea--

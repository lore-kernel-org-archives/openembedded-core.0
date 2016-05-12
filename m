Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 309A6601D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 23:30:18 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id s184so10182303vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 16:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=39i5yqMRGMxG3maiIQTMoXLDkNCBqUHgUgT53WgP+CQ=;
	b=dHzDImYxoYDAzmJtcOeYUUXyGtw6zu4e9xQLih4jJ882d2V+T6dpQhL/GqMxyAde0z
	Qq6DX+1x4NI2U9GJM4uHacE9d40sjIFUp9lvEd1xfbUCa2PjPqNLUQ96xTlevNnxM1k8
	KNXJdOWDZUnmkYdWH0pt2uo47AeqFNPsk96N3BgZOFGLo/0u7rdGKvr4Mzv0rk/IpR9d
	jPJ0NliVaDsSBlVOypvMshzA1xVxhQiOMCLk2tPdGe6XKNanfnhNe1CoX8qD36vS/By1
	W/ByaFjAnGSP6HEqNZp7UERW1kjNsfM1DCSTFDwAIyL7H8c530MZOppAt2A0AosLhmW/
	/vBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=39i5yqMRGMxG3maiIQTMoXLDkNCBqUHgUgT53WgP+CQ=;
	b=Q20z/3TfW1wFSBGSayHfZvWX2SeqZmF7lur+Oy2ax9CxWGKwML5Y+IpQ2DZ9/utEj1
	mvZ8RBKg5uBwjNg0DqFL62JrWfWAGN0gms66TQuz2euss1flab4qGtxfNilxwp1n+a62
	sN2SuIkNg2AVkct2OR0ZigLj8qwISVwy0EUqY5AZTveWOxSxynlMcqgRL95lzUAykrR1
	cNYtaHzg9IHoBXLQHNwCg0Rd2AUhe15+syn2STSWhsqoLJsGk6eaNffMG6a4uiqmVlbw
	yKS4e4QybBZfh8MzJ4qLeMTvuZJGPDtrVcZ2sIeA6tQHWAmpqhZHog10B/9FVXkMMg4i
	6mPA==
X-Gm-Message-State: AOPr4FXkWdHoUrrz9t2zBwj8+qIkab4mipWmKbLMY+PS5uAxE9C2CBUhA/fHXCqCsnyT3339zPjpwle/O0X7Iw==
MIME-Version: 1.0
X-Received: by 10.31.55.135 with SMTP id e129mr5899359vka.12.1463095819143;
	Thu, 12 May 2016 16:30:19 -0700 (PDT)
Received: by 10.103.50.75 with HTTP; Thu, 12 May 2016 16:30:18 -0700 (PDT)
Received: by 10.103.50.75 with HTTP; Thu, 12 May 2016 16:30:18 -0700 (PDT)
In-Reply-To: <1463066087.9746.15.camel@linuxfoundation.org>
References: <1463058769-8498-1-git-send-email-adrian.ratiu@ni.com>
	<CAMKF1sp-cXec1TAWfdVus_Hg46QxF5SMx+7yk5T-MhsUxsEz8Q@mail.gmail.com>
	<20160512174542.332fae80@adi-pc-linux.emea.corp.natinst.com>
	<1463066087.9746.15.camel@linuxfoundation.org>
Date: Thu, 12 May 2016 17:30:18 -0600
Message-ID: <CACS+7ZQ_2wUFZFYQv_dskVrrEEYF2TAKEjS0eRnLx7qYEd-nfw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.9: fix build with gcc 6
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
X-List-Received-Date: Thu, 12 May 2016 23:30:19 -0000
Content-Type: multipart/alternative; boundary=001a1144728e928e520532ad8a12

--001a1144728e928e520532ad8a12
Content-Type: text/plain; charset=UTF-8

On 12 May 2016 9:15 a.m., "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2016-05-12 at 17:45 +0300, Ioan-Adrian Ratiu wrote:
> > On Thu, 12 May 2016 07:38:00 -0700
> > Khem Raj <raj.khem@gmail.com> wrote:
> >
> > > On Thu, May 12, 2016 at 6:12 AM, Ioan-Adrian Ratiu <
> > > adrian.ratiu@ni.com> wrote:
> > > > Building gcc-cross 4.9.3 with gcc 6 fails with the following
> > > > error:
> > > >
> > > > error: 'const char* libc_name_p(const char*, unsigned int)'
> > > > redeclared inline with 'gnu_inline' attribute
> > > >
> > > > This is a backport of the upstream fix.
> > >
> > > I have seen couple of such patches being proposed. I was of the
> > > opinion to drop 4.9 from master however if we still want to
> > > refresh it the I would propose that we change the SRC_URI to point
> > > to
> > > latest on gcc-4_9-branch and remove any backports
> > > we have done since 4.9.3 release. It can also be merged into
> > > krogoth.
> > > Then we can latest decide if we want to keep 4.9 in
> > > 2.2 release or not. Would you be able to test such a patch
> >
> > Actually I'm all for dropping gcc 4 from master. It's about time IMO.
> >
> > I need this patch to fix the build in krogoth and was just waiting
> > for
> > feedback on master before I sent this patch there.
> >
> > I'll resend for krogoth directly then :)
>
> Since several people are hitting this and we have the patch, lets merge
> it, then drop 4.9 as a followup.
>

I also sent a patch for gcc 5.3. It has the same issue.

> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1144728e928e520532ad8a12
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On 12 May 2016 9:15 a.m., &quot;Richard Purdie&quot; &lt;<a href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 2016-05-12 at 17:45 +0300, Ioan-Adrian Ratiu wrote:<br>
&gt; &gt; On Thu, 12 May 2016 07:38:00 -0700<br>
&gt; &gt; Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; On Thu, May 12, 2016 at 6:12 AM, Ioan-Adrian Ratiu &lt;<br>
&gt; &gt; &gt; <a href="mailto:adrian.ratiu@ni.com">adrian.ratiu@ni.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; Building gcc-cross 4.9.3 with gcc 6 fails with the following<br>
&gt; &gt; &gt; &gt; error:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; error: &#39;const char* libc_name_p(const char*, unsigned int)&#39;<br>
&gt; &gt; &gt; &gt; redeclared inline with &#39;gnu_inline&#39; attribute<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This is a backport of the upstream fix.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have seen couple of such patches being proposed. I was of the<br>
&gt; &gt; &gt; opinion to drop 4.9 from master however if we still want to<br>
&gt; &gt; &gt; refresh it the I would propose that we change the SRC_URI to point<br>
&gt; &gt; &gt; to<br>
&gt; &gt; &gt; latest on gcc-4_9-branch and remove any backports<br>
&gt; &gt; &gt; we have done since 4.9.3 release. It can also be merged into<br>
&gt; &gt; &gt; krogoth.<br>
&gt; &gt; &gt; Then we can latest decide if we want to keep 4.9 in<br>
&gt; &gt; &gt; 2.2 release or not. Would you be able to test such a patch<br>
&gt; &gt;<br>
&gt; &gt; Actually I&#39;m all for dropping gcc 4 from master. It&#39;s about time IMO.<br>
&gt; &gt;<br>
&gt; &gt; I need this patch to fix the build in krogoth and was just waiting<br>
&gt; &gt; for<br>
&gt; &gt; feedback on master before I sent this patch there.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ll resend for krogoth directly then :)<br>
&gt;<br>
&gt; Since several people are hitting this and we have the patch, lets merge<br>
&gt; it, then drop 4.9 as a followup.<br>
&gt;</p>
<p dir="ltr">I also sent a patch for gcc 5.3. It has the same issue.<br></p>
<p dir="ltr">&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</p>

--001a1144728e928e520532ad8a12--

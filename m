Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5908C74955
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 02:01:54 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id u21-v6so28727746lfu.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 19:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qVi43ryLz13KsVzwURxXQT9pqVsY2jx8xk1Q+obVh/s=;
	b=d4Z+5j+33aPcwgf3ZFRVeP8kNOSSRcvGErEZm6YNMuw2Mz0mqxPbkwgqm+tKqUMnZX
	pdwOV6TcY3JJe6d9Sqt/bMpV69Xyb3+l9thNI8CCSOk/q5iAYxKeWihIfXVuFTjOR3ts
	+NhE7pvfbQicU498/MGqyFMX9tqWmDCsu50xzJ0feHw4XKpKqq/YbSRv2N0b3In9A1dV
	0VBQuibXDk79Te7Jc6QDGV0yk2huOcXuJD+BIUfaG5cSG+6/eG7YHgCMbvS8ykGAUrv+
	PCITD5C4ffN5rwaSwkuTCMbX7UzGPm73wd1dEHeEPuhpRdS8IOHlCsr/tH9ArlYJM88A
	6wTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qVi43ryLz13KsVzwURxXQT9pqVsY2jx8xk1Q+obVh/s=;
	b=bwc06pX76Ojg25WXPhGciMJXYJatYaBql43eRoc4DRFwHaNOgosmYiAn9SKdz7YezC
	cVJAacKYonO4PaFROCjjoUl5dytkIg9SGswqlMYufqyEYUnPwKDz8MMSCKzquMW196uQ
	JDeeuAg9qJIbDJTV0tEF3sz3HdzlBz4UjC/l1HJcaRpD3UOfOqmtoySgFa/rkftatlKq
	mybOjebgaq0a8EMREAeqNh1U0O9ZPl2ya5VXOTGqYL6kBcVXhXTCsmRjm7Iku92+VIRv
	gYZkFoO2uB5HO4Crvz6TZbucVlwJtsThBof1PKeBo6uVIVlAl0DMphyrUSGHRxaiknOl
	nalQ==
X-Gm-Message-State: ALQs6tARlJwFiqPeXkzXCLGSd3vsaU6Z1Uo4hs5JEL6jOR+FTAXT3byZ
	URYi0GLteGrpjqiFHXTIy8VIojcMZijq0xDQ6xZzbw==
X-Google-Smtp-Source: AB8JxZq9dvhXuQhae726mOjBgKfTlLWn7pzsYZL5QnYf9JQBnzH6YKtbiUR7c7u/f8EvrxRn7yZo6sNqZ5Dta7n7Vf0=
X-Received: by 2002:a2e:934f:: with SMTP id
	m15-v6mr3166143ljh.39.1525399315499; 
	Thu, 03 May 2018 19:01:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c9:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 19:01:54 -0700 (PDT)
In-Reply-To: <20170608004333.GH10782@bill-the-cat>
References: <CAJTo0LYUEgJgU03xxhi2ke3SspsEs0_JPcX4yiBaVbF6p-saUQ@mail.gmail.com>
	<1496838489-25242-1-git-send-email-ed.bartosh@linux.intel.com>
	<1496838748.6630.214.camel@linuxfoundation.org>
	<20170608004333.GH10782@bill-the-cat>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 3 May 2018 22:01:54 -0400
Message-ID: <CAHUNapQXxNY1473299BoPKPcKz8Uja9UXpdxnv1hXpYpkGBdJA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [poky] [PATCH v2] u-boot: enable dhcp for MPC8315 board
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
X-List-Received-Date: Fri, 04 May 2018 02:01:55 -0000
Content-Type: multipart/alternative; boundary="000000000000574ec5056b57b47d"

--000000000000574ec5056b57b47d
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 7, 2017 at 8:43 PM, Tom Rini <trini@konsulko.com> wrote:

> On Wed, Jun 07, 2017 at 01:32:28PM +0100, Richard Purdie wrote:
> > On Wed, 2017-06-07 at 15:28 +0300, Ed Bartosh wrote:
> > > Getting ip address from DHCP server is much more convenient
> > > than setting static ip. It allows to configure u-boot in
> > > more generic way and to avoid hardcoding static ip in
> > > u-boot configuration.
> > >
> > > Enabled dhcp client functionality for Yocto reference
> > > hardware MPC8315E-RDB.
>

Is this really something that should be part of the oe-core recipe? This
looks more like something one would find in a BSP layer.

--000000000000574ec5056b57b47d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jun 7, 2017 at 8:43 PM, Tom Rini <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, Jun 07, 20=
17 at 01:32:28PM +0100, Richard Purdie wrote:<br>
&gt; On Wed, 2017-06-07 at 15:28 +0300, Ed Bartosh wrote:<br>
&gt; &gt; Getting ip address from DHCP server is much more convenient<br>
&gt; &gt; than setting static ip. It allows to configure u-boot in<br>
&gt; &gt; more generic way and to avoid hardcoding static ip in<br>
&gt; &gt; u-boot configuration.<br>
&gt; &gt; <br>
&gt; &gt; Enabled dhcp client functionality for Yocto reference<br>
&gt; &gt; hardware MPC8315E-RDB.<br></span></blockquote><div><br></div><div=
>Is this really something that should be part of the oe-core recipe? This l=
ooks more like something one would find in a BSP layer. <br></div></div><br=
></div></div>

--000000000000574ec5056b57b47d--

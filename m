Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 29FAE71BAA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 11:02:58 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id s49so48225302qta.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qwDdBuPy1yoSoBgTG+sD0gcUReM2fQqH6P0SU8FycZ0=;
	b=XDvbl5pQfaRIrg1CJWo9thHTUXzPZB+yuzfP8iios+NzDLKunAMI/XVHpGq9mVfFGw
	JycUWbCsU4pgnX3VYf+w09/l1PRMbcjv7xWFH8ST14E4ielTsIDeiuhaNTdsGe0dgRw9
	0a+JiGeE14vtyqvwSB+z6MEpkoiCGcESY59kTlD2Ibz0wDEFESpK+QnRS9okytDmzPYE
	8RiDO4/9+QjvvQ5sUBFNM5wtDqEX7ZdlQ4B5i6GBdoaHtZOQKuPMRBPoS4BrcZafsTE1
	EcbBT+vb8BmIzTlnxsKcZ1bYhtHh5qEB3BqTHXMNaLYhNDi2ZyX1afcSmCp1gqowQ6PO
	X+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qwDdBuPy1yoSoBgTG+sD0gcUReM2fQqH6P0SU8FycZ0=;
	b=PXkpnI6+0bAlNn6rgzNFPcjjCn5eFfzWK7RtXvwBYqJv9szr88KKW9OAgTOdQXIgde
	9yIreH8+SPblm6fCVkj3AxHJBP/7JlLdnQWkQWo9BNurSwcuBvcu1cfqj4fDcV1Is6xM
	FJL1A4+pGTP8M5o4tUy5plKJgq6j97G9YHnYccZLSkqOzwa4qw+wguboEJeP32gqm5Ze
	gHBYt0AkZh9lqxx1f+i6bgvqzX/09GhK0GplvV7/9njgLAgWwtxwjV8jR8v9e6MKWZFL
	kd0EZDmaqQzLJTUXpzoY6L4Ec+T/ndFLk7LcDIQGgtM60PfYdRNmPNmZTwu713TD5CCc
	+1pg==
X-Gm-Message-State: ABUngvdFJ3Zuf1tiUNjdqmot7HGHdiAilpRe8CuZ6EwnxB+QfbIDLkxBdQ8v9FrxV46cQXXSQzsWU6Co9P1fx2il
X-Received: by 10.200.47.169 with SMTP id l38mr106552qta.78.1476961380074;
	Thu, 20 Oct 2016 04:03:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 20 Oct 2016 04:02:39 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610200514490.4275@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610191112240.15586@ca624034.mitel.com>
	<2130816.2i4mC23lpe@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191541370.14839@localhost.localdomain>
	<1542758.b0vWq7N0OP@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191733110.26015@localhost.localdomain>
	<1476915092.2166.105.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1610200514490.4275@ca624034.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Oct 2016 12:02:39 +0100
Message-ID: <CAJTo0Lb0tySg64CMSj8yQ2s9EK7Jyu9E29u6wJnnW=mnmVfZCA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: how can i ask to keep all the generated "nativesdk" rpms?
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
X-List-Received-Date: Thu, 20 Oct 2016 11:03:00 -0000
Content-Type: multipart/alternative; boundary=001a113795446826a0053f49decc

--001a113795446826a0053f49decc
Content-Type: text/plain; charset=UTF-8

On 20 October 2016 at 11:31, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

> should i have expected a nativesdk directory?
>

Not if you didn't build a SDK, no.

Ross

--001a113795446826a0053f49decc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 October 2016 at 11:31, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3yk" cla=
ss=3D"a3s aXjCH m157e1b98f03d0f76">should i have expected a nativesdk direc=
tory?<br></div></blockquote></div><br>Not if you didn&#39;t build a SDK, no=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a113795446826a0053f49decc--

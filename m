Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id A2532731DD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 09:36:48 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id y2so129646603oie.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Sep 2016 02:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lKeRptc25DuNClAZ48wG/tHDLmysVAsTliRV1fXvwLk=;
	b=RP0mkg4cszA2KTFNx9uZEilBp9vzlRr7VLsFprLla1ootJMo4r0kSZ+5hxlHX7LAW1
	TGQXWMe0d6tQmFdAEFPcMRfLHsUQI5IFWX/b6Ba7FjPs+8TBvXVenF3kwZIQPO72ARFn
	SJGNZK6NHG83RCQQgKVj6W0kYzQHJOcaL/iPtRntSWVfG4M8GJGt37nA6UWkm+1pBB0y
	KijsWEgsD+CiNj9VZfOZUo2KnZkwcx25RcZfd3RBLW+jMcsN6ec9giciM6CiQe+mb5xk
	gFCjHJ/aTlQFZah9gKqnJx2ln3QebP3ohEJSOwYJw+zQS/w1p7F4hkAGsRHCbf+0VFTV
	Oaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lKeRptc25DuNClAZ48wG/tHDLmysVAsTliRV1fXvwLk=;
	b=iLrvJrtv957QYqGKUJElQhEd/dNGuq5fMrYVDXSCNVf3mYfYXMudZ3YSep3OPJvK+B
	MbesgFDrhpypIMg808mYYIARD3acyQggzXfnQuKBm41mvuidwHXsPgEDye+vjfsLekHW
	LBS+i+/xYPRdcbzVrvVI8gC1rc3YSX7GLYvVeSWZVZd2gtsKdebD+4RIiLG79wWC3t/r
	bN/BAQJpg2kX3MihK3EGvtcP9Bw+lLsx3ZCk59e54Qx7qLkKnSjkEEyJxFqc7kYpATs5
	9qLTgBocAAp0zGbobQzzljbebtt+8TOo4JxeDW1zERrhJCcR8J7E54F2/qb4XyGDqhsn
	5sKg==
X-Gm-Message-State: AE9vXwPXzDnRKo6Nkt8uZeOMdQ1S9+7jOpgmZZ7KDgtpIrDNmtaYEa284EjRfMidizNAHnw8BYT9gyKPZaN1i9On
X-Received: by 10.202.180.2 with SMTP id d2mr4548499oif.98.1473413808793; Fri,
	09 Sep 2016 02:36:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 9 Sep 2016 02:36:28 -0700 (PDT)
In-Reply-To: <871t0tzads.fsf@ni.com>
References: <20160908095633.26651-1-adrian.ratiu@ni.com>
	<CAJTo0LaDjgTd20i-BQ5QQrWrKms3rfq-vNCiqVB7yz6f8VAmpg@mail.gmail.com>
	<878tv2znhb.fsf@ni.com>
	<CAJTo0LY_6wg10ft-RNRrYH7xa93=aWB9LuH=gxEpgf19vC446Q@mail.gmail.com>
	<871t0tzads.fsf@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Sep 2016 10:36:28 +0100
Message-ID: <CAJTo0LZtsxhz=5=XdBWDQVMZpXyXqi11h2OS5XY5HOrUXkMmnA@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: add libpcre to DEPENDS
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
X-List-Received-Date: Fri, 09 Sep 2016 09:36:48 -0000
Content-Type: multipart/alternative; boundary=001a113d3dd4ae75ee053c0fe2fe

--001a113d3dd4ae75ee053c0fe2fe
Content-Type: text/plain; charset=UTF-8

On 9 September 2016 at 10:32, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> I cleared the build directory and sstate cache, started with a clean
> rebuild and I can't reproduce the error anymore. gen-all-unicode is
> built as expected and at runtime it links with libpcre as expected
> and the build succeeds. This is really weird, I didn't touch these
> packages at all, they just sporadically failed out of the blue and now
> they work.
>

That's good, right? :)

If you ever manage to replicate, please save the build directory for
inspection.

Ross

--001a113d3dd4ae75ee053c0fe2fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 September 2016 at 10:32, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":46b" class=
=3D"a3s aXjCH m1570e4c0d1885abe">I cleared the build directory and sstate c=
ache, started with a clean<br>
rebuild and I can&#39;t reproduce the error anymore. gen-all-unicode is<br>
built as expected and at runtime it links with libpcre as expected<br>
and the build succeeds. This is really weird, I didn&#39;t touch these<br>
packages at all, they just sporadically failed out of the blue and now<br>
they work.<br></div></blockquote></div><div class=3D"gmail_extra"><br></div=
>That&#39;s good, right? :)</div><div class=3D"gmail_extra"><br>If you ever=
 manage to replicate, please save the build directory for inspection.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a113d3dd4ae75ee053c0fe2fe--

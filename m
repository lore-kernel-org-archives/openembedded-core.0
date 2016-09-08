Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0C4731D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 10:40:10 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id i184so248229924itf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 03:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x4TBkVcMM0Kz6PUqI2fOD+seM0/1Rxp/SzuRFCPiiu4=;
	b=QAaVvxBJwK40+E4ku1sNpPDtXJ5Nk6UVm6HsWbLkAuFP+GeXMtV5Qdi9ur4NoA/rtU
	2WNdy2JbYPNhVKnV8J8gW+ehkL4Ky9dNDIiU4O/hgVcMpICZV/SZFtIqDDT7I4Dm1Wqu
	5tinfPXj/M8jcHgakCUnm9DZw+YCLikcoJbE0UU3TGtt/45dLd0zwk8rZhoLAvspeHVu
	cf6WjvfUI4egKLB+GauRozJPg6xCtDufZ3OcLLnU7GGM/xW6rktEWr4I7w6Y3+vzIWMF
	ZJ1Z8wedMHTrG3mhwf6B3e736a9uJV789VKDFYqafM2lNbs+6GG3mjIuKBOtzUpeL+Yu
	G2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x4TBkVcMM0Kz6PUqI2fOD+seM0/1Rxp/SzuRFCPiiu4=;
	b=WqMF+7KmfQmz7rOJzY+eiWJQJ8gPixFbXqO4HKPhARCKQT6Uomei0o06LM3udtIP0Z
	ysGvnXBwYlgulZB8ENFwZ0cM+JmEyyNC8RuMJ2zRKoI5/6V+RTEjJHDVMV1ZH6WUCEYc
	J+oA16wtkG02TO424IIx1tZDdktlWOvSnc5NXKMeOeQLL6rXOCVCircJQ2Gg4OdDvmVP
	KB5Ck2SGmYiUX+3A7wR4S6kwy6lNOgHpw0PQiuYdPDLfNHZhmo6oXZm4fwXEjLoO3z0I
	xwtuWOZD/6pDO8fXo2hTp4egvcU5ufqslBkduD5ZpytZPMUf2FIqrL2IGWKfhcrZuJDW
	VuLg==
X-Gm-Message-State: AE9vXwPrerujrDa0EqFSZAZYLZpNtSmQFEd/mmNWgrzQkOMf1Mr3y+n7/QbbNg+wjFujUwEnL2jJCic7lTW7KkTg
X-Received: by 10.36.124.141 with SMTP id a135mr13418729itd.25.1473331211048; 
	Thu, 08 Sep 2016 03:40:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 8 Sep 2016 03:39:50 -0700 (PDT)
In-Reply-To: <878tv2znhb.fsf@ni.com>
References: <20160908095633.26651-1-adrian.ratiu@ni.com>
	<CAJTo0LaDjgTd20i-BQ5QQrWrKms3rfq-vNCiqVB7yz6f8VAmpg@mail.gmail.com>
	<878tv2znhb.fsf@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Sep 2016 11:39:50 +0100
Message-ID: <CAJTo0LY_6wg10ft-RNRrYH7xa93=aWB9LuH=gxEpgf19vC446Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 08 Sep 2016 10:40:11 -0000
Content-Type: multipart/alternative; boundary=001a114a967a78a647053bfca782

--001a114a967a78a647053bfca782
Content-Type: text/plain; charset=UTF-8

On 8 September 2016 at 11:37, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> No. It fails sporadically on the jenkins build machine when it's under
> load. Somehow adding the pcre dependency directly to pango fixes the
> build machine which is really weird. I can't replicate this on my dev
> machine.
>

Can you get access to the build directory when it fails?  It would be
interesting to see what ldd says the gen-all-unicode is linking to.

Ross

--001a114a967a78a647053bfca782
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 September 2016 at 11:37, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5vm" class=
=3D"a3s aXjCH m1570960f1101cbf2">No. It fails sporadically on the jenkins b=
uild machine when it&#39;s under<br>
load. Somehow adding the pcre dependency directly to pango fixes the<br>
build machine which is really weird. I can&#39;t replicate this on my dev<b=
r>
machine.</div></blockquote></div><br>Can you get access to the build direct=
ory when it fails?=C2=A0 It would be interesting to see what ldd says the g=
en-all-unicode is linking to.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a114a967a78a647053bfca782--

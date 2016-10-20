Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id D2249719E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 10:16:39 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id z190so84205186qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 03:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bbx0V/IZpcav2C8bPx4CMD6D6eOHHvanMLv4qOstFTo=;
	b=RzkQQgs6HQ7t05z/u7Zpd0Tl324fwk9iRtXJqs3dDm8l0GmQKnAc6RtUH9BdfKuUqS
	KPiDV27ucTofxBIrzrgpePhrPfkOUelsCxwHGql/oYxtus0/l8691mwB3/nj3azhziOz
	Z4OV9RQcpD/aegroLaWNXIjkWyS2nfSKeZVzCR2AIGHmge18alwf133TPkE2q5MrgkRQ
	GbzZ6tldOzJIk+dVGtJkY4YjrsRlkYdV030R0WRuBtw25cQyaCR/y7t+tLzczbMYLRCP
	B+Hr3Uoev8xy5hASBO0HFGaTtjnfz5Cu/PGspS4x832zj8bCl7y4x2jiPrCMpyQon2RJ
	D/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bbx0V/IZpcav2C8bPx4CMD6D6eOHHvanMLv4qOstFTo=;
	b=Hwd7DERjeyQPS7MnRmqz80d57+VXM3pYrHUqrwipC978J1ePhjrDqAcThnG4JsWJfq
	GXByjiQpVUroyPiINQ3xv57bXahLdIGm5oT2H7n3IU+nGPYYKnKmluqnJk6wc6ivrOTT
	dG09X+HXTvzoAKfzGcfL3vzFvCHgbuZzjQ6xaElzVQUgtJKAgwyyY5MZenNZbGFFQccc
	M/SYa/3lBzS+GBqsdixQrULLIjqh6u6U7xMurC/0EMwrZ/6UWy189FpqpEaNVdiNxz6m
	2b4HY50pyKVeUTo+PXxk8RRDn20cxdjejMiedLyLZlIbTnmhtG3+bKfzDcINEdnd1Qa1
	iodw==
X-Gm-Message-State: ABUngvcqukR/0Cr6W+MPFgLQ/wE0dXGDcaOfxdP3EzoUrNmGxVxjOVEZb1ixytGfv5JKb0Y5L0NXV+r3hzzHmfJh
X-Received: by 10.55.198.132 with SMTP id s4mr7862935qkl.221.1476958598493;
	Thu, 20 Oct 2016 03:16:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 20 Oct 2016 03:16:18 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610200542160.9999@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610200542160.9999@ca624034.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Oct 2016 11:16:18 +0100
Message-ID: <CAJTo0LYJ8TUX4vK_9dTVpoCvNKvjSAYSwYACgjLOkG0fxdAPZQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: any plans to upgrade to rpm-5.4.17?
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
X-List-Received-Date: Thu, 20 Oct 2016 10:16:40 -0000
Content-Type: multipart/alternative; boundary=001a11438fd09c7e85053f4938a3

--001a11438fd09c7e85053f4938a3
Content-Type: text/plain; charset=UTF-8

On 20 October 2016 at 10:46, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

> so is there an ETA for just moving to 5.4.17?
>

As the weekly schedule mails say we're currently hard frozen for the
Morty/2.2 release.  No doubt Mark is aware of the 5.4.17 release but
upgrading rpm5 is "not trivial" so don't expect it to land straight after
master opens again.

Ross

--001a11438fd09c7e85053f4938a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 October 2016 at 10:46, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5s7" cla=
ss=3D"a3s aXjCH m157e18f383a24d6e">so is there an ETA for just moving to 5.=
4.17?<br></div></blockquote></div><br>As the weekly schedule mails say we&#=
39;re currently hard frozen for the Morty/2.2 release.=C2=A0 No doubt Mark =
is aware of the 5.4.17 release but upgrading rpm5 is &quot;not trivial&quot=
; so don&#39;t expect it to land straight after master opens again.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a11438fd09c7e85053f4938a3--

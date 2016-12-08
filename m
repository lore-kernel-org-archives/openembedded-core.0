Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0841F60069
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 15:24:25 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id x190so452634775qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 07:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aGyuKSPEjyNtiwKK0nw770x9p+/iQD8mEz26AHj04K8=;
	b=WybQoeQlOkIIQphAa/5TrPEfhPa5A//MKJpowP5lg+3OedjPJfcfHomhqPnQtFeuDq
	ajkjw0xfBeh38xgnXWHV5mJ6N4WRz9RAbncy8dhobnnc/APLmyF9w+ik3kftk/LjLB13
	TDJg22eJcYkD2b+UimASOIRuUolAQHHTFkbybqIq5s+DaqAQ0b7BITaQSaaczBftqpwd
	3bsMHDPmcN11qupWAz6Eisba8W8ZqIJ8wWpNhkl33yTwdAwnEs7F9pnlGRvH0POr49vx
	I+Puyrvz8WxiXrYXLoI7DbX9VSbwZ0smVblqFPYuAz6cdw5RQAH/x+Cu8Z7iRleTbd8D
	VOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aGyuKSPEjyNtiwKK0nw770x9p+/iQD8mEz26AHj04K8=;
	b=UT0J+qoRDHzfvwpUXprEB2k44K5QpQjeViqzMS620vBgFIoWArGJKrII2ai4OfyG8N
	CpI1hVlzHexahr1DLhFUDR8pJfWR4KYWLIIU7MIb9z8UCtgPPsgWf5dMOjSf202rpXvq
	I0Sw62Rfv2ijcBb2AvFX4ChhH/gS/mOjjaS7cxyAbEift0oe2ivej+jWIgLBQmTQQYnK
	n5dzkhZ5WJZkbBvPn7qtGBhqaoyz0QH4RsyLqGWHO0NB7MKae+rBDZZf5GR2dNv7qJhH
	BtwNP0jC8uArhr0qLSQBrtMyM+UadP1BiEHNdY0hmfKoWqfOUOofg9vCSKXCTjIHOV0s
	tQ5Q==
X-Gm-Message-State: AKaTC01z3OSWPIbkO01BbuxCQyqua8nKHMS6NSYRSgw+tzdNXiQ7tYSmPOri1DmL/yVIC6fXR2Qxx41ykZziwaYz
X-Received: by 10.55.5.145 with SMTP id 139mr65057384qkf.77.1481210666410;
	Thu, 08 Dec 2016 07:24:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 8 Dec 2016 07:24:06 -0800 (PST)
In-Reply-To: <2760910.PlGPul2nZt@peggleto-mobl.ger.corp.intel.com>
References: <1477393415-13053-1-git-send-email-olani@axis.com>
	<3d0139cbc58340fea6f0ea733004c06a@XBOX01.axis.com>
	<2760910.PlGPul2nZt@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Dec 2016 15:24:06 +0000
Message-ID: <CAJTo0LaYJ0+AyUb+-h1Kf5vbXuro=pq-2gNKXiO7Ea4mO3hMkg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Load devtool and reciptool plugins in a well-defined manner
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
X-List-Received-Date: Thu, 08 Dec 2016 15:24:26 -0000
Content-Type: multipart/alternative; boundary=001a114c8f849bf8790543273b5d

--001a114c8f849bf8790543273b5d
Content-Type: text/plain; charset=UTF-8

Sorry, slipped down in my inbox.  Thanks for acking Paul, these are in
staging now.

Ross

On 7 December 2016 at 21:16, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> On Tue, 06 Dec 2016 07:37:16 Ola x Nilsson wrote:
> > Ping?
>
> I guess Ross / Richard were waiting for my ack - sorry about that.
>
> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>
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
>

--001a114c8f849bf8790543273b5d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, slipped down in my inbox.=C2=A0 Thanks for acking P=
aul, these are in staging now.<div><br></div><div>Ross</div></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On 7 December 2016 at 21:1=
6, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linu=
x.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Tue, 06 Dec 2016 07:37:16 Ola =
x Nilsson wrote:<br>
&gt; Ping?<br>
<br>
I guess Ross / Richard were waiting for my ack - sorry about that.<br>
<br>
Acked-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com=
">paul.eggleton@linux.intel.com</a><wbr>&gt;<br>
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114c8f849bf8790543273b5d--

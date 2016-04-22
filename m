Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 90E5A7318A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:08:38 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id g8so13880094igr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NLG1vcSfJBQgloafEHQyJReinC0GZ6iCK0w5IqNnqEA=;
	b=H307qFNpo+OjAl2A+gcw0Gh3ysrdS24PB4Dr6jtw9I2JDfdYum7+fo5QY9CcVCb4LH
	ieZDmcOo6CGqZzrvX7WT+sc1yp31Gft0mB1xP0ORR8xKv2L5whw+j0kt0I1zt4AmZHe7
	/MqG31F1DCg1d8P96dTQLOZgM+NaC2NOHWWPf9brBG5k6VKcfMQyUNbGo+WXuPsJJYRg
	aAqG2TWUuOAhI8295MuMPLby5O3VAIDSt1AQEMK/SCk0qoVXhAkvXWH55kkex7HlraRX
	U8QadODI38281tz3lOnZ4f82dPoBUPB2OSQ58kC5oBs1BhsDLlBRs5Bqg7SEthamO/sC
	4Cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NLG1vcSfJBQgloafEHQyJReinC0GZ6iCK0w5IqNnqEA=;
	b=hC7itxE00UyZ0FPOIWL3VsGGFWQvSm3UIG/jGgGSkWmKk2mhg6DQ5Ih64q8kaxtYTS
	tVzJ4EQfEL9boiqjKuXjc7vsBZZEjimHKuhFpCJzPLhaEd/ZXCoFHYFjRKcN2AAJRAk9
	JYuaCCKNcC5i/J/Wjqlw86qx9RSBXu5hnwmdcHhX3Nfqi2+TPa9ieFIRrcc5NlE5O5LX
	LBOuYvIbAIwL2v0+RM+ZAcY+BNaokY7VCEwBwLUz6MdLTK/eo02Yi3QuydI6LVCCEVZ5
	nKBPriYEiUeyAcknLzXcYM9suE+qfZxwL+G7Km3kmQTViUce+6+oOG7le63q34VQrlvk
	NwBw==
X-Gm-Message-State: AOPr4FV3UnbQU41CllQQe+pkOB4trNAe9HdLTS0BDA8MJWigIDZ2Nih8b2PMHc4swsAdxVyv+7foxQNZ4gyrnZ0S
X-Received: by 10.50.233.40 with SMTP id tt8mr4115370igc.78.1461326918960;
	Fri, 22 Apr 2016 05:08:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Fri, 22 Apr 2016 05:08:19 -0700 (PDT)
In-Reply-To: <1461320780-50763-1-git-send-email-noor_ahsan@mentor.com>
References: <1461320780-50763-1-git-send-email-noor_ahsan@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Apr 2016 13:08:19 +0100
Message-ID: <CAJTo0LbK8RCQTLsvqBH_2+YYbs4rdHHiX=T6zyeor=GgXfok0Q@mail.gmail.com>
To: "Noor, Ahsan" <noor_ahsan@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cups.inc: Fix ldflags warning.
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
X-List-Received-Date: Fri, 22 Apr 2016 12:08:38 -0000
Content-Type: multipart/alternative; boundary=f46d04287571e7e81b053111af6a

--f46d04287571e7e81b053111af6a
Content-Type: text/plain; charset=UTF-8

On 22 April 2016 at 11:26, Noor, Ahsan <noor_ahsan@mentor.com> wrote:

> QA Issue: No GNU_HASH in the elf binary: '...libcups.so.2' [ldflags]
>

Are there special options needed to make that happen? I can't replicate it.

Ross

--f46d04287571e7e81b053111af6a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 April 2016 at 11:26, Noor, Ahsan <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:noor_ahsan@mentor.com" target=3D"_blank">noor_ahsan@mentor.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":hx" class=3D"a3=
s aXjCH">QA Issue: No GNU_HASH in the elf binary: &#39;...libcups.so.2&#39;=
 [ldflags]<br></div></blockquote></div><br>Are there special options needed=
 to make that happen? I can&#39;t replicate it.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--f46d04287571e7e81b053111af6a--

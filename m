Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2A85E77CDA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 09:49:13 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id n21so133954465qta.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 02:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9gebUrOuhiiYFe4mJY/5pRP4hOKgcojr65j23iGQA7U=;
	b=OzrNbQ5QGY6NGX63vrYZH33zwcUpDeIIRw5BUKjtPRMFBZlM85mT8AP3SqsbHlMfW7
	zG0E+IZjZjwe+iyMX+95hzHZuE5LtkP3DdBW7XixAfaxDu2dfUhhfAKiurNgYL7F4nY+
	xp1+UzwJpE7b65F3ziOqzDMJMq5/TD2AfrKD4ZLJtIJz2Euez4v1+6xNRsXqhpqgj5/r
	DXrpnqmi34VeDjnRfa8JDlYgMnV6rPRduZ5nHopCcFfAGlr/VrZx0Q1ZjQYl9wPBA7Cf
	DhZAfDyEf8N26Ro2EU9iJ5O+gLX0tQfJK7o3sBfjGSEfNXfwvwLvA8IEIcBEABMS7I3d
	kngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9gebUrOuhiiYFe4mJY/5pRP4hOKgcojr65j23iGQA7U=;
	b=UCvCo7Gvo7FzUIMMpm8bYedbLu0Tj41V2roXl3YMY52rW9BbrobX7ByTg25rc+xwdS
	85SUPJvyrJzxJOhXkS2sJ6xf1peaLORLbiR4XwB857Mbfsk3iP7Fg4+RyeWl68uv22GB
	qS12CcwwN37Z36wrKHRQOqVg7qVzV/Q00a1woDzQ3ephFhMXhtJB+2Z7hPgNUdV7muIL
	EAOZY9rDVgaFOpuCw5jaQFXOWNivjBWaOuhTcywW4E07KOrVLlFY4hLkdKy0V/5OUx+p
	hsRVwkK1FM51Ga9Lkm3VZioi0fNUiGgSnyzvuRjNv+zo33YoAOy9RRzCf003UDlaHdRy
	F1Rw==
X-Gm-Message-State: AFeK/H3wLn8Ti2r9yMMATecA4b5SR/43OYHCCemCcf+pA/SQQ+aKsQ54uCEA/qDgNTB32dy97RxmB69v8hYhqfig
X-Received: by 10.237.53.9 with SMTP id a9mr21528856qte.188.1491299355026;
	Tue, 04 Apr 2017 02:49:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 4 Apr 2017 02:48:54 -0700 (PDT)
In-Reply-To: <20170404080203.6985-1-Martin.Jansa@gmail.com>
References: <1d818d62-704e-61f4-1f0c-a3980a09b502@windriver.com>
	<20170404080203.6985-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Apr 2017 10:48:54 +0100
Message-ID: <CAJTo0LbUrTDOrXU4VzPe=+iiZtFyasL7LhNtpb4YiX6eLTkTWQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x86-base.inc, qemuarm.conf: prefer 4.10 version of linux-yocto
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
X-List-Received-Date: Tue, 04 Apr 2017 09:49:14 -0000
Content-Type: multipart/alternative; boundary=001a11c0285e4f8b9c054c543092

--001a11c0285e4f8b9c054c543092
Content-Type: text/plain; charset=UTF-8

On 4 April 2017 at 09:02, Martin Jansa <martin.jansa@gmail.com> wrote:

> -PREFERRED_VERSION_linux-yocto ??= "4.8%"
> +PREFERRED_VERSION_linux-yocto ??= "4.10%"
>

The qemuppc and qemumips machines don't have a preferred version, so should
we be setting it in all the machine configurations, or can we remove it
from these recipes?

Ross

--001a11c0285e4f8b9c054c543092
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 April 2017 at 09:02, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":30f" class=3D=
"a3s aXjCH m15b382759fb1831a">-PREFERRED_VERSION_linux-yocto ??=3D &quot;4.=
8%&quot;<br>
+PREFERRED_VERSION_linux-yocto ??=3D &quot;4.10%&quot;<br></div></blockquot=
e></div><div class=3D"gmail_extra"><br></div>The qemuppc and qemumips machi=
nes don&#39;t have a preferred version, so should we be setting it in all t=
he machine configurations, or can we remove it from these recipes?<br></div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a11c0285e4f8b9c054c543092--

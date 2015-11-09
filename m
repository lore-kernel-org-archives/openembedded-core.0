Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id AC1C674197
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:34:05 +0000 (UTC)
Received: by qkao63 with SMTP id o63so29419952qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 06:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vW+cilvSEBEP5GBqcgApprYtNIsBfwrrHYJ0WW8chS0=;
	b=seZqZxZJ4PVJ/nWzLAmWvFKKSgQ4B42sawhvnNYeG4AAmB8GelnU0KG6KA3zwwNiJt
	4k0IErUxp8BtjpT3WVxnaMuHsTw6zDgepb9CF36lqIkoWbpvHsyVNfAigigUVSL75cwG
	bMC4moWVSGjd4p/9WNHnWShPm73dlhmqc6rJ6cHSZT7y8YWhcWI/+8OOJA2zOnxwnRDM
	cnVAXRlv/D0doQ4tTQ3z8/XCvQQPZa5gmzHwmh46O6jJZD+UxN2DDDwyM7tFOS+KwbJX
	mLCmW0JwZkS2L63Paag31SJnJJmcDek8I92I5y2ic0PlsQnkm6KDFBvWryEZ6TY3zApW
	gWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vW+cilvSEBEP5GBqcgApprYtNIsBfwrrHYJ0WW8chS0=;
	b=dUeHDV1x6mOp+5Li7ZUrC02PWqMn18Nu5l9G2c4OA++a45LzOuHsgz/00JbHGueOF0
	GIEcGgjYHcSJgpiju/qxezY0sdk1qps0QB4vZV3bQ6BXlRpzLMbXRZ7NlTUmWpoBjdau
	cc0TJskQBbeHMLiLvW4YDvwkHZEJumRj//cBKf10HMENiW5an2QD1mfEW9XdkzBNtMNF
	f7DpUf285hzY491/ojVdOBF1rTpEvdUFXmXO7QxS1pN9lNwa8RAo/gvSDqJi4eb9DIq/
	DWXgGnPiQBZ5w9e1uj6y5z5QaVt9wRsjyg6RqnJbsE2icD5/BBSWh/AR28D2lii6T7FJ
	SruQ==
X-Gm-Message-State: ALoCoQm1OLpkRTUYOwGoB7WiM5u+Lg97maejIoSTrquGWTBqP5/8ThrkGHNx+aJl+f8JpEsCK9sQ
X-Received: by 10.55.212.89 with SMTP id l86mr30056825qki.64.1447079645409;
	Mon, 09 Nov 2015 06:34:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Mon, 9 Nov 2015 06:33:45 -0800 (PST)
In-Reply-To: <564094ED.4050402@windriver.com>
References: <cover.1445333081.git.liezhi.yang@windriver.com>
	<b6a5e9973afe805490f6aee8967026bc47f2692b.1445333081.git.liezhi.yang@windriver.com>
	<CAJTo0LaOD2_=aDwHi9fjGzWZ2+hcMtUnjHMFsSOTABWiozuSTQ@mail.gmail.com>
	<564094ED.4050402@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Nov 2015 14:33:45 +0000
Message-ID: <CAJTo0LaU=2GbBh7F6d+yGz+nUFZKd9x3cvSi4mU_=7xG2QY_Dg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] bitbake-prserv-tool: check file name
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
X-List-Received-Date: Mon, 09 Nov 2015 14:34:06 -0000
Content-Type: multipart/alternative; boundary=001a114998f43a0e2905241c7c52

--001a114998f43a0e2905241c7c52
Content-Type: text/plain; charset=UTF-8

On 9 November 2015 at 12:43, Robert Yang <liezhi.yang@windriver.com> wrote:

> Maybe selftest should use export.conf rather than export.inc ?
>

It's a configuration file that is typically included, so I'd say .inc is
perfectly reasonable.  Better error reporting in the Python would be useful
so it doesn't just throw an exception.

Ross

--001a114998f43a0e2905241c7c52
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 November 2015 at 12:43, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3el" =
class=3D"a3s" style=3D"overflow:hidden">Maybe selftest should use export.co=
nf rather than export.inc ?<br></div></blockquote></div><br>It&#39;s a conf=
iguration file that is typically included, so I&#39;d say .inc is perfectly=
 reasonable.=C2=A0 Better error reporting in the Python would be useful so =
it doesn&#39;t just throw an exception.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a114998f43a0e2905241c7c52--

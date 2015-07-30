Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id BD86C7632C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:17:56 +0000 (UTC)
Received: by qkdg63 with SMTP id g63so17708365qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 06:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v5V7elBFQA7bVr5M6tKcr/8jgO2EkA5UV+ra+4Y/r6g=;
	b=X0qlFrfxHnWpvjvwmHY/FvA5Yoc3cbj3ItpHYt1bpSNj0NKAtTeFt2fJ2SNbsSknkV
	YWYT2IgnyD5ttyGXRoxIlt3MKeCoFNuq5EiVtuT1eZGkDX6ajmTafWTKHKPtWT+GyS0A
	iq54Po1HomDgqburLnbyth53OTlpKE98aSpkt7+UXQUiK9m6IEjiwsPObu3WcaUzeU9H
	xG0o6kbsxv2oV6JTLbayGTUyyGgRt8HGyHlvv+B94XByf5vXF4y9OM3UT1q74eZE3AX+
	rzgzgCuuKIpnGjWqfe/8YRptBYsYmFCmMVGmSrzf9fN3CDkrMx4jfubQAqt6TJ4r8rzQ
	tYAg==
X-Gm-Message-State: ALoCoQmud1pLLEF39SYR6PxFgO0egTqca153s1yqUrBJMtwoI7aLFe5z3SrK4TjnlMMngcK3ZTwj
X-Received: by 10.55.22.169 with SMTP id 41mr71168144qkw.13.1438262276650;
	Thu, 30 Jul 2015 06:17:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Thu, 30 Jul 2015 06:17:37 -0700 (PDT)
In-Reply-To: <55B9866A.8080300@windriver.com>
References: <1438134558-7785-1-git-send-email-li.zhou@windriver.com>
	<CAJTo0LYkVtGiWfH-yf0T7PWREdk=ZyoMU3LyV1OEQpqWCiy2pg@mail.gmail.com>
	<55B9866A.8080300@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 14:17:37 +0100
Message-ID: <CAJTo0LaFJfp9mJy+N5sD84OCRhA0rDo-Peee26eY7QM40fRizw@mail.gmail.com>
To: "Zhou, Li" <li.zhou@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: Add marking for config files in recipe
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
X-List-Received-Date: Thu, 30 Jul 2015 13:18:00 -0000
Content-Type: multipart/alternative; boundary=001a11496e90180f30051c178860

--001a11496e90180f30051c178860
Content-Type: text/plain; charset=UTF-8

On 30 July 2015 at 03:05, Zhou, Li <li.zhou@windriver.com> wrote:

> Do you mean that I should use branch master instead of fido? Has fido been
> abandoned?
> Thanks.
>

For patch submissions you generally submit to master and then request a
backport to the stable branches.

Ross

--001a11496e90180f30051c178860
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 July 2015 at 03:05, Zhou, Li <span dir=3D"ltr">&lt;<a href=3D"mailto:=
li.zhou@windriver.com" target=3D"_blank">li.zhou@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=
=3D"#000000">Do you mean that I should use branch master instead of fido? H=
as
    fido been abandoned?<br>
    Thanks.</div></blockquote><div><br></div><div>For patch submissions you=
 generally submit to master and then request a backport to the stable branc=
hes.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11496e90180f30051c178860--

Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1239A77002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 09:29:40 +0000 (UTC)
Received: by qgt47 with SMTP id 47so64637080qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 02:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hMbyMgKwcfrDL/7iZcIJ2BRrCaD6VTPMkpCUONCFPko=;
	b=L6NEu6czyklvW3r0wPfw2FX2pMacX3YjU1aJN/agivYummvKHEw5Hu1ybtJTwqleRP
	LKoqOhibG9ZXyLJRSC8otkdWeDPHOibhYpjiHFwNyW+xqo6M/UaeQCnROvX7d7lJ2l+C
	c4xkyy+UG+Igv4uTwhco3hQiyFJi3Ynunn1xZ9+WhnK5ghj+Gla8GeElKwfH5kVhwFhk
	6Zp7T8ZFhTwl5UIzQvvrKg65GoF6NAun3hWBz7K3LrYEqqEHr3pMJP4CKW7txBFdI4xI
	FoeeuFZ7JdyvsSv8lvh8eDNQ9MIhLapzi8G3VpzA0LhP7Qge5VM+skMlgybqW6sJiHG3
	DvfA==
X-Gm-Message-State: ALoCoQm6vqIGZjQNamEWwg2YJijcABjP8piEF4mLEohSCZlnuUC5I3iKgNw1jpx1JyHuCdXABBKe
X-Received: by 10.140.235.147 with SMTP id g141mr4797105qhc.22.1443173380449; 
	Fri, 25 Sep 2015 02:29:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 25 Sep 2015 02:29:20 -0700 (PDT)
In-Reply-To: <1443157157-33969-5-git-send-email-raj.khem@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
	<1443157157-33969-5-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Sep 2015 10:29:20 +0100
Message-ID: <CAJTo0LbLhcaPRHhf4Jop8uZjHB5CyNOnVXH-T4UVKMMCG1nrYA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] blktrace: Include <sys/types.h for dev_t
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
X-List-Received-Date: Fri, 25 Sep 2015 09:29:41 -0000
Content-Type: multipart/alternative; boundary=001a11376e6eb1129e05208efc78

--001a11376e6eb1129e05208efc78
Content-Type: text/plain; charset=UTF-8

On 25 September 2015 at 05:59, Khem Raj <raj.khem@gmail.com> wrote:

> +Status: Submitted
>

We have tooling around this field, so please use Upstream-Status.

Ross

--001a11376e6eb1129e05208efc78
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 September 2015 at 05:59, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":671" class=3D"a3s" s=
tyle=3D"overflow:hidden">+Status: Submitted<br></div></blockquote></div><br=
>We have tooling around this field, so please use Upstream-Status.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a11376e6eb1129e05208efc78--

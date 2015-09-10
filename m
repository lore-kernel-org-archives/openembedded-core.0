Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8182D73243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:12:50 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so17056689qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 05:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=A0DxxX3NkW9BHQj3y+kw+nLEmyiUz1JRQ+Y6XPk7i7Y=;
	b=BS3fzxNzhr97oUoTfKXfupuAZ73MUZ41LwarBuvZemNDMGVrCZuy0YkD+AB8dG80DZ
	x/NF8h0e2dafVCgnG2iyDRnf+/UQfpx9nn15233AzUgcupyt63XzZoROyviI0oyhWHG3
	A47UcHKtlDSlh8rtZ4FMxlUkd4Q3E7KsdD/Kfj0kx8X/q4Swv9O7jc9tohvLlgYYH6ol
	Pynk6ysixs75qRmHbj+v1VDrQrMOZddle48AkQZrc2M9jcyrOFxYHyoqgNyya6EEwFlw
	yzrndr8KcrZTGvp9Zqp0yuVGqm5dgk4zouviydRGqBMzhH42r1K1lUnZHt4NjVGjPSHw
	dXwQ==
X-Gm-Message-State: ALoCoQmhQaF0ZzvTcM/0qbSvbCEUTI7yEzXKUABP5NOeufQ90tgPe5dpXqAQ63NdzK8NzvdheReW
X-Received: by 10.55.197.213 with SMTP id k82mr52426214qkl.49.1441887170435;
	Thu, 10 Sep 2015 05:12:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 10 Sep 2015 05:12:30 -0700 (PDT)
In-Reply-To: <55F173AC.7010808@mlbassoc.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
	<32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>
	<55F1679C.5090508@linux.intel.com>
	<55F16E82.1070708@gmail.com> <55F172C9.3030601@linux.intel.com>
	<55F173AC.7010808@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Sep 2015 13:12:30 +0100
Message-ID: <CAJTo0LYWxFtoYNseSup-zXAvJMigP_y1c4wdSrFXwk6SP_C-=A@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Policy for 'Pending' patches (was Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close)
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
X-List-Received-Date: Thu, 10 Sep 2015 12:12:52 -0000
Content-Type: multipart/alternative; boundary=001a1149a4829a16ae051f638409

--001a1149a4829a16ae051f638409
Content-Type: text/plain; charset=UTF-8

On 10 September 2015 at 13:12, Gary Thomas <gary@mlbassoc.com> wrote:

> What would you do to the poor sod that sends a patch upstream
> (i.e. Pending) that is not being moved on by the upstream holders?
> Punish him by making his patch (and potentially all others he
> has created) invalid?  Seems a bit harsh...
>

Send upstream is Upstream-Status: Submitted.

Pending means "I wrote a patch but cannot be bothered to send it upstream".

Ross

--001a1149a4829a16ae051f638409
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 September 2015 at 13:12, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D=
"mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":ub" class=3D"a3s" s=
tyle=3D"overflow:hidden">What would you do to the poor sod that sends a pat=
ch upstream<br>
(i.e. Pending) that is not being moved on by the upstream holders?<br>
Punish him by making his patch (and potentially all others he<br>
has created) invalid?=C2=A0 Seems a bit harsh...</div></blockquote><div><br=
></div><div>Send upstream is Upstream-Status: Submitted.</div><div><br></di=
v><div>Pending means &quot;I wrote a patch but cannot be bothered to send i=
t upstream&quot;.</div><div><br></div><div>Ross=C2=A0</div></div></div></di=
v>

--001a1149a4829a16ae051f638409--

Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id BF9B771A35
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 09:55:06 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id n21so58319207qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 01:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DLNwTckhJTRdFQDlaK+fEUkMA5wsh6wYEbLtTxQPgxw=;
	b=IMmaWQrOvV47oBmXdWnZs/WAz/tf6rSmGX/mngatyi3bRbz0UvyukzCcgTK4BGcJvl
	ayOgq96lHqrmjNSfQUgsJKtcI5fOir6izCjH37Tq34Kd4CMjTNYpQssCWvsjbzc+uMQ6
	ooqQuq206v/6sEBo3pw0HcHPxUAJvsXpxNB7tVy/jyQjN+a0ocwCaTo/BlzIrOA5nC+p
	jWod5DIMAGXUk4ovtr+GQ10hXmaG1B8Cpa0bVA5yeDHHdhGGpwIlr9S4FRXtw37HBCtq
	1KiEhcfH0ZJTDtl9HL4+t00y51E5kOSSIUIMGjH2xj2PdFVVmcXOfEDsZ/psum0k8KWY
	PqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DLNwTckhJTRdFQDlaK+fEUkMA5wsh6wYEbLtTxQPgxw=;
	b=VMqZsDa/oSL6tBJEty4HhiStx22UVwmqfYaQAj8HPsxaw6I259RCiJQcD9ExtWsTGD
	XYqAPwqrNSAFEBR6xPho/cId38P4pFKev/0k4hgap9JzozpW4qVQp27Oh/lhZDefTLhT
	VwwmzcmLAehvcDzziw1XAz4E9s2Gk7F04oiUFuZE/ZCnqiPe5XqPULRe0nUnPdsSJJUf
	KFM+bXHFwq6nDWxjhGxYaZ3eKI0WhObPlKaDog+XZylvOqTCU+tChVTgrtpmgwJrnQQC
	uCWCkT5QCo/xEeMLh0AzmEzKsj74nR6QJITPtIib95yDyotKjsKYvzIk6ClFDSyyjTr7
	fa8Q==
X-Gm-Message-State: ABUngveK/IZtjrqMeViMr9UyYwpdZF2LMrRCnrJE3GoT2PRfPIO7Bis0ujbpg6qd2Lma8b2xROUYBrSxsflFZxZH
X-Received: by 10.55.75.17 with SMTP id y17mr5799024qka.26.1478512508350; Mon,
	07 Nov 2016 01:55:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 7 Nov 2016 01:54:48 -0800 (PST)
In-Reply-To: <CAP71WjyP-GE7evimye661zy-L4G7VdAwNX_8-6qOVSTj1y11eg@mail.gmail.com>
References: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
	<CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
	<CAP71Wjyy-qQH+nE34FTKUhqgRqGZocpfQ4CrkmTPh+OOMGK6jg@mail.gmail.com>
	<CAJTo0LZAGq8szm0vL0wyyR_rFVe1LBoMWYcoZh+VBMBcw5kW-Q@mail.gmail.com>
	<1478304597.3662.28.camel@pbcl.net>
	<CAJTo0LaKjNiFY3Z41Zk0Ln1fH_mLBF+hjKhr46+f3tewO5bTow@mail.gmail.com>
	<CAJTo0LbiSBPq3ZHKmmHYpoM+GZWcOgDNyJy3-Cd4XhRxF9Lt1w@mail.gmail.com>
	<CAP71WjyP-GE7evimye661zy-L4G7VdAwNX_8-6qOVSTj1y11eg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Nov 2016 09:54:48 +0000
Message-ID: <CAJTo0LYBQtYwq5LBQxE=1s4G1hfH+92m_P=pRPVzcwALeJR4dw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Mon, 07 Nov 2016 09:55:09 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8db696a0540b30453

--001a114a88c8db696a0540b30453
Content-Type: text/plain; charset=UTF-8

On 7 November 2016 at 09:42, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> great. Does that mean that this patch can be merged or do you have any
> other issue?
>

Yeah, it's queued in my staging branch now. Sorry for user error stalling
this.

Ross

--001a114a88c8db696a0540b30453
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2016 at 09:42, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@=
linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2jq" class=3D"a3s aXjCH m1583e2c401922127">great. Does that mean that =
this patch can be merged or do you have any<br>
other issue?<br></div></blockquote></div><br>Yeah, it&#39;s queued in my st=
aging branch now. Sorry for user error stalling this.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a88c8db696a0540b30453--

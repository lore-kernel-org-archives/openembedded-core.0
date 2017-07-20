Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 59EFD7835E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 20:25:26 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id v127so21679700itd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h9JRsn0n0x6U2xu0NpjI1rkwlFsINQFKF2IIYXYjnrU=;
	b=VClElDhLsy1Tp1NbYrLsnZuxsNJt2s3SkdDlhcA40mU64p3SFMk2F9sYbmJSleHt1U
	GBId6xjZ0JULjdTxe3AFh2kzMsh81djy01Za11DzpHRc8S9LkbUkrfhXuINW5jFbXNyW
	YxmKTw6SbW/aTz+MjJchTYOdyOMo5VkFu4m4GM7LJokap91poq5+skHCvx5l1bWlKEhl
	dNjAoCaalfnJtvOZm5+i+OHTHAfF8JS2drdGyJnbFIA96Om9tqGlvE0KuL9aW3hQonE2
	kQd9oB4cAZ6ghzimWnOH8YoFrt/v69UhQxq5yPfRK2gUSq+6r4cHP67wfOFG9OH/+DGI
	DI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h9JRsn0n0x6U2xu0NpjI1rkwlFsINQFKF2IIYXYjnrU=;
	b=k4v4tXJeHh+k8inttOx7jUVMIPqLQ53s/CiMN1wKMS6E1JmDEnyahYslG3VBmJVG9m
	lbk2oSg+hPOFmxH3QWy4WxgiM3KAumQ6zAtYoLOADBJgchVYvuqaC2ynR3U3pj9JmFCB
	qRhoMd8ChD5ba2MQJwc5/qvzv8nfVAF6JhhelA0C+Ha1/A3LQGjs+n08TVB7CVlE6w3v
	eFpNhRcqKLgkmrHSqYfwTQ3Gqfu3MVeQKjaSPPelpuWQFeyMZwfp9Zmv/VB86Hp0HrzZ
	VrsVMatoG4suUgH6pHmRvAmjyiJEXFrRjwvuYWOsn7m+y8ElFmajNf8DtIpUdwdUsrH4
	S20w==
X-Gm-Message-State: AIVw110yQ5tApt+clod4BI6YinUfAz+o2dHG53WpE3SH+nZ+KOnDPE6W
	9jdcF0Bl97O86Gk2aTxAJQxKH4nPoPzm
X-Received: by 10.36.26.13 with SMTP id 13mr4384108iti.87.1500582327706; Thu,
	20 Jul 2017 13:25:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 20 Jul 2017 13:25:07 -0700 (PDT)
In-Reply-To: <CAP71WjyVmM=a3rpoGm+CoyERx2=q60sHhT-TanoXHxEef_o6PQ@mail.gmail.com>
References: <20170717184050.5474-1-otavio@ossystems.com.br>
	<CAJTo0La-FM3ThuMWJPB4riFf1QLeq0Vd=cRJ_DBjrCCbOCV4Vw@mail.gmail.com>
	<CAJTo0LapT9NrznbPkFYoVmLcQwVMArSjGT0vFjJ0Z-7x-TvWBw@mail.gmail.com>
	<CAMKF1spheC7ODGgJ3FeBUiUfDDLH=K1SFJ1=Vr8odT55Q4WTuQ@mail.gmail.com>
	<CAP9ODKo3H0WUp1T3jQK6qANHMhHLgX5T7cR9HLmmXPJnwpj7FQ@mail.gmail.com>
	<CAP71WjyVmM=a3rpoGm+CoyERx2=q60sHhT-TanoXHxEef_o6PQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jul 2017 21:25:07 +0100
Message-ID: <CAJTo0Lb8YFtgzfX5m+0mBo52Opc7ayzThQFuxcHDqbVKV1qmCA@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 17.1.5 release
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
X-List-Received-Date: Thu, 20 Jul 2017 20:25:26 -0000
Content-Type: multipart/alternative; boundary="001a11441b5c9983810554c58ce5"

--001a11441b5c9983810554c58ce5
Content-Type: text/plain; charset="UTF-8"

On 20 July 2017 at 21:14, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> It built fine for me (OE-core/nodistro + meta-qcom) with and without
> pkg-config installed on the host.
>

Yeah it's not that, mesa builds fine for intel-corei7 on my machine, but
fails with qemuppc.

libdrm isn't generating a libdrm_intel if I build for qemuppc.  Maybe it's
looking for kernel bits that are disabled in our latest kernels?

Ross

--001a11441b5c9983810554c58ce5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2017 at 21:14, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=3D=
"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@lin=
aro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:47i" class=3D"a3s aXjCH m15d61a3e75e9f2e4">It built fine for me (OE-core/n=
odistro + meta-qcom) with and without<br>
pkg-config installed on the host.<br></div></blockquote><div><br></div><div=
>Yeah it&#39;s not that, mesa builds fine for intel-corei7 on my machine, b=
ut fails with qemuppc.</div><div><br></div><div>libdrm isn&#39;t generating=
 a libdrm_intel if I build for qemuppc.=C2=A0 Maybe it&#39;s looking for ke=
rnel bits that are disabled in our latest kernels?</div><div><br></div><div=
>Ross=C2=A0</div></div><br></div></div>

--001a11441b5c9983810554c58ce5--

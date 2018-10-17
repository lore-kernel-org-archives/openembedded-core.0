Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id F293079B21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 19:01:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a8-v6so3284748wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 12:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CHmIWOvPGPtA6mza86zi61txBzYZN1wB56DJEUGrtII=;
	b=HOkI9Nkun3kxi71cw0KTwrlHQ3FeZqome1ha+XsnvOnnLEDrnNddUmiqK3/+d5m9ns
	0ufkmKdGZu03lj6oqRoKplNGgNitl30RNQqytq/EsP32TB9sC5b0N1GHHzSQMOHShIgu
	T156oGTDN/ffs/vOw+FgEBVWG1GY5FCcYSKWOC6UGzIP+lEf1920KiPOGodWh27ff47n
	pSpOQ1REzwfpS3akcc0dF9ysbQjM29xupC7wW046b5YKEGDLW5hz9QhIuuafiB4Z7h65
	hYqnibDlzOi21eLQLFEMzgqlebFdnTRsIvNeZYj9C1sDy9ec5o6IqeWAoGbOz1k4rqJA
	fY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CHmIWOvPGPtA6mza86zi61txBzYZN1wB56DJEUGrtII=;
	b=I3MH0xYDeDmcFjiwMVfRIYLTy29ixLsWBb46br0aZBJY1MiIdk51t4G98t6L36pOns
	XRLZSQ14Q+S1l4HKF3imjZYTcM6NkWWIAwxPOEyCmMt1cJ2wBKVSCDhVP7B3BGXnZpC0
	3DH3hDCCTQu/v/RVptJLTRPYF337DOL2Sm3+ucaVXbBV8joOGnPhezXxdK8k+lzz1+/l
	UQVsoUYCfhnebavyHcNnj7fKp1F2qmGpMezVfA87eV7pv4MvR4pqJt15h01AgCrAvFAT
	zS2/rYFm/1xvSpKguIwoVmt2yexcnVCzcrTNdKJYfkwo1he1RleGxChco9ghkIpB+PiK
	cRtg==
X-Gm-Message-State: ABuFfoj2IoWfpTKWJu+e2Zstwm1c/vh7ojV/HhQYVy/eHzpvllNEvJUF
	ZUJdmMlTMmeL+tmlseldaYmEDH0V9ckgkL/4lH8=
X-Google-Smtp-Source: ACcGV636r2NFBylGfToMnjv2PfzSowBWepVbYxi0BkWlMDcgbIVkOe6p4+Blxw6EDJEb06yvoaZXO145mniAJTo8YaY=
X-Received: by 2002:a7b:c259:: with SMTP id
	b25-v6mr4002553wmj.138.1539802899442; 
	Wed, 17 Oct 2018 12:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20181015182128.13115-1-kamensky@cisco.com>
	<CAJTo0LYWG7O+VryaFi9r4kc5JagPtuynWHi9gV6nV+cLPUw+SQ@mail.gmail.com>
	<9f182627633f75c8383901510cc11e4b87349084.camel@linuxfoundation.org>
	<alpine.LRH.2.00.1810162250430.53155@sjc-ads-6991.cisco.com>
	<118f12f46497b3b4fda287b64c5e432afde9b6d9.camel@linuxfoundation.org>
	<CA+chaQcjv6-2v8oC25=7fapKKg5XapC21+6K1oN28Kk9MJF2zw@mail.gmail.com>
	<40a5b6dd1386ea77070814f7ef7ad340cc2e9e62.camel@linuxfoundation.org>
In-Reply-To: <40a5b6dd1386ea77070814f7ef7ad340cc2e9e62.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Oct 2018 21:01:28 +0200
Message-ID: <CA+chaQekaVbr5MMkW7TFWXeFq5Ye-Cyfn5WBn-0ZiM=QVTW-GA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap: 3.3 -> 4.0
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
X-List-Received-Date: Wed, 17 Oct 2018 19:01:39 -0000
Content-Type: multipart/alternative; boundary="000000000000d86f1c0578714c7d"

--000000000000d86f1c0578714c7d
Content-Type: text/plain; charset="UTF-8"

systemd.bbclass won't include that .service file in FILES_<pkg> without
setting SYSTEMD_SERVICE_<pkg>.

I'll send fix for that in few minutes.

On Wed, Oct 17, 2018 at 5:07 PM <richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2018-10-17 at 16:50 +0200, Martin Jansa wrote:
> > There seems to be one more issue in current master (for which I
> > haven't seen a fix in master-next or ML):
> >
> > ERROR: systemtap-4.0-r0 do_package: QA Issue: systemtap:
> > Files/directories were installed but not shipped in any package:
> >   /lib
> >   /lib/systemd
> >   /lib/systemd/system
> >   /lib/systemd/system/stap-exporter.service
> > Please set FILES such that these items are packaged. Alternatively if
> > they are unneeded, avoid installing them or delete them within
> > do_install.
> > systemtap: 4 installed and not shipped files. [installed-vs-shipped]
>
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3b77e7b7852549dcfbc426d4ce258e6e857c0acd
> was supposed to fix that :(
>
> Cheers,
>
> Richard
>
>

--000000000000d86f1c0578714c7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">systemd.bbclass won&#39;t include that .service file in FI=
LES_&lt;pkg&gt; without setting SYSTEMD_SERVICE_&lt;pkg&gt;.<div><br></div>=
<div>I&#39;ll send fix for that in few minutes.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 17, 2018 at 5:07 PM &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfounda=
tion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 201=
8-10-17 at 16:50 +0200, Martin Jansa wrote:<br>
&gt; There seems to be one more issue in current master (for which I<br>
&gt; haven&#39;t seen a fix in master-next or ML):<br>
&gt; <br>
&gt; ERROR: systemtap-4.0-r0 do_package: QA Issue: systemtap:<br>
&gt; Files/directories were installed but not shipped in any package:<br>
&gt;=C2=A0 =C2=A0/lib<br>
&gt;=C2=A0 =C2=A0/lib/systemd<br>
&gt;=C2=A0 =C2=A0/lib/systemd/system<br>
&gt;=C2=A0 =C2=A0/lib/systemd/system/stap-exporter.service<br>
&gt; Please set FILES such that these items are packaged. Alternatively if<=
br>
&gt; they are unneeded, avoid installing them or delete them within<br>
&gt; do_install.<br>
&gt; systemtap: 4 installed and not shipped files. [installed-vs-shipped]<b=
r>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D3b77e7b78=
52549dcfbc426d4ce258e6e857c0acd" rel=3D"noreferrer" target=3D"_blank">http:=
//git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D3b77e7b7852549dcfbc426d4c=
e258e6e857c0acd</a> <br>
was supposed to fix that :(<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000d86f1c0578714c7d--

Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail.openembedded.org (Postfix) with ESMTP id 038C1789FF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 13:29:28 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id i12-v6so19648973otl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tDU8T6cBprmn+GjV7wyE0XM562jXD15aMp9OwdUoDzA=;
	b=soc+BQpnqJx6oXTrH6xwMcgiz3/nvhvtwYoe0DXnptsrAQ8Iyo7+HV+s5aptI0/Zhb
	DL72NicxnPoo++Q99vCBY13EoS89sb4IJok2khJE6jvRiz9nxfcC3wmcyHze65yOY3Oz
	1o35IUqx9LYFxCObfSAMMZB5MY6kKS3S2oSxhDzheyBERA/dFEsW+e8LXpDziiBVGLAy
	vf1luCyfKAv95ExiIaXdOQaI5KxarOPJm1bGYhx5Hoq35SeCd0CL8G0tYEYVL02DISpv
	xPfq0xWtkDWHV/Wler/l6XlEl28PwgvwI/g8vwyKQO/l6K4nNjtgDcat9MyLM8n1SXKf
	0N5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tDU8T6cBprmn+GjV7wyE0XM562jXD15aMp9OwdUoDzA=;
	b=ZvWQZ6Dg3CmHAB6PlplDXlV05tqb1eZPMppyXFRC40hDUbNfEywYkGDbXYYg4agvpR
	1bAKw11u3fPAXTsPhqoc1TA8SYj/tkpWRb2dC4ym2p0qBEP75jh9AU7+Y2iIO9EhOnSQ
	/ApVl8S0tqJXDpF45hMt+9arIfPGQ8I57HQ2jbJrfKFm7lW+4TRvIp1Sk54xYlxhRuS0
	AhdkeyJWZxZJXvJERSXjtREdtGLHZbuY+8li654CpzcwdnAOMZbjZH4RIiK2e4oj1Ptk
	XcVUea9yui4K2q3sUx/UNnF64BJY5SzkPGRFmSPUzjPzC5a5pGVGJn4YGkBwIhnkWj2Z
	qkXg==
X-Gm-Message-State: ABuFfoiISreiHo68PJqJVWxb8+vpnOO0dWcr/3y/tgVvFDKH8sIlGzYi
	oA74Vanvjyqmw5tOTWes/KCJ0j7VKYsv0+ZXAahCrIps
X-Google-Smtp-Source: ACcGV63qbL4oaTKlwTlPHLCIccYM4VoNLnwKchThsYsBYFarrpULAemalkTbYNXV71HjTj0HBOrBie1CbhDaEafuXsQ=
X-Received: by 2002:a9d:3ee4:: with SMTP id b91mr1255953otc.330.1539005370033; 
	Mon, 08 Oct 2018 06:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRMzCDLn8_0sh+PqoC=FnpspLm4o3gx=UULsRZiExOL7_YhMQ@mail.gmail.com>
	<CAJTo0LaopKzbbnUDR5fixoiE4pt=9S8T-f3JMCa6NL9U1kf5uQ@mail.gmail.com>
	<CAMRMzCDi=7129TPUGmMtqgr9GdnANS7r4N2QDEc4Fz_iyRCtCA@mail.gmail.com>
	<CAJTo0LZGfjV_-QiDNAZ6HAtfjZou8izu1Oc0+FVx4e4+b5TTug@mail.gmail.com>
In-Reply-To: <CAJTo0LZGfjV_-QiDNAZ6HAtfjZou8izu1Oc0+FVx4e4+b5TTug@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Oct 2018 14:29:18 +0100
Message-ID: <CAJTo0LbgsEunYXSfAa+yma=ZBWRSFFcEgMh9b_Yc=AEHY_QBaQ@mail.gmail.com>
To: Marc Ferland <ferlandm@amotus.ca>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Python3 and HTTPS issue
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
X-List-Received-Date: Mon, 08 Oct 2018 13:29:29 -0000
Content-Type: multipart/alternative; boundary="000000000000637f980577b79cca"

--000000000000637f980577b79cca
Content-Type: text/plain; charset="UTF-8"

Had a change of heart and just sent a patch to add ca-certificates to the
recommends for python3-crypt.

Ross

On Mon, 8 Oct 2018 at 12:52, Burton, Ross <ross.burton@intel.com> wrote:

> Python3 would be overkill, but the SSL libraries probably should yes.
>
> Ross
>
> On Sat, 6 Oct 2018 at 02:54, Marc Ferland <ferlandm@amotus.ca> wrote:
>
>> On Fri, Oct 5, 2018 at 5:22 PM Burton, Ross <ross.burton@intel.com>
>> wrote:
>> >
>> > Did you install ca-certificates?
>> >
>>
>> Looks like it did the trick, thanks.
>>
>> Just wondering: why isn't ca-certificates not RRECOMMENDed by openssl
>> or maybe python3?
>>
>> Marc
>>
>

--000000000000637f980577b79cca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Had a change of heart and just sent a patch to add ca-cert=
ificates to the recommends for python3-crypt.<div><br></div><div>Ross</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, 8 Oct 2018 at=
 12:52, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burt=
on@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr">Python3 would be overkill, but the SSL libraries probably should =
yes.<div><br></div><div>Ross</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr">On Sat, 6 Oct 2018 at 02:54, Marc Ferland &lt;<a href=3D"mailt=
o:ferlandm@amotus.ca" target=3D"_blank">ferlandm@amotus.ca</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Fri, Oct 5, 2018 at 5:22 PM Burto=
n, Ross &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross=
.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Did you install ca-certificates?<br>
&gt;<br>
<br>
Looks like it did the trick, thanks.<br>
<br>
Just wondering: why isn&#39;t ca-certificates not RRECOMMENDed by openssl<b=
r>
or maybe python3?<br>
<br>
Marc<br>
</blockquote></div>
</blockquote></div>

--000000000000637f980577b79cca--

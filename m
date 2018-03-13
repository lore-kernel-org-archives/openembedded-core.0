Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id ACF0F60234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 13:17:29 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id v6so52795iog.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hlNXO3UU4rWEtMmjMelCy6dosGoqh+mxTvVw48Rrf7w=;
	b=nMgzwO8ocuG1YHMRxoCSt884b4XXvDWPusOUZwRa7JGGpDs7OtOR3JBww1cld6mQ87
	vu3m+0SGx8oJByfxx9fw6axmevDWWLK3bKcpMQ8MLM0xcEjo4iBksoXFWwhGwkFJawpq
	IdB0N/c0AxGhcLkB1KD8mziYI+C3Cq0DkYnJgR0wFw2m/bNRCqDrr3Jkd0Ie9C7oRVdP
	NEuVEW0chH3DtIkxGhwtpuyPlWj1SjADjOV3KSm0/S9sKWsDCCzExAp/H2GiME10yPrP
	A8EGKAU5GsUfUxnFlvG+5tGwPWPZhniByOn7h+kWMnggT11rQwQzw0mTxu4vwz8TKvek
	o1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hlNXO3UU4rWEtMmjMelCy6dosGoqh+mxTvVw48Rrf7w=;
	b=QAszcmsL+nsFWkeJG9OHx20z5+isFzs5QZREK8lBG0B9TqvanG5HrKyukkl0+FpXGE
	Rq4IEI2ThnCpJqrU6LBIalLe1QuOK5EVdbM1UEJQxC+3EbwXMWimgHe55bWN0PcOiwRU
	NecQzHECowFV+EB/wbMWNChy5ip+v4fDnyWktf9LsxcStVfZPzN0xajGQaqosR/wOqzd
	bALyFtrochhMxDZO3c5+/Iip4k1qeEnbL5k/9LYjKskIQkfUqf4DK/5UNxY/slBM31nN
	vzQUpCbV/1kMgCip48DmY7xU3nBy6DqaWcA8+v60wuAuqTi1/yBwTFt6oqs3CbnR4Xhu
	pS/w==
X-Gm-Message-State: AElRT7FQgFB+BREoHbSQ4htFbhH3+RLsiyxzrXkjqtriU/cH09eCGTQ/
	IPJAPhxcu4oWfuHVsuKJ3lYNUa5SCHOdawx5fcpE/Q==
X-Google-Smtp-Source: AG47ELtULzzLuxDrAwY0VzXtYZFHg1NSMW/jx7Dh79nMcPBTu5JaeHPc/sRopncGXhMiOjmT7WbQYe1VnUT9zDe4h3o=
X-Received: by 10.107.37.212 with SMTP id l203mr665348iol.20.1520947050814;
	Tue, 13 Mar 2018 06:17:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Tue, 13 Mar 2018 06:17:10 -0700 (PDT)
In-Reply-To: <e95861b3-527a-7f70-b572-0b38ee7647b8@intel.com>
References: <20180310002346.6086-1-california.l.sullivan@intel.com>
	<CAJTo0Lbw3obJmC44nLGXxNGb1AuVFxGQzH69ckDZzM76qOkwLQ@mail.gmail.com>
	<e95861b3-527a-7f70-b572-0b38ee7647b8@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Mar 2018 13:17:10 +0000
Message-ID: <CAJTo0LZxLvHsbnYJAh1SrNNoBBsso+36vW_fBdRN1QMfN5TnXg@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x86-base.inc: use xf86-video-modesettings as default xserver
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
X-List-Received-Date: Tue, 13 Mar 2018 13:17:29 -0000
Content-Type: multipart/alternative; boundary="001a11405f16afbfdf05674b14c0"

--001a11405f16afbfdf05674b14c0
Content-Type: text/plain; charset="UTF-8"

On 13 March 2018 at 00:09, Cal Sullivan <california.l.sullivan@intel.com>
wrote:

> It looks like Fedora doesn't patch the -intel driver anymore, instead they
> patch xserver to fiddle with the defaults.
>
> https://src.fedoraproject.org/rpms/xorg-x11-server/c/
> ee515e44b07e37689abf48cf2fffb41578f3bc1d?branch=master
>
> Given the comment and commit description, I'm guessing that list is
> everything older than gen4 (haswell) not already defaulting to something
> else.
>
> I can't find any attempts to upstream the patch... Also, given the
> different formatting, what would be the proper way to bring this into OE?
> Rewrite the commit message, leave Author field intact and add a link?
>

Just copy/paste the patch, add a more verbose header and your S-o-b, with
an Upstream-Status of Pending.

Ross

--001a11405f16afbfdf05674b14c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 13 March 2018 at 00:09, Cal Sullivan <span dir=3D"ltr">=
&lt;<a href=3D"mailto:california.l.sullivan@intel.com" target=3D"_blank">ca=
lifornia.l.sullivan@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_=
extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <tt>It looks like Fedora doesn&#39;t patch the -intel driver anymore,
      instead they patch xserver to fiddle with the defaults.<br>
      <br>
<a class=3D"m_5625482448860695509moz-txt-link-freetext" href=3D"https://src=
.fedoraproject.org/rpms/xorg-x11-server/c/ee515e44b07e37689abf48cf2fffb4157=
8f3bc1d?branch=3Dmaster" target=3D"_blank">https://src.fedoraproject.org/<w=
br>rpms/xorg-x11-server/c/<wbr>ee515e44b07e37689abf48cf2fffb4<wbr>1578f3bc1=
d?branch=3Dmaster</a><br>
      <br>
      Given the comment and commit description, I&#39;m guessing that list
      is everything older than gen4 (haswell) not already defaulting to
      something else.<br>
      <br>
      I can&#39;t find any attempts to upstream the patch... Also, given th=
e
      different formatting, what would be the proper way to bring this
      into OE? Rewrite the commit message, leave Author field intact and
      add a link?<br></tt></div></blockquote><div><br></div><div>Just copy/=
paste the patch, add a more verbose header and your S-o-b, with an Upstream=
-Status of Pending.</div><div><br></div><div>Ross=C2=A0</div></div></div></=
div>

--001a11405f16afbfdf05674b14c0--

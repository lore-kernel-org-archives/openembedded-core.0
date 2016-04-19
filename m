Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9C81560107;
	Tue, 19 Apr 2016 00:49:35 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id f74so534797qge.2;
	Mon, 18 Apr 2016 17:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=0f5rostuAI/x96yA6I0BGUEnM/BIZh7RzPNmrxqjz20=;
	b=rZGv4+STRIRichnlEJ8ilS8PWhyRecvDxzsV7H7Ub4e40QCw+e5eaUWwALHg3hfdfw
	KMAYO9ciCOWkoGEfH7swIJczLQ6g7IXU7Jx7+lBw7SAJIJ7eBs9onjN87SAM8yR4qnwC
	ptZnJW1DTBd3BNY/E6To8eIx/PgOLmX7oBuyui/MMX5a/lzxst0Pz97S/2tEEutgG+nE
	IpADIkBcmS654HWckxu2EUM8ftSv98RcYOS5mxZZDrFW1vv5zjuRytWDtkHzdnEuaPH7
	G/kq2pK7Q1ho1A1+Boa72/NoYN5isOswyp5jr0XDDbKdcaO8jTTdrxZvTpXswqJGZi2T
	dTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=0f5rostuAI/x96yA6I0BGUEnM/BIZh7RzPNmrxqjz20=;
	b=lcwyv8daPZX8LyGaPlk0SOIIbB5okPGOPLhF16KVEaNB2ONAeItnPsPR/eRT5HYqhK
	qLo1ueiKqT1zhmmQY5jOEJES/YIn9Slir6n61mUsrG9qVtkpdSsvgKb3yTtbouIaMm8K
	9aI2IdYIBl1TMUdnR6N0XG2qHDbxbPZhPMmbE59FI56Yew3/2UUTxDNjlJCwOiit6FgF
	F7xqYLfB6FeeCjknUIrWfful75zgpgkP95Gn1jt+o9ipJv5Dm0DQUd+E64j2Tn71WyuR
	aGIP3i1XemsCxoEKbvbbVmx9dqMDTZzB7g4Jl8WEli1dReTby2/A4kYOlYv6fbiKbCXg
	S19A==
X-Gm-Message-State: AOPr4FVQ1pmR90ar6jjtu6mwfG9Hdzrlpys0tQJHGHqJ1t1t+KXYQe0qw34CC043a1agG1k260lflxgKO/Strg==
MIME-Version: 1.0
X-Received: by 10.140.254.213 with SMTP id z204mr111455qhc.5.1461026975835;
	Mon, 18 Apr 2016 17:49:35 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Mon, 18 Apr 2016 17:49:35 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Mon, 18 Apr 2016 17:49:35 -0700 (PDT)
In-Reply-To: <1461019868.9308.224.camel@linuxfoundation.org>
References: <CAJTo0LZtDL-hbxXmYWdgf7HTZtSA4D2FgRKtx1+n6Rqxq50n=g@mail.gmail.com>
	<CAMKF1spGMHQMVP_-mrHYmDnjM+DPk0mktK_e+9G1bekuP6PnUA@mail.gmail.com>
	<1461019868.9308.224.camel@linuxfoundation.org>
Date: Mon, 18 Apr 2016 17:49:35 -0700
Message-ID: <CAMKF1spKB=HXLipbo_qFBY6mo67LOWAB-uQxRA25ghZTwD=i5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: yocto@yoctoproject.org, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bugzilla.yoctoproject.org policy for bugs against multiple releases
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
X-List-Received-Date: Tue, 19 Apr 2016 00:49:36 -0000
Content-Type: multipart/alternative; boundary=001a113aa030e6f0d00530cbd9cc

--001a113aa030e6f0d00530cbd9cc
Content-Type: text/plain; charset=UTF-8

On Apr 18, 2016 3:51 PM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2016-04-18 at 10:35 -0700, Khem Raj wrote:
> > Can we have a possibility to select  field like "affected version"
> > and have it such that multiple versions can be specified
>
> That doesn't really allow us to mark version X as merged and version Y
> as pending review though and as I understand it, that is the real issue
> atm :/.

May be bugzilla can be programmed to have such triggers. Having separate
bug is not a good looking solution
>
> Cheers,
>
> Richard

--001a113aa030e6f0d00530cbd9cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Apr 18, 2016 3:51 PM, &quot;Richard Purdie&quot; &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br>
&gt;<br>
&gt; On Mon, 2016-04-18 at 10:35 -0700, Khem Raj wrote:<br>
&gt; &gt; Can we have a possibility to select=C2=A0 field like &quot;affect=
ed version&quot;<br>
&gt; &gt; and have it such that multiple versions can be specified<br>
&gt;<br>
&gt; That doesn&#39;t really allow us to mark version X as merged and versi=
on Y<br>
&gt; as pending review though and as I understand it, that is the real issu=
e<br>
&gt; atm :/.</p>
<p dir=3D"ltr">May be bugzilla can be programmed to have such triggers. Hav=
ing separate bug is not a good looking solution<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
</p>

--001a113aa030e6f0d00530cbd9cc--

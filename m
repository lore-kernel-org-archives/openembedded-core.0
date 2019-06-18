Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 800A17E90F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 11:21:07 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id l15so4252600otn.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 04:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lVYbRpo2uIJUPD4HnzwgiZi7+lHL8hQAONPMtsv2l9U=;
	b=ewy4wAL8JU6MrHXoinxd1ODPDyy/WUZ4d325s+bVKjX2CpP1shcmYMlhNQBHZSviiY
	7zXaPaHcoxAS2blW0Pg9/sXRqGJBfRd19xgxBr0CZq/h3WD7YMb7lHyV9AUhrr1UocUA
	JORLFj8u0S0hCczp2eYY9WI375W95It4FdL4nHVitm4ya+eMWtaVZfb/OEJtYCdMXqCf
	i7R6xDlv7d5gsJka2Dm9abBjsLPAWkRcO18wkd4vqa3fg1Ukn+a4IDadoZWBxq5M8U/q
	UUZKrcQ0AGiOOHHAcl5SKgIUJUYk0Cbisxy87Xqf6aRofkW9hJdZISJ0Ojs3EZ3y1P3N
	QwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lVYbRpo2uIJUPD4HnzwgiZi7+lHL8hQAONPMtsv2l9U=;
	b=Fn0QnElPD+MhbZQOWY69z8QjH9AhonUhsOcIUMpzOZN7DIUpLbRdXIW8pFrnyHmNrX
	7A60pzxynPxqdk32hVo8/VzYGZEGa6ZmH1lsQO5CBUKvFDV/onVQlcayQmKQW1qy3zYC
	InSNMEY8w2hGJ6gXE54xk6rtm/XpdF1bQI6ooRrrhlTPDfxbAfpser2etjfeJdhNAzPY
	Jdd2OG1hQFzjYqLu2XcfMf23N73bJ/7JvPZwI1ZjiNgjOk469xEKonyb+rBS3hyez6Q0
	J42hKfa30dJKoB8P1oxyBePR6WiA95X1eXRz/17meV9yNI/Am/51N7DCL4BsamYH8oz1
	K8ZA==
X-Gm-Message-State: APjAAAUDUpjBzqO3p4Q9NTh/Y0rgjE5KX3xUnXNC7nJgcnFq3EwbtVaR
	X5V/r6jDyteQiRO4kUNVemsKkkP63tYbJk1Qwl8=
X-Google-Smtp-Source: APXvYqzK2gi1TTMLSh6FSfv9noe3fEfoFnW/OLtFKwlt/rKuYBggPIVuvvuJRB2+5RdNSMfdZ7aU7dvNfzIFT0TKbEw=
X-Received: by 2002:a9d:7dd9:: with SMTP id k25mr55253704otn.350.1560856868410;
	Tue, 18 Jun 2019 04:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <1555166214-57646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C143F7@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF0FB0C1@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF1002A6@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF1026BA@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF123A0E@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF128DDD@G08CNEXMBPEKD01.g08.fujitsu.local>
	<cedd7e708edfab28ec9db8046476313ea44a6022.camel@linuxfoundation.org>
	<1B56A49860EB2D45ADE3731B15C959FD01BF129787@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF12F738@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD01BF12F738@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Jun 2019 13:20:57 +0200
Message-ID: <CANNYZj9GKLaORrq1zTSamWxDn0FPAPNFvzQD=onzA=JaYfXsew@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchain-scripts: make rpm work in toolchain
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
X-List-Received-Date: Tue, 18 Jun 2019 11:21:07 -0000
Content-Type: multipart/alternative; boundary="0000000000002fda8e058b974fca"

--0000000000002fda8e058b974fca
Content-Type: text/plain; charset="UTF-8"

RPM is taking these things from its config file, not from an environment
variable, so you must be doing some additional custom magic to configure
rpm from environment when SDK is already in use.

Instead, you probably need to write appropriate settings into the file when
the nativesdk-rpm package gets created (or when populate_sdk is executed).

Alex

On Tue, 18 Jun 2019 at 10:03, Lei, Maohui <leimaohui@cn.fujitsu.com> wrote:

> ping
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org [mailto:
> openembedded-
> > core-bounces@lists.openembedded.org] On Behalf Of Lei, Maohui
> > Sent: Thursday, June 06, 2019 10:39 AM
> > To: richard.purdie@linuxfoundation.org
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] toolchain-scripts: make rpm work in
> toolchain
> >
> > Hi, Richard
> >
> > > Whilst I can guess why, its not obvious at all the dnf needs
> > > MACHINE_ARCH. I'd probably be happier with a better variable name.
> > > Which code exactly is using it?
> >
> > Arch information is necessary for rpm. As what do for dnf-native in
> > _configure_rpm function, nativesdk-dnf has to do the same work.
> > But the environment for nativesdk doesn't supply arch information. I
> think
> > MACHINE_ARCH is suitable to supply arch information for nativesdk.
> > How about your Opinion?
> >
> > Best regards
> > Lei
> >
> >
> >
> > > -----Original Message-----
> > > From: richard.purdie@linuxfoundation.org
> > > [mailto:richard.purdie@linuxfoundation.org]
> > > Sent: Tuesday, June 04, 2019 6:26 PM
> > > To: Lei, Maohui
> > > Cc: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] [PATCH] toolchain-scripts: make rpm work in
> toolchain
> > >
> > > On Tue, 2019-06-04 at 08:29 +0000, Lei, Maohui wrote:
> > > > Hi Richard
> > > >
> > > > This patch is necessary for dnf-nativesdk which has been merged. But
> > > > this patch is still ignored.
> > > > Do you have any comment about this patch?
> > >
> > > Basically I really don't like exporting "random" variables in the SDK,
> > > particularly when the meaning/use of them isn't clear.
> > >
> > > Whilst I can guess why, its not obvious at all the dnf needs
> > > MACHINE_ARCH. I'd probably be happier with a better variable name.
> > > Which code exactly is using it?
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002fda8e058b974fca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>RPM is taking these things from its config file, not =
from an environment variable, so you must be doing some additional custom m=
agic to configure rpm from environment when SDK is already in use. <br></di=
v><div><br></div><div>Instead, you probably need to write appropriate setti=
ngs into the file when the nativesdk-rpm package gets created (or when popu=
late_sdk is executed).</div><div><br></div><div>Alex<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 18 Ju=
n 2019 at 10:03, Lei, Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com=
">leimaohui@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">ping<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a> =
[mailto:<a href=3D"mailto:openembedded-" target=3D"_blank">openembedded-</a=
><br>
&gt; <a href=3D"mailto:core-bounces@lists.openembedded.org" target=3D"_blan=
k">core-bounces@lists.openembedded.org</a>] On Behalf Of Lei, Maohui<br>
&gt; Sent: Thursday, June 06, 2019 10:39 AM<br>
&gt; To: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH] toolchain-scripts: make rpm work in too=
lchain<br>
&gt; <br>
&gt; Hi, Richard<br>
&gt; <br>
&gt; &gt; Whilst I can guess why, its not obvious at all the dnf needs<br>
&gt; &gt; MACHINE_ARCH. I&#39;d probably be happier with a better variable =
name.<br>
&gt; &gt; Which code exactly is using it?<br>
&gt; <br>
&gt; Arch information is necessary for rpm. As what do for dnf-native in<br=
>
&gt; _configure_rpm function, nativesdk-dnf has to do the same work.<br>
&gt; But the environment for nativesdk doesn&#39;t supply arch information.=
 I think<br>
&gt; MACHINE_ARCH is suitable to supply arch information for nativesdk.<br>
&gt; How about your Opinion?<br>
&gt; <br>
&gt; Best regards<br>
&gt; Lei<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:richard.purdie@linuxfoundation.org" targe=
t=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
&gt; &gt; [mailto:<a href=3D"mailto:richard.purdie@linuxfoundation.org" tar=
get=3D"_blank">richard.purdie@linuxfoundation.org</a>]<br>
&gt; &gt; Sent: Tuesday, June 04, 2019 6:26 PM<br>
&gt; &gt; To: Lei, Maohui<br>
&gt; &gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; Subject: Re: [OE-core] [PATCH] toolchain-scripts: make rpm work i=
n toolchain<br>
&gt; &gt;<br>
&gt; &gt; On Tue, 2019-06-04 at 08:29 +0000, Lei, Maohui wrote:<br>
&gt; &gt; &gt; Hi Richard<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This patch is necessary for dnf-nativesdk which has been mer=
ged. But<br>
&gt; &gt; &gt; this patch is still ignored.<br>
&gt; &gt; &gt; Do you have any comment about this patch?<br>
&gt; &gt;<br>
&gt; &gt; Basically I really don&#39;t like exporting &quot;random&quot; va=
riables in the SDK,<br>
&gt; &gt; particularly when the meaning/use of them isn&#39;t clear.<br>
&gt; &gt;<br>
&gt; &gt; Whilst I can guess why, its not obvious at all the dnf needs<br>
&gt; &gt; MACHINE_ARCH. I&#39;d probably be happier with a better variable =
name.<br>
&gt; &gt; Which code exactly is using it?<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000002fda8e058b974fca--

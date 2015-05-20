Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 85DCE601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 14:45:43 +0000 (UTC)
Received: by qget53 with SMTP id t53so24489844qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 07:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+5JoaiR7QEYc88Oz/ERwUz+PGpranrQ5k8pbS7+ZRSE=;
	b=S4fzlkVg5EqRBIVNJr9rLWE3RqAxAN1Zz0ndLIKG6dPLx5rewfPG+V3dTfdEvMziZ2
	6O99UqLUJ+WwQdC+frI1pasCPjVh9SQE4s1biwfPAecNgjnRw3KEJaChW6gOqeL6L1Se
	Fp1LbWFDYInrPPuSgEQJaw1A638akh/Rq2qIfjXKogiGPs2Ifx5Ev0Eh2xJh+v8vMbz/
	Vj8Abj9ut/PCUxRix9BSx+U81EYPBvxPStN5QKnszOiyWIkcmHBTvef03dYUjZbECN/E
	ik2t9S/VRR9iAasPCopD5jzA4m8qYFC6PcOrX73NnK42B/OXtsf3FktBMbez1tsuAIBA
	LHhg==
X-Gm-Message-State: ALoCoQkRv55a44seL3FuoW1nU8VvQarFIeKA+4OLw60GBw8CzYvdAJEkMtLNcHuMyJXmcEtOOhBd
X-Received: by 10.229.96.138 with SMTP id h10mr19557188qcn.5.1432133144497;
	Wed, 20 May 2015 07:45:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 07:45:24 -0700 (PDT)
In-Reply-To: <CAOMwXhNB-5w2ywAe6anARY0Kp+osPRmu6KnoiOpfTJ6G0WCCnQ@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
	<CAC1BbcTOPBRO_3GjhSQdzQ35Y=BGAh1ntYdqK2tk8E09Hvni7g@mail.gmail.com>
	<CAOMwXhNB-5w2ywAe6anARY0Kp+osPRmu6KnoiOpfTJ6G0WCCnQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 15:45:24 +0100
Message-ID: <CAJTo0La5BpGRQEnNb34ZtV5-Po2dELjcN2mcy_Dn_e-c7=SWXg@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: busybox: passwd: applet not found
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
X-List-Received-Date: Wed, 20 May 2015 14:45:43 -0000
Content-Type: multipart/alternative; boundary=001a1133dd74596e520516847b63

--001a1133dd74596e520516847b63
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 15:42, Laszlo Papp <lpapp@kde.org> wrote:

> Now that just breaks all the code that our software is using. Why did
> this binary incompatible change sneak in, and especially: why without
> any note in the migration guide? Furthermore, is there a way to
> reverse this? I really would like to avoid rewriting my code just
> because some other people think it is a cool change. Or is this change
> absolutely necessary?
>

The point was to not give "normal" applets such as cat suid rights.  Why
can't your scripts just call passwd directly instead of proxying through
busybox?

Ross

--001a1133dd74596e520516847b63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 May 2015 at 15:42, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div id=3D":6l" class=3D"a3s" style=3D"overfl=
ow:hidden">Now that just breaks all the code that our software is using. Wh=
y did<br>
this binary incompatible change sneak in, and especially: why without<br>
any note in the migration guide? Furthermore, is there a way to<br>
reverse this? I really would like to avoid rewriting my code just<br>
because some other people think it is a cool change. Or is this change<br>
absolutely necessary?</div></blockquote></div><br>The point was to not give=
 &quot;normal&quot; applets such as cat suid rights.=C2=A0 Why can&#39;t yo=
ur scripts just call passwd directly instead of proxying through busybox?</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a1133dd74596e520516847b63--

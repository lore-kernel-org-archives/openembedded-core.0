Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 47EB677B07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 17:53:51 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id y76so70647966qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 10:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gtxexn3Zcj+ERwl3RVSo+VRksC8iMxGcMfk+8SUp43M=;
	b=PK8hsEcQk2seg57ZKiEDdu9HqF6BnF6j6aZFh/SWTTgEluuoBpXSQyNitD4ls7L4VE
	MoFZ9JvRI6ZdiZUxQPx5XoYFFMA5N/doINvdpVhzkD6jQspnGTerSt7PdM3I3tcpqZZu
	dZ5WB47utMgz2kvd2o1S4VvsbrNxTRDT4PASfEfvqe0eKHxzxqQLPzJCNTqs1mjIFiem
	zzojpx+YfU2K2Lp4+E5lAGngqMXaOGV+2agvjrbTEEpTT7dhdwBd8K+OOugjOgk0Esdt
	fdZu+u9dQgF61DFYHpUnbJESaDgicyJK01w6yKa63ueb+tADQztopWJTdNV2M990/GZV
	XtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gtxexn3Zcj+ERwl3RVSo+VRksC8iMxGcMfk+8SUp43M=;
	b=avecmI0LwEKK1ouVR27/2uz555CdGGkwCKbh2Ab7rRbQFXYD6a0ToLMr0RZu37qJVC
	8y5/spIdGJoYYjRu3U46VBBuAdRXb3rOAom5YrWMQ+XLny9T3Wa8kkyO8i65dcvhsmox
	o3MHqV/FRyc02twfTUVWAhkwToE5ZxQzAMphGBPmMhCoMfMH3hplx36r3QLZitWtfCdG
	NmOaQ/qXnr0VonqAUpG8oGfRED7zkZ8Y7slIQQpNvzXa2FNp18Pj+MF/88yFoHf3SQRC
	HhUy7MWpSOQtaxXL7x3oHjdqp6CnFMD2bLh6vYoNTBBrwaJ3cOFg0bD+16Y1AbJHtGhb
	pYww==
X-Gm-Message-State: AFeK/H1gsq4Le8r5rxh6Cn97UyYW0ucCInD2tPEFUPBwp7HadGdrw7n3TTvb+rs1AlrQ7joMftUmdMQ7SVfUkcKW
X-Received: by 10.55.175.195 with SMTP id y186mr14057784qke.26.1489773233162; 
	Fri, 17 Mar 2017 10:53:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 17 Mar 2017 10:53:32 -0700 (PDT)
In-Reply-To: <5e54c568-137b-003d-f2ea-424e807c273c@gmail.com>
References: <1489459188-15332-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LbJyOUHk8g512UZ_ZVJz9eXecghzMLKLwVBvHUKLF=T+A@mail.gmail.com>
	<5e54c568-137b-003d-f2ea-424e807c273c@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Mar 2017 17:53:32 +0000
Message-ID: <CAJTo0LZJxSYtZFDUbJaOcx03dCp1=20xRdR+D+BmkS-jVEELtA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pinentry: update to 1.0.0
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
X-List-Received-Date: Fri, 17 Mar 2017 17:53:52 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c5c2934054af0dcdf

--94eb2c06093c5c2934054af0dcdf
Content-Type: text/plain; charset=UTF-8

On 17 March 2017 at 17:52, akuster808 <akuster808@gmail.com> wrote:

> Didn't expect it make it in. My intend was for
> master-to-exclude-2.3-changes branch.
>

Cool, good to know.  It can be the inaugural patch in ross/later. :)

Thanks,
Ross

--94eb2c06093c5c2934054af0dcdf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 March 2017 at 17:52, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mail=
to:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=
=3D"#000000">Didn&#39;t expect it make it in. My intend was for
    master-to-exclude-2.3-changes branch.</div></blockquote><div><br></div>=
<div>Cool, good to know.=C2=A0 It can be the inaugural patch in ross/later.=
 :)</div><div><br></div><div>Thanks,</div><div>Ross</div></div></div></div>

--94eb2c06093c5c2934054af0dcdf--

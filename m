Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id DB0926AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 10:04:37 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id w18so229684300oiw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UI+DWvUE2r6cf25tAxq/RMk7S3vrOKsxd/bJA8jS7+M=;
	b=JMJob8dAju7rqrVTTsaIFdGWHXg5GYZoVuY+v3QI5cts3agb3O4Xm4LdCi/oRY+3M2
	LLDDyIN5zkxiuGtY6KaKTYtYnKvBNPx9b55fasp28Mu7H417luGvn6eZoADTlQ1qsc8H
	AX0N83yGtccXb6ptawfv7MQIDvYcSbLxE99jJyjXhlMMoa3Qz4YdJw/9vXw9Hey0SIZ5
	Rr1qTMel3tw+L0B5pkWUp0gz2X7ykiICdmvljPegPaRGAeXk9ZTK6iCU0KvTJx8Iz3Ij
	fVmqSysqo+MkP0I+iO0WQwB8gR8CEIKoQ6xnuPW9q239upFzi8zVoNLvzRMio5A5On5E
	R9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UI+DWvUE2r6cf25tAxq/RMk7S3vrOKsxd/bJA8jS7+M=;
	b=PF6cU2Q0k3gwn+oiiS2jy1MK/m+flZixu6Cg9ml53CW1OWuLspUut4hq9mylcObpjq
	IrDydTLhQ67CGBRrKqX2tWt5S4S9HAhsjJTJu/JRmYI5UORy6SYx4BO683eoXqAYwpOM
	HHGpYP2DoLv/EY9zZC96TqC92NXvMeEqXX1y+ZHKJuhOIGEeC7MVcDaqV52VVudl2Ox8
	FfFbb2gCY12UdBY7d79X16K9ll1xT6ndHfp+2suZ3wWogHVPMKjlBzhjzJdIQ1la63z9
	CCCL3bIbJOQza5dzdIRlHhu3bMcqfCUNzKVm4LMZw6jnBmy4Fy1jRge5dxv/1jFZREhN
	EhQw==
X-Gm-Message-State: AEkoouvFuAIG3JsWJ5z3GqLNLPYfPNOmPSyNgY1FANgAyxx/izNSs9Dqsj9Zq04r5XzInSYo4e/dldKJ7bphPaAW
X-Received: by 10.157.35.136 with SMTP id t8mr27011524otb.127.1470132277816;
	Tue, 02 Aug 2016 03:04:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Tue, 2 Aug 2016 03:04:07 -0700 (PDT)
In-Reply-To: <CAJTo0LbZbk_w+=G=EeG1O8U-9-hLH5B2N=MwEczyHcpzuaThxw@mail.gmail.com>
References: <CAHiDW_Hu7dZYxLD0cCEbV_M=-VtQF0s7O_8aZxZrXof2LXa5gw@mail.gmail.com>
	<CAJTo0LbZbk_w+=G=EeG1O8U-9-hLH5B2N=MwEczyHcpzuaThxw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 2 Aug 2016 13:04:07 +0300
Message-ID: <CAHiDW_Ev_wP_R=Kp=ADJ_zsk2LsYdQT4rsySxGL4rFWUdHu=yA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: augeas: oe-core removal warning
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
X-List-Received-Date: Tue, 02 Aug 2016 10:04:41 -0000
Content-Type: multipart/alternative; boundary=001a11490a1a314639053913d86e

--001a11490a1a314639053913d86e
Content-Type: text/plain; charset=UTF-8

On 2 August 2016 at 11:23, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 13 May 2016 at 08:15, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
>> I'm considering removing the augeas recipe from oe-core: it has not
>> really been depended on by anything since Danny (rpm has a non-default
>> PACKAGECONFIG but even that is accompanied by comments about no
>> testing) and we have nothing testing its functionality. Please speak
>> up now if you think augeas should stay in oe-core.
>>
>
> I think that it really should go and will likely be doing this shortly.
>
> Ross
>

Feel free, my commit to move it to meta-oe just showed up in
meta-openembedded master.

Jussi

--001a11490a1a314639053913d86e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 2 August 2016 at 11:23, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">On =
13 May 2016 at 08:15, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I&#39;m considerin=
g removing the <span>augeas</span> recipe from oe-core: it has not<br>
really been depended on by anything since Danny (rpm has a non-default<br>
PACKAGECONFIG but even that is accompanied by comments about no<br>
testing) and we have nothing testing its functionality. Please speak<br>
up now if you think <span>augeas</span> should stay in oe-core.</div></bloc=
kquote></div><br></span>I think that it really should go and will likely be=
 doing this shortly.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div></blockquote><div><br></div><div>Feel free=
, my commit to move it to meta-oe just showed up in meta-openembedded maste=
r.</div><div><br></div><div>Jussi</div></div></div></div>

--001a11490a1a314639053913d86e--

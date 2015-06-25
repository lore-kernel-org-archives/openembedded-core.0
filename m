Return-Path: <vomegaz@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id BA3BB75A0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 18:02:36 +0000 (UTC)
Received: by wgck11 with SMTP id k11so69290568wgc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AMQl6JnDl6PyYUNOWgHXqGXKrWif355Yexj/3ftBBls=;
	b=mwoqey2hog3SScN5AQJp0IobfbDtCTjwNvSkw2iye63xJJ7U5nZmE+NxKSVaRWX5zH
	5GZNl8Zj3XDlImcm5s55tg3+Lz8aLse27lzlotTnF4pENAxqtL5rPkErVUFFLWzxFEFh
	X1lLpPQUz12rkaohW2rZHvhOhMdsM0vMrkPVb+pe3+I9sMlRi9171ElUy2SZ8lVcqMZ/
	a9n7cgQngVW2W3JmFPOxPZE1RQpK84xetRwEdgKzsP2VjWi5PXwSaQEr2M9rhh1I0Msz
	piNf/wzZqa3WU4DXGkDxjBDFQSMl+/J694VImP3kFHCvtCzHFBPLDcc6vahjU0XVMcjn
	6CUA==
X-Received: by 10.180.103.227 with SMTP id fz3mr7999795wib.45.1435255357245;
	Thu, 25 Jun 2015 11:02:37 -0700 (PDT)
MIME-Version: 1.0
Sender: vomegaz@gmail.com
Received: by 10.28.9.6 with HTTP; Thu, 25 Jun 2015 11:01:57 -0700 (PDT)
In-Reply-To: <CAJTo0LZXnV=-PWRhekYvkqgPkjy1pit_zMxGXErUs77eC5NNMg@mail.gmail.com>
References: <1435231444-30705-1-git-send-email-thomas.perrot@tupi.fr>
	<CAJTo0LZXnV=-PWRhekYvkqgPkjy1pit_zMxGXErUs77eC5NNMg@mail.gmail.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Thu, 25 Jun 2015 20:01:57 +0200
X-Google-Sender-Auth: wNpjOS5ORwjzs1PjRd36qUX7DzI
Message-ID: <CAGXeWgk2Cn-487Vw0UrYy+3Ti0ShtJZgc3P732hq3yJCdhYydw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Set S to fix QA warning on systemd-serialgetty.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: thomas.perrot@tupi.fr
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jun 2015 18:02:36 -0000
Content-Type: multipart/alternative; boundary=f46d04428e70bb0bda05195b6d6f

--f46d04428e70bb0bda05195b6d6f
Content-Type: text/plain; charset=UTF-8

Hi Ross,

Since a recent patch on base.bbclass, if S is not set correctly then sanity
checks raise a warning message. If I have correctly understood, S should be
set within the recipe to point where the has been unpacked when this
warning message is raised.

I have upstream a patch v2 because, I have not correctly fixed the S value
in the recipe of systemd-serialgetty and to fix a linked bug on the second
patch on the recipe of volatile-binds.

Best regards,
Thomas P.

On Thu, Jun 25, 2015 at 4:23 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 25 June 2015 at 12:24, Thomas Perrot <thomas.perrot@tupi.fr> wrote:
>
>> +S = "${WORKDIR}/${PN}-${PV}"
>>
>
> But that's the default value for S (well, S uses BPN), so how does this
> help anything?
>
> Ross
>

--f46d04428e70bb0bda05195b6d6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross,=C2=A0<div><br></div><div>Since a recent patch on =
base.bbclass, if S is not set correctly then sanity checks raise a warning =
message. If I have correctly understood, S should be set within the recipe =
to point where the has been unpacked when this warning message is raised.</=
div><div><br></div><div>I have upstream a patch v2 because, I have not corr=
ectly fixed the S value in the recipe of systemd-serialgetty and to fix a l=
inked bug on the second patch on the recipe of volatile-binds.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Best regards,</div=
><div class=3D"gmail_extra">Thomas P.</div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Thu, Jun 25, 2015 at 4:23 PM, Burton, Ross <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blan=
k">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span>On=
 25 June 2015 at 12:24, Thomas Perrot <span dir=3D"ltr">&lt;<a href=3D"mail=
to:thomas.perrot@tupi.fr" target=3D"_blank">thomas.perrot@tupi.fr</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><div style=3D"overflow:hidden">+S =3D &quo=
t;${WORKDIR}/${PN}-${PV}&quot;<br></div></blockquote><div><br></div></span>=
<div>But that&#39;s the default value for S (well, S uses BPN), so how does=
 this help anything?</div><span><font color=3D"#888888"><div><br></div><div=
>Ross=C2=A0</div></font></span></div></div></div>
</blockquote></div><br></div></div>

--f46d04428e70bb0bda05195b6d6f--

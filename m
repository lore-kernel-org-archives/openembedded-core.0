Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id C17A66E8A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 15:57:05 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id e16so25607384qcx.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 07:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=49KdSNyQzSAQjWXG4qHO4VOSzryG1X7u9mlDEHTBEfQ=;
	b=gclkf6Jq0pXyYUM+tcFGbrkl6KlvfaoGGqf+dGD6tQ6PV8k9Bm0H+RVSm3ctNm3ed4
	YWbWsfenuoTLpOahKfTceH0XjMBnK5reLLKo7h0bR5fCEJlf9GV0B7Segwk8YRVlRKGE
	MNbRtJV3IoHgot4j8cNWvEkNVX2LCltZw3hfqzFyJU8JHARDF+pR2tCqP1lR2o7A0bsi
	5R0ijR2XT4TgJL2jzOGCVe8E2H81+8tB8ZFSmedUsj0BtIOvo7UmB3AhOo9t+o1XKfPt
	1XTmO3wwgkg08xIgftbvNcRBXcqKQN3ShJrFzvgqESBCRrYAn0uFmIRg305LoVYVTkEm
	KR3Q==
X-Received: by 10.140.91.228 with SMTP id z91mr5032502qgd.32.1392739026745;
	Tue, 18 Feb 2014 07:57:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 18 Feb 2014 07:56:46 -0800 (PST)
In-Reply-To: <CAMCfZKFO6G8pFprNR_62k4UhG1=S0sbxNew7VfzFSRKXtMG1RA@mail.gmail.com>
References: <CAMCfZKE1+RDpEE8HehL_GDp2WxrVWjpjVL0Fb94Y_729Zi0A=w@mail.gmail.com>
	<CAMCfZKFBnmFip9qdUxjf60F_T5yBBEUfENULR_Bxt_b+Hso77g@mail.gmail.com>
	<1392334278.14081.26.camel@ted>
	<CAMCfZKEJJdCgCdhHHa_944+adDA2h6sBR9b9nwL=gTpy+dUPJQ@mail.gmail.com>
	<CAMKF1sqQQQD82FeRg_hgK-Q5=VQDPArpJrz7wUxe8kGy7KNe=A@mail.gmail.com>
	<CAMCfZKFO6G8pFprNR_62k4UhG1=S0sbxNew7VfzFSRKXtMG1RA@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 18 Feb 2014 12:56:46 -0300
Message-ID: <CAMCfZKEBmZOGh7oxoPuVLG95gPK86WgyZQ=oezQJhxwpk6AXZg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qte-4.8.5 missing libQtUiToolsE.a on toolchain
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
X-List-Received-Date: Tue, 18 Feb 2014 15:57:06 -0000
Content-Type: multipart/alternative; boundary=001a113a7b1ef45c3f04f2b052b6

--001a113a7b1ef45c3f04f2b052b6
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 14, 2014 at 9:58 PM, Diego Sueiro <diego.sueiro@gmail.com>wrote:

> then package the needed static library in -dev package. Now its not
>> recommended practice however sometimes
>> exceptions are made but I would recommend to check first if its an
>> oversight/bug in QT5 to not generate a .so
>> for the given library or it could be a architectural need to have it
>> static either way some clarification is needed
>> before this change is made
>>
>
> Khem,
>
> Looking at some references it seems that qt just builds the static library:
> https://bugs.archlinux.org/task/37447
>
> http://rpmfind.net/linux/RPM/epel/6/x86_64/qt5-qttools-static-5.2.0-1.el6.x86_64.html
>
> http://fr2.rpmfind.net//linux/RPM/opensuse/factory/armv7hl/armv7hl/libqt4-devel-4.8.5-10.1.armv7hl.html
>

Any conclusions?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br


/*long live rock 'n roll*/

--001a113a7b1ef45c3f04f2b052b6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Feb 14, 2014 at 9:58 PM, Diego Sueiro <span dir=3D"ltr">&lt;<a href=
=3D"mailto:diego.sueiro@gmail.com" target=3D"_blank">diego.sueiro@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"><div class=3D""><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex">

<div style=3D"overflow:hidden">then package the needed static library in -d=
ev package. Now its not<br>

recommended practice however sometimes<br>
exceptions are made but I would recommend to check first if its an<br>
oversight/bug in QT5 to not generate a .so<br>
for the given library or it could be a architectural need to have it<br>
static either way some clarification is needed<br>
before this change is made</div></blockquote></div><br></div>Khem,</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Looking at som=
e references it seems that qt just builds the static library:</div><div cla=
ss=3D"gmail_extra">


<a href=3D"https://bugs.archlinux.org/task/37447" target=3D"_blank">https:/=
/bugs.archlinux.org/task/37447</a></div><div class=3D"gmail_extra"><a href=
=3D"http://rpmfind.net/linux/RPM/epel/6/x86_64/qt5-qttools-static-5.2.0-1.e=
l6.x86_64.html" target=3D"_blank">http://rpmfind.net/linux/RPM/epel/6/x86_6=
4/qt5-qttools-static-5.2.0-1.el6.x86_64.html</a></div>


<div class=3D"gmail_extra"><a href=3D"http://fr2.rpmfind.net//linux/RPM/ope=
nsuse/factory/armv7hl/armv7hl/libqt4-devel-4.8.5-10.1.armv7hl.html" target=
=3D"_blank">http://fr2.rpmfind.net//linux/RPM/opensuse/factory/armv7hl/armv=
7hl/libqt4-devel-4.8.5-10.1.armv7hl.html</a></div>

</blockquote></div><br>Any conclusions?<br><br clear=3D"all"><div><div dir=
=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br=
>Administrador do Embarcados<br><a href=3D"http://www.embarcados.com.br" ta=
rget=3D"_blank">www.embarcados.com.br</a><br>

<br><br>/*long live rock &#39;n roll*/</div></div>
</div></div>

--001a113a7b1ef45c3f04f2b052b6--

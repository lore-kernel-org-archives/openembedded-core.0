Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0831B6612D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 13:45:07 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id f6so90329216ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8DOs0YRbSkIkiXkwsXCEd7XIMNxQt6pV/9KfHDLE+f4=;
	b=PQcDg7/Zv7qLfNyf41RCOhhHAd/jtSBammmrF75MAtOQosh8qa5m6OPnGg4uWOKhfy
	D+cGuc0fc3wk5DXsWdRnoyqDoHpZA/mwbENg8fpFGJAfrHlDYtZJosmgs5SRImobts6W
	DTKyu14YkCoRS24v0RJ1iZfyWz+HoL9mCTBtnZatcty2gNmQy7q8Pu+aLiwjkz/sMiDk
	eXG4vpbmTnWtNeX6rI3tdzxUxZrVuBdNQMnW4xGsdzuaEujRgSfvRnPfEeMsRkCf5Kuo
	cxuu4Gqv3JRgUf+NFc9l2a7U+yr2HSQnZ/ftx9DwJYkEWhIzDz+JqHzdTefOnMxPmHLM
	Woeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8DOs0YRbSkIkiXkwsXCEd7XIMNxQt6pV/9KfHDLE+f4=;
	b=YXr0aAocetvvnIDuk33cXI5auCkw9NnHKh7ayfmciyrJAQAIi1Yq4pGTtpLOlaIPfY
	RNAREG8vXCBK2kwoX6RmtPIVeahSVWOdAUCGVp+PydTj1Mcv3tt4tchjYJ6/mUzIE3Ft
	23Fv3+E3fcg44J9Jf4FG8szIkoRMB6uwDDw7adx6VGjoTzeHfBDUtjX8NyFta5nX0JV9
	fIgU+uGIJGMvX6ASv47WGf9luOy2iDrybciVgBGOK7TAOMxE2Y2pFP1RGOWk6EefI3CU
	DSvyeYZvBBctSvDIZyU8DQpUHmQ3mr9NQObcRUQgH+qFFo51OxmOASDf8CTa2IeHwxCE
	5WAQ==
X-Gm-Message-State: AEkoous1meKDsjV1gDJk9VvNNG1ei48fRIgYcJ5vQ5tLRoK8Imv5lAcTc7Ts+8f1N4Rbb5WiqrBk8vxO4QQueYuI
X-Received: by 10.36.121.206 with SMTP id z197mr5418963itc.22.1472132708036;
	Thu, 25 Aug 2016 06:45:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 25 Aug 2016 06:44:47 -0700 (PDT)
In-Reply-To: <20160820203609.5599-1-raj.khem@gmail.com>
References: <20160820203609.5599-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Aug 2016 14:44:47 +0100
Message-ID: <CAJTo0LbPUuXx=N=BsncbdceCVpR=ZerdzqkRpgn2T5uz38p8nQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] xserver-xf86-config: pre-load int10 and exa modules
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
X-List-Received-Date: Thu, 25 Aug 2016 13:45:09 -0000
Content-Type: multipart/alternative; boundary=001a114aa820200b31053ae59b45

--001a114aa820200b31053ae59b45
Content-Type: text/plain; charset=UTF-8

On 20 August 2016 at 21:36, Khem Raj <raj.khem@gmail.com> wrote:

> @@ -3,7 +3,7 @@ Section "Module"
>      Load "fb"
>      Load "shadow"
>      Load "shadowfb"
> +    Load "int10"
>      Load "vbe"
>      Load "vgahw"
>  EndSection
>

The log says "int10 and exa" but V2 has lost all exa references.  Is this
intentional?

Ross

--001a114aa820200b31053ae59b45
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 August 2016 at 21:36, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":1dk" class=3D"a3s aXjCH=
 m156a9ab57fb91d94">@@ -3,7 +3,7 @@ Section &quot;Module&quot;<br>
=C2=A0 =C2=A0 =C2=A0Load &quot;fb&quot;<br>
=C2=A0 =C2=A0 =C2=A0Load &quot;shadow&quot;<br>
=C2=A0 =C2=A0 =C2=A0Load &quot;shadowfb&quot;<br>
+=C2=A0 =C2=A0 Load &quot;int10&quot;<br>
=C2=A0 =C2=A0 =C2=A0Load &quot;vbe&quot;<br>
=C2=A0 =C2=A0 =C2=A0Load &quot;vgahw&quot;<br>
=C2=A0EndSection</div></blockquote><div><br></div><div>The log says &quot;i=
nt10 and exa&quot; but V2 has lost all exa references.=C2=A0 Is this intent=
ional?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a114aa820200b31053ae59b45--

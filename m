Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3306360017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 17:51:08 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id b13so31443928qcw.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Feb 2015 09:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TtsCqboOVxoCcvJ+3OEysKFuRTgOSWNbH/oesMbJP7g=;
	b=jZZW8KPURYAiCwkdmR593jqPxQgv6+2LoKQA+mZZtTBMLgxIxrqNSOaSI3R6KMq6U7
	7evW14JQCPnRrr0bl2u1g3tseAs/KzMuPaD7uU+kJVQteyLLVs2HBztS4jLGehzUnAsX
	RxZkJUPaicz9k0BwnJQUQfPxi/Un0XSKtDktZpqM31zOtNheEMcIAodcOykN25Hg3DvN
	FbmT2jF5pVdhP6+Uue0Ykal/96J3/9iY7Bkh+eSUX2iXEjMfWoe0YAzViVwKttdQgs79
	t9MxcMni3PrrherGq6PEXlTESLcUzlSW0yNfgVGYFJl5WDUyu/bhOMl6oFwm5G8J0WXI
	3Waw==
X-Gm-Message-State: ALoCoQkA0ulnXpl+p/BA4pX9HwhmRMNTyeQmyUCTkaeSZzz+6jNZNzSnYdM/eh14EY6GB8kOXxmZ
X-Received: by 10.229.80.3 with SMTP id r3mr510379qck.23.1422899468596; Mon,
	02 Feb 2015 09:51:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 2 Feb 2015 09:50:48 -0800 (PST)
In-Reply-To: <EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Feb 2015 17:50:48 +0000
Message-ID: <CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 17:51:15 -0000
Content-Type: multipart/alternative; boundary=001a1133cb7860aa73050e1e99ec

--001a1133cb7860aa73050e1e99ec
Content-Type: text/plain; charset=UTF-8

On 2 February 2015 at 17:40, Khem Raj <raj.khem@gmail.com> wrote:

> Yeah, you must be using a weirdly compiled gcc on your host which is
> defaulting to -std  < c99 and hence the problem. I have fix for that issue
> already locally.


$ gcc --version
gcc (Debian 4.7.2-5) 4.7.2

This is the default gcc in current Debian stable.

Ross

--001a1133cb7860aa73050e1e99ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2015 at 17:40, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex">Yeah, you must be using a weirdly compiled gcc o=
n your host which is defaulting to -std =C2=A0&lt; c99 and hence the proble=
m. I have fix for that issue already locally.</blockquote></div><br><div cl=
ass=3D"gmail_extra">$ gcc --version</div><div class=3D"gmail_extra">gcc (De=
bian 4.7.2-5) 4.7.2</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">This is the default gcc in current Debian stable.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div><=
/div>

--001a1133cb7860aa73050e1e99ec--

Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6A9606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 16:55:43 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id 38so166960310iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 09:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xcoI2DSylbKr/TIWjTW0TKQOnDggM6MI3X/rggbFnJg=;
	b=b/ixi842a3cjrDQuNLuuBoWsP5R9nbxBCxxKlAxgoxdTIBG+GFBeyKdd5Dqs0WYAkf
	VPKfkflej+E3xKG+4LL6UqiA7c2xpW+olOkvqrBrm5nYI8QzTCBF1jrME+7lqiOQmcFs
	Fn4Y2PW1GaPQrlHLOSJ4poC/SBAV80oxkqOciG4GSfvfo3DDr184nFTguDwDesyhGk8f
	RkCUi1FyPHGHGTr1A1yeiz0FKLDgRGH2hv0pq4xU0Znooin13B517mDtb0sW51Q1pXqz
	GrascYU1A0c+vlCV6mt02H9SSKx+9XZVkPIQO0kWMe7+rWge5uYJ9LuNNWSXAuvb8XHv
	iLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xcoI2DSylbKr/TIWjTW0TKQOnDggM6MI3X/rggbFnJg=;
	b=Z3v2cpmGOIrFXii2Ne118aaMfuGHiV3Xu4JH7WJ2Oyxo+ndtHy0WdOTpgyTgkDG+f7
	vhBIWfPaepY+ED8Lh8Y4vMu2ExGkBT3RIWxSUieXaaCQ3OUqRvidfsyP3GYr68arhgOP
	SVhKXSNyZgyquqiiDWZEMbLhhqrVhb6y5ZA9yy5m8W3rRQl1cXVq4i3YzU19re10T/Pm
	GBkfosgZM+idPsBQyc7GbSulPQ4hlWnWCjLeF7SErb/pq6pGQ6UrJ/vnzfBhgtADLAvT
	zkcrVrFx6P+mWayvlhJKuucAGTQTktgdLJGZ7n3b4a+4cRIZ6OQqX+XQ5M3/gEISddjX
	MDcw==
X-Gm-Message-State: AEkooutc0J3pX9yvvFece06j2XOsbVObsswuDZhP+RNJhjYHRTJBuQy7WwDS8JG7hDryQIRoiP6q6NFJNFf5DBpS
X-Received: by 10.107.138.212 with SMTP id c81mr20733875ioj.148.1469465743649; 
	Mon, 25 Jul 2016 09:55:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 25 Jul 2016 09:55:24 -0700 (PDT)
In-Reply-To: <9b789aaef553ad10b81868af8a32e48ed5d702ac.1469431638.git.liezhi.yang@windriver.com>
References: <cover.1469431638.git.liezhi.yang@windriver.com>
	<9b789aaef553ad10b81868af8a32e48ed5d702ac.1469431638.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jul 2016 17:55:24 +0100
Message-ID: <CAJTo0LaAduh5ep=xgK8NO1MHc0R1Cr-Hwqe8Ut1FrkCviv+Rpg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] libinput: fix udevdir
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
X-List-Received-Date: Mon, 25 Jul 2016 16:55:45 -0000
Content-Type: multipart/alternative; boundary=001a113ed932a90741053878a782

--001a113ed932a90741053878a782
Content-Type: text/plain; charset=UTF-8

On 25 July 2016 at 08:28, Robert Yang <liezhi.yang@windriver.com> wrote:

> +FILES_${PN} += "${base_libdir}/udev/ ${nonarch_base_libdir}/udev/"
>

Isn't this covered by the bitbake.conf change?

Ross

--001a113ed932a90741053878a782
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 July 2016 at 08:28, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":68d" cla=
ss=3D"a3s aXjCH m15620f5615ee2b81">+FILES_${PN} +=3D &quot;${base_libdir}/u=
dev/ ${nonarch_base_libdir}/udev/&quot;<br></div></blockquote><div><br></di=
v><div>Isn&#39;t this covered by the bitbake.conf change?</div><div><br></d=
iv><div>Ross=C2=A0</div></div><br></div></div>

--001a113ed932a90741053878a782--

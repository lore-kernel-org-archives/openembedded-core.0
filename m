Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFE260762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 08:30:37 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id p64so27820200ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 01:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3GusE5BV6iIopSv42xKvBOMlj9DTqCa2W52cl/fAMEk=;
	b=L6A4q5/Q8KyQEaM+uirxWIDfRDVAcT8p23tUZ14vEpi1o2jFjdEMhZx8RV/akkbrPd
	xZjKImPJPw9Q/ipEk3pLC9AUjagKQY00oHmnoCZdTLKHyskTlX9jI+L4cTNKGDL97JGa
	ejEQpu9NDvF3pM9mABBklVuU1+Pj3DxPyZEes+bJkLog32CHLE1//VP9Fopa3a3Ug5f/
	KExHujx1WYv1apzPd2Vk21mvyi2NJ/0BuvS6YuLpBCO9HpXGlzNt5lcWnePQ+RcHU+dW
	/5ZQF7Z9MasiqKIax2FjaQz8EYWlmSnbmlWPjqgywMx9DqJcWue6/deWwiWuy35HV7Un
	pglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3GusE5BV6iIopSv42xKvBOMlj9DTqCa2W52cl/fAMEk=;
	b=kLN+CYSC/GY9C1guUidmCRy2ayFuora3DRf7Av/eep35x9zGAuYIJMn1Wju1xyBmHO
	rRj6QR2ACAuP9ed7NSaRkg/hR7uPvvSGMOn55RKDxXfibV8mO6CXFiXJuwXlbmnUhw3/
	qNb/Gbz3bs2MMwUxE4CcrqqyNsldixYSey+TLt2/aJ9U7PKIKjytO90+Nu88iGRFFYW1
	sTfv56L3SbZojNeKOup40RUJyhQsdWJQnGypTZIv55IGfqzIJNNcTw/HlUt36Qp7B6a1
	3jrjADadVaTJQT3foj6e19Q2iwNtIVcGifFAvBnBWIruilt0gaJPFVPYVK60gANKv2ky
	Hh+Q==
X-Gm-Message-State: ALyK8tId9vZN3EUgWhuJvG3zSLfHPVYndRZe5xGcnG5qhN7sqzaiBNnWiX7jPIzMK6BjYWyOeUKZiNX41D1eAAl5
X-Received: by 10.107.135.234 with SMTP id r103mr2821073ioi.133.1464165037786; 
	Wed, 25 May 2016 01:30:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 25 May 2016 01:30:18 -0700 (PDT)
In-Reply-To: <1464160265-16527-1-git-send-email-zhenbo.gao@windriver.com>
References: <1464160265-16527-1-git-send-email-zhenbo.gao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 May 2016 09:30:18 +0100
Message-ID: <CAJTo0LaPkXBy4M4OFwfgQqFXKCyA_P5GkGYoovArZcK20kSmLw@mail.gmail.com>
To: Zhenbo Gao <zhenbo.gao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: add alias for connman
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
X-List-Received-Date: Wed, 25 May 2016 08:30:37 -0000
Content-Type: multipart/alternative; boundary=001a113fc2b6f860660533a67c78

--001a113fc2b6f860660533a67c78
Content-Type: text/plain; charset=UTF-8

On 25 May 2016 at 08:11, Zhenbo Gao <zhenbo.gao@windriver.com> wrote:

> connman get conflicts with networkmanager when building
> the project.
>

Do you mean installing connman and networkmanager at the same time breaks
networking?

Ross

--001a113fc2b6f860660533a67c78
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 May 2016 at 08:11, Zhenbo Gao <span dir=3D"ltr">&lt;<a href=3D"mailto=
:zhenbo.gao@windriver.com" target=3D"_blank">zhenbo.gao@windriver.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":fk" class=3D=
"a3s aXjCH m154e6c15d61b5f2b">connman get conflicts with networkmanager whe=
n building<br>
the project.<br></div></blockquote></div><br>Do you mean installing connman=
 and networkmanager at the same time breaks networking?</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113fc2b6f860660533a67c78--

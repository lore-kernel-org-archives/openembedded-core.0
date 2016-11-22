Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id A101F71A1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 15:32:47 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n204so29393018qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YSo2yuuZuBRlLeHYA7nCxnnwe5J3/kve9OZUjNCeV6g=;
	b=hpuqHyHHYuolW40cf/T0phGsWChoGGnIYATPGaN4NIl9FjPBPD8iJoIpegaVmit6PB
	YzYJ2AhfEeOgDtQt4fWvouJsUhY9tuKW4LvZQyLDf2itTnOskyfv0XrSF1z2eu5nCu1B
	3x8ioVRs9Luv3l49Zq5TDg/2gq+XchgLSVbqDbHkWtXflXm0+ajNNYvSKsYyYx+x3hIn
	Urcn5zbkyKsGX2YAJsMw/uD0BPBGwdiCfg+HK6JznHIowSfjgNrwBV12VeilOcztYRLN
	KN9BKmvTFxn4srQf0KQfWhfyMYYu8vsuPZaWIltEogn4uLOfwLDlEv+0ZnylWhFz0rAP
	nBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YSo2yuuZuBRlLeHYA7nCxnnwe5J3/kve9OZUjNCeV6g=;
	b=UqcVryPY4f9MwG8GKkqOZEqZd6vP2A/UWf39/Gim8PkfqnksGBpXkteZi0VlgfdRhO
	hnx6iqmQ0d7WYcWkEMhwiLBp1VttbmVCS+Yy2Luyg29U1suCJaP4tJvw+hCraDE6EyQA
	ngyGsasNhHy4NlqTnw/n+KHGq06/gL4xhZwAzFQl2r8ITX1O4yMXbfgOas6nmsjgM08X
	3qodT1O3hpOy3zhRubWZYV6HNVKCxkh6WqNufdeBlJ3kYvvYwgPDNVJb9vZyM6ES5RCr
	Iy9ecJ0V1ep9X3/ctRxHyJciFt19pocA1PLhqfvwYUU6ikyPPpWdgbAF0KcPFLxj8umH
	9W6A==
X-Gm-Message-State: AKaTC02WFzEAqZ548H6zemhBxDMEgKnFcUGoMFqLjmIGk0BTs6OS40IvjP1cIwOdUxa4qq4RLPemoArmESdguoEq
X-Received: by 10.55.207.78 with SMTP id e75mr26811825qkj.36.1479828768578;
	Tue, 22 Nov 2016 07:32:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 22 Nov 2016 07:32:28 -0800 (PST)
In-Reply-To: <1c31ec07-55d1-3a33-fc5f-6047c940d950@embed.me.uk>
References: <5c4588bd-53f6-6086-0443-faed9c0732cc@embed.me.uk>
	<CAJTo0LY4eFrus=dOy4PzbauML6iz4qzpCKrw9rp-pLCy6YiscQ@mail.gmail.com>
	<1c31ec07-55d1-3a33-fc5f-6047c940d950@embed.me.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Nov 2016 15:32:28 +0000
Message-ID: <CAJTo0LYsnuFVtpz72y=8zGAY3+pjn6z3WoAcwwODWhrPvkhX+w@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: distro checking and lsb_release
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
X-List-Received-Date: Tue, 22 Nov 2016 15:32:49 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b814a2e30541e57ceb

--001a1145b7b814a2e30541e57ceb
Content-Type: text/plain; charset=UTF-8

On 22 November 2016 at 15:11, Jack Mitchell <ml@embed.me.uk> wrote:

>     >    distro_id = distro_data['DISTRIB_ID']
>          release = distro_data['DISTRIB_RELEASE']
> TypeError: 'NoneType' object is not subscriptable
>

You're using arch which doesn't set those fields.  There's a patch on the
list which should be in master shortly.

Ross

--001a1145b7b814a2e30541e57ceb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 November 2016 at 15:11, Jack Mitchell <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ml@embed.me.uk" target=3D"_blank">ml@embed.me.uk</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><tt>=C2=A0=C2=A0=C2=A0 &gt;=C2=A0=
=C2=A0=C2=A0 distro_id =3D distro_data[&#39;DISTRIB_ID&#39;]</tt><tt><br>
    </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release =3D d=
istro_data[&#39;DISTRIB_RELEASE&#39;]</tt><tt><br>
    </tt><tt>TypeError: &#39;NoneType&#39; object is not subscriptable</tt>=
<tt><br></tt></blockquote></div><br>You&#39;re using arch which doesn&#39;t=
 set those fields.=C2=A0 There&#39;s a patch on the list which should be in=
 master shortly.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1145b7b814a2e30541e57ceb--

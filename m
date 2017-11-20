Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8426E786B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 11:07:43 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id n134so11501606itg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 03:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gDKKcyCjU5E2UDcCkBtLX7u/EPcoDz807yOjKcSh9Wk=;
	b=PRTQbUtKdavpEfEjgPYdoaVqwM8sMnFQW+UDUeL8ClDju1WNSpCy42UrpmSMLot9zn
	A7ra9zKvZ5BDfVJz0pzILZFgrKX0nvexMGdv6DIm3TIfxsNtze2r5t/gEjevMoE9GZpZ
	OGfE3VbtBhw93IjsxRpIvfSyD7W2ADUWzGL5B0AdU44IxYGN9/4lEZH/g8ZmPuvkWAFF
	7ZlTjl0pmKEVknICeuvtWiWAlKboABSlNK2ZXKu6Y9R7pjexBuhhtqjek1YLDmN9PQgr
	MbqDR98h6DKIjIYgKfEOoPoj8XND9x8jy4fWCG9J/V0nPqh+3L0RSFT/vAarqL52d8Vv
	H4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gDKKcyCjU5E2UDcCkBtLX7u/EPcoDz807yOjKcSh9Wk=;
	b=cjQJKtjjuyPwud+zd12O+cjikwxfy9xfqg6IgccU8RG4h4EQwW0pOMGLGVSKKco/YC
	vg1OHok/iT6OF3eRc0Xja3a2HkcKfvWthiqHwNqFuU2M5cClt14evLXbEXotKWzV/EVp
	zo0QqYQWfDeRYo1JzuNKhVQ0DJd6pzoFZoBGAA0reanat4o2vfRCTSADaiKbicfsCY+C
	FLXZeAqNMByWOAKiLkNMSbruAWfU1f9ls9tXT/G5MKeoypxEfJHBH2JyWIIXqwz6galT
	9QBmkkDgU1S+3bieJdEVriemmkMEiripIBci30hQiDT+8d3Lc138y3lmm00bSMDiZJTM
	obug==
X-Gm-Message-State: AJaThX4T0wWSNucPlRHumwcDjjPWO5ehmh0ERznyMYpDgfE0FDka9Uz4
	hNeWNSAkmZHK2VoGE4nb6fm6hiNvMwqhj+ZsbCQLWQ==
X-Google-Smtp-Source: AGs4zMYehmJJPONCog9PNByfhGbRjCSv4dBIQ/QCtqATXGxRqo3kTx/fpNFM8nSI7hVYxax1LbFLLWbSWKDNtOGeYEU=
X-Received: by 10.36.71.74 with SMTP id t71mr18173069itb.53.1511176064647;
	Mon, 20 Nov 2017 03:07:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Mon, 20 Nov 2017 03:07:24 -0800 (PST)
In-Reply-To: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Nov 2017 11:07:24 +0000
Message-ID: <CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: fix formatting IDE storage does not trigger "change" uevents
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
X-List-Received-Date: Mon, 20 Nov 2017 11:07:43 -0000
Content-Type: multipart/alternative; boundary="001a113f6a2086e140055e68188d"

--001a113f6a2086e140055e68188d
Content-Type: text/plain; charset="UTF-8"

On 17 November 2017 at 06:08, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> +qemu by default emulates IDE and the linux-yocto kernel(s) use
> +CONFIG_IDE instead of the more modern libsata, so disks appear as
> +/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE
> +is deprecated.
>

Can we fix our kernel and/or qemu configuration too?

Ross

--001a113f6a2086e140055e68188d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 November 2017 at 06:08, Hongxu Jia <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.j=
ia@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+qemu by default emulat=
es IDE and the linux-yocto kernel(s) use<br>
+CONFIG_IDE instead of the more modern libsata, so disks appear as<br>
+/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE<br>
+is deprecated.<br></blockquote><div><br></div><div>Can we fix our kernel a=
nd/or qemu configuration too?</div><div><br></div><div>Ross=C2=A0</div></di=
v></div></div>

--001a113f6a2086e140055e68188d--

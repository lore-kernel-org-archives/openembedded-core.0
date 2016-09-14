Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0602F731DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 20:59:19 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id o3so64389617ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 13:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Wm3eTSWtg7MduBTXshh864ILoOV+nvX1lfiLhc2fZVY=;
	b=Fl11jHhTIOwhPaslnMtKfwBshy1UpGtCe9Ji68Qj0jLHQmttKm95JKfKx3jhycZ6B2
	2FADEfE91BW2jTORdG41w4h6ipz1+S94pqcoGtPKDL45y+Az/uyYry8ogZeNWF2krBZn
	1h2ajeCoanoWdvD2adc4cSPchdE38ZYO3dK8rD3wij4/7wIHH/3ndiaR3Hu0Xi04dS56
	WvRMlqaQ5pMQ9jJMWtyB0+qkYNqQ5dVkimbSUL6OACgk8NS/sGlZr9yoJSFRBYRxNK1S
	VBDRL/8F2hq7ZoMsVIm6aKYGHhj/aUYahHUNOWZ3fXxz6o5wMUpCpuFWvS/Mke+2mMjP
	Rpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Wm3eTSWtg7MduBTXshh864ILoOV+nvX1lfiLhc2fZVY=;
	b=b5UoQXrbRJzb/EIpzOHOf8RiTS85se3RZl+nAAbPjlM/0P2BmFP+QFpkL7YxdXGBai
	bCemo6t4h397DSovAldv6dk7lZpgwk4YkZ+XcPOPUfCWaZlTTeW03bFAmxZ6e/rGvojm
	ZdWrtUkC4Qae2wMFEbk2diLKAgqUSwdOFhWYHBxcZCIr/0bllXAcVlk/MUBAg4yJjx9d
	5QDzeBOrVdnxABmzDtuE5ntuPxkVUaidipupQ1cQsJWqqtdjdX2+/zdNgQjlc64mBVaQ
	dQ41XXAkMkALe/5DlvwzYlMEo/bkmvQS0L2eTE+Kq9MfHStYx1S70OnJJjUpqIa2Cwyl
	eDGQ==
X-Gm-Message-State: AE9vXwNFAPwfeUJ5evw30cLJJw8A4+fdNoO6WY9o2AeJDhBaLjiJgOngKWcuNO6MlWZP5oqxgbJOkh9jLNK4Q6Tt
X-Received: by 10.107.130.203 with SMTP id m72mr11728633ioi.8.1473886760361;
	Wed, 14 Sep 2016 13:59:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 14 Sep 2016 13:59:00 -0700 (PDT)
In-Reply-To: <CAP9ODKowGs-bZ2oyAmUn4=b6BCZPZKR9vhS9Hd==etoU5o2Pvg@mail.gmail.com>
References: <1473871297-28966-1-git-send-email-ross.burton@intel.com>
	<1473871297-28966-2-git-send-email-ross.burton@intel.com>
	<CAP9ODKowGs-bZ2oyAmUn4=b6BCZPZKR9vhS9Hd==etoU5o2Pvg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Sep 2016 21:59:00 +0100
Message-ID: <CAJTo0LYK=k1bFjbbBcDEu+RJ5zHFvogOsNmeYHnFJnjiM3AVRQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] cmake: use convenience options for clarity
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
X-List-Received-Date: Wed, 14 Sep 2016 20:59:22 -0000
Content-Type: multipart/alternative; boundary=001a113ea9dcca7b09053c7e00f8

--001a113ea9dcca7b09053c7e00f8
Content-Type: text/plain; charset=UTF-8

On 14 September 2016 at 18:50, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Why jsoncpp cannot be also linked?
>

Because it's not in oe-core.

Ross

--001a113ea9dcca7b09053c7e00f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 September 2016 at 18:50, Otavio Salvador <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salv=
ador@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div id=3D":3cj" class=3D"a3s aXjCH m15729d2da048b089">Why jsoncpp canno=
t be also linked?<br></div></blockquote><div><br></div><div>Because it&#39;=
s not in oe-core.</div><div><br></div><div>Ross=C2=A0</div></div><br></div>=
</div>

--001a113ea9dcca7b09053c7e00f8--

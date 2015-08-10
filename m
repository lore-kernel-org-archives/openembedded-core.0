Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id B55C7768BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 20:37:01 +0000 (UTC)
Received: by qgj62 with SMTP id 62so101127454qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 13:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IduVcQIgn1agZ5W5KmnM10PPphuYcWPwYB8cb3XUj+A=;
	b=IGqyw7uoeBtwEXQjqu2RiuyXD3nCu61gZazpCSxbIZH6VvDDstG5d/CBM4lVebjHi4
	SlUmb5oUz0wv8giz5cI74/g4zlsg/GmYzJly22wvSlZVaw2S3/FYHQ77Lw3p0Neiv8VV
	mFX+XubSEm+65uY2pL887uNNtmrzsZ2aug3BUPTSGc1NMDNvluPnwQh0ZJn9ERfjlGfQ
	K1EB3TsyY/4zxPCMubXMv73spmYi97czWi35esq3VqvqOW2NKQ+4U05v6NtHmmo2jXU0
	oBGfOr1aYhIiG+2QkX/jRdy/VyLRnargRXVofSbEjMldAeUg+KqRWnmqTkBQVavblD08
	Mu3g==
X-Gm-Message-State: ALoCoQnP7rjIq9ZsaIFUY27aWbUzyiZeSlMsWaVlWPZjaLgrv+03U9XRWstk9CIPK/7DYX4TPr5t
X-Received: by 10.140.237.150 with SMTP id i144mr1677207qhc.22.1439239021322; 
	Mon, 10 Aug 2015 13:37:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Mon, 10 Aug 2015 13:36:41 -0700 (PDT)
In-Reply-To: <CAP9ODKqXYDCThwnMPHDHkzsHs-PH3HPSiddCqCsraprRzmT6GA@mail.gmail.com>
References: <1439236066-20015-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LZpPm1UGdw-ASy3bAH5RVZEHTwh_jEu34_mz3A2zkbn2w@mail.gmail.com>
	<CAP9ODKqXYDCThwnMPHDHkzsHs-PH3HPSiddCqCsraprRzmT6GA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Aug 2015 21:36:41 +0100
Message-ID: <CAJTo0LafA_=mwx7aMa1rzu-36G9ttgWFPwXsPP2zR4pZuLUyAQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] mesa: Provide virtual/libopenvg
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
X-List-Received-Date: Mon, 10 Aug 2015 20:37:02 -0000
Content-Type: multipart/alternative; boundary=001a113595aa9d0026051cfaf247

--001a113595aa9d0026051cfaf247
Content-Type: text/plain; charset=UTF-8

On 10 August 2015 at 21:14, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> So it does not offer OpenVG support anymore? What about mesa-demos?
>

mesa-demos hasn't been upgraded for a year (we should probably start
tracking the git repo). I've merged the demos fix into MUT.

Ross

--001a113595aa9d0026051cfaf247
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 August 2015 at 21:14, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":1ey" class=3D"a3s" style=3D"overflow:hidden">So it does not o=
ffer OpenVG support anymore? What about mesa-demos?</div></blockquote><div>=
<br></div><div>mesa-demos hasn&#39;t been upgraded for a year (we should pr=
obably start tracking the git repo). I&#39;ve merged the demos fix into MUT=
.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113595aa9d0026051cfaf247--

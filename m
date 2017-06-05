Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBFE780CE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 20:29:25 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id c10so48173671qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hqZiFEXw7Maf3NEufSDuo3+SofXwNLt2aEfVEbezqUo=;
	b=s8b/zO5A++NeKESF7rjq5A7/lhMkrQ2nFn25xyoISHgR3MqYZRTnULELT80oZFZsEU
	nda4yHqz5GKoLH4jk7cQl6ILYzeQAGy4QpT9j0/WmgOHADfQZiEigm8vRzMXoS7DPD84
	nsTfY6N84WVzIPc0bjVgXPXSovapj9NcmZpEi+CUoyl87eIMBjd640+a8niLJrfvuXjP
	aau518Vi6PDnwsAVpSOS6AaearldGuR+/E3Iipll4yPaHgEKSxntBZqfirASTszVFVkr
	lB4WbMVafaR3IPqYheRcMSA2D+aabnBHE0ohzXTz+7W1LQzehtZbZ51fdWEcgfzhRTD2
	tn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hqZiFEXw7Maf3NEufSDuo3+SofXwNLt2aEfVEbezqUo=;
	b=o8KKrFEb2mDEVYPDdvy4J0nUujRffm+SxeqYUDVYDNwSkZ/MZnxP096e8NIV7yleph
	YRqUWjqnk7w00trEQ9g1iJPBk8HouVeMgVxJIKEWgfN8Dy3ILMKOVduWAShSmeAN+dBT
	yybnPd9lx2kfYb6zfBhwDoALvapqSaIXreAUieq4aX+pKNtSvTHOA73Y48kr22sMUkDJ
	O+lbhTaar6ygZUT309VSOY2mYbUVaqGXOVolYmVhaV0g0u90a6jbXeFNuNcOjpFMIOKu
	gOqah087ekaaD1S1pNTSZKgWZqAmRBmvhjnyKkemkqtXK+4i48662ME+5PpuMx9CHryy
	thvA==
X-Gm-Message-State: AKS2vOzoP/gWuHfj1bxQwKWovc/YG23bM+Si9HGzuhx+QZ1mHNv4aMbK
	HEV1eWcqwGoH/95ujKFfEJM5dRFN46ls
X-Received: by 10.55.42.30 with SMTP id q30mr6117869qkh.109.1496694567131;
	Mon, 05 Jun 2017 13:29:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Mon, 5 Jun 2017 13:29:06 -0700 (PDT)
In-Reply-To: <20170531031904.7439-1-otavio@ossystems.com.br>
References: <20170531031904.7439-1-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Jun 2017 21:29:06 +0100
Message-ID: <CAJTo0LavZYib-FAuigB8ChY62ArU9WLrGaByofK=-h02+_NRiA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>, Marek Vasut <marex@denx.de>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] u-boot: Update to 2017.05 release
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
X-List-Received-Date: Mon, 05 Jun 2017 20:29:26 -0000
Content-Type: multipart/alternative; boundary="001a11493f0202f23205513c5c86"

--001a11493f0202f23205513c5c86
Content-Type: text/plain; charset="UTF-8"

On 31 May 2017 at 04:19, Otavio Salvador <otavio@ossystems.com.br> wrote:

> This 2017.05 release is out since May 08th, 2017.
>

Marek sent a patch before you did and that is sitting in my staging branch.

(hoping that he'll sent a v2 for the openssl 1.1 patches)

Ross

--001a11493f0202f23205513c5c86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 May 2017 at 04:19, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2a0" clas=
s=3D"a3s aXjCH m15c5c842489a4c73">This 2017.05 release is out since May 08t=
h, 2017.<br></div></blockquote></div><br>Marek sent a patch before you did =
and that is sitting in my staging branch.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">(hoping that he&#39;ll sent a v2 for th=
e openssl 1.1 patches)</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11493f0202f23205513c5c86--

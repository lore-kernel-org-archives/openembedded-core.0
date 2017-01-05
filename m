Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 552C071A6C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 11:02:18 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id k15so276950857qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 03:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wJ5OJCQlka/W2RLHilayszqqQXQjrzUnY4GmXRZ0VVU=;
	b=ZSWr6GUzYA61r//a2e/dykMgGHi7rhLuHqURLrOvA0Kpm+fmX1M5n8Wi0Y8dDDCuXl
	tFvCvw1uQXn/QMtP+TRK6M2wwdlg9aQBaeSeGyE7E1W1kjGzpJ0lz7twqusZ1Qo7vNyQ
	/1DDZnMzMhcqp2clfGspZyqj/Y1Jq+3odEPbARG94ZdK6xfVNQ4NRLTZJ/qZ/PK7SwhF
	Joil/T5IiwCKZLHacB3tPxTEMcb9fV6viFJ81g6UmKud490pEPiiUkC0c+n/Nun/xqCw
	aeePibVR5bhpA1p8kyOicxnzmSrNKl5gYEjqeBGIfW1A/lPLVtaXj7t4jv3npkWE0fN7
	YJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wJ5OJCQlka/W2RLHilayszqqQXQjrzUnY4GmXRZ0VVU=;
	b=G8c8jV48ERmU/mZJwfy8tdOu24sveeCFEpxgA8uMciqNADKt0XiMAnjKPHsKIAd8HM
	OU/sWXNhJ7e1AwbpylLnsW1VFL7mFQtzdNi0gEibFMe37mXx+SvFhSY+/GG0pPbwgMr+
	49K/92TYUJN0qHirFa0LZ0RoLr7+WGkXjep9WtwkPnQ86kqxLzOOcAGlK4/QW3f3mO1Y
	XzF36cUamfd5SOcdhywvd4dU5DxkPsCxvRWFLcZUC8jRuMopdgNPz2qFkVFdlgh77Dvq
	ouCL2qgDOlJuaSgkwL85NJV0X2vaa8mWAtkELyWKZzn92K3m6JiEwfH5Gk8vLa31x4kk
	6fXA==
X-Gm-Message-State: AIkVDXJH3B82DYAbiEZrYpSlTuaxDrbcrMoBw8fXJW+MEiAgM6a1LSLj0cwa0EtTL2BLac/edf39Avfshcn6wIVQ
X-Received: by 10.237.34.46 with SMTP id n43mr72207150qtc.105.1483614139101;
	Thu, 05 Jan 2017 03:02:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 5 Jan 2017 03:01:58 -0800 (PST)
In-Reply-To: <1483612541-21017-1-git-send-email-piotr.lewicki@elfin.de>
References: <1483612541-21017-1-git-send-email-piotr.lewicki@elfin.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Jan 2017 11:01:58 +0000
Message-ID: <CAJTo0La=Jzw7X7cDYLmZ2SJby2WuEZS7718QVwDSyjxaqe39fg@mail.gmail.com>
To: Piotr Lewicki <piotr.lewicki@elfin.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 0/1] Fix building apache2 on morty branch
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
X-List-Received-Date: Thu, 05 Jan 2017 11:02:23 -0000
Content-Type: multipart/alternative; boundary=001a11377e18bed24b054556d5ab

--001a11377e18bed24b054556d5ab
Content-Type: text/plain; charset=UTF-8

On 5 January 2017 at 10:35, Piotr Lewicki <piotr.lewicki@elfin.de> wrote:

> Patch from master that fixes building of apache2 on morty.
>

Wrong list, you want openembedded-devel@.

Ross

--001a11377e18bed24b054556d5ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 January 2017 at 10:35, Piotr Lewicki <span dir=3D"ltr">&lt;<a href=3D"=
mailto:piotr.lewicki@elfin.de" target=3D"_blank">piotr.lewicki@elfin.de</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4gr" class=
=3D"a3s aXjCH m1596e336ab01ea2e">Patch from master that fixes building of a=
pache2 on morty.<br></div></blockquote></div><br>Wrong list, you want opene=
mbedded-devel@.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a11377e18bed24b054556d5ab--

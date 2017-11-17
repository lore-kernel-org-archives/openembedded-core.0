Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 74E8878867
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 19:24:36 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id h6so2354057oia.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 11:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=47Ny72sTHxPXmPSjwrAm/V7kkS7xeKjEJ/bEK16c3BY=;
	b=NCOSTZdjC/5jRE2HIRtqTSWHvWnLatW8itXMU4fBXuI7B2PD8f9ADCulPZxSSRrmyO
	cwPhR15L+czU1s4wdtnKDUkUd8BM+pz9ykvMih+ghJ98o0is9uJLMMtu6E0G2yPaeJav
	idcz7YF72+VOnMnEXfOAf91921lEOGAmb9nJhoZHCiY7tqZjfnkHvUggDpQ0WtudKWHu
	hmzuTm7UgXi2e8stCZul7HkUk7XGCnW9EjblOu3IOOTEt5cCemRh79uhyyorzVOATtSd
	mzfbpl8E8xMn1Rx3AcbvzL7zbACUBBZY67yUOR7Xceue+pSxOD/1ePKgMwVftD9kBKJK
	tLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=47Ny72sTHxPXmPSjwrAm/V7kkS7xeKjEJ/bEK16c3BY=;
	b=dpI78sbC5o4E/5qU+S7raQARcwpSRAmZnP+CJsTnaaIyUa32hYm/yjXFNsq9yBFHeV
	0F20/MsEjwAAPSlHA70rso8P3cl/HLnMKDtejDbcqrGE8yKdi9/2VpXoO2LNNBt+/3ie
	B7bfclc8ELD4UaODtOL6362QpQYpt0oqenQVgaB6SUG7pnbscG9jMTtfy2vYtFkhUAOd
	2xXW6iSyy0/N1R3hLrGvNIilaZ2hf/2lLgkAVEHzxc49uRYztxo7GwlI22ZFoLdgBi1H
	xJa4X+elF09sCe4aZxMJI83YQs7F0qn7ZyKyDKa+KT6zm0AqUNraN6N9t3lwP3NOHkRa
	lYYw==
X-Gm-Message-State: AJaThX6k1/kyUYTZMRm9hs9NkbvjiOxLO2xhz8aeu4zl/yaLXnioreD9
	eo23qwSMNKW7OEDD23+43rAWAUH8
X-Google-Smtp-Source: AGs4zMY67y3lvJ+0HxmR+zdLdaRxVc92QSPMUwZ2a3nGEAHYtqEDJXatM2CxeEF9YL3xbRQaRoL0bg==
X-Received: by 10.202.57.66 with SMTP id g63mr917435oia.346.1510946677199;
	Fri, 17 Nov 2017 11:24:37 -0800 (PST)
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com.
	[74.125.82.175]) by smtp.gmail.com with ESMTPSA id
	z96sm1919549ota.30.2017.11.17.11.24.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 11:24:36 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f175.google.com with SMTP id s12so2904347otc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 11:24:36 -0800 (PST)
X-Received: by 10.157.80.13 with SMTP id a13mr2010950oth.370.1510946675768;
	Fri, 17 Nov 2017 11:24:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Fri, 17 Nov 2017 11:24:35 -0800 (PST)
In-Reply-To: <20171117175142.2642-4-stefan@agner.ch>
References: <20171117175142.2642-1-stefan@agner.ch>
	<20171117175142.2642-4-stefan@agner.ch>
Date: Fri, 17 Nov 2017 17:24:35 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqEx2RMdxOy4Kj=QcEwCNf5PiAvK36wK_pVLM7aYv5bZg@mail.gmail.com>
Message-ID: <CAP9ODKqEx2RMdxOy4Kj=QcEwCNf5PiAvK36wK_pVLM7aYv5bZg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH 4/4] openssl: fix runtime errors with Thumb2 when using binutils 2.29
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
X-List-Received-Date: Fri, 17 Nov 2017 19:24:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 17, 2017 at 3:51 PM, Stefan Agner <stefan@agner.ch> wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>
> When compiling OpenSSL with binutils 2.29 for ARM with Thumb2 enabled
> crashes and unexpected behavior occurs. E.g. connecting to a OpenSSH
> server using the affected binary fails with:
>   ssh_dispatch_run_fatal: Connection to 192.168.10.171 port 22: incorrect signature
>
> Backport upstream bugfix:
> https://github.com/openssl/openssl/issues/4659
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 75D2E7CC96
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 12:29:39 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z19so10938541otm.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 04:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=2QeaY+/XeLcjCiGApv2AineGe2/c/RZWcJkiT0igYN4=;
	b=edOL4uPEoAA5kHMCL7ZqnEKPyZry/CcL9t6+DRDcsb/Ent39RqmGHG66c2f1JQuHli
	FWbqYk59XSGwt+NXubkaTfOAwXq2Z7BOa4zJ96z9y3RQ7ZgEbvn/E8lA5Fh3vrBT9ylj
	o2nZELx+SHmxFQKltxF+h157Lq/QgQaEeAUVmJl3FhGgwMsOcIe3AEsvyEtC45ppnlAY
	1VlP354pXS06HYdD30EKZtwBdS12glMABaYdx5S9SEfWVNvnUZ+G9ISOTtDuVW+FAXG2
	BlNRk0ZTHs7ojC6uOOeA53i5l8Fani3OLN7t/E2Vbhe5T4npE9P0tz2nupi9UMbr7dTI
	pWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=2QeaY+/XeLcjCiGApv2AineGe2/c/RZWcJkiT0igYN4=;
	b=F6wYLXdCNm8I3REq2p5dKXfH2aik0fkoPpNyvFO8iZS5sytem3pTAbgPv23HGaxXUo
	1vqNDdKLolpPgzINB2Q2MfsTkhxX+4BDzmx2tGdwCkNS0ReWPOUysRVNy+LXARNgm2Eo
	vuf0HSbyvUD7LfQBcg7zhzN79dP8aLkdvpsN4dJ9BulutbEtxkvblOuOl5avvnMTGtNG
	wyU9SQ7eN9QDPc4BOOcvzTVCSEcb74NKE9S7hMF+Gmd1m90kwqvC3FfEUH89R/A9K3xO
	2xy5T1XJDEz8IAKlJLuhlWLEwLxQB+KQev6TXmYYKcYPLZPboHlJDnu1Ek+tx+NGD1hL
	YsEQ==
X-Gm-Message-State: AHQUAubcAB+wFNo9TNkZ0OhDD7Zti7nDg4sjVj7FDxzvHICccwSTBswD
	DAQTrIA/USUZwyu6W3mc52kXw/yfcyjHng==
X-Google-Smtp-Source: AHgI3IYMfEHMayerohFG5mjvM5j9IdcTIH8cuTVkn5uLEDrbMW8YIAMDlwfVCthTuTDs4tmQyT5P3A==
X-Received: by 2002:a9d:7b4e:: with SMTP id f14mr9832901oto.141.1551184179911; 
	Tue, 26 Feb 2019 04:29:39 -0800 (PST)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
	[209.85.167.171]) by smtp.gmail.com with ESMTPSA id
	q25sm4705515otl.15.2019.02.26.04.29.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Feb 2019 04:29:39 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f171.google.com with SMTP id w66so10153882oia.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 04:29:39 -0800 (PST)
X-Received: by 2002:aca:54c5:: with SMTP id i188mr2258690oib.16.1551184178506; 
	Tue, 26 Feb 2019 04:29:38 -0800 (PST)
MIME-Version: 1.0
References: <20190226113559.9398-1-otavio@ossystems.com.br>
	<CANNYZj_XPzrqbSZ7_XmqkwhLYyMgJ_L5J8AUSkkFBjPf-U80mw@mail.gmail.com>
In-Reply-To: <CANNYZj_XPzrqbSZ7_XmqkwhLYyMgJ_L5J8AUSkkFBjPf-U80mw@mail.gmail.com>
Date: Tue, 26 Feb 2019 09:29:26 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo8P91Ex9Go+pvnphKVUaun3QOjnXwNJTemy4Apt-9ovQ@mail.gmail.com>
Message-ID: <CAP9ODKo8P91Ex9Go+pvnphKVUaun3QOjnXwNJTemy4Apt-9ovQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Tue, 26 Feb 2019 12:29:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Alexander,

On Tue, Feb 26, 2019 at 9:20 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> On Tue, 26 Feb 2019 at 12:36, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > We had a c_rehash shell re-implementation being used for the native
> > package and there is no reason to not use it as well for the
> > target. This allows it to be available without the need of perl being
> > installed.
>
> I'd rather not deviate from the upstream, and use what the upstream
> provides. Especially considering that perl version does have command
> line options that the shell version does not, and the difference might
> increase in the future:
> c_rehash [-old] [-h] [-help] [-v] [dirs...]
>
> If you really really can't afford perl runtime on the target, and want
> the shell version, how about making it a PACKAGECONFIG?

Well, the c_rehash has a specific use case and this version is
/already/ in use on 1.0 (for both target and native) and on 1.1 for
native. If c_rehash is not good enough for use, we should remove it
from native as well.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by mail.openembedded.org (Postfix) with ESMTP id 405896C491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:49:00 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id u18so1843251oie.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 07:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=qGSKVrMlRRIRB0kMjoM7u8ioSL+BNqJs6Jwep1mDL9Y=;
	b=RfQL9aaKzJSzg6/IfclZCjOUmcZe5AO77I7MxCOeO0v6KxuxOTpIRn8sjGpJEJl3jy
	DzWvvw3gJ6lMX7RLjNJBrxHN2c6uMZ623zfjy9n/V+eKJEjjUGsv2I8y4wbs0jrGmx5z
	n9jCG/F4EZnfSD/MH6VWBHMbAzFNmHBQWYpg6d3oMlpxuUtRgkENx7zVSSP6V7jrBep0
	P1ayS0nCgsCYxaAz6L5QV5MRZZDeva2nVCL6sYUTrGr92TTHWC5FxwEPUMjJihjjb0JE
	94hB2WJQh/zPORzZ/EZNRC4GpRDBM1PydZ4ew5Yq8C6/PtKT2sm4FVjrNae0sGYXVfVe
	buvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=qGSKVrMlRRIRB0kMjoM7u8ioSL+BNqJs6Jwep1mDL9Y=;
	b=e4PZLNu3Knn9IvCHXb2kxbdM+gyM6wRHLnWhD0KOipR6g2QMAyyH/DHgRNfLL5Iy+y
	sKroM/jnFDiPzjKUpBWTvPOgPbVqQ/byyuI/+nUMoi/rrewgOAcGBWu8LS6qz3iQtBi2
	6asmjNZoCKGkuTeXblddWSZr5KA64AUrMzKIDUkFB93kMbyOLboZ+2BOtwtB0xcGgJ1T
	xadbOaT+/ahZOUxSsZNmPzied1a1DWP8n5+zrMEy/olWlDzQVgYmJhi2s849QgSJyPwa
	qUWKFq2p0LkVXFO6k219xMvv+waEw4FHFWLIfQEn7ooLSowl504BXDH3wyHf04PsfpR0
	n8TQ==
X-Gm-Message-State: AGRZ1gKBFpJjYJVxPzexMJGzPI8U9B53GNMTmv4cQFzUPRtVwADd5B2m
	8l58S6Z1+k0IpH2JbZPYuMUDEXeyDsIC0JWh
X-Google-Smtp-Source: AJdET5drQCM23OY71bahJipSjNPzeQTcUW+SNhAraHYKWH9raCLJ2MT1trCCp/jwmOjbiirz/NidNw==
X-Received: by 2002:aca:47c6:: with SMTP id u189mr1423735oia.250.1542728939863;
	Tue, 20 Nov 2018 07:48:59 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com.
	[209.85.167.173]) by smtp.gmail.com with ESMTPSA id
	e45sm13869275otj.43.2018.11.20.07.48.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 07:48:57 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f173.google.com with SMTP id x202so1835601oif.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 07:48:52 -0800 (PST)
X-Received: by 2002:aca:1716:: with SMTP id j22mr1278614oii.19.1542728932253; 
	Tue, 20 Nov 2018 07:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20181119100443.2882-1-abrodkin@synopsys.com>
	<1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
	<20181119190835.GO11247@bill-the-cat>
	<CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
	<153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
	<CAJTo0LY=m+Y8HXgypQ0Jk0N1=ke6eopXjEOeYWNENJ83CJO8ZQ@mail.gmail.com>
	<CAJTo0Laecf+PnBPcg9qgHABvGwBEr+n7Sze3-OPp3OvbYBvJmw@mail.gmail.com>
In-Reply-To: <CAJTo0Laecf+PnBPcg9qgHABvGwBEr+n7Sze3-OPp3OvbYBvJmw@mail.gmail.com>
Date: Tue, 20 Nov 2018 13:48:40 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqKDfJ11FLoXFwRZ3ttw4v3NODWEQdB7RkCAzHq7DWPiw@mail.gmail.com>
Message-ID: <CAP9ODKqKDfJ11FLoXFwRZ3ttw4v3NODWEQdB7RkCAzHq7DWPiw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Tue, 20 Nov 2018 15:49:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 20, 2018 at 1:40 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> (hit sent too early)
>
> Of course how big are these tools, and is it really useful splitting
> them up?  If we're talking a 10k binary, is putting them in separate
> packages worth the complication?

I think it makes sense to split; we are building an embedded system
build system and granular installation is a must have. Using PN to
install all tools is a win win combination.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


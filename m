Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 502A475212
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 05:19:08 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id q17-v6so21101248otg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 22:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yfbl1dDCRorQK2SDy94yYlOi3gGQ+AQVkqXsXqu9N2s=;
	b=EvOoBqCk57smxKlLXxEx7zH38inPSZ2Jnpx28f7QWjYxVf77bxDXL7xUObSL4g2Eq1
	B6qBbUKtVJtX+xUpcnbeSAFjbBNr6lSzsnduKZShFkXedvGq82+9dmreFpE8nNWe3Zon
	FT3NiqlJq4XbhJ1hj/nzWdIYcwjvBlL6hwG5s7K6tAH1Wl2TGu8toKBYN1eK5Izn8ZBn
	pbcWhdQdkKwqUAF+lA2ae+6pjK7oiMMn/Off4pneA+qtS+P+qS8wm+Pm7qv7bFYeZoow
	JCRRhZgoXWW8iOcQ4SW2XOuMJgaInmW9pK8ime482LcjfAUCMB4Oy3j0SDta92LN/fqs
	XVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yfbl1dDCRorQK2SDy94yYlOi3gGQ+AQVkqXsXqu9N2s=;
	b=J21XJR54SIHez/zYR/Hdg5gpZoDz+ytDNYWjq/clHL+AyoMiURakfSbVowKZvoDVSm
	qr21qPstxHtD5i/zwaz6OhBSOfqSO3H/9OzyagZenO4IRhX4F9CUpuGcal7a688tzUKR
	YFdVqMov1UjqTK16wqLYk3dkwcLqc2dVDf+1kRMxnUcYDOf+1fERP4llsvTiDDzpTU4+
	s03Ryd2nh5Gpa6FjJrpbmnF3FZt3nx2TIUPlCY/U8ucXpJb4Iz+mK1y03GteGKcnRh8L
	S4fPJ0k37oy446F9eF4dVOOOjt9P7fuGncUA8qgct82YUI+8RP8cs4fjXBQbcEHOhl6C
	0Zxg==
X-Gm-Message-State: ALKqPwfqazDXZPHuMGUlHqPPbEa+zi5ydF8ur6SsnslDaWPw5Bdzojv1
	GqpJL3/wQL0+zBGRiezTwbP6CK7IGXUoxhXDP+jcVB6f
X-Google-Smtp-Source: ADUXVKIDX0xx/Vduk8O0iQoJARuwWkaGiOxgukynyJIPeBpC+ijMu2OxuDxvAzCNTeTa2KwoqmaDAGY75EjFBDBe3DU=
X-Received: by 2002:a9d:cd:: with SMTP id 13-v6mr9564469otk.155.1527916749234; 
	Fri, 01 Jun 2018 22:19:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 22:19:08 -0700 (PDT)
In-Reply-To: <20180601221440.29992-2-dev@sashko.rv.ua>
References: <20180601221440.29992-1-dev@sashko.rv.ua>
	<20180601221440.29992-2-dev@sashko.rv.ua>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Jun 2018 08:19:08 +0300
Message-ID: <CANNYZj8ZmdHAFix08WYXkLLJ1ZGf5pv8PAHqfR3B4GRHzM_n+w@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] iso-codes: fix SRC_URI
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
X-List-Received-Date: Sat, 02 Jun 2018 05:19:08 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-02 1:14 GMT+03:00 Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com>:
>  SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
> +SRC_URI = "https://ftp.osuosl.org/pub/blfs/conglomeration/iso-codes/iso-codes-${PV}.tar.xz"

The correct new URI is
https://salsa.debian.org/iso-codes-team/iso-codes, don't grab a random
ftp from google search results please.

Alex


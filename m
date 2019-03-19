Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id E54057CE22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 16:28:34 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id c18so18232736otl.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=PZ7lQbt2jj+cQ9YHLpHDTRJyq4QqdYOkKPlB6iJ8YJk=;
	b=QVyxczHKsRE8m+138h7x/jfXMzq4RRAOqg6CeQFCFkknrcv2nMtbonWN4PTskEw7S0
	cEH2U6lFh6kk6T0r0HISW2F0KtmE6OqBw/gH8t6ZJ8M1c7Vrn3OmXljo+eMcDW+P7yoV
	nT27HL8GnS82t3aKxfm/zZain8fnZ4+EtiTOn9O0dKnaebLPRVetJ9vlWJNcfNA7Bgnz
	Dqi8QA7UP4kdY9Mpo6l/W2ANmQ2xHAZPhdthLZ91vyxyZwCNrN1y48IYnYbUqN/gu5FR
	1IETlM3Mc5Cysy+qpV1hrF49GjM98IOS7Nc7eF2fTi2sl+PSmV1SIH3GYu1311ePz5ja
	r1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=PZ7lQbt2jj+cQ9YHLpHDTRJyq4QqdYOkKPlB6iJ8YJk=;
	b=D+Gu+6K94NUXFMU9sog/CgIXfjGBGXRVydQfN9QqkFxFFxs3czu5hOjG3SHcF7sDSI
	yTgoI6SpIp0oE14bIjwCsGD+593HVux3dmMEF2XOfeXOSsMZzbZAwnvAl1Cj9qA0B4mF
	ySdmtZOw0ccUVKKj+yvVn5gSO75h4Wp02lRkEILzbGzjCOO/z5060WNUXpIlumUv43f1
	BZJw2kgBrUUaP/7YM7DrkrUg81qa/ak2txIY+QJW0Uje3wKePIElU4phGrIU6O3l8WNm
	2onk/WmRLeocM5O7TAbJT1+Qjrzn5xNtqsmC4X1v2U+G+BCNHmtEMUfZpRsgeFr7Fb7e
	jQGQ==
X-Gm-Message-State: APjAAAXxoM4jWsIDla2OlxZ4FNMf2m9my1OjSbhS4NZ7rnBWYxo+x0se
	RnDbGQKozZGT5bRfNEeU4UErvwtBiHHo7g==
X-Google-Smtp-Source: APXvYqzrmx7SqbniQlDYHHewae1t8azeLlq3/bZh2czd3kCa7970tds+h6FA/dPAXd1Y45XdXuh3VQ==
X-Received: by 2002:a05:6830:1454:: with SMTP id
	w20mr4456686otp.190.1553012915225; 
	Tue, 19 Mar 2019 09:28:35 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
	[209.85.210.51]) by smtp.gmail.com with ESMTPSA id
	e138sm6150350oih.27.2019.03.19.09.28.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 09:28:34 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f51.google.com with SMTP id e80so13156782ote.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:28:34 -0700 (PDT)
X-Received: by 2002:a9d:644d:: with SMTP id m13mr2186848otl.22.1553012913883; 
	Tue, 19 Mar 2019 09:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190319135347.27444-1-otavio@ossystems.com.br>
	<AC4C6292-ED8A-4C78-AFD9-578EAFA37326@gmail.com>
In-Reply-To: <AC4C6292-ED8A-4C78-AFD9-578EAFA37326@gmail.com>
Date: Tue, 19 Mar 2019 13:28:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpD9npAsHGX60s2tSbnayf1EN8AYWjxxe=z1W6udKkMWg@mail.gmail.com>
Message-ID: <CAP9ODKpD9npAsHGX60s2tSbnayf1EN8AYWjxxe=z1W6udKkMWg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Upgrade 1.1.1a -> 1.1.1b
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
X-List-Received-Date: Tue, 19 Mar 2019 16:28:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 19, 2019 at 12:48 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> Openssl10 needs a similar update, can you do it please?

Sent.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


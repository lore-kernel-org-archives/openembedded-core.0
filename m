Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id C006679186
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 16:38:08 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id v8-v6so21882997oie.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 09:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dH73PELHNdLzJAnUcoQ9r20cmOrpp8sQHUNcHOHj5Y4=;
	b=iGIwrlochnXszkprwNIGBi4oVrDvorBaeccjcuS76BTfbujMzeMthL2U9x8E2c3P1p
	dtiLvPWOhGMsVG5ctTW52wEdIOGIc0OgHo3QV0DQH0iS9fT3R9wNDbPY7vd11k6lkJD3
	8+m9fe2jQT8/AcAlKaBf7kUMWxB9AnfXb9QLa/4a4M8mJlysEdMXJmbtKFfRe0KQQFFV
	oDIst2CDXxkcgGWqyus8rUs1zpZUJ18lgciW9EX+yh1ZbgfRiSXnkjFH8dMKa/Qa09vj
	f26ui/WyxvxP5do7v8UsDBDsWG5Rx4xNjpNg7yyETW4q87KwJU8QzVaCj7tKsUKJVTJd
	KSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dH73PELHNdLzJAnUcoQ9r20cmOrpp8sQHUNcHOHj5Y4=;
	b=Mo15Y6t350twj74/Id30UD+Qqjdy6PkIhDS4mSQiCBKVHafJzy21BYSyUggf9v/X8X
	6YlpuGcAxxleaM6yKEGj3U8ZCBVsqRzGKGBfQKCmfgQR8GxQcUWfgPymDqACUN0QToEL
	1pk2Hs0+ia21OK59cNW60yBhFTZ2f87Sg21Dnp0lUYWC+5fc0TAqQBV1t0zAfkW754Fa
	CzbCG6J7Sy+jvesniILpEtxFV7LbgItFrrof0ABN0EBQ+E1WXu0U0V19kv0IKw26Pt+/
	SVba0KH1WR8ZgOWODopqJaHD/Qj6S/bCklszXanouKxeG/yPk46teK1ZF3KR0x/Af3ZV
	LVow==
X-Gm-Message-State: AOUpUlGB8ih5+Z52bmIfRg4xuyCu0jTlPSPKyLMR0uYDulabjq9XzPcA
	kybjOtfrJUj0Cz/kWYl/AIyWmbnWuVfoiW4Dxlk=
X-Google-Smtp-Source: AA+uWPzmSNM+Fnv0sR3VW8BVefSaPmXAuKsJeCELCA34xvEMapyYOZaiynzZkl4Z1I24NopcLJDd7FjypN6OQv8NGJU=
X-Received: by 2002:aca:d015:: with SMTP id
	h21-v6mr11385022oig.142.1534696689827; 
	Sun, 19 Aug 2018 09:38:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90ed:0:0:0:0:0 with HTTP; Sun, 19 Aug 2018 09:38:09
	-0700 (PDT)
In-Reply-To: <CA+NJmkd2gUD6mgzOruaqN8y-upO9BVqt8bKbAd-nzKL4dnJbaQ@mail.gmail.com>
References: <CA+NJmkd2gUD6mgzOruaqN8y-upO9BVqt8bKbAd-nzKL4dnJbaQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 19 Aug 2018 18:38:09 +0200
Message-ID: <CANNYZj9wG5zVdAAQqyu=eXYo1d=1wY4XCWcpWK+Etod7_B9V-w@mail.gmail.com>
To: Isaac Nickaein <nickaein.i@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Specifying incorrect license in recipe
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
X-List-Received-Date: Sun, 19 Aug 2018 16:38:08 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-19 13:54 GMT+02:00 Isaac Nickaein <nickaein.i@gmail.com>:

> How such issues is prevented in openembedded (e.g. throughout review
> of new recipes)?

Basically yes. Note that we regularly find deficiencies in old recipes
as well. It's not the end of the world.

> Who is responsible in the cases that license is violated?

Obviously the one who shipped the product to the consumer, which is
not the Yocto Project :-) It's up to the OEMs or their contractors to
thoroughly review what goes into images and under which licenses.

Alex


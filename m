Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
	[209.85.167.174])
	by mail.openembedded.org (Postfix) with ESMTP id 574046C28B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 09:32:16 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id c206so17457790oib.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 01:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h+JyN5qLdM8TgREjpdoTZQ+YmHewO2rZgAjnAMrd4bk=;
	b=P2r5WzCcgQ6Z0wNgXYjLdYgyXUlPPotUBaEizFL/5AvJ0nQ3fF+Q3KPra2Qo93RVt/
	X++KxJjEoMTWERVHSpa1P5yEyQgHPazkE8t5yMoGn5SKtoFnq5mToMw40Q8hFqLvD4s5
	6Ma5QkslPLoeR0PjH7ez8VNFGxYTV3LVjv2FC6vlTvqCkWhqNnntxAYGsgaJpJ71wd+6
	kt9qKDaWOWM1X7bfg7l/SjSrWbopEEHSJlp0z7YZCAhnGiVM8VWeYCMazIAqg2UNj0Z6
	u6D2nWI5OJYHVPwVw6jD0Mody9PkCwBIt+tN0qiAyABW4wVZrDBt0NdzEJDEhKaLead8
	LUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h+JyN5qLdM8TgREjpdoTZQ+YmHewO2rZgAjnAMrd4bk=;
	b=ZZzfgd3JLYxX3wCepGBytrZnrleJSLYwR6Vb9rntEJcEVZYnDKgCm568DgRzb0IrVf
	hUtJ37hvNHSAGOMhCHOiNjxlsskeE3VqtzFXtVGFjjX40kEGUGM1OWOorAzIbR7pIcv2
	USIPWAbktT2riAhPoJl77mhpPiNYjGqlpoRwpljNGLDBwIWKWyOelZQ1qpz081YSiNRd
	b2iQfzUoCWVD0ZiVtibw4h14uk0R/C8jKLbiYz7N3uHq4FGaGP4RRm4PQbjqjkBBGaFV
	KLT0X5v9x7wbq+8SgA/YokSmnqMFWw4aHCvPohsAXNI0CRKAr1q5GmLpKgBIbybfHiC2
	jrfA==
X-Gm-Message-State: AGRZ1gID8qq0PEObSpeTigA14OC+hZCW2Vq16ZYiDpSIzr//11L+nFER
	gyacdbDy7hYbFAzEDYOiASOYTo6PnB3LupEQOgU=
X-Google-Smtp-Source: AJdET5eSes/HRfx+YvTTLS9STlnoLlnKn9SXD85wX41td4EDjO+f3HnQhm6Mp7vFD+cuUaHF9qiD9ZLwIgi0iNAYm9U=
X-Received: by 2002:aca:503:: with SMTP id 3-v6mr4538851oif.302.1542533537317; 
	Sun, 18 Nov 2018 01:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20181117144457.A7B74440002@auh.yoctoproject.org>
	<be32ec5d-9c69-0625-10a2-a32b587bc02a@gmail.com>
In-Reply-To: <be32ec5d-9c69-0625-10a2-a32b587bc02a@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 18 Nov 2018 10:32:05 +0100
Message-ID: <CANNYZj-0azx-FS8J8uT=tHWteoVyq5rUCyCeBv-+cqoB=HK2vg@mail.gmail.com>
To: marek.vasut@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] Upgrade status: 2018-11-17
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
X-List-Received-Date: Sun, 18 Nov 2018 09:32:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Nov 2018 at 22:42, Marek Vasut <marek.vasut@gmail.com> wrote:
> Is there any chance AUH will be fixed to update U-Boot properly, that
> is, all recipes at once ? Now it updates it partly and fails, obviously.

The issue is that all recipes include uboot-PV.inc (that carries the
git revision), and updating one recipe breaks the others. AUH relies
on devtool to do the upgrade, and devtool operates only on one recipe
at a time, so I don't think it's feasible. Perhaps you can take those
emails as a reminder to do the upgrade manually, or alternatively I
can blacklist u-boot recipes so that auh skips them (but then you have
to remember to do the updates anyway).

Alex


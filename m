Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 87BDA7665F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 11:42:49 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so173234146pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 03:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=1OVNfZP01bj9+X1ayOlp1cGNVL6mBGTFX3zBpPmd61g=;
	b=fAjOoYHCMiUYi3WS7EDoN9jqaAtsVQekAcO7ncZys51HYky6gzpg8n46yCSVI3c5JY
	FXsSgeAqJunbU3VrtBr5P+0PrRGhy8IYdzR97swVYrYfpykqI65UcgFGd/UBs9bHXJO1
	JqjXxGGPEAMywWiJVrf9NsWxGKllx/LLlUIZtHwRwnT6WqJv6O82u24wfGEmg8FaSIts
	qTFyp2mimCNxQ2FGf1EEJja8nAlgoAkQUi4aQ46opyg49xMOcgaM9LcZzbMqt3s8l8Yt
	b6zlZCwTACFwcqthg8qTB9oSgVoVSoUu0azRxLf9bFfY1TP8IFHr37KPjnzfwslGCDZz
	bo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=1OVNfZP01bj9+X1ayOlp1cGNVL6mBGTFX3zBpPmd61g=;
	b=AwtjQLrs3t0OnoNbAUpN8viXKjN4nDYTTLrqG6LYhYvUk7O1ER5hEgzZkeFWl9D1Pt
	lUVqQweL1yTV0b6H1Ir9zazEMkEsrnn9xWndrAiCzByTTFAgyTt40ubeo4UFmqS8pt0O
	LryoowYEk+zK9PZj0Y+yoQpVnrgdoR4S4+JWgNCzhMOfppqtbFU8aO242oola9F5WJRO
	54T8qfxQScAp6KLzF9VoIDt6aHmlFME0jNaTwdtpjIHtPFFyBdeqO/ABt5KrTmIgC1pu
	uvrVE3zoQgwnUaqyP+AKvWvb8qVER/+GzuRT/LVaqjS0isf2fn5iN/YMwRqMofG8VcEN
	qewg==
X-Gm-Message-State: ALoCoQlRz3gfUSOioNLRxK4dR7+Z++2J3W1MDFMzV2Sf/PfkY5E5QPrDdqzb2uAwKmdFxjei8LEJ
X-Received: by 10.66.155.74 with SMTP id vu10mr21437176pab.80.1447674169592;
	Mon, 16 Nov 2015 03:42:49 -0800 (PST)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	qn5sm36232601pac.41.2015.11.16.03.42.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 03:42:48 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabfh17 with SMTP id fh17so175654287pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 03:42:47 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.68.228.228 with SMTP id sl4mr53270570pbc.51.1447674167499;
	Mon, 16 Nov 2015 03:42:47 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Mon, 16 Nov 2015 03:42:47 -0800 (PST)
In-Reply-To: <564661AB.9040201@mentor.com>
References: <1447432009-9129-1-git-send-email-otavio@ossystems.com.br>
	<1447432009-9129-2-git-send-email-otavio@ossystems.com.br>
	<564661AB.9040201@mentor.com>
Date: Mon, 16 Nov 2015 09:42:47 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrR+6G7tCZQNukw11yKGbxhB=FUEe53=n3KGgXUu9s5YQ@mail.gmail.com>
Message-ID: <CAP9ODKrR+6G7tCZQNukw11yKGbxhB=FUEe53=n3KGgXUu9s5YQ@mail.gmail.com>
To: Nathan Lynch <Nathan_Lynch@mentor.com>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Mon, 16 Nov 2015 11:42:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 13, 2015 at 8:18 PM, Nathan Lynch <Nathan_Lynch@mentor.com> wrote:
> On 11/13/2015 10:26 AM, Otavio Salvador wrote:
...
>>  S = "${WORKDIR}/git"
>
> Does this recipe need a PV assignment now?

Agreed; I sent a v2 with this. Thanks for spotting it.

> Also consider folding in
> http://lists.openembedded.org/pipermail/openembedded-core/2015-October/112087.html

I think it applies fine, I can add it to the serie if Ross prefer
though... Ross?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


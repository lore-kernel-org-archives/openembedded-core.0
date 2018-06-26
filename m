Return-Path: <nick83ola@gmail.com>
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9EE6076F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 12:57:52 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id c15-v6so18918528otl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=j1IX5j/KDRJOUHV9+3Q4YOc5jhPvgtnc1ZWL9UW0524=;
	b=kaU03pAUDbCWKAbjclTKAKciuvpOvCdHwYC0+6t+huabYFHTCOPd7k+er/BB8SNMr+
	vKFvjV175+VbF1zDab+N5eKWdBiaac3W/45AdkbtgAmU/lcTeEyWWo/MIX520p0swNbP
	o30ZcTYXkFur9CfPVJI7GXhJ4wleQKfWh83JksfEL2pKjvJ80oMv0H+hqh7GNLSo/Q0O
	OFT6UaWOR9HVzFD6d0sdaojSEaB+oWnSv2z4jDw6DDuJGmHM+NFt3nrlq68CF/WLTKvh
	xPpf6RGVE8E7ZxsDWiB71KpV8NlOSsCKX/T4xJai2Mzz09q4Xf0kRtVvDn3QoFM50Xz7
	DfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=j1IX5j/KDRJOUHV9+3Q4YOc5jhPvgtnc1ZWL9UW0524=;
	b=ck3idtD6SNgb7ubWcCHVxaLlaZ+wFWm2p3DjZD/splrwaXhcOmk/Z1GxMNAXkl4AaZ
	QQTJmrKuWMc1mjhwYIrXz3zh7/PLsAXB7+l8//51Hjm2M6JbKZfDHnkfNvvb7qMoEPF1
	726/HYW7M9KaNJhUUiE+omCTPDjf3AWbh0Jh5m66fHYhGbtSN32Jwr1kKYFGWggkWr9j
	HAH/JZTxGj0ufFcmM/I/B42GExLBIfosdKgvBbX+3mf88BYp/l0C9TPwqw20KTXNnGnG
	INwhg+lCFhTdZ5EeZWzI0toZEfSL0t33Y8FYxEXw2k7UbJn6IYI5tSZzQoOlBYzoLt81
	0pFA==
X-Gm-Message-State: APt69E1KDgDX7ZV1rx7Za9iCxb54KNHuQnhGUgCLE1Xt7w1QbwetjyC0
	FBBg7v95TIFOFREMdXl4Pxc4zeUf358tVg2YW5g=
X-Google-Smtp-Source: AAOMgpe7h/bB020foYFqLKCLft6U8bHmzn4hnws44GKt9azsFElBrb/v9d2LbJmZ0BkK93lJlU3qwR4k61HmiIbWYRM=
X-Received: by 2002:a9d:4e12:: with SMTP id
	p18-v6mr835004otf.260.1530017873252; 
	Tue, 26 Jun 2018 05:57:53 -0700 (PDT)
MIME-Version: 1.0
From: nick83ola <nick83ola@gmail.com>
Date: Tue, 26 Jun 2018 13:57:42 +0100
Message-ID: <CABPh3UMZTQwbOhJc0MN9HOg4hThYqG5tcg-sS7OhFjbgrPAhww@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [HELP] ptest & ptest
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
X-List-Received-Date: Tue, 26 Jun 2018 12:57:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I have a python3 package that launch a py.test test suite from
setup.py and I have created a recipe for it using setuptools3

Anyone has some hint about how to add a ptest target to run the tests
into the final image (or better in a qemu test image)?

there are some recipe/documentation that I can look at about creating
-ptest target for python packages?

Regards
Nicola Lunghi


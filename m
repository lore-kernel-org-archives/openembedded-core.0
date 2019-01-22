Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f47.google.com (mail-yw1-f47.google.com
	[209.85.161.47])
	by mail.openembedded.org (Postfix) with ESMTP id 739586BDC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 13:06:14 +0000 (UTC)
Received: by mail-yw1-f47.google.com with SMTP id t13so9336305ywe.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 05:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=SyBguXk/dd85mpWlcm8kivuhM7uIbyjRoNdozIUIgjU=;
	b=S0UrO4TshCdZrmzCkY/t1CrfwM0QBtTHGzQ8umlzlQOlozTP9h3qPCyPYPLgsqNoFd
	zbh2I5zdpgZzwRRnFJWxeS1Jlpa1On9khkPtuHE8rRRAb3k/11QS2IkaLGzWerLxWIOc
	8BeR4X2zKT1B1iLTg5+dMILsNQkPCGx554OJzbRT+xs9io61tC2bt27hD6Jb7j6+oUIL
	v6gIZNwuoIibKzRqtu4gTx/t+7LJd/YIGyWXCARDStvC2guc9JwN+JoP5YvFgYYp5NB1
	gCeLem3Dhe5z05JWzflO9rC2J6BOnVzqpSQdaXPdJB/DjK0B4c7fJcyHYgLunRLA2GYp
	tKPw==
X-Gm-Message-State: AJcUukdVT90gWd2FkUj9Se8YBz4v8YHkHLBbakYdWqX4oavOacxD9vrb
	c7QOMX/pnDNWmH9seJ7MRYJ5cTmy
X-Google-Smtp-Source: ALg8bN7aeG5aggLcDRNLuMEOX0q3GQmmFUHiCqfuTzUSkO2sGIjj7XDsFnWjDh7o4y9iVSjPR1JhaA==
X-Received: by 2002:a81:a054:: with SMTP id x81mr32426840ywg.293.1548162375139;
	Tue, 22 Jan 2019 05:06:15 -0800 (PST)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	r20sm5953860ywa.13.2019.01.22.05.06.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 Jan 2019 05:06:14 -0800 (PST)
Message-ID: <88612759fcbff8ec983740eb130002e604329aa1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2019 13:06:12 +0000
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: sstate siginfo question
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
X-List-Received-Date: Tue, 22 Jan 2019 13:06:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I am hoping to optimise some network traffic here a little by reducing
sstate upload to our central server.

These might be stupid questions on that subject:
* Are *.tgz.siginfo files without a matching *.tgz useful to be shared
  (uploaded to our centra sstate server), or is there no point?
* which siginfos can be safely avoided to be uploaded? I'd assume all
  *_rm_work.tgz.siginfo
  Any others?
* Can such an approach be feasible?


Cheers,
Andre'



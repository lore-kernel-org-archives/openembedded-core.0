Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id A4ADD65CD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:31:53 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s6EFVlND004995
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 17:31:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1405351911;
	bh=3snb9P9n8kz2qiqYLhbfsF1Vd/eB/+umOONm4y/FvRA=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=P25tqFOyWdJp08rAlL4t05BSmSeJ81K69DkYFFdXwQWmBh5IJCwkwHHzOrJkH521G
	8ZcFuR0wP7rOk4z9pgnE+Bl8rKY2FTRHVD1/2McDq2PMLbXUp4CXWToT3y7ZOE8cPA
	Ho2YBdp5+quFv9WTqOmT7vUhls2Yq3qCWkmUHB6k=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s6EFVg2r017304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 17:31:43 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1X6iEA-0000ug-40
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jul 2014 17:31:42 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1405349203-32702-1-git-send-email-jatedev@gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 14 Jul 2014 17:31:42 +0200
In-Reply-To: <1405349203-32702-1-git-send-email-jatedev@gmail.com> (Jate
	Sujjavanich's message of "Mon, 14 Jul 2014 10:46:43 -0400")
Message-ID: <lyzjgchs81.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH] python2: Add PACKAGECONFIG for tkinter to support tk from meta-oe
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
X-List-Received-Date: Mon, 14 Jul 2014 15:31:57 -0000
Content-Type: text/plain

Jate Sujjavanich <jatedev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

> +PACKAGECONFIG[tkinter] = ",,tk,tk tk-lib"

What do you want to reach with this?  Afais, build is not more deterministic
than before and requiring both 'tk' and 'tk-lib' when 'tkinter' is *not*
enabled does not look sane to me either.

You probably want something like

| PACKAGECONFIG[tkinter]="--with-tkinter, --without-tkinter, tk tk-lib"

although I do not know/checked whether '--with*-tkinter' is supported by
python's configure script.


Enrico


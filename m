Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 4971B6D6EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 16:12:46 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	rAEGCjU3011344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 17:12:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1384445566;
	bh=KGahetDj9QupKOBRMxLZym8eC/i57wjgkANKxa60EYo=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=WkCjKWMTzzlrOpjqUa7/4OOIvjzJ2nhPYoNnmB7lzSEsq5JOBvGwBXR6dqWH9Gdnw
	ThgtLEBMck3G5k6NH4VvO18IGJ5ecBAX5ug6vc3orGDubp3xUhheg7wexKS7FHXQXP
	0xleXHqoxQlxwxpb4Tke5z+zEnGz5W5wYaz4n218=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id rAEGCfra002300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 17:12:42 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VgzX7-0003PF-38
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Nov 2013 17:12:41 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <CADV-EXEyxDZQowU8EdGFJbFbg-muYTPZACTzq_m8D7ubHe-Vfg@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 14 Nov 2013 17:12:41 +0100
In-Reply-To: <CADV-EXEyxDZQowU8EdGFJbFbg-muYTPZACTzq_m8D7ubHe-Vfg@mail.gmail.com>
	(Yevhen Kyriukha's message of "Thu, 14 Nov 2013 17:27:05 +0200")
Message-ID: <lyk3gbm07a.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -3.3
X-Spam-Level: ---
X-Spam-Tests: AWL, BAYES_00, CHARSET_FARAWAY_HEADER, DKIM_ADSP_ALL,
	RP_MATCHES_RCVD, SPF_NEUTRAL, DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: =?UTF-8?B?UmU6INChb250aW51b3VzIGtlcm5lbCByZWJ1aWxkIGFmdGVyIHVwZ3JhZGU=?=
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
X-List-Received-Date: Thu, 14 Nov 2013 16:12:48 -0000
Content-Type: text/plain

Yevhen Kyriukha <kirgene-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

> But if kernel building completed successfully then next time when I
> run bitbake it starts rebuild.
>
> My previous version of bitbake and oe-core are
> 565b3e31e0226c6e193ee0b031bd5e7bef25591e
> and ae28ee3f7a060b9e0d13154a84f2444a98490b5b respectively.

git revert 8308e22a44a2dea7d1bbfb429b9df9c63714a649

should fix it



Enrico


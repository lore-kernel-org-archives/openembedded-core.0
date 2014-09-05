Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 02FCE71403
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 10:21:13 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s85AL889019341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Sep 2014 12:21:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1409912472;
	bh=Cfhu4oXgrCBbqK3NhueT5ErVkFvvrKN/t7Mb1dyhuP8=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=fyidBmaRHb4AbtWYBRZ2eMleUyiZEmR1zmmdRf21XdG5DCJhvjmMj5qXjY7tab5vp
	CUeZeKmoV/ctsmacPIZgqNg67Et+dx/VYpYIAoV8bKr95aVU1idlU4+RD615nB1Hi2
	nyL3WhgPqSL0B8MWpPaRVfhKL5Xj2RelZ7QCwrjQ=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s85AL3s5030001
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Sep 2014 12:21:05 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XPqdZ-0006ap-F9
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Sep 2014 12:21:02 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<c57d855c12c783cdfa52f304e52fc2fd1267dd96.1409655125.git.Qi.Chen@windriver.com>
	<5408BDC6.2060006@pabigot.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 05 Sep 2014 12:21:01 +0200
In-Reply-To: <5408BDC6.2060006@pabigot.com> (Peter A. Bigot's message of "Thu, 
	04 Sep 2014 14:30:14 -0500")
Message-ID: <lyoauufjw2.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH 01/26] systemd: upgrade to 216
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
X-List-Received-Date: Fri, 05 Sep 2014 10:21:18 -0000
Content-Type: text/plain

"Peter A. Bigot" <pab-VfDNNZTKYKBBDgjK7y7TUQ@public.gmane.org> writes:

> Maybe systemd-networkd and its constituent pieces need to be pulled
> out as a separate package?

Yes; I think this is necessary.  systemd gets larger and larger with
each release and is providing functionality which is either not needed
(logind, the network stuff, nspawn, nss modules) or which is solved by
other parts of the system and is conflicting with them.


Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz


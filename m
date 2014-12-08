Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 7E37865E1A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 11:52:09 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sB8Bq6IZ013728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Dec 2014 12:52:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418039528;
	bh=73QKr/rPvsvLN3DiehiAS2J11GU8c9DkDi9jEMrg40k=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=NE5A+wIKa+G/y2CPQ1C1JVA9A5WtojDG5IGDlitBZ3qDJXEodHGewy1iQ0ptzlZBA
	wwykj6mfzKq+avgyuptrwayEJdAFoHRZLXVR63bC22tNWvPxewKREyPIeE+Q5xc3+o
	pPCgQMB6D4euKEN3ziMbJ2sS4Fte2huRxKdLvtHw=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sB8Bq2fs026359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Dec 2014 12:52:03 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XxwrA-0005LG-Ru
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Dec 2014 12:52:01 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1417812364-14923-1-git-send-email-ross.burton@intel.com>
	<C1929A84-C95C-4584-B64F-D09C7F71D656@dominion.thruhere.net>
	<CABcZAN=y7exSY-8x=iXo_-g9nL5zzRL3yYSa+7NR0m11fwmGOA@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 08 Dec 2014 12:51:59 +0100
In-Reply-To: <CABcZAN=y7exSY-8x=iXo_-g9nL5zzRL3yYSa+7NR0m11fwmGOA@mail.gmail.com>
	(Christopher Larson's message of "Sat, 6 Dec 2014 18:38:32 -0700")
Message-ID: <ly388q5pgg.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH] dtc: don't use autotools as this doesn't use autotools
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
X-List-Received-Date: Mon, 08 Dec 2014 11:52:20 -0000
Content-Type: text/plain

Christopher Larson <clarson-ZYzTKstmaoRBDgjK7y7TUQ@public.gmane.org>
writes:

> The problem with that is DESTDIR is an automake convention.

Not only automake, it is part of the "GNU coding standards" (--> info
standards).


Enrico


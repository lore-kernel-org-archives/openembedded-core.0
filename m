Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id CDB6F60B9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 15:26:32 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s0AFQR8f001184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 16:26:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1389367591;
	bh=RRZrWyDvyQkrpJ1NWFqkLbny7FpRTQ2Hxnk/Q4ISews=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=WQj3/7Q4NKysoBg8BipLFtFUGYsHVq4O3/tY7j4BrEseNlLcdOHkQG5XK402eIKwh
	pr/6a+nhTUebuDWAc/QRJZDYEpOWrd9deCFvSPNoYTjcwTszGlqVOqQkfteWPh9tHx
	YvdFAn21hV/seMS9iBVeX2M8Q1VJ5AleoIcE/fKI=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s0AFQMsd009317
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 16:26:24 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1W1dyY-0007Ah-8s
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jan 2014 16:26:22 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1389365909.git.anders@chargestorm.se>
	<8da3468e95268dad80132de5e8398c7491cc7b71.1389365909.git.anders@chargestorm.se>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 10 Jan 2014 16:26:22 +0100
In-Reply-To: <8da3468e95268dad80132de5e8398c7491cc7b71.1389365909.git.anders@chargestorm.se>
	(Anders Darander's message of "Fri, 10 Jan 2014 15:59:01 +0100")
Message-ID: <lyeh4fyi1t.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.0
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: Re: [PATCH 1/1] terminal.bbclass: do not export PS1
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
X-List-Received-Date: Fri, 10 Jan 2014 15:26:34 -0000
Content-Type: text/plain

Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org> writes:

> With a complex PS1 setup, PS1 might not have all characters correctly
> escaped

I think, this must be solved in other layers (bitbake?).  Using
'pipes.quote()' seems to be a proper way to escape things correctly.


Enrico


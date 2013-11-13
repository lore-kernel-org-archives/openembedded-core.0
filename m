Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id C4B436D39D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:02:21 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	rADE2HCY027795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 15:02:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1384351338;
	bh=jUSB1HlZeAiI0ZblAl4oUlIO3VoADumfd9/jCllZOhk=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=a5/7saTIB4NXkRYssmHJPKWCmPVubZhqJ/bQBhhG7QQvBVxiu+nE2jpKkmAtZQ/2u
	8Xng6jFscFfztWaxx/ferNRCUfA3o76XaupRuj/QLuTKoZeUFa8HEkTd4gSvmXgfZx
	s1Gp3hysDOuJX+GILgflY4T323OAJjuMEJm1WrRI=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id rADE2BW5006672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 15:02:12 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1Vgb1G-0001pc-UC
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Nov 2013 15:02:11 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1384270308.6460.11.camel@ted>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 13 Nov 2013 15:02:10 +0100
In-Reply-To: <1384270308.6460.11.camel@ted> (Richard Purdie's message of "Tue, 
	12 Nov 2013 15:31:48 +0000")
Message-ID: <lyppq4z9gd.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-Scanned-By: MIMEDefang 2.74
Subject: Re: Confusing Performance Numbers
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
X-List-Received-Date: Wed, 13 Nov 2013 14:02:24 -0000
Content-Type: text/plain

Richard Purdie
<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
writes:

> I had some ideas I decided to test out. Specifically:
> Its very hard to figure out what in these tests might be noise and what
> if anything was a real gain (other than the disk usage improvements). I
> suspect the hardlinking patch may be worthwhile, the other two are
> perhaps not useful.

fwiw, we record performance data as part of our normal build process and
it should be possible to compare these statistics.  Results are e.g.

             https://www.cvg.de/people/ensc/metrics.txt.gz
             https://www.cvg.de/people/ensc/metrics.html

(there is much room to improve the visualization; a new colleague just
started to work on it).  Relevant changes/classes are

  https://www.cvg.de/people/ensc/metrics.py
  https://www.cvg.de/people/ensc/elito-metrics.bbclass
  https://www.cvg.de/people/ensc/0008-build.py-fire-TaskFailed-with-same-environment-as-Ta.patch




Enrico


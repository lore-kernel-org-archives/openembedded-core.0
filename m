Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 977436B8D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 10:03:49 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s5DA3j0t019582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 12:03:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1402653828;
	bh=xqF8K+RY2zw5NJMQB4LjM99jMVBrCsR8d7z/wQ7OAlI=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=jWEC/z0yRywQ+gVZyRpYmO7KMfKlIf1tfCDJMQxChxataEZBs39XQepNXTXpbRkb1
	BNg5a6VQDEPBwer8IccegpGIJRB0qK5pWa9ndevnWo2Eoz6A00MlyIlza8hQJohkHv
	ZHqXuKMxRouRLfHUVch2VIB4CXEl/ZMbGKmBD6m8=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s5DA3dYf002841
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 12:03:41 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1WvOKc-0002Oq-2Y
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jun 2014 12:03:35 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1402580166-30993-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<5399CB3A.3020506@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 13 Jun 2014 12:03:33 +0200
In-Reply-To: <5399CB3A.3020506@windriver.com> (Robert Yang's message of "Thu, 
	12 Jun 2014 23:46:02 +0800")
Message-ID: <lya99h86tm.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: Re: [PATCH] openssl: install files in ${libdir}, not in ${base_libdir}
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
X-List-Received-Date: Fri, 13 Jun 2014 10:03:55 -0000
Content-Type: text/plain

Robert Yang <liezhi.yang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
writes:

>> ${base_libdir} is not in the search path of -native binaries and they
>> will try to pick the wrong openssl libraries.
>
> Hello, I don't quite understand this, why it doesn't search
> ${base_libdir}, please ?

good question... When I wrote the patch a month ago or so, git-native (the
http fetcher afair) failed to run because it did not find libcrypto.so.1.0.1g
(system has ...1e version only).

I cherry-picked idea from dd05e06b89906002f68d616a6326c962e725bc54 for
openssl then and things worked.

But I can not reproduce the problem anymore when building from scratch
so this might be a temporary or local problem only.

So, this patch can be dropped.


Enrico


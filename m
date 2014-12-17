Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 9D92872651
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 10:22:06 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBHAM2gh018407
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 11:22:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418811725;
	bh=ILJb1DtYeEOW1HATLa5XSGeqZS/VbSDq/JmL+L0R86g=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=C+QRadSWIVBA2jS4gPQgs+4Epb39Nx9bp+kiIkSRGoF2fy4SVCH0xh4LKmjYs/Egp
	rZ1QlotsV1UjcBBnTJGtybCeI3LQ+2BT6ZodxD/LiVC8li6OJ9EgSC4GvsMg3SeVNj
	8jUu8bVI9hxLfy+5gq1OBqolYkDtO7NzIE0efTpM=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBHALwEd030974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 11:21:59 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1Y1Bjy-000551-4P
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Dec 2014 11:21:58 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1411894750.git.Qi.Chen@windriver.com>
	<e8d9350d5e90ff8b13ab18cd0ec0c868e7cc7f9e.1411894750.git.Qi.Chen@windriver.com>
	<54914F06.3030405@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 17 Dec 2014 11:21:57 +0100
In-Reply-To: <54914F06.3030405@windriver.com> (ChenQi's message of "Wed, 17
	Dec 2014 17:38:14 +0800")
Message-ID: <lyk31qa856.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
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
Subject: Re: [PATCH 1/1] dhcp: fix for systemd service file
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
X-List-Received-Date: Wed, 17 Dec 2014 10:22:17 -0000
Content-Type: text/plain

ChenQi <Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

>> 1. Set Type=forking for dhcpd.service to make it start up correctly.
>> 2. Add PIDFile=/var/run/dhcpd.pid

why forking? Starting dhcpd with '-f --no-pid' should chose the more
simple non-forking variant without a clumsy.pidfile.


Enrico


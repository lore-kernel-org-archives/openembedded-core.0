Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id ADBD67318D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 15:42:24 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7VFgMim006712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 17:42:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1472658143;
	bh=Zw213WYTv+EEyRUyn9BqPJ2YcHbEjxIJJ2SC07Bi/EM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Sender;
	b=GXkViqE0yYMXLgk6CD2m1mynNoKurcU7BssGWEvhw4ZVDvv3a8SdZ45C7Zc20pg8W
	cp4tXIEozAhkHlfPQW0G7QfySABsmUJ8S3J0EOyLF/LxV3KT/P2hd6rBBT3voj1Mfq
	+fFk3XPsOgWPbeSMCAMX/ZJ4rdmejO9x2yzsQ9X4=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7VFg52m008079 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Wed, 31 Aug 2016 17:42:05 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 8662E442F34;
	Wed, 31 Aug 2016 17:41:42 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7VFg3FW008076
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Wed, 31 Aug 2016 17:42:03 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>) id 1bf7eN-0004Fb-5X
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2016 17:42:03 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 31 Aug 2016 17:42:03 +0200
Message-ID: <lya8ftx7w4.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.0.95 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.5
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Subject: Replacement for tslib?
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
X-List-Received-Date: Wed, 31 Aug 2016 15:42:26 -0000
Content-Type: text/plain

Hello,

tslib is more or less mandatory for resistive touchscreens but it was
removed some days ago.  This breaks e.g. meta-qt5 layer which depends on
it.

Is this removal really final (which would be really bad, because resistive
touchscreens are used e.g. in industrial environments)?


Enrico


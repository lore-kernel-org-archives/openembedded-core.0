Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 742B961883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 12:34:27 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r71CYRCV029869
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 1 Aug 2013 14:34:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1375360467;
	bh=81j34rkn/BKMG7/tE478TzrhOtPtVKjuDHHvQ99RLzQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=nV8+N1NBAJnzdXE7jPdgMmSnDmfT4/R2/uX2DUOV3ox6EsIe77PHb47yHlJ6i5fzI
	nNg/gL9c7w9bS8kXReb5J4OUwqCKySzk8s9gcdRYtEfdBwf4Wc7o37gPYFD1PJvSsb
	m43Q/dCeVd93GcvogUIRMBYYdvCavGVhxJlxgqww=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r71CYNgJ022024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Aug 2013 14:34:24 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1V4s5H-0002LC-DE; Thu, 01 Aug 2013 14:34:23 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1375357402-10147-1-git-send-email-muhammad_shakeel@mentor.com>
	<1375357402-10147-3-git-send-email-muhammad_shakeel@mentor.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 01 Aug 2013 14:34:23 +0200
In-Reply-To: <1375357402-10147-3-git-send-email-muhammad_shakeel@mentor.com>
	(Muhammad Shakeel's message of "Thu, 1 Aug 2013 16:43:21 +0500")
Message-ID: <lyk3k5wpww.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: muhammad_shakeel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
Subject: Re: [PATCH 3/4] rpcbind: Add systemd support
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
X-List-Received-Date: Thu, 01 Aug 2013 12:34:28 -0000
Content-Type: text/plain

"Shakeel, Muhammad"
<muhammad_shakeel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> writes:

> +++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
> ...
> +[Service]
> +Type=forking
> +ExecStart=/usr/sbin/rpcbind

The '-w' option, perhaps '-f' (--> 'Type=forking' can be removed then)
and a general way to add local options would be a good idea.

-->

| EnvironmentFile=-/etc/default/rpcbind
| ExecStart=/sbin/rpcbind -f -w ${RPCBIND_ARGS}


Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz


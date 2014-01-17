Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id BEB8F6AE73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 11:57:48 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s0HBvjWs028090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 17 Jan 2014 12:57:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1389959868;
	bh=x4xx2T1rw7NjjHzmt5DaCBusMLSOaQVhvpzFxhpFmaE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=iFYwYNQKIwVngOTqvHUAy7SYuYYi/g46HAXgU0mJI4YdA/vOqkBlcMFjAjhdutsEy
	jCXv25MzdvO+SD9s0dfTeJG9eSzN5lref1RJ+UbEJ1p/wB6ReWEdK4kv+WzHj5BdgK
	7EynTXTOefqCgvn6IGzAyff+pr6Wqh+5cUudZ+Bs=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s0HBveVa029669
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Jan 2014 12:57:42 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1W483Q-0003Ex-KT; Fri, 17 Jan 2014 12:57:40 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1389941136.git.Qi.Chen@windriver.com>
	<ebe4c661db437203a8120ba13ed7b1ae1275c9b3.1389941136.git.Qi.Chen@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 17 Jan 2014 12:57:40 +0100
In-Reply-To: <ebe4c661db437203a8120ba13ed7b1ae1275c9b3.1389941136.git.Qi.Chen@windriver.com>
	(Chen Qi's message of "Fri, 17 Jan 2014 14:46:34 +0800")
Message-ID: <lytxd2yg5n.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.84
X-Spam-Score: -5.1
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: Chen Qi <Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH 1/5] systemd: add 'less' to its RDEPENDS
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
X-List-Received-Date: Fri, 17 Jan 2014 11:57:50 -0000
Content-Type: text/plain

Chen Qi <Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> +# less package is needed to correctly display the contents of 'journalctl'
> +RDEPENDS_${PN} += "kmod dbus util-linux-mount less"

please make this an RRECOMMENDS; people can set 'SYSTEMD_PAGER=' or pipe
the journalctl output and do not need 'less' then.



Enrico


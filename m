Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 6B00B6FD62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 13:45:50 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s5IDjlHv017368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 18 Jun 2014 15:45:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1403099150;
	bh=Xs2cjspdOzxxsHrHlPazpnYb70qAcznUBFKL7xmfSVg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=Pna33rvgTpWpKKwpKFJfgfVqZYimpr4KWD1w9ZyOJlPqhdyiPDDbjrrl2unTyselc
	71S3leFjvuf/4CcBDRLS2I/jViC4E3g0Ld7iriFnLHuEef2FyS7vJfN1Y9j+wT/uo7
	qA4fimM8XVRcEUjrIXbepDafgmckcUUbb3J2Uvlc=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s5IDjgM8024940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 Jun 2014 15:45:44 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1WxGBK-0001Iu-BV; Wed, 18 Jun 2014 15:45:42 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1402926503.git.liezhi.yang@windriver.com>
	<279354682d9d0a74f99d0ed601f745c48963a079.1402926503.git.liezhi.yang@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 18 Jun 2014 15:45:42 +0200
In-Reply-To: <279354682d9d0a74f99d0ed601f745c48963a079.1402926503.git.liezhi.yang@windriver.com>
	(Robert Yang's message of "Mon, 16 Jun 2014 06:49:18 -0700")
Message-ID: <lyfvj2s54p.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.0
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: Robert Yang <liezhi.yang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH 1/3] systemd: check IFLA_VLAN_PROTOCOL
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
X-List-Received-Date: Wed, 18 Jun 2014 13:45:52 -0000
Content-Type: text/plain

Robert Yang <liezhi.yang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
writes:

> ++#ifdef IFLA_VLAN_PROTOCOL
> +         [IFLA_VLAN_PROTOCOL]    = { .type = NLA_U16 },
> ++#endif

This will trigger everytime because IFLA_VLAN_PROTOCOL is an enum, not a
#define


Enrico


Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4276CA74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:54:19 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r9MEsBMh029909
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 22 Oct 2013 16:54:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1382453652;
	bh=1UKsv4wzAomhVAnLv2I4PTjLH5upg0/UWV15X9U366w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=TQothnJggEOB86OSsFxw62TiEm+Oud8TemfkEG4VTFH12uWi9Tse0UjQJ8C2C6Jkq
	HmoR/9zQtSPrMLe9FuRgdvh1T4V9TczaTWrS7kmt45VizR1M2yMCWEXT//XiDclIbe
	vUKYPx50uavxppALglLRW5DQXyiXzlbk5BvW9C7E=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r9MEs6DK027830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 22 Oct 2013 16:54:07 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1VYdLS-0003kN-Px; Tue, 22 Oct 2013 16:54:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Iorga\, Cristian" <cristian.iorga@intel.com>
References: <1382083973-13444-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZBVxwoUufz4dbpaCXoV4x3x+S_q3NYowGsjstXHDs=tQ@mail.gmail.com>
	<ly7gdawxs2.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<969F26A8BAB325438E7EB80D3C3134FB16CA0FEC@IRSMSX105.ger.corp.intel.com>
Date: Tue, 22 Oct 2013 16:54:06 +0200
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16CA0FEC@IRSMSX105.ger.corp.intel.com>
	(Cristian Iorga's message of "Tue, 22 Oct 2013 14:37:35 +0000")
Message-ID: <ly1u3de4q9.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Tue, 22 Oct 2013 14:54:20 -0000
Content-Type: text/plain

"Iorga, Cristian" <cristian.iorga@intel.com> writes:

> Sorry to ask, what is this case: 'ip=dhcp'?

That's the case when kernel gets the ip by dhcp (--> CONFIG_IP_PNP); it
is configured by a 'ip=dhcp' kernel cmdline option.


Enrico


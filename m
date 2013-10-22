Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 206B26CA74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 15:13:44 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r9MFDYfF030174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 22 Oct 2013 17:13:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1382454815;
	bh=stjyOu/GhHvSF36mGg9uMenm14nd/6jLn6rUilmITIM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=ksiSl2quhncMyuo2UpfGOfW1CRft4txFWuv8gQYQjJXocU/+BdRB7WPgdamFckQaA
	nM0xlrihlDV0OrHoMkdHrg40V2nHIbRq+poHRnEbtGAvwmoiU3iBTz7r1URBOgVO6j
	WIOJ7kpsPEOEyJGlDSIwz7lAgRYalInad/VRETko=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r9MFDSW5001132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 22 Oct 2013 17:13:30 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1VYdeC-0003s9-Jv; Tue, 22 Oct 2013 17:13:28 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Iorga\, Cristian" <cristian.iorga@intel.com>
References: <1382083973-13444-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZBVxwoUufz4dbpaCXoV4x3x+S_q3NYowGsjstXHDs=tQ@mail.gmail.com>
	<ly7gdawxs2.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<969F26A8BAB325438E7EB80D3C3134FB16CA0FEC@IRSMSX105.ger.corp.intel.com>
	<ly1u3de4q9.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<969F26A8BAB325438E7EB80D3C3134FB16CA102D@IRSMSX105.ger.corp.intel.com>
Date: Tue, 22 Oct 2013 17:13:28 +0200
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16CA102D@IRSMSX105.ger.corp.intel.com>
	(Cristian Iorga's message of "Tue, 22 Oct 2013 15:00:28 +0000")
Message-ID: <lytxg9cp9j.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Tue, 22 Oct 2013 15:13:46 -0000
Content-Type: text/plain

"Iorga, Cristian" <cristian.iorga@intel.com> writes:

> I might be wrong, but I fail to see how this relates to our situation.
> Care to elaborate?

The provisining works only when static ips are configured.  Using connman
in dhcp setup will do all the bad things which were tried to be fixed by
the provisioning (bringing down interface, clearing default route).

Ideally, provisioning mechanism would be extended so that connman uses
dhcp by requesting current ip and without reconfiguring the interface
(neither on startup, nor on shutdown).

But for now, only solution seems to ignore the netwrok interface which
is done by the patch.



Enrico


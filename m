Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S31I3-0003VH-Jm
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 09:23:07 +0100
Received: by wgbdr12 with SMTP id dr12so217794wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 00:14:38 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.99.100 as permitted sender)
	client-ip=10.180.99.100; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.99.100 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.99.100])
	by 10.180.99.100 with SMTP id ep4mr8076581wib.7.1330589678334 (num_hops
	= 1); Thu, 01 Mar 2012 00:14:38 -0800 (PST)
Received: by 10.180.99.100 with SMTP id ep4mr6453719wib.7.1330589678282;
	Thu, 01 Mar 2012 00:14:38 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm25243667wiy.7.2012.03.01.00.14.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 00:14:37 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8166980a5f0696c1f88bce1fb9bdcff7089690b8.1330587785.git.sgw@linux.intel.com>
Date: Thu, 1 Mar 2012 09:14:35 +0100
Message-Id: <C2C41049-7169-4851-B07A-9CDDD5A5ED45@dominion.thruhere.net>
References: <cover.1330587785.git.sgw@linux.intel.com>
	<8166980a5f0696c1f88bce1fb9bdcff7089690b8.1330587785.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnMCFa28X4nH4GsnUB75BrniNnc4iqG/laLWlor1F/6WCcOh6JPCchgOdD8KBfyQNE2Lwih
Subject: Re: [PATCH 1/4] self-hosted: Fix multiple libx11 error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 08:23:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 mrt. 2012, om 08:46 heeft Saul Wold het volgende geschreven:

> From: Zhai Edwin <edwin.zhai@intel.com>
>=20
> Self-hosted needs package libx11-dev, which is ambiguous as =
virtual/libx11 is
> provided by libx11 or libx11-trim. This patch explictly set the =
perferred one,
> libx11-trim-dev, to avoid this.

I don't like this patch, it now forces a distro decision on a task on =
oe-core, which is bad.

regards,

Koen=



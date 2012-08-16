Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T22KG-0004EI-Nk
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 17:49:36 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 16 Aug 2012 08:37:20 -0700
Received: by obceq6 with SMTP id eq6so3339254obc.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 08:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=Q06SjFrhgjR4UyotgY1M3YZ6BZvu/lVFoTMvj4usG90=;
	b=nIn7BfTCAq4u6CSlCsF5uVXTGXxg0g6HpLu8VG9ei+qoFtjZb50iHoADHFcL9MYyaT
	z372GuO46hlccpVQGUdF02qf/o61k2bWe3tq9n+Hh/0fwPYaQls9rWh7AImPZgpNJESO
	o+BrA2GYw55EWTNLUdjjDtQB9ULZ0BUyGwwpkraTbW7Bn5P6lKMuCYLBA7v2u6zxzh1r
	LWw8Nzzn48rtAmpQSZfNMPDPSE42g/Rk9wuFourG8RYmEERLekOXDzsVKCzMA2s+jbUS
	cNX5L0vlJnAobmrngbVYWWXg0TVVa34iUWvPr9HuJBD2zQrSxVbKqFux3URDVxuQeCJP
	xctA==
Received: by 10.182.145.8 with SMTP id sq8mr1425485obb.50.1345131439727; Thu,
	16 Aug 2012 08:37:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Thu, 16 Aug 2012 08:36:59 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Aug 2012 16:36:59 +0100
Message-ID: <CAJTo0LbKPX-T4R0kM2gNzy6vAjLJseKq31ZDSDGp8GBnh3UAuA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkaS/GPjBlb8QSsLAOd3Ux3YUp95q39pr5DzyCB8SQRLV2WH9Fmb+g4VrPAMkdhNFLIEAXU
Subject: Dropping GTK+ 2.12
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
X-List-Received-Date: Thu, 16 Aug 2012 15:49:37 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

GTK+ 2.12 is very, very old (2007).  Does anyone still use it, or can
we drop it from oe-core?

Actually, if anyone still wants it, can we move it to meta-oe?  Do we
really need three versions of GTK+ in oe-core?

Ross



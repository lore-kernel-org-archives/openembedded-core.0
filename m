Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 817756BA14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 16:31:35 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id t60so3933729wes.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ykb5BFG5sahNESEMtIj1iAbB5i/sB3TQfdePvaKD9ho=;
	b=IfKuSb3moxth9o84TNqv9PNXQjVsV1B7ShgYc3u9ik/Alrq154DBA4XxCI8zfzYqXg
	p0BtUNufr/bDrn2iqzBX2mBDFAnvxbYARRE4PkZGW9JLvP6vfuaOLSJxoLUx/wYswPmT
	l6NU+RPXnLfSGUjXFMUjuMWivDwBBD7SGr8rnC5Yz2L5sd71l+/gbBVoqSLWfy+DAQXj
	gWfaOgOO3KNhlqS2W5NXWUjKE/eXuBnnPVv8vxsrZSVfJDUqwXiXHhQfZIms3VdPieor
	Jxk/NuuLdwXYAW9L0yH6eZBdRDkNIAD77PftQ9Z13eX5uHrBrxeskz2Lfl9OY1Ecv8bO
	XGVg==
X-Gm-Message-State: ALoCoQkoSO8CYcfe8mcAazoc0yN1wRNaaayEOKwEzpiOnpIORCNDf7SzXaNUmv/X4nu246RowUom
X-Received: by 10.180.210.231 with SMTP id mx7mr91921wic.5.1382113895312;
	Fri, 18 Oct 2013 09:31:35 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a072:4f8e:55ba:e612?
	([2001:610:612:0:a072:4f8e:55ba:e612])
	by mx.google.com with ESMTPSA id lr3sm27221950wic.5.2013.10.18.09.31.33
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Oct 2013 09:31:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <52615ACB.1010203@emagii.com>
Date: Fri, 18 Oct 2013 18:31:32 +0200
Message-Id: <34C59EF9-AA69-48F2-ACE4-6BBAAA88FD4A@dominion.thruhere.net>
References: <52615ACB.1010203@emagii.com>
To: Ulf Samuelsson <angstrom-dev@emagii.com>
X-Mailer: Apple Mail (2.1510)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with PREFERRED_VERSION/PREFERRED_PROVIDER for the kernel
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
X-List-Received-Date: Fri, 18 Oct 2013 16:31:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 okt. 2013, om 17:59 heeft Ulf Samuelsson <angstrom-dev@emagii.com> =
het volgende geschreven:

> 1. If you define something in the <MACHINE>.conf and in <DISTRO>.conf
>    then <DISTRO>.conf has higher priority.
>    This is really non-intuitive.

It is correct however, if the DISTRO defines it, it's a DISTRO setting =
that a MACHINE.conf really should stay away from.

regards,

KOen=


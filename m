Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id DCABF601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 07:53:20 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so3936569wid.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 23:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=hR579W7rwB0vn9uFA0HcPfEvRklYTHPCHp6F7UmpHoY=;
	b=dxGxkGGAnao146GnAant6NLXSZG32ArDGaoKfgXE2XqmmO7v5Jgo39sDIKcTqmaxvx
	S2VN8DJJe/jfOEuRVOY2GuyH72aYFOjvcdQ5pZ+ZRPVitkPQuibs1SuU3E5bfCVS6Hjn
	Fcbigm0NQLYNZOvGME6zGD9FlWYLLulkKE/Yg7pw+/veA+un0RHVCoHf4QbuXmWq1pmK
	+KnfeqcvNf7ojeWBpM/NPfn+/mceBUdYp1tZ82cl7GweUXLngfnBLb+2Ez+uKCj1+Xrz
	psl1UmqjYvxVPnXNC4SMNV7Kgt6wBat5keFkbPuIBoXyDuPvAmdo99k3sYmhIP3tjUOz
	TjkQ==
X-Gm-Message-State: ALoCoQk+G6Kv7OWZDQsuRCQKOFPHOUZAXs56IzF5xPapGz14PWERAK/og0RvLm71waVSQLOU2Cnc
X-Received: by 10.180.76.144 with SMTP id k16mr11073072wiw.3.1417593201442;
	Tue, 02 Dec 2014 23:53:21 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	fk12sm15432131wic.6.2014.12.02.23.53.20 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Dec 2014 23:53:20 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1417569497-23334-1-git-send-email-sgw@linux.intel.com>
Date: Wed, 3 Dec 2014 08:53:18 +0100
Message-Id: <84FE6D3B-F284-4B82-9A29-CA4ED2DD2424@dominion.thruhere.net>
References: <1417569497-23334-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][RFC] procps: Upgrade to 3.3.10 (procps-ng version)
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
X-List-Received-Date: Wed, 03 Dec 2014 07:53:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 3 dec. 2014, om 02:18 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:
>=20
> This is an update to procps-ng version, cleaned up patches
> added to fix up usrbin_execprefix in OE-Core.

Why are you dropping sysctl.conf? And can you please send v2 as a -M =
formatted patch?



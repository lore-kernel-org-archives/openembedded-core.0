Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE3F6E94E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 13:03:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Feb 2014 05:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,772,1384329600"; d="scan'208";a="477138129"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.157])
	by orsmga002.jf.intel.com with ESMTP; 03 Feb 2014 05:03:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Date: Mon, 03 Feb 2014 13:03:47 +0000
Message-ID: <1846327.CZeKFxv0XS@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <1391432329-1046-1-git-send-email-david.nystrom@enea.com>
References: <1391432329-1046-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] udev: add udev-utils to RDEPENDS
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
X-List-Received-Date: Mon, 03 Feb 2014 13:03:54 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi David,

On Monday 03 February 2014 13:58:49 David Nystr=F6m wrote:
> An intended fix for below error message with core-image-lsb,
> Sending this as an RFC since I dont really know what constitutes
> a RRECOMMENDS vs. RDEPENDS.
> Is this clearly defined somewhere ?
> Below should be an RDEPENDS, no ?

Does this actually fix the problem though? An RRECOMMENDS would only no=
t be=20
satisfied if the package ended up empty, or you were using BAD_RECOMMEN=
DATIONS=20
(or NO_RECOMMENDATIONS). I can't see this change actually accomplishing=
=20
anything.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


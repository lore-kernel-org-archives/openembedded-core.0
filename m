Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 20A9E70619
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:50:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,678,1400018400"; d="scan'208";a="55063782"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 17 Jul 2014 16:50:30 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.153]) by
	COSNADEXC21.usr.ingenico.loc ([10.31.4.221]) with mapi id
	14.03.0174.001; Thu, 17 Jul 2014 16:50:30 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC][PATCH v4] libav: set LICENSE according to
	PACKAGECONFIG options
Thread-Index: AQHPoc5zYHX9OMMsEE6qKbhFd+IH2Q==
Date: Thu, 17 Jul 2014 14:50:29 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050BA8B29DEA@COSNADEXC13.usr.ingenico.loc>
References: <8672BB614B4CCA40A6B3BDD6FD82050BA8B280C6@COSNADEXC13.usr.ingenico.loc>
	<1405608287-10401-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1405608287-10401-1-git-send-email-Matthieu.Crapet@ingenico.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [RFC][PATCH v4] libav: set LICENSE according to	PACKAGECONFIG options
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
X-List-Received-Date: Thu, 17 Jul 2014 14:50:34 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

One more note. I've tested with 0.8.11 & 9.13 on OE-Core current git (maste=
r).
The only weak point is the use of python anonymous function which is called=
 twice each time, is there a better solution ?

Regards,
Matt


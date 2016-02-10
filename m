Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7A7765CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 23:21:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1ANLoH0012913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Feb 2016 15:21:50 -0800 (PST)
Received: from seebs-worktop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 10 Feb 2016 15:21:49 -0800
Date: Wed, 10 Feb 2016 17:21:47 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Andreas =?UTF-8?B?TcO8bGxlcg==?= <schnitzeltony@googlemail.com>
Message-ID: <20160210172147.093cfc76@seebs-worktop>
In-Reply-To: <CALbNGRQfNy=M5Y-zQXgXb-nQcbNKe5G_3D816HnK37w2Lag1SA@mail.gmail.com>
References: <cover.1455047631.git.peter.seebach@windriver.com>
	<56BA47DD.6020007@windriver.com>
	<CALbNGRQfNy=M5Y-zQXgXb-nQcbNKe5G_3D816HnK37w2Lag1SA@mail.gmail.com>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] pseudo 1.7.5 [jethro][fido]
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
X-List-Received-Date: Wed, 10 Feb 2016 23:21:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Feb 2016 22:52:53 +0100
Andreas M=C3=BCller <schnitzeltony@googlemail.com> wrote:

> Are user IDs affected? If yes there would be a chance to reduce loads
> of host contamination warnings..

They could be in some cases, especially with build history. In most cases,
packages were fine, but reporting could be wrong. But basically, it was
possible for stuff that should have been running under pseudo not to actual=
ly
be querying the database.

-s
--=20
Listen, get this.  Nobody with a good compiler needs to be justified.


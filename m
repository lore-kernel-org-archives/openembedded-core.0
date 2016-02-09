Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3766B70101
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 21:16:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u19LGb0U025984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Feb 2016 13:16:37 -0800 (PST)
Received: from seebs-worktop (172.25.40.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 13:16:36 -0800
Date: Tue, 9 Feb 2016 15:16:35 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20160209151635.6327ebb0@seebs-worktop>
In-Reply-To: <56BA47DD.6020007@windriver.com>
References: <cover.1455047631.git.peter.seebach@windriver.com>
	<56BA47DD.6020007@windriver.com>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 09 Feb 2016 21:16:38 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 9 Feb 2016 14:11:09 -0600
Mark Hatle <mark.hatle@windriver.com> wrote:

> Everything remains compatible, but it does fix a subtle race condition that can
> lead to files under pseudo control inheriting their host system permissions.
> 
> See bug 9031 for more details.

For reference, the thing which exposed the circumstance where this was
actually remotely likely to come up was added in f1d4744, back in 2014,
and somehow the actual change isn't mentioned in ChangeLog.txt, but in
practice it's been there since 1.6.1. But it would only (probably) show
up if you ran some commands with "pseudo <cmd>" *while* running other
things using a pseudo server normally.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


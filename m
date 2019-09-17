Return-Path: <henning.schild@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id CD2407F8F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:44:26 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x8H8iQYo023732
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 10:44:26 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.68.240])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x8H8iQG8028428;
	Tue, 17 Sep 2019 10:44:26 +0200
Date: Tue, 17 Sep 2019 10:44:26 +0200
From: Henning Schild <henning.schild@siemens.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20190917104426.73290e2b@md1za8fc.ad001.siemens.net>
In-Reply-To: <20190903134350.21512-1-henning.schild@siemens.com>
References: <20190903134350.21512-1-henning.schild@siemens.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [PATCHv2 0/6] solve several issues in oe-git-proxy
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
X-List-Received-Date: Tue, 17 Sep 2019 08:44:27 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Seems that was merged without further notice ... again. But hey it is
in.

poky
49bb6cefb507c116cb2548ae842eb0653053fee4...4b0bf01c14a90313ab294ead2ca1e5536bafd632

Henning

Am Tue, 3 Sep 2019 15:43:44 +0200
schrieb Henning Schild <henning.schild@siemens.com>:

> From: Henning Schild <henning.schild@siemens.com>
> 
> Change to v1:
>  - fix comment in p4
>  - move "set -f" all the way up in p4, that was the intention in the
>    first place
> 
> Henning Schild (6):
>   oe-git-proxy: allow setting SOCAT from outside
>   oeqa: add case for oe-git-proxy
>   Revert "oe-git-proxy: Avoid resolving NO_PROXY against local files"
>   oe-git-proxy: disable shell pathname expansion for the whole script
>   oe-git-proxy: NO_PROXY suffix matching without wildcard for
> match_host oe-git-proxy: fix dash "Bad substitution"
> 
>  meta/lib/oeqa/selftest/cases/oescripts.py | 58
> +++++++++++++++++++++++ scripts/oe-git-proxy                      |
> 21 ++++---- 2 files changed, 71 insertions(+), 8 deletions(-)
> 



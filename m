Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF85C60E49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 18:55:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA3ItYrY025976
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Nov 2014 10:55:35 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Nov 2014 10:55:33 -0800
Date: Mon, 3 Nov 2014 12:55:22 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20141103125522.623ba486@e6410-2>
In-Reply-To: <1414861479-5493-1-git-send-email-pab@pabigot.com>
References: <1414861479-5493-1-git-send-email-pab@pabigot.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] prevent pseudo host passwd/group contamination
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
X-List-Received-Date: Mon, 03 Nov 2014 18:55:39 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Sat, 1 Nov 2014 12:04:36 -0500
"Peter A. Bigot" <pab@pabigot.com> wrote:

> The new patches use --without-passwd-fallback, preventing contamination
> from the host files during the early build stages when the target
> versions from base-passwd aren't yet available.

I like these, and will see whether I can free up time to work on this. If I
can't, though, I have no objections to these (and the previous set) being
added to oe-core as local patches until next time I have a free day or two to
study the password code.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


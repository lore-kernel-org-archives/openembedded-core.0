Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2158260167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 22:35:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9DMZkb8026842
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Oct 2014 15:35:47 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 13 Oct 2014 15:35:46 -0700
Date: Mon, 13 Oct 2014 17:35:45 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20141013173545.0d2c5de0@e6410-2>
In-Reply-To: <543C5246.30703@pabigot.com>
References: <1413157795-1346-1-git-send-email-pab@pabigot.com>
	<20141013162851.58e820e6@e6410-2> <543C5246.30703@pabigot.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] pseudo+image.bbclass: changes to avoid host contamination
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
X-List-Received-Date: Mon, 13 Oct 2014 22:35:51 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Mon, 13 Oct 2014 17:29:26 -0500
"Peter A. Bigot" <pab@pabigot.com> wrote:

> Basically, even if "root" is a special case, taking this path means 
> making assumptions about what the application is doing based on what 
> system/libc functions it invokes.  Too often when somebody assumes a 
> general tool will only be used specific ways, somebody else will prove 
> them wrong.

True.

For the oe-core case, it seems like it might be reasonable for us to set
pseudo up to, by default, get configured with preloaded things which match
the expected configuration of base-passwd. If people then go overriding
base-passwd in strange ways, they could break that, but we at least know what
the default configuration would be, and could possibly even make base-passwd
check whether pseudo's configuration matches its answers, and blow up if
there's a mismatch there.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


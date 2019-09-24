Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5774D7F290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 07:02:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46csZT5jr2z4t;
	Tue, 24 Sep 2019 09:02:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569308546;
	bh=6FZzmx0CT/+c7WffHWogBHVnE00b8PZUHTlXVQ0uDao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZ+VeWOa5rHhFUDFx6NuD7/FCJl/EJzKeORmHXPFhwP2QZOzWct6yuc8mUE8b75yX
	tRUTLG2UVY3SSV6ACqwNMBLnvNA9MhCLowY8LMZpYS2NPqZ9WyUP2nS3iBYyq2RO+X
	BdKychxY6o6LuqH3BXfj2JydmsuXFCiL8n1usGke3TgGZbLIzj5REJ/5BG2FQV7u6p
	gaJ1j8cMho44Q/BsJVSTkMbEKla7WVgWnlydWjakWLO9lyCNqAycg+TOUgEH0jhzTj
	dS9EWc5O/s5O/jR2imbUv2hjLJF/mfyWP4OJrvB3A+8vZXz7BYgkEdD+5Yk2v84Vhb
	ScCcCKKzhR7Hc7yaK9+GQUFsl9pwluBF2pmhmN1v72cGB5kicvhXSJlBPfATXlHxj0
	jD6SUWzW2m0ce8P1cSPRA5KUl0TujyO8IKE+lcDAxofN/GxuweHocGhGiMBzEd/6Sy
	DUgpc/O/Brl84j3yQ+FTdA0Sz/d2R90MmB1gRdT8PDWkxymROSbUyzpnRmeFA04qCS
	1S1MRBWIDwt8U1CYnmiVPn1SKQie1D/gO18dLM7GtQ6ir5HlzbOjB8adGo0+Wl31/Z
	o85ctI7AV440BOSKyboO97pOOWfAfeBHeA/h7JKcgOIvKmpFzYcLUrbM7jFaeWBwFr
	qR45uKoOj7exBTM2iSv8dYI4=
Date: Tue, 24 Sep 2019 10:02:23 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190924070223.GB16793@localhost>
References: <cover.1569294712.git.akuster808@gmail.com>
	<d0e2babdab1625e86d0abc7fa7dab25caa73ccb6.1569294712.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d0e2babdab1625e86d0abc7fa7dab25caa73ccb6.1569294712.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Thud][ 15/24] dhcp: fix issue with new bind changes
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
X-List-Received-Date: Tue, 24 Sep 2019 07:02:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

In master this patch was reverted due to a bug that caused a regression.

Please drop this change, and use the upstream fix
0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch
instead.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



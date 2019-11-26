Return-Path: <pb@pbcl.net>
Received: from pbcl.net (pbcl.net [159.69.221.92])
	by mail.openembedded.org (Postfix) with ESMTP id 33C557FCD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 18:19:29 +0000 (UTC)
Received: from pb by pbcl.net with local (Exim 4.89)
	(envelope-from <pb@pbcl.net>)
	id 1iZfQv-0005qA-S1; Tue, 26 Nov 2019 19:19:29 +0100
Date: Tue, 26 Nov 2019 19:19:29 +0100
From: Phil Blundell <pb@pbcl.net>
To: Cengiz Can <cengiz@kernel.wtf>
Message-ID: <20191126181929.sys6lo2fadf72wdn@pbcl.net>
References: <20191126133943.124402-1-cengiz@kernel.wtf>
MIME-Version: 1.0
In-Reply-To: <20191126133943.124402-1-cengiz@kernel.wtf>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd-conf: add timesyncd.conf
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
X-List-Received-Date: Tue, 26 Nov 2019 18:19:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2019 at 04:39:43PM +0300, Cengiz Can wrote:
> This patch adds a default timesyncd.conf with Google's time servers
> moved to Fallback and pool.ntp.org as primary time servers.

The "advice for vendors" on the ntp.org website specifically says:

   Do not use the standard pool.ntp.org names as a default 
   configuration in your system.

I don't think we should make this change.

p.



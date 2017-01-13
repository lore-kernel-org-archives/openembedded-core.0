Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id C61C971996
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 20:20:43 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cS8L3-0003uI-N9; Fri, 13 Jan 2017 21:20:43 +0100
Message-ID: <1484338839.3966.89.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 20:20:39 +0000
In-Reply-To: <3441a3d4-be4e-1f6a-6a4b-9b556796d83d@gmail.com>
References: <20170111035102.18447-1-raj.khem@gmail.com>
	<20170111035102.18447-2-raj.khem@gmail.com>
	<CAJTo0LZYiqp+b7hwsGaZDKbpwo4UPxyLLw7Eje1-Y5Fg-=Jwow@mail.gmail.com>
	<1484333133.3966.76.camel@pbcl.net>
	<3441a3d4-be4e-1f6a-6a4b-9b556796d83d@gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.25
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
X-List-Received-Date: Fri, 13 Jan 2017 20:20:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-01-13 at 10:52 -0800, Khem Raj wrote:
> 
> I have sent a patchset with IFUNC change reverted for now until its
> fixed.

Yeah, I saw that.  But in light of recent developments it seems like it
might be better to revert the earlier NPTL patch that apparently
introduced the real problem.

p.



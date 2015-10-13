Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 35C62734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 12:08:05 +0000 (UTC)
Received: from cpc5-cmbg17-2-0-cust97.5-4.cable.virginm.net ([86.30.112.98]
	helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZlyNA-0002ob-SZ; Tue, 13 Oct 2015 14:08:05 +0200
Message-ID: <1444738079.5251.29.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 13 Oct 2015 13:07:59 +0100
In-Reply-To: <CAP9ODKrCcmX=4bHACTyGpF9BNivvDcBEieTyOcbChHdZr67pkA@mail.gmail.com>
References: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
	<9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
	<6BA567C8-0D8A-402A-B733-2E9DECFD9844@gmail.com>
	<32B54709-BA87-45AC-BDC0-22604B6D3979@gmail.com>
	<6C58EED7-075B-4B58-B401-DB9EF31B8D50@gmail.com>
	<CAMKF1sreATF=J9rh-dK5fbsJt9szaJTmNyOOHg1gC+mVGNBZyg@mail.gmail.com>
	<B1E843F8-C2B2-403A-87E4-1D8AD3E13C63@gmail.com>
	<CAP9ODKrCcmX=4bHACTyGpF9BNivvDcBEieTyOcbChHdZr67pkA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
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
X-List-Received-Date: Tue, 13 Oct 2015 12:08:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-10-13 at 08:45 -0300, Otavio Salvador wrote:
> I understand Khem is excitant to include more non-upstreamed patches
> into GCC but I would prefer to have it included and Java working fine
> than a local patch applied forever. :-(

Maybe you'd like to file a bug against upstream GCC in that case.  I
think Khem already suggested this to Jens but he said he had "no time"
to do that.

p.



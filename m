Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 318156A95B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:14:39 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VEGIJ-0006kn-DD; Tue, 27 Aug 2013 12:14:39 +0200
Message-ID: <1377598478.5452.51.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Qi.Chen@windriver.com
Date: Tue, 27 Aug 2013 11:14:38 +0100
In-Reply-To: <f1e2a5ea20351fbe0e1e0552462752a5f5c70330.1377587203.git.Qi.Chen@windriver.com>
References: <cover.1377587203.git.Qi.Chen@windriver.com>
	<f1e2a5ea20351fbe0e1e0552462752a5f5c70330.1377587203.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] runqemu-internal: change the lock acquire/release logic
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
X-List-Received-Date: Tue, 27 Aug 2013 10:14:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-27 at 15:08 +0800, Qi.Chen@windriver.com wrote:
> This patch simplifies the lock acquire/release logic by removing the
> flock mechanism.

I'm not sure that "simplifies" is an accurate description of the results
of removing flock.  How about "breaks"?

p.




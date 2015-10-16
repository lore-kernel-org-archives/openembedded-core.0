Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id DC34377104
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:29:05 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1Zn0Nr-0001We-5Y; Fri, 16 Oct 2015 10:29:03 +0200
Message-ID: <1444984136.19532.7.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Fri, 16 Oct 2015 09:28:56 +0100
In-Reply-To: <7314976f3f2463926748eec4fbf8c0a3111c4caf.1444979576.git.Qi.Chen@windriver.com>
References: <cover.1444979576.git.Qi.Chen@windriver.com>
	<7314976f3f2463926748eec4fbf8c0a3111c4caf.1444979576.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] openssl: don't move libcrypto to base_libdir
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
X-List-Received-Date: Fri, 16 Oct 2015 08:29:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-10-16 at 15:14 +0800, Chen Qi wrote:
> A patch more than two years ago moves libcrypto from libdir to base_libdir
> for the reason of /usr split. And I don't think this reason still stands.

Why not?

p.




Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 18CEE60043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 22:31:13 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZzBFx-0007Lk-FW; Wed, 18 Nov 2015 23:31:13 +0100
Message-ID: <1447885867.4042.22.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Nov 2015 22:31:07 +0000
In-Reply-To: <1447871842-30347-2-git-send-email-Martin.Jansa@gmail.com>
References: <1447864860.1472.56.camel@pbcl.net>
	<1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
	<1447871842-30347-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 2/6] cortexa{7,15,17}: add VFPv4 tunes
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
X-List-Received-Date: Wed, 18 Nov 2015 22:31:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-11-18 at 19:37 +0100, Martin Jansa wrote:
> -# VFP Tunes
> -AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon"
> +# HF Tunes
> +AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon cortexa15hf-neon-vfpv4 cortexa15thf-neon-vfpv4"

I'm not sure I really understand what's going on with these hardfp
tunes.  If we now have separate tunes for -vfp4, -neon and -neon-vfp4,
what do you actually get if you ask for plain "cortexa15{t}hf"?

p.




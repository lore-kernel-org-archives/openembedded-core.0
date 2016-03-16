Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 432856FF97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 12:21:16 +0000 (UTC)
Received: from [212.183.132.61] (helo=e130) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1agARw-0005fd-6r; Wed, 16 Mar 2016 13:21:16 +0100
Message-ID: <1458130840.2038.23.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Jens Rehsack <rehsack@gmail.com>
Date: Wed, 16 Mar 2016 12:20:40 +0000
In-Reply-To: <E262EC7C-008A-421F-894E-40BED850BDEB@gmail.com>
References: <E262EC7C-008A-421F-894E-40BED850BDEB@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RESEND 1/4] ARM: handle missing thumb suffix
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
X-List-Received-Date: Wed, 16 Mar 2016 12:21:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-16 at 10:34 +0100, Jens Rehsack wrote:
> When enabling tune for arm926ejs, poky optionally appends suffixes for
> thumb and dsp support. Since sometimes arm926ejse (ARM code) and sometime
> arm926ejste (thumb code) is used in PACKAGE_ARCH, allow both.

Personally I think this is a further argument for fixing the tune files
to simply not append these suffixes rather than doubling up the allowed
architectures everywhere.  See previous discussion on the oe-core list.

Also, just on a matter of style, if you are submitting a patch to
oe-core then the description probably oughtn't to refer to things that
"Poky" does.

p.




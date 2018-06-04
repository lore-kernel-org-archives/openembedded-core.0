Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 769B96074F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 17:20:39 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id p185-v6so6793422itp.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oNvuW4rjMVpQONYLg4HWHP6yrHgQc/QDFNjXUV7bC7c=;
	b=PVp8syPxnL0l3v9zcSHL3xS0NBDnTW10Onu6bT/PGWelCwJqkChLtPa4oFBivbng3L
	ecKoz2XQwYQKSNAKFbLdfc5t6tH92SMFR6kfBaDwE71aS1QYuWYHOG87stbGAoVOQ0mU
	X/BguBrSt14OGGX798tomtQeDI9cHlizvQCmMpp1Z6NUY7FX67OINidZ246NAyWehNQy
	ELQJrGyvzInOjjCT1mazEWZ4RRBsaVXGwHoWbM+fJHyCkai+VPgXC5qmpptNvSP0k0nv
	xIt4RXOb5trXwt4u+GLZeyAjwOLlbEhYcJ0DESwFwnhPffqAWfZd5VSw3ii0YFzUpGcZ
	mEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oNvuW4rjMVpQONYLg4HWHP6yrHgQc/QDFNjXUV7bC7c=;
	b=jr/SSYwGd5+eqhw7S3sS6pMuJNeMb/C/xK0tYPvVUx7U9mugeI3MKBQ0NlnK/Da4sv
	bUKSgzDwK5rYJiZCYlPTimJ7wM45ro/r9Hy/tCHOnv7MqJbH3/6KHiQ9cNp+YI0Wpm52
	rmSYS4q+PZSTfdKzgd9PLIk1RFGuLzEBsu8XbkDA8a7DR5WCjMFr96msocTozxXdpVm8
	iwy1tR+VZq8SeVJ6Q2CrcuQ4t6ah5mwpdZZfOSk3GEx0zkU2LNbAvbw21kpebLTx+rst
	M4Zybh07WJyW5p/AN2NHLioedL7rwU2ehRnHiG5H1bOSSxcX1j3Ph2DADIeG3tc0Vrht
	J4Yg==
X-Gm-Message-State: APt69E2KUymP8P+gtfPjwD1pYXUiVbY+772/VD76QeIowtBpl6ZDGFz1
	fif19pIPQyKnGwmdf1UZlAY=
X-Google-Smtp-Source: ADUXVKKy4N+xwWN+o/40bvj2sPozJsiXfdR6dFunRoucKTOH9QtPGo6+lhpeKYQUp16tMXThrG8vSQ==
X-Received: by 2002:a24:8046:: with SMTP id
	g67-v6mr15029195itd.16.1528132840415; 
	Mon, 04 Jun 2018 10:20:40 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	131-v6sm504963itv.29.2018.06.04.10.20.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Jun 2018 10:20:39 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <79a9b2f1db65d8cc4233f93b7b5213d025a6d262.camel@gmail.com>
To: Martin Kelly <mkelly@xevo.com>, openembedded-core@lists.openembedded.org
Date: Mon, 04 Jun 2018 12:20:39 -0500
In-Reply-To: <5c2bc7c4-6a79-2775-af6a-30fb6d693296@xevo.com>
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-6-mkelly@xevo.com>
	<1fa5f19ad4ac398de0dc6da40c46ead935133dbe.camel@gmail.com>
	<5c2bc7c4-6a79-2775-af6a-30fb6d693296@xevo.com>
X-Mailer: Evolution 3.28.2 (3.28.2-1.fc28) 
Mime-Version: 1.0
Subject: Re: [PATCH v2 5/7] toolchain-shar-extract: pass env to post-relocate
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
X-List-Received-Date: Mon, 04 Jun 2018 17:20:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-01 at 15:24 -0700, Martin Kelly wrote:
> On 06/01/2018 03:08 PM, Joshua Watt wrote:
> > On Fri, 2018-06-01 at 14:02 -0700, Martin Kelly wrote:
> > > It's useful for the post-relocate scripts to be able to see the
> > > SDK
> > > environment, for example to see the values of CC, CXX etc. in
> > > order
> > > to
> > > dynamically generate toolchain files.
> > > 
> > > To enable this, source the SDK environment script prior to
> > > calling
> > > the
> > > relocate scripts.
> > > 
> > > Signed-off-by: Martin Kelly <mkelly@xevo.com>
> > > ---
> > >   meta/classes/toolchain-scripts.bbclass     | 17 +++++++++++++
> > > ----
> > >   meta/recipes-core/meta/meta-environment.bb |  5 +++--
> > >   2 files changed, 16 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/meta/classes/toolchain-scripts.bbclass
> > > b/meta/classes/toolchain-scripts.bbclass
> > > index ae7bbef034..5f99fd8c03 100644
> > > --- a/meta/classes/toolchain-scripts.bbclass
> > > +++ b/meta/classes/toolchain-scripts.bbclass
> > > @@ -118,11 +118,20 @@ EOF
> > >   }
> > >   
> > >   toolchain_create_post_relocate_script() {
> > > -	script=$1
> > > -	rm -f $script
> > > -	touch $script
> > > +	relocate_script=$1
> > > +	sdk_script=$2
> > > +	rm -f $relocate_script
> > > +	touch $relocate_script
> > > +
> > > +    cat >> $relocate_script <<EOF
> > > +# Source the SDK env script in case it is needed for the
> > > relocate
> > > scripts.
> > > +. $sdk_script
> > 
> > I had originally done something similar to this when I added
> > support
> > for the post-relocate scripts with icecream. However, it is
> > insufficent
> > because there can be multiple SDK environment scripts that need to
> > be
> > sourced. In order to get a fully correct environment, I had to do:
> > 
> >   # Setup environment
> >   for env_setup_script in `ls $1/environment-setup-*`; do
> >   	. $env_setup_script
> >   done
> > 
> > see meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-
> > setup.sh
> > 
> > 
> 
> There's one overall "SDK environment" script (the one you source as
> a 
> user to enter the SDK environment), and also customizable ones
> installed 
> by nativesdk-* packages (e.g. one that cmake uses). In this patch, I
> had 
> not intended that post-relocate scripts should be able to see the 
> environment scripts for every project but instead just for the
> global 
> SDK enivorment (to get at variables like OECORE_NATIVE_SYSROOT).

(Almost) All of the code I can find that deals with the SDK environment
supports multiple top level environment-setup-* files. If you happen to
have more than one, the relocation script will relocate all of them
(meta/files/toolchain-shar-relocate.sh), and the extraction script will
give you instructions to source them all (meta/files/toolchain-shar-
extract.sh).

It's possible this is some left over anachronism and it has no actual
use, but we should either fix it everywhere else or be consistent here.

> 
> Let me know if I have missed something and not including the other 
> environments could cause breakage.
> 
> Here's what I mean from an example extracted SDK:
> 
> martin@columbia:~$ ls /opt/xos/nanopi-neo-plus2/*environment*
> /opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-linux
> 
> martin@columbia:~$ ls 
> /opt/xos/nanopi-neo-plus2/sysroots/x86_64-xevo-linux/environment-
> setup.d/
> cmake.sh
> 
> In the above example, we are currently sourcing only 
> /opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-linux and
> not 
> cmake.sh.

Sort of.... environment-setup-aarch64-poky-linux is going to implicitly
source the cmake.sh script (see the for loop at the end of the script)



Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 336E060167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 16:27:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2014 09:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,546,1400050800"; d="scan'208";a="563311334"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.121.119])
	by orsmga002.jf.intel.com with ESMTP; 25 Jun 2014 09:26:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Meier, Dennis" <meier.dennis@siemens.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 25 Jun 2014 17:26:39 +0100
Message-ID: <8902442.ZlenMckcFY@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.8-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <6F22A92316C68C42A591A48A6291DA9DD95C99@DEFTHW99EI0MSX.ww902.siemens.net>
References: <1403011013-29977-1-git-send-email-meier.dennis@siemens.com>
	<CAP9ODKo_tNpKNkOpr9mwFGosmuXiKfXQuNnTURaZzptsamSyzA@mail.gmail.com>
	<6F22A92316C68C42A591A48A6291DA9DD95C99@DEFTHW99EI0MSX.ww902.siemens.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate_sdk_base: add auto-completion in setup
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
X-List-Received-Date: Wed, 25 Jun 2014 16:27:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 June 2014 10:01:36 Meier, Dennis wrote:
> > -----Original Message-----
> > From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On
> > Behalf Of Otavio Salvador
> > Sent: Dienstag, 17. Juni 2014 16:40
> > To: Meier, Dennis
> > Cc: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH] populate_sdk_base: add auto-completion
> > in setup
> > 
> > On Tue, Jun 17, 2014 at 10:16 AM, Dennis Meier
> > 
> > <meier.dennis@siemens.com> wrote:
> > > Signed-off-by: Dennis Meier <meier.dennis@siemens.com>
> > 
> > I do like the idea but how portable is it?
> > 
> > For example in my envinronment it does not work as I use zsh.
> 
> Yeah that's what I was afraid of. We figured that the script might still be
> invoked by bash because it starts with "#!/bin/bash" and thus it might
> work, but if you tested it and it didn't work for you I think it doesn't
> make sense to apply this patch.

Well, it depends - Otavio, when you say "it does not work" did you test it? 
#!/bin/bash should ensure bash is actually used.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


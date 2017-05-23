Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3BBD277D24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:48:49 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id a5so37395692lfh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vrfe+NUKkMxZwYmAvD/zraiwDE43wk7hgFXS39VDmBA=;
	b=VrsbbEeYwFO0DiU5+V5o/T80gK85nBVptTpLVgPPmDE6/LvyqDKTdlilBoE5yR/qO5
	c6H6hay2UryFH9mId7kH/3DAXkioytZUi/zjI21g0Pqnj75wezTlGj2JkoHFeFJ1m1aY
	k69QcyY7wKiPgJmf3DqElWtiG6Qf4P1/mk6kBMZ85yLUR+qlLit083u8nFTnsCPtGCQj
	Ur0/Dt5XFpDkpKOlpLBAzci2X3SSX5UMSTBZ36rbpag3LAAnsnvQN1jKf1ZLZUELS9SR
	nxbEmnWENVva6BZPTh3fsnOo/am1r5FPyLDT0CNupsH2riJoUm1STIsi0iSApaHvHOve
	ek0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vrfe+NUKkMxZwYmAvD/zraiwDE43wk7hgFXS39VDmBA=;
	b=GJ/MMAy12Q3lcXDTxMkPpPOpz6tTfgoB4pcrHN1H9ugQjtWyXH/G9kBduAqqe1WLky
	g8rywyTY9fz8i/+Rd/01Xp9kNN302zpN585EV3lPSgXlAOrUAYDYuMZG3qg+dSiDsmCL
	AFNM20t3SBGtOVC7TqHa8ss1PLRvNTeDiplhKqzv+y/hFQj0/P29ppRTk/5hDSYju9h9
	YWuXIZzbmgsmbQhgn81cnhOPZBTyufQTyI+SQQ+N5yXoQOxRu5NyPG+rfSvl7uNadXx8
	Zs/N9StIqjYfKoBaqUEhkKJhKo/1Ddp1x4F6PG9TsuBWG/8WLZMiwONGu+s+GlRADmqx
	PRgA==
X-Gm-Message-State: AODbwcBQo1Xj2kwP5fgL1HDB77Rv74QpZMguC9LWf3ti5KjibVJ82vf8
	bEfCFCrA/VqIAO7kBGkeB7kT1Lue5Q==
X-Received: by 10.80.180.155 with SMTP id w27mr21276794edd.42.1495550930540;
	Tue, 23 May 2017 07:48:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 23 May 2017 07:48:19 -0700 (PDT)
In-Reply-To: <CAJTo0Lbig6eUAOHX_UCLU7VM8QUG-Cj2JZoBzsfwbd7vpLKRdA@mail.gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-10-raj.khem@gmail.com>
	<CAJTo0La8fX-H==K-R37j2uTG2s_a5ww0hmNqtLNOEox8C-EZuQ@mail.gmail.com>
	<CAMKF1sqQfmxrG+jOHoeS-kizz127zY1vDbO3Xo4qRVnqZD8cvw@mail.gmail.com>
	<CAJTo0Lbig6eUAOHX_UCLU7VM8QUG-Cj2JZoBzsfwbd7vpLKRdA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 May 2017 07:48:19 -0700
Message-ID: <CAMKF1sp01SVCaG=g4=UKRM23OwYC1LpQSBmwde7j0GugV3R6Fg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/15] db: Add --tag=CC to cross libtool invocation
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
X-List-Received-Date: Tue, 23 May 2017 14:48:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 7:44 AM, Burton, Ross <ross.burton@intel.com> wrote:
> packages/corei7-64-poky-linux/db/db: RDEPENDS: added "libgcc (['>= 6.3.0'])
> libstdc++ (['>= 6.3.0'])"
>
> That's worse! :)

no its better, it reintroduced the deps and this time also on libgcc
which probably was latent. it worked because someone else pulled
libgcc into image. can you check readelf -d | grep DT_NEEDED output
from bins/solibs in db package. ?


Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D6F94708AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 19:04:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6SJ4G71023712
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 12:04:16 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 28 Jul 2014 12:04:15 -0700
Date: Mon, 28 Jul 2014 14:03:50 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140728140350.46af54ca@e6410-2>
In-Reply-To: <CAMKF1so=YuEoE2vQgG_yZWLzeKg=71vYEdHnX0V8fNowL=95zg@mail.gmail.com>
References: <cover.1406572002.git.peter.seebach@windriver.com>
	<c49369320ca271d42175888f5b9daccf45c297bf.1406572002.git.peter.seebach@windriver.com>
	<CAMKF1so=YuEoE2vQgG_yZWLzeKg=71vYEdHnX0V8fNowL=95zg@mail.gmail.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Add support for ld.so.conf.d
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
X-List-Received-Date: Mon, 28 Jul 2014 19:04:26 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Mon, 28 Jul 2014 11:47:30 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> the patch is good but introducing another variable is not needed you
> can cover it under US_LDCONFIG itself, ldconfig with empty ld.so.conf
> will still parse standard lib search paths anyway

The reason I wanted another variable is to control the creation of a
*non-empty* ld.so.conf that would pick up other config files. The idea
is that if you wanted to add a non-standard library search path, you
could create a file in ld.so.conf.d. I didn't want to make the file
have contents unconditionally.
 
> Secondly when we use ldconfig it generates ld.so.cache under /etc
> so I hope we take care of this when we have ro-rootfs

I assume that's already working for the existing empty ld.so.conf you get
with USE_LDCONFIG=1.

It does occur to me that I don't know whether our cross-ldconfig knows
this syntax. I'll double-check that.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


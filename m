Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1E4765DD0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 22:06:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7MM6n7Y013419
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Aug 2014 15:06:49 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 15:06:48 -0700
Date: Fri, 22 Aug 2014 17:06:26 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20140822170626.13280b11@e6410-2>
In-Reply-To: <20140822214626.GF20524@jama>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org> <20140822133349.76751634@e6410-2>
	<20140822193910.GD20524@jama> <20140822154954.04d4fc02@e6410-2>
	<20140822214626.GF20524@jama>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Fri, 22 Aug 2014 22:06:55 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 22 Aug 2014 23:46:26 +0200
Martin Jansa <martin.jansa@gmail.com> wrote:

> changing
> default DEFAULTTUNE (and TUNE_PKGARCH with that) to have thumb while
> still building with -marm doesn't make much sense to me and is only
> confusing.

I think the distinction is that if you use armv7at-neon, you *can* build
specific packages with thumb. Mostly, I guess, I don't think it makes sense
to use a tuning that specifically states that it can't run thumb code for
processors which can. Although... May not be an important distinction, really,
as you note.

> Every distro can use something more "optimized" DEFAULTTUNEs for each
> MACHINE they use, I do it for SHR:
> https://github.com/shr-distribution/meta-smartphone/blob/shr/meta-shr-distro/conf/distro/include/defaulttunes.inc

Huh, that's an interesting point. I'll wave this at people and see what they
think of it.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C069E7036C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 20:24:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6BKOq7w013453
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Jul 2014 13:24:54 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 11 Jul 2014 13:24:52 -0700
Date: Fri, 11 Jul 2014 15:24:49 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140711152449.08d84fdc@e6410-2>
In-Reply-To: <CAJTo0Lay1CB_BumWQDDLHrS2i2XkiE99TamO3bwMH86_=P8gFg@mail.gmail.com>
References: <cover.1405110050.git.peter.seebach@windriver.com>
	<0cbfa0da548acdef1a4ab12cb708c699a495dd7f.1405110050.git.peter.seebach@windriver.com>
	<CAJTo0Lay1CB_BumWQDDLHrS2i2XkiE99TamO3bwMH86_=P8gFg@mail.gmail.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.6.0.bb: uprev to pseudo 1.6
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
X-List-Received-Date: Fri, 11 Jul 2014 20:25:00 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 11 Jul 2014 21:21:06 +0100
"Burton, Ross" <ross.burton@intel.com> wrote:

> The extended attributes code means adding build-dependency on attr.
> 
> Which leads onto the discussion as to whether we add attr-native to
> the build for pseudo-native, or use ASSUME_PROVIDED and document that
> the host needs to provide it.

Well, since my builds worked without adding the dependency, I guess I would
go with ASSUME_PROVIDED since that was what I did, apparently.

I admit to not having been aware that it was possible to lack xattr
support in a modernish Linux.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


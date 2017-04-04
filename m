Return-Path: <seebs@seebs.net>
X-Greylist: delayed 438 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Apr 2017 22:40:58 UTC
Received: from mail.seebs.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id 05D4272F4D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 22:40:58 +0000 (UTC)
Received: from seebsdell (home.seebs.net [74.122.98.108])
	by mail.seebs.net (Postfix) with ESMTPSA id C105C2ADCEA;
	Tue,  4 Apr 2017 17:33:40 -0500 (CDT)
Date: Tue, 4 Apr 2017 17:33:39 -0500
From: Seebs <seebs@seebs.net>
To: brian avery <brian.avery@intel.com>
Message-ID: <20170404173339.2e07d9b4@seebsdell>
In-Reply-To: <c9e2f951c2e2bc367fa6bff0daf039f00503c846.1491344268.git.brian.avery@intel.com>
References: <cover.1491344268.git.brian.avery@intel.com>
	<c9e2f951c2e2bc367fa6bff0daf039f00503c846.1491344268.git.brian.avery@intel.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] scripts: change way we find native tools (pseudo)
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
X-List-Received-Date: Tue, 04 Apr 2017 22:40:59 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  4 Apr 2017 15:22:10 -0700
brian avery <brian.avery@intel.com> wrote:

> oe-find-native-sysroot: Recipe Specific Sysroots have eliminated the
> large STAGING_DIR_NATIVE. Now, we will rely on the meta-ide-support
> sysroot that is what was populating the large STAGING_DIR_NATIVE in
> previous versions anyway. We now look for RECIPE_SYSROOT_NATIVE.

So far as I can tell, pseudo internals won't be affected, and this
sounds reasonable to me.

-s


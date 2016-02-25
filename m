Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F23C477355
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 18:28:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1PISgM4027765
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 10:28:42 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 10:28:41 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1456423924.git.mark.hatle@windriver.com>
	<a535895e0c98108980d93d50a8ebd837b07c5605.1456423924.git.mark.hatle@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56CF47D9.8030804@windriver.com>
Date: Thu, 25 Feb 2016 12:28:41 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <a535895e0c98108980d93d50a8ebd837b07c5605.1456423924.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 1/3] rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
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
X-List-Received-Date: Thu, 25 Feb 2016 18:28:42 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2/25/16 12:18 PM, Mark Hatle wrote:
> [Note: base64 pieces were omitted from this patch!  Use the version in the
> -contrib tree if you are interested in the contents.]

The openembedded-core-contrib and poky-contrib have been updated.

patch.xz is not supported patch type, it's been changed to patch.gz.  Everything
else is the same.. (and THIS time I tested it on the correct branch!)

> meta/lib/oe/package_manager.py was also updated.  This ensures that any
> diagnostic messages are ignored from the output of rpmresolve.
> 
> The patches have been split into bug fixes (things that belong upstream)
> and local changes that are OE specific.
> 
> The following patches are obsolete and have been removed:
> 
> rpm-remove-sykcparse-decl.patch
> fstack-protector-configure-check.patch
> rpm-disable-Wno-override-init.patch
> rpm-lua-fix-print.patch
> rpm-rpmpgp-fix.patch
> verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/lib/oe/package_manager.py                     |   14 +-
>  .../rpm/rpm/beecrypt-5.4.15-to-5.4.16.patch.xz     |  Bin 0 -> 26668 bytes
>  meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |   46 +-
>  .../rpm/rpm/fstack-protector-configure-check.patch |   21 -
>  .../rpm/rpm/header-include-fix.patch               |   10 +
>  .../rpm/rpm/lua-5.4.15-to-5.4.16.patch.xz          |  Bin 0 -> 212864 bytes
>  .../rpm/rpm/python-rpm-rpmsense.patch              |   30 +-
>  .../rpm/rpm/rpm-5.4.15-to-5.4.16.patch.xz          |  Bin 0 -> 1316188 bytes
>  meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |   39 +-
>  meta/recipes-devtools/rpm/rpm/rpm-db60.patch       |   56 +
>  .../rpm/rpm/rpm-disable-Wno-override-init.patch    |   32 -
>  .../rpm/rpm/rpm-disable-auto-stack-protector.patch |   32 +
>  .../rpm/rpm/rpm-fix-parseEmbedded.patch            |   27 +
>  .../rpm/rpm/rpm-lua-fix-print.patch                |  104 --
>  ...rpm-macros.in-disable-external-key-server.patch |   16 +-
>  .../rpm/rpm/rpm-mongodb-sasl.patch                 |   69 ++
>  .../rpm/rpm/rpm-payload-use-hashed-inode.patch     |   20 -
>  .../rpm/rpm/rpm-pkgconfigdeps.patch                |   10 +-
>  meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |   16 +-
>  .../rpm/rpm/rpm-python-restore-origin.patch        |   49 +
>  .../rpm/rpm/rpm-remove-sykcparse-decl.patch        |   14 -
>  .../rpm/rpm/rpm-rpmdb-grammar.patch                |  124 +++
>  .../rpm/rpm/rpm-rpmio-headers.patch                |   19 +
>  meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch |   67 --
>  .../rpm/rpm/rpm-scriptletexechelper.patch          |   29 +-
>  .../rpm/rpm/rpm-syck-fix-gram.patch                | 1081 ++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   30 +-
>  .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   27 +-
>  .../rpm/rpm/syck-5.4.15-to-5.4.16.patch.xz         |  Bin 0 -> 4524 bytes
>  meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   36 +-
>  ...broken-logic-for-ghost-avoidance-Mark-Hat.patch |   38 -
>  meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |  206 +++-
>  .../rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb}           |  101 +-
>  33 files changed, 1835 insertions(+), 528 deletions(-)
>  create mode 100644 meta/recipes-devtools/rpm/rpm/beecrypt-5.4.15-to-5.4.16.patch.xz
>  delete mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/lua-5.4.15-to-5.4.16.patch.xz
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-5.4.15-to-5.4.16.patch.xz
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db60.patch
>  delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-auto-stack-protector.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
>  delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
>  delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
>  delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/syck-5.4.15-to-5.4.16.patch.xz
>  delete mode 100644 meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
>  rename meta/recipes-devtools/rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb} (94%)



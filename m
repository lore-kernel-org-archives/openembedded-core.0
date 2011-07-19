Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjEvq-0007Un-1M
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:22:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jul 2011 11:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,229,1309762800"; d="scan'208";a="32170504"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2011 11:18:03 -0700
Message-ID: <4E25CA5B.70607@linux.intel.com>
Date: Tue, 19 Jul 2011 11:18:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310958357.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1310958357.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] Upstream-Status patch additions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2011 18:22:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2011 08:06 PM, Scott Garman wrote:
> Hello,
>
> This pull request simply adds the Upstream-Status metadata field to
> patches for the man and unfs-server recipes.
>
> The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:
>
>    bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/upstream-status
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/upstream-status
>
> Scott Garman (2):
>    man: add Upstream-Status field to paches
>    unfs-server: add Upstream-Status field to patches
>
>   .../001-2.2b47-2.2b51.patch                        |    5 +++++
>   .../unfs-server-2.1+2.2beta47/002-destdir.patch    |    5 +++++
>   .../unfs-server-2.1+2.2beta47/003-manpages.patch   |    5 +++++
>   .../unfs-server-2.1+2.2beta47/004-strsignal.patch  |    5 +++++
>   .../unfs-server-2.1+2.2beta47/005-sys-time.patch   |    5 +++++
>   .../unfs-server-2.1+2.2beta47/006-reiserfs.patch   |    5 +++++
>   .../unfs-server-2.1+2.2beta47/007-map.patch        |    5 +++++
>   .../unfs-server-2.1+2.2beta47/008-configure.patch  |    5 +++++
>   .../unfs-server-2.1+2.2beta47/009-multirw.patch    |    5 +++++
>   .../unfs-server-2.1+2.2beta47/010-realpath.patch   |    5 +++++
>   .../011-fno-strict-aliasing.patch                  |    5 +++++
>   .../unfs-server-2.1+2.2beta47/012-nostrip.patch    |    5 +++++
>   .../unfs-server-2.1+2.2beta47/013-mntpathlen.patch |    5 +++++
>   .../014-uninitialized.patch                        |    5 +++++
>   .../unfs-server-2.1+2.2beta47/015-setattr.patch    |    5 +++++
>   .../016-makefile.in.patch                          |    5 +++++
>   .../017-wrs-dynamic-rpc.patch                      |    5 +++++
>   .../018-remove-tcp-wrappers.patch                  |    5 +++++
>   .../019-pid-before-fork.patch                      |    5 +++++
>   .../020-undefined-chmod-fix.patch                  |    5 +++++
>   .../unfs-server-2.1+2.2beta47/021-nolibwrap.patch  |    5 +++++
>   .../022-add-close-on-exec-descriptors.patch        |    5 +++++
>   .../man/man-1.6f/man-1.5g-nonrootbuild.patch       |    4 ++++
>   .../man/man-1.6f/man-1.5h1-gencat.patch            |    4 ++++
>   .../man/man-1.6f/man-1.5h1-make.patch              |    4 ++++
>   .../man/man-1.6f/man-1.5i2-initial.patch           |    4 ++++
>   .../man/man-1.6f/man-1.5i2-newline.patch           |    4 ++++
>   .../man/man-1.6f/man-1.5i2-overflow.patch          |    4 ++++
>   .../man/man-1.6f/man-1.5j-i18n.patch               |    4 ++++
>   .../man/man-1.6f/man-1.5j-nocache.patch            |    4 ++++
>   .../man/man-1.6f/man-1.5j-utf8.patch               |    4 ++++
>   .../man/man-1.6f/man-1.5k-confpath.patch           |    4 ++++
>   .../man/man-1.6f/man-1.5k-nonascii.patch           |    4 ++++
>   .../man/man-1.6f/man-1.5k-sofix.patch              |    4 ++++
>   .../man/man-1.6f/man-1.5m2-bug11621.patch          |    4 ++++
>   .../man/man-1.6f/man-1.5m2-buildroot.patch         |    4 ++++
>   .../man/man-1.6f/man-1.5m2-multiple.patch          |    4 ++++
>   .../man-1.6f/man-1.5m2-no-color-for-printing.patch |    4 ++++
>   .../man/man-1.6f/man-1.5m2-sigpipe.patch           |    4 ++++
>   .../man/man-1.6f/man-1.5m2-tv_fhs.patch            |    4 ++++
>   .../man/man-1.6f/man-1.6e-i18n_whatis.patch        |    4 ++++
>   .../man/man-1.6f/man-1.6e-lzma+xz-support.patch    |    4 ++++
>   .../man/man-1.6f/man-1.6e-mandirs.patch            |    4 ++++
>   .../man/man-1.6f/man-1.6e-new_sections.patch       |    4 ++++
>   .../man/man-1.6f/man-1.6e-ro_usr.patch             |    4 ++++
>   .../man/man-1.6f/man-1.6e-security.patch           |    4 ++++
>   .../man-1.6e-use_i18n_vars_in_a_std_way.patch      |    4 ++++
>   .../man/man-1.6f/man-1.6e-whatis2.patch            |    4 ++++
>   48 files changed, 214 insertions(+), 0 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-core

Thanks
	Sau!



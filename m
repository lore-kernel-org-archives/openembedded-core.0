Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CE53B71A65
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 19:37:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2017 12:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,344,1498546800"; d="scan'208";a="121384422"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2017 12:37:38 -0700
Message-ID: <1502221573.1934.21.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 08 Aug 2017 14:46:13 -0500
In-Reply-To: <CAJTo0LaVB7h5ycSzGOcQgpLKcPVbByu9KeR7oqZWoF1Ab4KU4g@mail.gmail.com>
References: <20170808014624.9506-1-JPEWhacker@gmail.com>
	<CAJTo0LaVB7h5ycSzGOcQgpLKcPVbByu9KeR7oqZWoF1Ab4KU4g@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] externalsrc: Handle .git not being a directory
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
X-List-Received-Date: Tue, 08 Aug 2017 19:37:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-08-08 at 20:32 +0100, Burton, Ross wrote:
> On 8 August 2017 at 02:46, Joshua Watt <jpewhacker@gmail.com> wrote:
>         +        git_dir = subprocess.check_output(['git',
>         'rev-parse', '--absolute-git-dir'],
>         cwd=s_dir).decode("utf-8").rstrip()
> 
> 
> Doesn't work with my old git:
> 
> 
> bb.data_smart.ExpansionError: Failure expanding variable
> do_compile[file-checksums], expression was ${@srctree_hash_files(d)}
> which triggered exception FileNotFoundError: [Errno 2] No such file or
> directory: '--absolute-git-dir/index'
> Summary: There was 1 ERROR message shown, returning a non-zero exit
> code.
> 
> 
> 
> $ git rev-parse --absolute-git-dir
> --absolute-git-dir
> $ git --version
> git version 2.11.0
> 
I also tried it and got same log. my git is a bit newer (2.12.3).

Leo
> 
> Ross
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core




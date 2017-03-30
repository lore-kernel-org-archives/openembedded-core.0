Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D8C3277CD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 14:30:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 30 Mar 2017 07:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,246,1486454400"; d="scan'208";a="1113667497"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by orsmga001.jf.intel.com with ESMTP; 30 Mar 2017 07:30:13 -0700
Message-ID: <1490884701.17259.52.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Mar 2017 08:38:21 -0600
In-Reply-To: <CAJTo0Lbb-TZYaZs+aKMSZEKUAhcN=8n6+bDrq5GjaTxo-Ws-cw@mail.gmail.com>
References: <20170330063921.31988-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0Lbb-TZYaZs+aKMSZEKUAhcN=8n6+bDrq5GjaTxo-Ws-cw@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/pkgdata: support musl on unit tests
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
X-List-Received-Date: Thu, 30 Mar 2017 14:30:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-03-30 at 12:45 +0100, Burton, Ross wrote:
> 
> On 30 March 2017 at 07:39,
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>         +        # recipe-runtime-package relation for virtual/libc
>         provider
>         +        Libc = collections.namedtuple('Libc', ['recipe',
>         'runtime_pkg', 'libpath', 'staticdev', 'utils', 'rutils'])
>         +        cls.libc = Libc('glibc', 'libc6', '/lib/libc.so.6',
>         'libc6-staticdev', 'glibc-utils', 'lib6-utils')
>         +        if get_bb_var('TCLIBC') == 'musl':
>         +            cls.libc = Libc('musl', 'musl',
>         '/usr/lib/libc.so', 'musl-staticdev', None, None)
>         
> 
> Instead of all of this, why not just change the tests to use a
> different package?  The bulk of them were just using glibc as it's
> going to be built, but we've built zlib too so the tests could use
> that instead.

If you consider that replacing the libc for another recipe/package is
fine, I go that way.

Leo
> 
> 
> Ross




Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 777A361EEB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 15:09:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2013 08:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,988,1363158000"; d="scan'208";a="339948501"
Received: from unknown (HELO helios.localnet) ([10.252.121.227])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2013 08:09:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 03 Jul 2013 16:09:55 +0100
Message-ID: <3743526.ioJ26RjPsj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAJTo0LaoRo3urg=M8n5+V0zD9y8RzJ=dRZPjYBupz8mR_HiWQQ@mail.gmail.com>
References: <1372858838-17887-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAJTo0LaoRo3urg=M8n5+V0zD9y8RzJ=dRZPjYBupz8mR_HiWQQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/insane: fix libdir check regexes
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
X-List-Received-Date: Wed, 03 Jul 2013 15:09:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 July 2013 15:35:15 Burton, Ross wrote:
> On 3 July 2013 14:40, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> > +    lib_re = re.compile("^/lib.*\.so[0-9.]*$")
> > +    exec_re = re.compile("^%s.*/lib.*\.so[0-9.]*$" % exec_prefix)
> 
> I'd been meaning to double-check this assumption since the discussion
> yesterday, and I'm glad I did.  My Debian machine has these files in
> /usr/lib that don't match that regex:
> 
> libatlas.so.3gf
> libblas.so.3gf
> libcblas.so.3gf
> libf77blas.so.3gf
> liblapack_atlas.so.3gf
> liblapack.so.3gf
> libmozjs.so.10d
> libnspr4.so.0d
> libnss3.so.1d
> libnssutil3.so.1d
> libplc4.so.0d
> libplds4.so.0d
> libsmime3.so.1d
> libssl3.so.1d
> 
> How about ^lib.+\.so(\..+)?$ to match a library filename?

Hmm, right. That looks reasonable. v2 sent.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


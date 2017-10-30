Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AF71F71A8E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 10:51:11 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 30 Oct 2017 03:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,319,1505804400"; d="scan'208";a="143823072"
Received: from mlehtone-mac02.fi.intel.com (HELO [10.237.66.46])
	([10.237.66.46])
	by orsmga004.jf.intel.com with ESMTP; 30 Oct 2017 03:51:10 -0700
User-Agent: Microsoft-MacOutlook/f.27.0.171010
Date: Mon, 30 Oct 2017 12:51:12 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: ChenQi <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
Message-ID: <0973040A-9027-4FEF-A333-5350D48E02E7@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v5 05/10] bitbake.conf: add ip and scp to
	HOSTTOOLS unconditionally
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<8d1c4aacc60173f9db4809d23303d4825cc0090d.1509094533.git.markus.lehtonen@linux.intel.com>
	<9fb0243b-5fef-e5c3-1175-3af8c3f3db7d@windriver.com>
In-Reply-To: <9fb0243b-5fef-e5c3-1175-3af8c3f3db7d@windriver.com>
Mime-version: 1.0
Subject: Re: [PATCH v5 05/10] bitbake.conf: add ip and scp to HOSTTOOLS unconditionally
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
X-List-Received-Date: Mon, 30 Oct 2017 10:51:11 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

Hi,

What that tries state is that the image uses facilities written for runtimetest (i.e. oeqa.targetcontrol) to run binaries on the target machine. The new image introduced (i.e. python-pgo-image) uses this to run the profiling task on device.

Thanks,
  Markus


On 30/10/2017, 3.29, "ChenQi" <Qi.Chen@windriver.com> wrote:

    On 10/27/2017 06:07 PM, Markus Lehtonen wrote:
    > Needed to be able to run images using the runtime test facilities.
    
    Hi Markus,
    
    What do you mean by 'run images using runtime test facilities'?
    testimage? ptest?
    'scp' and 'ip' are added to HOSTTOOLS if 'testimage' is inherited.
    What's the use case that still needs 'scp' and 'ip' unconditionally?
    
    In addition, if we add these two utilities to HOSTTOOLS unconditionally.
    Please cc to doc people to also change the QuickStart.
    
    Regards,
    Chen Qi
    
    > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
    > ---
    >   meta/conf/bitbake.conf | 6 +++---
    >   1 file changed, 3 insertions(+), 3 deletions(-)
    >
    > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
    > index 9696273acc..9075d03998 100644
    > --- a/meta/conf/bitbake.conf
    > +++ b/meta/conf/bitbake.conf
    > @@ -476,15 +476,15 @@ HOSTTOOLS += " \
    >       [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp cpio \
    >       cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
    >       fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
    > -    head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
    > +    head hostname id install ip ld ldd ln ls make makeinfo md5sum mkdir mknod \
    >       mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
    > -    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
    > +    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen scp sed sh sha256sum \
    >       sleep sort split stat strings strip tail tar tee test touch tr true uname \
    >       uniq wc wget which xargs \
    >   "
    >   
    >   # Tools needed to run testimage runtime image testing
    > -HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
    > +HOSTTOOLS += "${@['', 'ping ps ssh stty'][bb.data.inherits_class('testimage', d)]}"
    >   
    >   # Link to these if present
    >   HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat ssh sudo"
    
    
    




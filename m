Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 358717198A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 16:25:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2017 09:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,344,1498546800"; d="scan'208";a="121318961"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2017 09:25:39 -0700
Message-ID: <1502210054.1934.1.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 08 Aug 2017 11:34:14 -0500
In-Reply-To: <CAJTo0LbdP=cQCXd1k5ogPnz3Rn7tcwY5sMhWEKWApvo_VMgCOw@mail.gmail.com>
References: <20170807213351.600-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170807213351.600-2-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LbdP=cQCXd1k5ogPnz3Rn7tcwY5sMhWEKWApvo_VMgCOw@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] sstatetests: limit the number of signature comparisons when differ
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
X-List-Received-Date: Tue, 08 Aug 2017 16:25:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-08-08 at 15:40 +0100, Burton, Ross wrote:
> On 7 August 2017 at 22:33,
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>         From: Leonardo Sandoval
>         <leonardo.sandoval.gonzalez@linux.intel.com>
>         
>         For perfomance reasons, limit the number of signature
>         comparisons when
>         stamps differ. The limit set is hardcoded to 20.
>         
>         [YOCTO #11651]
>         
>         Signed-off-by: Leonardo Sandoval
>         <leonardo.sandoval.gonzalez@linux.intel.com>
>         ---
>          meta/lib/oeqa/selftest/cases/sstatetests.py | 40
>         +++++++++++++++++++----------
>          1 file changed, 26 insertions(+), 14 deletions(-)
>         
>         diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py
>         b/meta/lib/oeqa/selftest/cases/sstatetests.py
>         index 0b36027918..6298443a18 100644
>         --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
>         +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
>         @@ -458,6 +458,25 @@ http_proxy = "http://example.com/"
>                              base = os.sep.join(root.rsplit(os.sep,
>         2)[-2:] + [name])
>                              f[base] = shash
>                      return f
>         +
>         +        def compare_sigfiles(files, files1, files2,
>         compare=False):
>         +            for k in files:
>         +                if k in files1 and k in files2:
>         +                    i_sigfile += 1
> 
> 
> Surely this is going to produce an i_sigfile is not defined error?

Right, I forgot to remove that line and test it properly. Will send
another revision.

Leo



> 
> 
> Ross 




Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CE70B6AC24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 09:03:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 24 Apr 2015 02:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,638,1422950400"; d="scan'208";a="714857292"
Received: from jevens-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.46])
	by fmsmga002.fm.intel.com with ESMTP; 24 Apr 2015 02:03:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Fri, 24 Apr 2015 10:03:32 +0100
Message-ID: <9598845.8ZbdBo0yX6@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <d690fdd4b6924ba28eff25f4f9fb4dc5d2f5ca56.1429865892.git.Qi.Chen@windriver.com>
References: <cover.1429865892.git.Qi.Chen@windriver.com>
	<d690fdd4b6924ba28eff25f4f9fb4dc5d2f5ca56.1429865892.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/2] uninative-tarball: delete the packagedata task
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
X-List-Received-Date: Fri, 24 Apr 2015 09:03:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 24 April 2015 16:59:34 Chen Qi wrote:
> This task is meaningless for uninative-tarball as the package task
> has been deleted. Besides, sometimes it would cause problems. To
> reproduce, use the following command.
> 
> bitbake uninative-tarball -c cleansstate && bitbake uninative-tarball &&
> bitbake uninative-tarball -c clean && bitbake uninative-tarball
> 
> The error is something like below.
> 
> File: 'sstate.bbclass', lineno: 33, function: sstate_installpkg
>      0029:        bb.build.exec_func(f, d)
>      0030:
>      0031:    for state in ss['dirs']:
>      0032:        prepdir(state[1])
>  *** 0033:        os.rename(sstateinst + state[0], state[1])
>      0034:    sstate_install(ss, d)
>      0035:
>      0036:    for plain in ss['plaindirs']:
>      0037:        workdir = d.getVar('WORKDIR', True)
> Exception: OSError: [Errno 2] No such file or directory
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/meta/uninative-tarball.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/meta/uninative-tarball.bb
> b/meta/recipes-core/meta/uninative-tarball.bb index 62bdde8..41f7927 100644
> --- a/meta/recipes-core/meta/uninative-tarball.bb
> +++ b/meta/recipes-core/meta/uninative-tarball.bb
> @@ -23,6 +23,7 @@ inherit populate_sdk
> 
>  deltask install
>  deltask package
> +deltask packagedata
> 
>  SDK_DEPENDS += "patchelf-native"

I forgot to note, this one is filed also - [YOCTO #7597]. Can you please add 
this to the commit message on the branch?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


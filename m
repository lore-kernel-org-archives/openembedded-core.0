Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 524A071ADE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:01:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3J91nqT004837
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Apr 2017 02:01:49 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Apr 2017 02:01:49 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1492592223.git.paul.eggleton@linux.intel.com>
	<63ad928771459b7087ce69f5f372d159c02103f9.1492592223.git.paul.eggleton@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d7722b1a-5c5c-196c-77ff-5b4a7811302c@windriver.com>
Date: Wed, 19 Apr 2017 17:01:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <63ad928771459b7087ce69f5f372d159c02103f9.1492592223.git.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/3] runqemu: fix incorrect calls to get variable values
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
X-List-Received-Date: Wed, 19 Apr 2017 09:01:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, this should be my fault, this fix is fine to me.

// Robert

On 04/19/2017 04:57 PM, Paul Eggleton wrote:
> We were specifying a default parameter; the get() function defined here
> does not take such a parameter. I appears this code had not been tested.
> This fixes runqemu erroring out immediately when used within the eSDK.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/runqemu | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 3744c67..605bcf2 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -732,8 +732,8 @@ class BaseConfig(object):
>                  # be able to call `bitbake -e`, then try:
>                  # - get OE_TMPDIR from environment and guess paths based on it
>                  # - get OECORE_NATIVE_SYSROOT from environment (for sdk)
> -                tmpdir = self.get('OE_TMPDIR', None)
> -                oecore_native_sysroot = self.get('OECORE_NATIVE_SYSROOT', None)
> +                tmpdir = self.get('OE_TMPDIR')
> +                oecore_native_sysroot = self.get('OECORE_NATIVE_SYSROOT')
>                  if tmpdir:
>                      logger.info('Setting STAGING_DIR_NATIVE and STAGING_BINDIR_NATIVE relative to OE_TMPDIR (%s)' % tmpdir)
>                      hostos, _, _, _, machine = os.uname()
>


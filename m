Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T2pkH-0005J2-Dj
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 22:35:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Aug 2012 13:23:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,791,1336374000"; d="scan'208";a="210358676"
Received: from unknown (HELO helios.localnet) ([10.252.121.86])
	by fmsmga002.fm.intel.com with ESMTP; 18 Aug 2012 13:23:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Aug 2012 21:23:42 +0100
Message-ID: <3365994.Ze6JgaDIRU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1345309553-12079-1-git-send-email-raj.khem@gmail.com>
References: <1345309553-12079-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] unifdef-native: Correct LICENSE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Aug 2012 20:35:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 18 August 2012 10:05:52 Khem Raj wrote:
> The header in sourcefile says its BSD licensed
> not GPL therefore make the correction
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../unifdef/unifdef-native_2.6.18+git.bb           |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
> b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb index
> 1b93816..141b891 100644
> --- a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
> +++ b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
> @@ -1,6 +1,8 @@
>  DESCRIPTION = "Kernel header preprocessor"
>  SECTION = "devel"
> -LICENSE = "GPL"
> +LICENSE = "BSD-3-Clause"

It's 2-clause, according to the following:

http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/unifdef/files/unifdef.c
http://dotat.at/cgi/git?p=unifdef.git;a=blob;f=COPYING;hb=HEAD

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



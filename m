Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1T61fJ-00047a-8d
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 17:55:51 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 27 Aug 2012 08:42:32 -0700
Received: by pbcxa7 with SMTP id xa7so7268998pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 08:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=Kxj1JJeH3+iavtIAvmUXEYAm7M6SmTRlvyhqMQ0HcgI=;
	b=gdM1eme524UDTdHjRjiIm4CMA2iFl4patcXswf4NI5d8vCAuWJNnIvuM1ZdocCZOHN
	x0q3ZZSBJJvq7Q9ZPc0drNmuANJr2Pi0/JK21GUvqBWlbyryA8XcPBmOg8xLR3gnAdOe
	hJaA58NtamjUF3XpV4eTMoYZiNTPfgqATb9fImdEciOZz6LZJIumjXSiwVT3ehh57XeB
	nH2NIJrAld1E2i49quVj/OKYLKUW/c3RrB4KLPrxUPXKCGq4+LPZkAws20FjmnyzloQA
	2aFmtIi2SbiL3xV24VGKPOnlUodFYTLphz/6b8C75gYY/MK2KtXRQWWEvDbVTMIJ+7Ql
	qMaQ==
Received: by 10.68.230.232 with SMTP id tb8mr35181069pbc.19.1346082152119;
	Mon, 27 Aug 2012 08:42:32 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id qo8sm14944632pbb.19.2012.08.27.08.42.30
	(version=SSLv3 cipher=OTHER); Mon, 27 Aug 2012 08:42:31 -0700 (PDT)
Message-ID: <503B9565.1060504@intel.com>
Date: Mon, 27 Aug 2012 08:42:29 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1345694632.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1345694632.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQlm1KKGLV8RD/ZW6Z9nBsDKSH/qH5RxpbwzwSdYlTBgLahUlqL+TtJjGewKM6lupSTxZzgN
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] linux-yocto: custom repo fixes
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
X-List-Received-Date: Mon, 27 Aug 2012 15:55:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2012 09:08 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> I worked through some custom repository issues over the past day, and
> the outcome is two small patches to fix some corner cases. I've tested
> these with the standard linux-yocto recipes, with my base linux-yocto-custom,
> eternalsrc and the repositories that were showing the error.
>
> (patches are stacked on my yocto base, but that history has no impact).
>
> Cheers,
>
> Bruce
>
> The following changes since commit 19ff55a53b436d463f9577adaed15be77708f0d2:
>
>    routerstationpro: move board off 3.0 and onto the 3.4 kernel (2012-08-22 14:26:10 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (2):
>    kernel-yocto: don't require meta branch for custom repos
>    kernel-yocto: set master branch to a defined SRCREV
>
>   meta/classes/kernel-yocto.bbclass                  |   17 +++++++++++------
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   2 files changed, 12 insertions(+), 7 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!




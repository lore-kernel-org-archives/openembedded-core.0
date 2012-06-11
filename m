Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Se8yF-00018u-O2
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:04:07 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga01.intel.com with ESMTP/TLS/RC4-MD5; 11 Jun 2012 10:49:53 -0700
Received: by pbbro8 with SMTP id ro8so5630448pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=ki1tCjed/w2MEk2jDkg7H7tm15wESuw2W9QSzN4BZQg=;
	b=NeIRDyCsd5R7igi42LZPUA9svMbxuL4JMVFNksF2Te7y0YYEis4Cxk5oWNDa7fYKP6
	cA7i+ojdRKHZI8W/E9TIEofPpnLKzQ5q8MYEX6K2oWqHcFwi+L16VBdyDHgWG0U9OOFv
	6pJDdPXHv+jGyqkJjcl3yp5heActzj6RIWf2bWPLXtSZ8ZerMjW7A9zxOUmqQmEs9Ufn
	23NVhGBLVfKpjnCrBXiCOdg4vOy/+wWXheqfXqSuCwWeCWreznTU0w1A0R8u4YD+5i2A
	ff0l9HYDXM7H6wqchWLWSft6iXaFL6Fqn2V26v/iXoeoS8rusoeQJfrxDgXJrCx6Hf4X
	3J/g==
Received: by 10.68.232.232 with SMTP id tr8mr28940276pbc.73.1339436993224;
	Mon, 11 Jun 2012 10:49:53 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id he9sm12459313pbc.68.2012.06.11.10.49.51
	(version=SSLv3 cipher=OTHER); Mon, 11 Jun 2012 10:49:52 -0700 (PDT)
Message-ID: <4FD62FC5.5010807@intel.com>
Date: Mon, 11 Jun 2012 10:49:57 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
	<1339166898-11667-2-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1339166898-11667-2-git-send-email-laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQmJbcAxo6wSxN2Yd23HSh8ITb5AfT9BtcL47+aYVw7xZk9BzVuvVq8agT0HmZv2OlJ7UNA0
Subject: Re: [PATCH 1/4] freetype: upgrade to 2.4.9
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
X-List-Received-Date: Mon, 11 Jun 2012 18:04:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2012 07:48 AM, Laurentiu Palcu wrote:
> Signed-off-by: Laurentiu Palcu<laurentiu.palcu@intel.com>

Hi Laurentiu,

Since this commit fixes a bug and addresses security issues, please be 
sure to include these details in the future in your commit log. 
Something along the lines of:

Addresses CVE-2012-1126, CVE-2012-1127, CVE-2012-1128, ...

This fixes [YOCTO #2468]

helps us track security-related fixes and bugfixes more easily.

Note, in this case the number of CVEs this fixes is unusually long (I 
count 19 of them), but listing all of them is good policy.

Thanks,

Scott

> ---
>   .../no-hardcode.patch                              |    0
>   .../{freetype_2.4.8.bb =>  freetype_2.4.9.bb}       |    4 ++--
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-graphics/freetype/{freetype-2.4.8 =>  freetype-2.4.9}/no-hardcode.patch (100%)
>   rename meta/recipes-graphics/freetype/{freetype_2.4.8.bb =>  freetype_2.4.9.bb} (91%)
>
> diff --git a/meta/recipes-graphics/freetype/freetype-2.4.8/no-hardcode.patch b/meta/recipes-graphics/freetype/freetype-2.4.9/no-hardcode.patch
> similarity index 100%
> rename from meta/recipes-graphics/freetype/freetype-2.4.8/no-hardcode.patch
> rename to meta/recipes-graphics/freetype/freetype-2.4.9/no-hardcode.patch
> diff --git a/meta/recipes-graphics/freetype/freetype_2.4.8.bb b/meta/recipes-graphics/freetype/freetype_2.4.9.bb
> similarity index 91%
> rename from meta/recipes-graphics/freetype/freetype_2.4.8.bb
> rename to meta/recipes-graphics/freetype/freetype_2.4.9.bb
> index bce01cf..31bee80 100644
> --- a/meta/recipes-graphics/freetype/freetype_2.4.8.bb
> +++ b/meta/recipes-graphics/freetype/freetype_2.4.9.bb
> @@ -18,8 +18,8 @@ PR = "r0"
>   SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
>              file://no-hardcode.patch"
>
> -SRC_URI[md5sum] = "dbf2caca1d3afd410a29217a9809d397"
> -SRC_URI[sha256sum] = "a9eb7da3875fcb2f022a9c280c01b94ae45ac83d8102838c05dce1277948fb71"
> +SRC_URI[md5sum] = "77a893dae81fd5b896632715ca041179"
> +SRC_URI[sha256sum] = "c4204ac1d48e99d4375a2f32bf4f3f92780a9d9f015e64e57e852f6c004859b9"
>
>   S = "${WORKDIR}/freetype-${PV}"
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center



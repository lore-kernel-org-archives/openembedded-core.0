Return-Path: <Stefan_Seefeld@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 00B2C60DF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:42:26 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1XHvIR-0007S1-Ce from Stefan_Seefeld@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Aug 2014 06:42:27 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 14 Aug 2014 06:42:27 -0700
Received: from [0.0.0.0] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.2.247.3;
	Thu, 14 Aug 2014 06:42:26 -0700
Message-ID: <53ECBCBF.4060209@mentor.com>
Date: Thu, 14 Aug 2014 09:42:23 -0400
From: Stefan Seefeld <stefan_seefeld@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1408023506.22187.106.camel@ted>
In-Reply-To: <1408023506.22187.106.camel@ted>
X-OriginalArrivalTime: 14 Aug 2014 13:42:27.0284 (UTC)
	FILETIME=[962A7940:01CFB7C5]
Subject: Re: [PATCH] site: Add common-darwin
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
X-List-Received-Date: Thu, 14 Aug 2014 13:42:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 08/14/2014 09:38 AM, Richard Purdie wrote:
> We need this to ensure there are some correct values when building with
> meta-darwin. This matches the addition of a common-mingw site file in
> the core.
> 
> diff --git a/meta/site/common-darwin b/meta/site/common-darwin
> new file mode 100644
> index 0000000..604c04b
> --- /dev/null
> +++ b/meta/site/common-darwin
> @@ -0,0 +1,2 @@
> +ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
> +ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getgrgid_r=yes}

This looks like a typo. Shouldn't the second line start with
"ac_cv_func_posix_getgrgid_r=..." ?

	Stefan


-- 
Stefan Seefeld
CodeSourcery / Mentor Embedded
http://www.mentor.com/embedded-software/


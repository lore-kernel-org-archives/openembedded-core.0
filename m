Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 38B4F6C963
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 17:36:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08HaZCT020502; Wed, 8 Jan 2014 17:36:35 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EXu0DdI-6Dt4; Wed,  8 Jan 2014 17:36:35 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08HaVQ7020498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 8 Jan 2014 17:36:32 GMT
Message-ID: <1389202585.19102.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Date: Wed, 08 Jan 2014 17:36:25 +0000
In-Reply-To: <1389028342-23264-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1389028342-23264-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] Modify buildstats to be merged inside buildhistory
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
X-List-Received-Date: Wed, 08 Jan 2014 17:36:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-01-06 at 18:12 +0100, Corneliu Stoicescu wrote:
> - added buildstats inheritance inside buildhistory
> - when buildhisory is used, buildstats will be moved inside the buildhistory directory
> ---
>  meta/classes/buildhistory.bbclass |    3 +++
>  meta/classes/buildstats.bbclass   |    2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index e9a9c3b..54efecfe 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -16,9 +16,12 @@ BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
>  BUILDHISTORY_COMMIT ?= "0"
>  BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
>  BUILDHISTORY_PUSH_REPO ?= ""
> +BUILDSTATS_BASE = "${BUILDHISTORY_DIR}/buildstats"
>  
>  SSTATEPOSTINSTFUNCS += "buildhistory_emit_pkghistory"
>  
> +inherit buildstats
> +

I don't think we need this inherit line. The user can still decide
whether to include it or not, if it is included, it can be under
buildhistory control. So it should be safe simply to remove it.

Cheers,

Richard




Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 725F97FC8E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 01:07:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2019 17:07:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,227,1571727600"; d="scan'208";a="201330453"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by orsmga008.jf.intel.com with ESMTP; 21 Nov 2019 17:07:50 -0800
To: openembedded-core@lists.openembedded.org
References: <1574350084-21061-1-git-send-email-stefan.ghinea@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <1a92ed53-86a0-7588-beb2-c62136bb3df4@intel.com>
Date: Fri, 22 Nov 2019 01:07:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1574350084-21061-1-git-send-email-stefan.ghinea@windriver.com>
Subject: Re: [PATCH] ghostscript: CVE-2019-14869
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
X-List-Received-Date: Fri, 22 Nov 2019 01:07:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 21/11/2019 15:28, Stefan Ghinea wrote:
>                   file://CVE-2019-14811-0001.patch \
>                   file://CVE-2019-14817-0001.patch \
>                   file://CVE-2019-14817-0002.patch \
> +                file://CVE-2019-14869-0001.patch \
> +
>   "


Parsing recipes...ERROR: ParseError at 
/home/pokybuild/yocto-worker/qemux86-64/build/meta/recipes-extended/ghostscript/ghostscript_9.27.bb:32: 
unparsed line: 'SRC_URI_BASE = 
"https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927/${BPN}-${PV}.tar.gz 
                 file://ghostscript-9.15-parallel-make.patch 
     file://ghostscript-9.16-Werror-return-type.patch 
file://do-not-check-local-libpng-source.patch 
file://avoid-host-contamination.patch 
file://mkdir-p.patch                 file://CVE-2019-14811-0001.patch 
              file://CVE-2019-14817-0001.patch 
file://CVE-2019-14817-0002.patch 
file://CVE-2019-14869-0001.patch '

Please remember to test your patches.

Ross


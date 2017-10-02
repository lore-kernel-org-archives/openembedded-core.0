Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 95CB771DD0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 14:57:15 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 02 Oct 2017 07:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,469,1500966000"; d="scan'208";a="158409573"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2017 07:57:16 -0700
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <20171002145234.6306-1-otavio@ossystems.com.br>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e28ad2ad-f30c-bffe-808d-4f6d782f172d@linux.intel.com>
Date: Mon, 2 Oct 2017 17:53:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171002145234.6306-1-otavio@ossystems.com.br>
Subject: Re: [PATCH v3] lib/oe/package_manager.py (rpm): Allow use of non-signed packages
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
X-List-Received-Date: Mon, 02 Oct 2017 14:57:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/02/2017 05:52 PM, Otavio Salvador wrote:

> @@ -551,6 +551,8 @@ class RpmPM(PackageManager):
>           if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
>               gpg_opts = 'repo_gpgcheck=1\n'
>               gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
> +        elif: self.d.getVar('RPM_SIGN_PACKAGES') == '0':
> +            gpg_opts = 'gpgcheck=0\n'
>           else:
>               gpg_opts = ''

Still wrong! I'm kind of getting tired though. Can you figure it out for 
yourself, this time?

Alex



Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EBC3860234
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Oct 2017 07:39:51 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Oct 2017 00:39:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,463,1500966000"; d="scan'208";a="158017053"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 01 Oct 2017 00:39:51 -0700
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <20170930180655.25134-1-otavio@ossystems.com.br>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d270479c-2e98-0211-1cc0-b7775a318d1b@linux.intel.com>
Date: Sun, 1 Oct 2017 10:36:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170930180655.25134-1-otavio@ossystems.com.br>
Subject: Re: [PATCH 1/2] lib/oe/package_manager.py (rpm): Signature check is enabled by default
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
X-List-Received-Date: Sun, 01 Oct 2017 07:39:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/30/2017 09:06 PM, Otavio Salvador wrote:
> The dnf has GPG signature check enabled by default. It has been confimed using:
> 
> ,----
> | root@qemux86-64:~# grep gpgcheck /etc/dnf/dnf.conf
> | gpgcheck=1
...
>           if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
> -            gpg_opts = 'repo_gpgcheck=1\n'
>               gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))


NAK both patches, I'm afraid. gpgcheck and repo_gpgcheck are two 
different options, which control different things, and you thoroughly 
confused them here.

Alex


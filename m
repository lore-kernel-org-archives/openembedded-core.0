Return-Path: <radu.moisan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 363406AEA2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 12:11:48 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Jul 2013 05:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1001,1363158000"; d="scan'208";a="264440153"
Received: from ubuntu.rb.intel.com (HELO [10.237.105.59]) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jul 2013 05:11:47 -0700
Message-ID: <51D6B875.6020005@intel.com>
Date: Fri, 05 Jul 2013 15:13:41 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1372950678.git.radu.moisan@intel.com>
	<84abd44bc70ed4b13ca44a8ad32a8a91d708163b.1372950678.git.radu.moisan@intel.com>
	<CAJTo0LYK3=YTgHq39=g-m+CYLGx=+52xA=uvrzF=Ch_36VfSow@mail.gmail.com>
In-Reply-To: <CAJTo0LYK3=YTgHq39=g-m+CYLGx=+52xA=uvrzF=Ch_36VfSow@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/10] iputils: Upgrade to v20121221
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
X-List-Received-Date: Fri, 05 Jul 2013 12:11:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 07/04/2013 07:12 PM, Burton, Ross wrote:
> On 4 July 2013 16:13, Radu Moisan <radu.moisan@intel.com> wrote:
>> -DEPENDS = "openssl docbook-utils-native sgmlspl-native"
>> +DEPENDS = "gnutls docbook-utils-native sgmlspl-native"
> Please say why this change is happening.  Also is there a configure
> option to force the use of gnutls over openssl, or what happens if
> openssl was already installed when iptuils builds?  Vague dependencies
> cause sstate problems.

Sadly I don't remember the reason. I'll drop this and fallback to openssl.
v3 patchest folowing.

Radu


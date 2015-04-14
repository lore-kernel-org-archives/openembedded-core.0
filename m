Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56EBF65CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 01:23:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3E1NRhO007047
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Apr 2015 18:23:27 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 13 Apr 2015 18:23:31 -0700
Message-ID: <552C6C0D.7060300@windriver.com>
Date: Tue, 14 Apr 2015 09:23:25 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1428656126.git.liezhi.yang@windriver.com>
	<01d8849d5b3421ecaed8bd5d9ccb5e8cbdc926b8.1428656126.git.liezhi.yang@windriver.com>
	<CAJTo0LYLK6=BLLhQj3o28ApZwq_vGhCAmkK1ijyVWBWHdevwFw@mail.gmail.com>
In-Reply-To: <CAJTo0LYLK6=BLLhQj3o28ApZwq_vGhCAmkK1ijyVWBWHdevwFw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/15] aspell: remove libpspell-dev from PACKAGES
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
X-List-Received-Date: Tue, 14 Apr 2015 01:23:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/13/2015 09:33 PM, Burton, Ross wrote:
>
> On 10 April 2015 at 10:29, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     +FILES_${PN}-dev += "${bindir}/pspell-config"
>
>       inherit autotools-brokensep gettext texinfo
>
>
> Is that a binconfig-style pspell-config and so we should be inheriting
> binconfig.bbclass?

Yes, I think so, I will fix that.

// Robert

>
> Ross


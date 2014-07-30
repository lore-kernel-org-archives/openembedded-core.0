Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 71D0A70961
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 18:08:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2014 11:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,765,1400050800"; d="scan'208";a="577820047"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO [10.255.12.249])
	([10.255.12.249])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2014 11:07:12 -0700
Message-ID: <53D93450.4070503@linux.intel.com>
Date: Wed, 30 Jul 2014 11:07:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Leah <leah@wolfssl.com>, openembedded-core@lists.openembedded.org
References: <CAL0pqZ0w0qmwPUhtEOfc6DCMggH6t_ELWOxhpWPSCxETta-u9A@mail.gmail.com>
	<CAL0pqZ2VaH_mCrNkXQvUOWNC_eWSTUUk-Gyp1eX06XL17EvLQA@mail.gmail.com>
In-Reply-To: <CAL0pqZ2VaH_mCrNkXQvUOWNC_eWSTUUk-Gyp1eX06XL17EvLQA@mail.gmail.com>
Subject: Re: Add recipe to openembedded, adjust layer
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
X-List-Received-Date: Wed, 30 Jul 2014 18:08:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2014 10:53 AM, Leah wrote:
> Hi,
>
> I have a recipe - cyassl_3.1.0.bb, a lightweight ssl library that I would
> like to add to openembedded. I am not sure as to the best location, perhaps
> recipes-connectivity? Do I need to submit this recipe the same way I would
> submit a layer?
>
THis might be better suited for the meta-openembedded collection of 
layers, possibly under meta-networking, you can send it to the 
openembedded-devel@lists.openembedded.org list as a patch.


> Also, is there a way to edit my current layer's information(meta-wolfssl)
> on the openembedded layer index?
>
It appears that Chris Conlon has already submitted meta-wolfssl, see

http://layers.openembedded.org/layerindex/branch/master/layer/meta-wolfssl/

Sau!

> Thanks,
>
> Leah
>
>
>


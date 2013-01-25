Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TygPt-0004Zh-Qt
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 11:21:50 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 25 Jan 2013 02:04:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,537,1355126400"; d="scan'208";a="195030018"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Jan 2013 02:04:09 -0800
Message-ID: <51025A35.1070009@intel.com>
Date: Fri, 25 Jan 2013 12:11:01 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama> <51013F96.80302@intel.com>
	<CAGiJk9ca5XZXMamBFOr+syV08WK--2CYONS_0f=rCxrZkm+n-g@mail.gmail.com>
	<CAGiJk9dpU1vpqUZt_+3aS4Bu97_kEkftPrOameF-LAB1qd2qDg@mail.gmail.com>
	<CAJTo0LbN7djNS17qDc60716+uSSgjKbtXHnUvsCWq6Bm_zKigA@mail.gmail.com>
	<CALbNGRQhr3GGp+Hx2jMOs0sEXCw5PNYdQhfoiHL0Kw1AxWvf6g@mail.gmail.com>
	<CAJTo0LZR4BjQYHPfaBtGpDe9Oi1qTuv=wAvhCkQ6EtfNkuLKtg@mail.gmail.com>
	<CAGiJk9ca7C5UWwLW0GTsiqSxH=TjOHfQ_bd4L9YgiKW+151cuw@mail.gmail.com>
	<CAJTo0LaEiSg-V_kFPLMVDfz51GunE97JwPUHTDW_WWjCXoPOaA@mail.gmail.com>
	<20130124154325.GB3200@jama>
	<CAJTo0LZLkLsYfiiQhFXKgBPL6x1AMF5g6EU3dEZ0k9LMSRaf+A@mail.gmail.com>
In-Reply-To: <CAJTo0LZLkLsYfiiQhFXKgBPL6x1AMF5g6EU3dEZ0k9LMSRaf+A@mail.gmail.com>
Subject: Re: [PATCH] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Fri, 25 Jan 2013 10:21:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 01/24/2013 05:48 PM, Burton, Ross wrote:
> On 24 January 2013 15:43, Martin Jansa <martin.jansa@gmail.com> wrote:
>> I think the point is, keep default default.target for images where it's
>> OK (gui or warning) and change default.target to something else only for
>> images where it matters (nogui if you care about warning).
>>
>> Changing default value by patch in systemd recipe and then setting
>> default value back in many image recipes doesn't look sane.
> Sure, so we make the default graphical, and there's no change as far
> as the final image is concerned.

Thanks guys for your feedback, dropping this and looking for another 
approach.

Radu



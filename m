Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0872F6CEB9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 17:53:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Nov 2013 09:53:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,647,1378882800"; d="scan'208";a="428935096"
Received: from unknown (HELO [10.255.14.249]) ([10.255.14.249])
	by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2013 09:53:27 -0800
Message-ID: <527A8217.8090605@linux.intel.com>
Date: Wed, 06 Nov 2013 09:53:27 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Carlos Rafael Giani <dv@pseudoterminal.org>
References: <527A5666.6040208@pseudoterminal.org>
	<CAJTo0LZ6LpU88=gnD_xYJzvzC+xg34vmSKFR2h3TS2daOXbfKw@mail.gmail.com>
In-Reply-To: <CAJTo0LZ6LpU88=gnD_xYJzvzC+xg34vmSKFR2h3TS2daOXbfKw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Request for moving Orc to OE-core
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
X-List-Received-Date: Wed, 06 Nov 2013 17:53:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2013 07:47 AM, Burton, Ross wrote:
> On 6 November 2013 14:47, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>> As preparation for upgrading the gstreamer1.0 recipes to 1.2 , I would
>> propose to move Orc into OE-core.
>> Without Orc, key elements of GStreamer (audioconvert, audioresample,
>> videoconvert, videoscale ..) are much slower.
>> Currently Orc is in meta-oe . Its recipe uses the most recent version
>> (0.4.18), which is the minimum Orc version that works with GStreamer 1.2. If
>> Orc is in oe-core, it can be added to the
>> gstreamer1.0-plugins-base/good/bad/ugly recipes' default PACKAGECONFIG
>> lists.
>
> I agree with this, and have wanted to do this for a while now.
>

Carlos,

please make it so and thanks for working on the gstreamer update.

Sau!

> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


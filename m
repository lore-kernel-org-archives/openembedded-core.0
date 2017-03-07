Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C977B775DB;
	Tue,  7 Mar 2017 14:43:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v27EhDKm017238
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Mar 2017 06:43:13 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Mar 2017 06:43:13 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Andre McCurdy <armccurdy@gmail.com>
References: <1488862727-25152-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LaNUQW=Qsyxm7eC9hFduzVMy5v+1Sy9aBMfgNoBgAqoow@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <f417ea5c-df83-ef34-648f-5a526f3d2e16@windriver.com>
Date: Tue, 7 Mar 2017 08:43:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaNUQW=Qsyxm7eC9hFduzVMy5v+1Sy9aBMfgNoBgAqoow@mail.gmail.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [PATCH] meta: start to ignore the largefile distro feature
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
X-List-Received-Date: Tue, 07 Mar 2017 14:43:18 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/7/17 4:35 AM, Burton, Ross wrote:
> CCing openembedded-architecture to open the field for comments.

At this point, I'm not sure there is any reason to NOT using largefile system
wide.  It's a common enough feature, and even 'small' devices (with sdcard
slots) can run into large file problems now.

> On 7 March 2017 at 04:58, Andre McCurdy <armccurdy@gmail.com
> <mailto:armccurdy@gmail.com>> wrote:
> 
>     The largefile distro feature has been enabled by default in oe-core
>     for a long time and, more recently, also in poky-tiny. Building
>     without the largefile distro feature receives little or no testing.
>     Many packages now enable LFS without exposing a configure option, so
>     there should be very little expectation that disabling the distro
>     feature will result in a distro which globally disables LFS.
> 
> 
> So I've had a bug for this for some time but have never got around to it.
> 
> If we're going to assert "LFS by default" do we want a sanity check to verify it
> was used?
> 
> Do we want to put -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 in the default CFLAGS?
> 
> I'm not aware of any good reason to not use LFS, but now is the time for anyone
> else to speak up if you have a good reason to keep it as an option!
> 
> Ross
> 
> 
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> 



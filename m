Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D27AD77DCA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 14:54:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jul 2017 07:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,307,1496127600"; d="scan'208";a="106964388"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2017 07:54:24 -0700
Date: Tue, 4 Jul 2017 17:54:51 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170704145451.GA28939@mbabyjoh-desk.ger.corp.intel.com>
References: <1499174980-28223-1-git-send-email-maxin.john@intel.com>
	<1499174980-28223-2-git-send-email-maxin.john@intel.com>
	<CAJTo0LYYxTT_rJT1YxG34ROfuemMRaLkRqBhSDLQ9ifRfSmyXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYYxTT_rJT1YxG34ROfuemMRaLkRqBhSDLQ9ifRfSmyXA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] libva: upgrade to 1.8.3
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
X-List-Received-Date: Tue, 04 Jul 2017 14:54:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Tue, Jul 04, 2017 at 03:24:41PM +0100, Burton, Ross wrote:
>packages/corei7-64-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva-drm.so.1.3904.0 
> /usr/bin/mpeg2vldemo /usr/bin/putsurface /usr/bin/vainfo /usr/bin/mpeg2vaenc /usr/bin/h264encode
> /usr/bin/loadjpeg /usr/bin/jpegenc /usr/lib/libva.so.1.3904.0 /usr/bin/putsurface_wayland /usr/bin/avcenc",
>added "/usr/lib/libva-drm.so.1.4000.0 /usr/lib/libva.so.1.4000.0"
>
>libva-drm should never have been in that package, and all the binaries have disappeared.
>
>(Maybe using dynamic splitting would be more reliable)

Thanks, Will update accordingly. 

>Ross
>>
>>On 4 July 2017 at 14:29, Maxin B. John <maxin.john@intel.com> wrote:
>> 1.7.3 -> 1.8.3

Warm Regards,
Maxin


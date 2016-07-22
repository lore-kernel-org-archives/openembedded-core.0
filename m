Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C2078606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 11:22:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2016 04:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="1027038912"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2016 04:22:49 -0700
Date: Fri, 22 Jul 2016 09:28:47 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160722062847.GA2395@mbabyjoh-desk.ger.corp.intel.com>
References: <1469167768-9827-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LYEB+iGcHnVn32jiJ9o7ry0gLTEUhS8+v70prrsMOCE7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYEB+iGcHnVn32jiJ9o7ry0gLTEUhS8+v70prrsMOCE7A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] sysprof: fix floating dependency on polkit
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
X-List-Received-Date: Fri, 22 Jul 2016 11:22:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

>On Fri, Jul 22, 2016 at 12:08:33PM +0100, Burton, Ross wrote:
>>On 22 July 2016 at 07:09, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>   +FILES_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${datadir}/dbus-1/', '', d)}"
>
>
>    No need to do conditionals in FILES as it's fine for files to not exist.

Thanks, Sending v2 soon.

>    Ross

Best Regards,
Maxin


Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 399 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jan 2016 17:25:53 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1ABAB6067D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 17:25:53 +0000 (UTC)
Received: from [216.82.249.131] by server-4.bemta-12.messagelabs.com id
	EB/2B-13971-31BFB865; Tue, 05 Jan 2016 17:19:15 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-8.tower-28.messagelabs.com!1452014351!10720510!2
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 7.35.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14071 invoked from network); 5 Jan 2016 17:19:13 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-8.tower-28.messagelabs.com with SMTP;
	5 Jan 2016 17:19:13 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 5 Jan 2016 18:19:07 +0100
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 5 Jan 2016 18:19:06 +0100
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1452011653-10012-1-git-send-email-maxin.john@intel.com>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <568BFB09.2070203@digi.com>
Date: Tue, 5 Jan 2016 18:19:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1452011653-10012-1-git-send-email-maxin.john@intel.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-AntiSpam-Interceptor-Info: protection disabled
Subject: Re: [PATCH v2] bluez5: upgrade to 5.37
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
X-List-Received-Date: Tue, 05 Jan 2016 17:25:54 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Just a quick question regarding this:

On 05/01/16 17:34, Maxin B. John wrote:
> +PNBLACKLIST[bluez5] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez4', 'bluez5 conflicts with bluez4 and bluez4 is selected in DISTRO_FEATURES', '', d)}"

Is 'bluez4' a user's custom distro feature, because it doesn't seem to be part of the standard distro features. What poky.git at current master has is 'bluetooth' and 'bluez5' as distro features and those are used by bluetooth.bbclass to set BLUEZ variable as follows:

"" if bluetooth is not in DISTRO_FEATURES                                                                                                   
else "bluez5" if bluez5 is in DISTRO_FEATURES                                                                                               
else "bluez4"

So BLUEZ variable may be equal to 'bluez4' but an unmodified poky distro will never have 'bluez4' as distro feature.

Am I missing something obvious?

-- 
Regards,

Javier Viguera


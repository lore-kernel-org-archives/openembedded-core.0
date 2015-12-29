Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 378 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Dec 2015 17:21:37 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.197])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7AD6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 17:21:37 +0000 (UTC)
Received: from [216.82.241.196] by server-5.bemta-8.messagelabs.com id
	87/AA-09301-7AFB2865; Tue, 29 Dec 2015 17:15:19 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-6.tower-46.messagelabs.com!1451409318!9525367!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 7.35.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32667 invoked from network); 29 Dec 2015 17:15:18 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-6.tower-46.messagelabs.com with SMTP;
	29 Dec 2015 17:15:18 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 29 Dec 2015 18:15:11 +0100
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 29 Dec 2015 18:15:11 +0100
References: <1450877140-15246-1-git-send-email-maxin.john@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <5682BF93.2010703@digi.com>
Date: Tue, 29 Dec 2015 18:14:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450877140-15246-1-git-send-email-maxin.john@intel.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-AntiSpam-Interceptor-Info: protection disabled
Subject: Re: [PATCH] packagegroup-core-x11-sato: include pulseaudio-misc
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
X-List-Received-Date: Tue, 29 Dec 2015 17:21:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 23/12/15 14:25, Maxin B. John wrote:
> Add pulseaudio-misc to include "pacmd" in core-image-sato* images.
> This helps in modifying audio setup during runtime.

Hi all,

Could this be cherry-picked to Jethro as well? It applies without 
conflicts and seems as valuable as in master.

-
Regards,

Javier Viguera


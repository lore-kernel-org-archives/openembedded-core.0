Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.204])
	by mail.openembedded.org (Postfix) with ESMTP id 61DEC60DED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 10:48:00 +0000 (UTC)
Received: from [216.82.241.132:56785] by server-12.bemta-8.messagelabs.com id
	ED/88-06553-0EEC2B25; Thu, 19 Dec 2013 10:48:00 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-11.tower-45.messagelabs.com!1387450079!33537390!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.9.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32460 invoked from network); 19 Dec 2013 10:48:00 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-11.tower-45.messagelabs.com with RC4-SHA encrypted SMTP;
	19 Dec 2013 10:48:00 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 19 Dec 2013 04:48:03 -0600
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.158.1;
	Thu, 19 Dec 2013 04:47:59 -0600
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 19 Dec 2013 11:47:57 +0100
Message-ID: <52B2CED8.3020707@digi.com>
Date: Thu, 19 Dec 2013 11:47:52 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1387276932-26461-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1387276932-26461-1-git-send-email-paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] libsoup-2.4: add intltool-native to DEPENDS
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
X-List-Received-Date: Thu, 19 Dec 2013 10:48:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

On 17/12/13 11:42, Paul Eggleton wrote:
> -DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3"
> +DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 intltool-native"

+1 for this change.

I was bitten by this bug using a DISTRO with no X11 support (removed X11 
from DISTRO_FEATURES). In that case the 'intltool-native' dependence is 
not fulfilled and libsoup fails to build.

Could it be *backported* to Dora/Dylan?

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.


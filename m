Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 377 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Jun 2014 12:10:53 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.205])
	by mail.openembedded.org (Postfix) with ESMTP id 23C406FD46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 12:10:53 +0000 (UTC)
Received: from [216.82.241.196:58105] by server-13.bemta-8.messagelabs.com id
	1E/44-14006-45DDE935; Mon, 16 Jun 2014 12:04:36 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-3.tower-46.messagelabs.com!1402920275!35154491!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26084 invoked from network); 16 Jun 2014 12:04:36 -0000
Received: from mail.mx1.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-3.tower-46.messagelabs.com with RC4-SHA encrypted SMTP;
	16 Jun 2014 12:04:36 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 16 Jun 2014 07:04:27 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.342.0; Mon, 16 Jun 2014 07:04:35 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 16 Jun 2014 14:04:33 +0200
Message-ID: <539EDD51.9060508@digi.com>
Date: Mon, 16 Jun 2014 14:04:33 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1396927648.git.Chong.Lu@windriver.com>
In-Reply-To: <cover.1396927648.git.Chong.Lu@windriver.com>
Subject: [backport to Daisy] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Mon, 16 Jun 2014 12:11:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

I see this was finally included in oe-core *master*, but the problem is 
still affecting Daisy.

Creating a basic command-line image with dbus pulls in the 
dbus-ptest-ptest package (37MB installed):

# du -sh /usr/lib/dbus-ptest/ptest
37.6M   /usr/lib/dbus-ptest/ptest

Could the fix be backported to Daisy?

-
Thanks,

Javier Viguera
Software Engineer
Digi International® Spain S.A.U.


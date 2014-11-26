Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 413 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Nov 2014 16:08:29 UTC
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.108])
	by mail.openembedded.org (Postfix) with ESMTP id 49E9972318
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:08:29 +0000 (UTC)
Received: from [216.82.254.195] by server-12.bemta-7.messagelabs.com id
	FD/8D-02703-069F5745; Wed, 26 Nov 2014 16:01:36 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-4.tower-200.messagelabs.com!1417017693!22943180!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22192 invoked from network); 26 Nov 2014 16:01:34 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-4.tower-200.messagelabs.com with RC4-SHA encrypted SMTP;
	26 Nov 2014 16:01:34 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.377.0;
	Wed, 26 Nov 2014 10:01:21 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Wed, 26 Nov 2014 10:01:32 -0600
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Wed, 26 Nov 2014 17:01:30 +0100
Message-ID: <5475F954.7070808@digi.com>
Date: Wed, 26 Nov 2014 17:01:24 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
CC: <openembedded-core@lists.openembedded.org>
References: <1415788406-23120-1-git-send-email-otavio@ossystems.com.br>
	<1415788406-23120-3-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1415788406-23120-3-git-send-email-otavio@ossystems.com.br>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [dizzy backport] [PATCH 3/4] sysvinit-inittab: Disable the carrier detect requirement for serial consoles
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
X-List-Received-Date: Wed, 26 Nov 2014 16:08:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I see this patch has been committed in master. Could it be backported to 
dizzy?

This fixes a problem with some commands (for example busybox 'less' 
applet) that become unresponsive when used in a serial console on some 
hardware platforms (for example a FSL mx28).

A basic: 'less /etc/passwd' just hangs showing nothing and you can only 
stop it with CRTL-C.

As the backport seems pretty safe in general, could it be backported?

-
Regards,

Javier Viguera


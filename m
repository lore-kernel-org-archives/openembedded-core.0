Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0D57D6FF97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 10:09:26 +0000 (UTC)
Received: from [216.82.251.37] by server-10.bemta-12.messagelabs.com id
	D2/01-07562-6D77B075; Mon, 11 Apr 2016 10:09:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsVyIDc+SfdaOXe
	4wYU98hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a2Ce/YC26yVByf1cHWwPiBuYuRi0NIYDWj
	xOlH19m6GDmBnMWMEvtf1oPYwgJ2Ettb5kLF3STOfjvBAmKLCERJ3Nz1jB3EZhPQk5h86Qkzi
	M0roC7x7OhhoDgHB4uAqsSSaRIgYVGBcIkHP64xQpQISpyc+QRsDKeAu8SLSSCtHBzMAvYSD7
	aWgYSZBeQlmrfOZobYqiJxcOllsFYJoPimzWfZIWwTiYtXd7Nhsg0lvs/6xgJhS0vs7VvIPIF
	ReBaSzbMQts1Csm0BI/MqRo3i1KKy1CJdI0O9pKLM9IyS3MTMHF1DQyO93NTi4sT01JzEpGK9
	5PzcTYzAAK9nYGDcwdg+3esQoyQHk5Io754C7nAhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryby
	oBygkWp6akVaZk5wFiDSUtw8CiJ8H4ESfMWFyTmFmemQ6ROMepyLPhxey2TEEtefl6qlDjvU5
	AiAZCijNI8uBGwuL/EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3B8gUnsy8ErhNr4COYAI
	64tk/TpAjShIRUlINjJFTL7Dv4EqOu61/Z+765xyyrblyr+xEXsuY/rsnbdVnu4THU2rbhykT
	vY4XGh052p4x//EHx1NuV0TzpytW7tJa5Nty+djD2B1cb0r21NrdPHT/wIRZZ8Q0Cppv2Gjyp
	mcq7gyY6nbPfc2xV3rS3kaOkyYdWfX/hImn+bIr4Y+UoyY8c+UItFFiKc5INNRiLipOBADLRa
	OS9gIAAA==
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-4.tower-153.messagelabs.com!1460369365!14917569!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 8.28; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 46251 invoked from network); 11 Apr 2016 10:09:26 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-4.tower-153.messagelabs.com with SMTP;
	11 Apr 2016 10:09:26 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Mon, 11 Apr 2016 12:09:16 +0200
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Mon, 11 Apr 2016 12:09:15 +0200
References: <1459935290-3827-1-git-send-email-javier.viguera@digi.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <570B77C6.5070806@digi.com>
Date: Mon, 11 Apr 2016 12:09:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459935290-3827-1-git-send-email-javier.viguera@digi.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: Re: [daisy][PATCH] eglibc: security fix CVE-2015-7547
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
X-List-Received-Date: Mon, 11 Apr 2016 10:09:29 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

According to the Yocto release page:

https://wiki.yoctoproject.org/wiki/Releases

Daisy is now community maintained.

As the "community" does not have push-permissions to the git server, is 
anyone with permission willing to merge this patch?

The patch is a backport of the CVE-2015-7547 vulnerability fix from 
glibc-2.20 to eglibc-2.19.

I can put this patch in our own BSP layer, but I think oe-core is the 
proper place to commit it, and this way it will benefit to other people 
still using Daisy branch.

-- 
Thanks,

Javier Viguera
Software Engineer
Digi International® Spain S.A.U.


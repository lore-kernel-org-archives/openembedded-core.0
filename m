Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB2F6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 15:33:38 +0000 (UTC)
Received: from [216.82.241.196] by server-1.bemta-8.messagelabs.com id
	9B/29-30925-2DF1CE65; Fri, 18 Mar 2016 15:33:38 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-15.tower-46.messagelabs.com!1458315216!20543460!2
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 8.11; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31357 invoked from network); 18 Mar 2016 15:33:37 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-15.tower-46.messagelabs.com with SMTP;
	18 Mar 2016 15:33:37 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Fri, 18 Mar 2016 16:33:31 +0100
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Fri, 18 Mar 2016 16:33:31 +0100
References: <1456337541-4269-1-git-send-email-javier.viguera@digi.com>
	<56E06C6D.5020008@digi.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <56EC1FC2.1020502@digi.com>
Date: Fri, 18 Mar 2016 16:33:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E06C6D.5020008@digi.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
X-KSE-AntiSpam-Interceptor-Info: protection disabled
Subject: Re: [PATCH] bluez5: allow D-Bus to spawn obexd in systems without systemd
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
X-List-Received-Date: Fri, 18 Mar 2016 15:33:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/16 19:33, Javier Viguera wrote:
> On 24/02/16 19:12, Javier Viguera wrote:
>> This includes a proper D-Bus service file for obexd in systems that do
>> not support systemd.
>>
>> Signed-off-by: Javier Viguera
>> <javier.viguera-i7dp0qKlBMg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>
> Ping.
>

I know people is probably busy enough trying to stabilize the upcoming 
2.1 release, but could this be considered for master?


Thanks,

Javier Viguera


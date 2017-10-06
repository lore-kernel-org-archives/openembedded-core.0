Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5DF780C0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 10:31:34 +0000 (UTC)
Received: from [216.82.251.39] by server-14.bemta-12.messagelabs.com id
	55/C8-01756-88B57D95; Fri, 06 Oct 2017 10:31:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRWlGSWpSXmKPExsXi5LtOQLct+nq
	kwYeDVhZ7Py1itLjz8x27A5PHzll32T3ObVzBGMAUxZqZl5RfkcCaMbH9M2vBP8aKZTfusTUw
	nmHsYuTiEBJYySixcuoLJghnEaPEjbZWti5GTg5hgTiJzvtTWUESIgINjBKvDv9mBkkICeRIf
	HjRD2azCehJTL70BMjm4OAVsJb415EPEmYRUJHY0raTEcQWFQiXaDrbzwJi8woISpyc+QTM5h
	SwlVg1Yw3YLmYBC4mZ888zQtjiEreezGeCsOUltr+dA7VWReLg0stgNRJA8U2bz7JD2CYSF6/
	uZoOwDSW+z/rGAmFLS+ztW8g8gVF4FpLVs5Csm4Vk3Swk6xYwsqxi1ChOLSpLLdI1NtRLKspM
	zyjJTczM0TU0NNLLTS0uTkxPzUlMKtZLzs/dxAiMinoGBsYdjH+++B5ilORgUhLlfR1yPVKIL
	yk/pTIjsTgjvqg0J7X4EKMMB4eSBG9OFFBOsCg1PbUiLTMHGJ8waQkOHiURXlWQNG9xQWJucW
	Y6ROoUoy7HjYfX/zAJseTl56VKifNmgBQJgBRllObBjYClikuMslLCvIwMDAxCPAWpRbmZJaj
	yrxjFORiVhHnzQabwZOaVwG16BXQEE9ARc5qugBxRkoiQkmpgXHGgJ+ORRMcNpelngms5rwRt
	kfFa6dM4f9rFFWfk/s25qKvaEVJ3j/3IhtOLuOce+1m+5ov7lXnJjRJTjki9bVbbnXYi2UVr1
	ZqflsIfGjNcU0J2m/qJ8BqY/1Ji/tZ/o3rbcjmH5o9F5hc+ufnHN+4Jlauz8XYw85J/u8HhUL
	jKsrUP7XNuKLEUZyQaajEXFScCAHHACXMQAwAA
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-8.tower-164.messagelabs.com!1507285894!50930433!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 71088 invoked from network); 6 Oct 2017 10:31:34 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-8.tower-164.messagelabs.com with SMTP;
	6 Oct 2017 10:31:34 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 6 Oct 2017 05:31:32 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 6 Oct 2017 12:31:29 +0200
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170914122753.12713-1-ross.burton@intel.com>
	<c93c3583-f1aa-bf91-c86e-bde0f6229592@gmail.com>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <6ba17c2a-78cd-2705-0ce4-1fffeb4c007e@digi.com>
Date: Fri, 6 Oct 2017 12:31:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <c93c3583-f1aa-bf91-c86e-bde0f6229592@gmail.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: Re: [PATCH][morty] bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
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
X-List-Received-Date: Fri, 06 Oct 2017 10:31:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20/09/17 21:30, akuster808 wrote:
> 
> merged to stagging.
> thanks
> - armin

Hi Armin,

Do you plan to merge this into 'morty' soonish?

Some users of our BSP layer are asking about this vulnerability.

Thanks.

-- 
Javier Viguera
Software Engineer


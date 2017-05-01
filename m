Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0046.outbound.protection.outlook.com [104.47.41.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5736079E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=iAVXqdPTcM324AL/pp9Tp6VPIYdNf6AOveuX1jlS3k4=;
	b=Lea9CPzLx+Db/iRu50OL3t/s/U6Eyi17HFz5a3nRZzWlCK03tjSx2XiJsJ0KceAGZ69GnWF0h0GYwq1DC6aXkpXoSagVpONY39X094LuH0YjuUasgatCpFLFufx1nnmWhpA3FOYYqu0koPHG937Z0IQ9cLfP/6Up5KznFvT2j/A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	CY4PR01MB2680.prod.exchangelabs.com (10.172.135.14) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.13; Mon, 1 May 2017 16:47:22 +0000
To: Jan Kiszka <jan.kiszka@web.de>, <openembedded-core@lists.openembedded.org>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
Date: Mon, 1 May 2017 09:41:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: BN6PR18CA0019.namprd18.prod.outlook.com (10.175.188.29) To
	CY4PR01MB2680.prod.exchangelabs.com (10.172.135.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eab4bf80-4996-4081-e0bc-08d490b1bdcc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR01MB2680; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2680;
	3:gxatwJD6tJHviZFOTWlk4wCgYrU/foNv7H7TaUdBu1A2pMzNWvhm98z44CE33/RpAAvfgk/rSfedJ/3PWCGgH2tXnyIRIFcJTpb8m0hjkuhfBocm75R9RhTP+GwxiyleXBL1X8Kt6RO8JmSeKWMcK6ESjqmnYCpUY0yiL/X2ivrL1654dJVyN9deCcKXNRsEZpFDGY3kAy7F4ytRpzmpruM2wNyAVNs/RlhKhZdp/Uuo4Vs2mxBPyh5daafdmEi9Edcg0kYp8yTtBou+oozuLiye+iHinbzCQFgzhwiAHNTVhIcepxTJxKjUHam4ysi95FCWm5qXmUf5ZSJJ0auZKg==;
	25:SSXfYgCxXVM12/K326jJLabxqlciLZg38icg0rSKw7jaVkf1fhCX8xy/iB0TLoCeZ6z91UlURCpdzXvOwOiFCFrdOoifE/N/ZVD0tYnjn4CFv2IqZFuR5+3bvycxSHxlMQ5vj/efXhHS3jjtPp+kRsvjIfa41mxFBmAsKJS2uACMdYypmqZzwe0xAQMfF1DIVIi/DnCIoJDAQs+dZ1xvKre/mDi6HXGawUnEVdboFn8UfIE+w5ilQCRZD0fAAOh9tAZjecGukBdY8HkSoc51DJLjWSCiEBC4aMjiqLPpkmAzMOsml0VxapdzCb+PDf4LlAIkOkISFBzaHpOCz6+ygdEJgsSUpakV5d1TJT/HgukjWaCcsD1gBY7i5iAvanpxGUq/vhQpZ5NBbeDVWQMGpLURpNwC5+4aqDfugXvBEees4Mbz9BDZJf1UY4Baf8HgiztLgDlBenwRP+7X90gFJw==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2680;
	31:KmdFp2Fl69YCFZ7yPp68leSbmR24q2JJDEuXruEppgZq9664KUv1kFalQsbDurI/u0nNV5YisXgrBA//7NhtZ6ZJc5vVdALyoV7uE/pZoe84fCA89ndpfHUlZhMmwyBq2nEpE+Mvx9+ooQ6DEv1kd3rpggq0vcxM1A0gFqbx3sG+pYRZHVzQDFaga5kKQIdaNLJj8nHUXQRhxOhIVUOxfw1JKJLnjvceV7jb9/AtUX6QNSFH6LeMUJ0tJuNFKt3sRoUUCZU0O+Ko95CQd33dsw==;
	20:LHJtNhQcTMsszMZa5efD3SmbnWsnnkyFyi41XxIF7eFGvG9/xcw5Eg5UW9KWyDcFDutw6gzBUh0Vu0KPAdetJtlBLpFXC1jBTilEsSjuXlTSZEtamyvu1Kb0JA+IzRs7alaWrIxjOjpwzZtfm1uRaZphUgoAY1oY0WBjw3AMkz++dOtDys6yzQnhwAJ/ZvTgrCPxBXaQ5SUpWoF7TydeFR6eiIZsp69eiMqnCYzW/Zx6a6zf5vMVUTRbc6PkOqvKnXoH9FKUGF9rJJiOUOK9fDlWFqOMus8iC/Uxe/Ju9/zvQPiQVxQuJn0izOibe00cr43RChUUsRC/+A/nN3w8Uw==
X-Microsoft-Antispam-PRVS: <CY4PR01MB2680C77BFD35A5F0B5DB4F56AB140@CY4PR01MB2680.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(126837547833334);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(20161123555025)(20161123562025)(6072148);
	SRVR:CY4PR01MB2680; BCL:0; PCL:0; RULEID:; SRVR:CY4PR01MB2680; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2680;
	4:oGdZnmRYUY89X6HD1vJ50O/Wx/y0VEl3Xex0eyjJgp0/j0qRgspuJMsZi0Ir320jDF34ae3crRNxqzGeLRv+WvzV5SKQW2XR+fiQkMPpljxreLnf3WWGmnuXdzyF/Kayh1wswPjkX0bybY8Av/s9eHMnYy8SNGpw3pXGC45ZRT5sLegzxHOmK+zJ+ba8D7LGzwJlRbaYUqVOlsk7clkbwFsUbRB1fkK2oLBy9dCfiq81KyvCRs5CSDHeuuG8SmS04s/Yc36NubzXr7DpRo4Tvhr6XXKudRhdMy+CICPiwGcXgMV2CA7FJ65Vlc2y0iiwusEe8BS0TUQ13gn9/NmpPZUQNGUZZ/SdAPWxyqlwgaWbLNIiY4+WCpAXKXTiYKQe2QKklJfKBVhHa7cRbhkxyoRCoxpmLsDsIKiNXzgemzsG3rSqWcaomgIv08j8ecjtgOyPPGXB8ZxGB+iXecEWDMfhIaZxZCLuQK6zNylktPfk/MfGk6n6TLIb+QwlIlmZvPyLEiSy+5AeeMfNjuZ/Q4OSEjhR8KfDSvj4ROdqadwwxoMb7BZEerhtIsHMXH+Z0tHZ7i/0m0EyR2MiPh9nyxNgSGTczGelPQ3970A/z9wFUxeSiRrtZb4iUN9xHTvon4lq8pYqikt3rl1/mNYGe7jkTRygvD4ZD9F0vulo72Fiy5457c4e8QRpR44pRVkILheXe+JbnOfRFuL++NQyrQR6hhdNAV+atWUlsCkzslAUiv/DH+ptbwNgLw+xgZ6e
X-Forefront-PRVS: 02945962BD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39830400002)(39450400003)(39410400002)(39400400002)(377454003)(24454002)(77096006)(53546009)(6486002)(31696002)(42186005)(2950100002)(7736002)(64126003)(305945005)(229853002)(65826007)(31686004)(508600001)(117156002)(86362001)(38730400002)(50466002)(76176999)(2906002)(50986999)(5660300001)(6666003)(54356999)(65806001)(65956001)(83506001)(23746002)(3846002)(25786009)(47776003)(6116002)(230700001)(33646002)(8676002)(53936002)(4001350100001)(189998001)(36756003)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR01MB2680; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; CY4PR01MB2680;
	23:mYObKwsE8R/0uiMVMCAZSajfx3PWGnzD1KZrd?=
	=?Windows-1252?Q?sIeLjdXlrOPC4Z3vv1fbRmQaOBijT5TjzSUIZHh08AMCh40VkAjIJPht?=
	=?Windows-1252?Q?pMMAp+qiCLS1RhHWiIU4A9MdfVe+ogm+HqjefJxgHDrFQ4QpArWM5oUg?=
	=?Windows-1252?Q?aG5zdvVny41C98M5i3M56qUriUtMItrsn5iG5/5H7hrrFNtnID94riGG?=
	=?Windows-1252?Q?8d4548oZ+lL/j802vy0lH+9qqp14vmXOr2hat7g15uavId6vCcexFZb5?=
	=?Windows-1252?Q?hmtHhBxnNtKENZsvAa6fkHd7S+38K+5ZBI2M4T2QOznTXOnMXVie5oyf?=
	=?Windows-1252?Q?Tdr/O1+4PKKBG0uQuvwsz18jVG6YJquJ/NqGDLd+N/9jx2DCtVuZElXZ?=
	=?Windows-1252?Q?+j4Ax9VLgK/7cUZ0+m6/IPmRs8bUSbj8BlbqK46hHd2wEDPSuqXQloSU?=
	=?Windows-1252?Q?nEO51VOsTWXPr1KgjJE1e/YFOE0/5FK9gllqb0S4UyB8YRdyF/6sl9zN?=
	=?Windows-1252?Q?GdyHVn9c5b+xKNyPVlZ4XfuJ2RlDtgsBXNRHMKdFFBMhV5xQ65hnLNmA?=
	=?Windows-1252?Q?qAzRFltQVpgYNfPkLM+LLQCv0+Zy2ohUuGLK3gnDlUCYhRHKO4UPPse2?=
	=?Windows-1252?Q?68LmJYNXdZWPB82i24Hul+CPDVJ2FV9bitlQhGB7rPWzhdlqlaD2fEsM?=
	=?Windows-1252?Q?wMQXJN4JWt9cLma2epqYumR23SWw/7ypPQEuJNWP1pI1Hc17xrnuTSFb?=
	=?Windows-1252?Q?snhTcXjoJUZ3ZJJhtN9VNWv/W5jGHOk8vHev+e5FC+FTNaeTWAVweVdr?=
	=?Windows-1252?Q?UQSHYuqgUItNSzASYCPF/BPG4lJPstD1AZCyPp76vzecA4kn1mL3hUoh?=
	=?Windows-1252?Q?8HLh6F5ayR7Yoe9vvjnmvT5a6Wg6g0ujbRhdPxVvPTxRKoQG+TGFbK3M?=
	=?Windows-1252?Q?32ztrI3qyWhb3WNHuT21BX7bMkXQTq7reWn4KasCNX95XrvpL/pSJxct?=
	=?Windows-1252?Q?8BxwQMoVJVTikGnmj00v1LvmqDt4WEBKM3yuPoK44opryDZ4qHum2Bfv?=
	=?Windows-1252?Q?fPJdhYQXfcqn4zon99OCkVfDCLuUw8dQ06Itp6ZAaQrqrZjqKZRCb0ft?=
	=?Windows-1252?Q?LwoleVt+PCunoVFjA2xiEINjooIGLBCUnsPZ++45CYtmDCh1U9Kyd9Mp?=
	=?Windows-1252?Q?foNR0htAVfE0iz4Pw6WgYZ3s+yv3z4tXnpHEM94i5pEbw0WRwGBONtH8?=
	=?Windows-1252?Q?84ml4Dr2+p1MxkmMzD1gIAbtoeEwchbVJR9CyqVHTBCgbU8XGEBVZ6oQ?=
	=?Windows-1252?Q?2ZZ?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2680;
	6:pw9RF1TU0I800xopVB0Ea4pRgd8oRi/m3xtPMgwUKFOkXPVtEJ8M8+T1oIMNo0pBHw/eyDxKy6riEmySsND3hE8zF2LSz4mBNZPRGihSuprWGR08YnQ7clZKlpUay5GqZZWWdSVRSyrWDtOUsuSzbAZftHUuvEleddFXpQlv6j3I/qLHV0YquXoFNQSPfkrSWC+vsa+Dq5XnPqlvgpLcARxKaABrYZKpcyLN3rhNxaKjiR+ee7gm+6VkWwl662w1sKFOOX6/yYIUpxXVF7xrjqEaD8x7fl6ze+0P/Ik2LTsR2vlIiqrQfBXFxk1w/hiTBMJ7BVV0AUoygaY7vSEC6iErIutumcoiYTJ0gf6huRn/2aNbCoMYLmLy0VfDOqdAAJTuON+RC8/GyiHziSx6qjLUOQMA7XrFDrXlbZaol+1dPo4ox+tvMu/Rjx6p0HqJvmBpvS4yAJXsRkJf8nnpqPZftkra0zS+OibPRBR17gUWFSKH/OKXEOcA6rUDUHVJFJ4OCW3hQvHVxCfvzDC1Pw==;
	5:PVcnaInfO8XJWk/7RR9ZEIgOr/D9j7ixtKcZyWoFAbg5Y+NfqFQgaSi0AWI1sQWbi0mssWlS8jAg9S9GIwEuBpP3LC0ZlzUWZYAlkXw2x6mV3+/fAxZDqBQEu0L6XSwuccqeiMSD4WiDkvTYgPmPWA==;
	24:S+X0QZ/OmiVcUYTOlE13flapfSMgtdSUAo7LDLwUl+RoiitHbCuTer17+P3UT2cLdUJj+goTo/ci/yb8EqRzGurV04yjZ0bl3QM3aYv2Rv4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2680;
	7:syz0+/Wx7YRRQrRi5+jes0duUUxpiz63C18qQlsrAr33ikj6KfQRbd2FQLLjc5OqhWR5U8Ywn1qxAV6xpbZnmItJ0ygZExB3sBOiZ8/ZvGNhQgZyK1jYbJOwg6D8oVmKxhMB6q88RshmxE/IUekAS9q4ntfgxomgTW/gy5V1c3tCatev61nfdqHcvoyHkzKtO+EztTg6dQmMCy1GDA4to5aN2qHEuJPiiQy0fNr7rqK5Q2N94po/r+nbhSo4Jn8vPFcIXWl0j/0GNZXarKx9u9iaJ/uHPhqEQ+j0YahCplHLiVDRSfHa20LBAiHRg0QJPX8iFb5xiapM/7ZTY39xsg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2017 16:47:22.6037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR01MB2680
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Mon, 01 May 2017 17:02:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/30/2017 08:28 AM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> The upstream init script uses SIGUSR2 to terminate that daemon because
> SIGTERM is ignored. As the killproc function does not support specifying
> a signal, switch to start-stop-daemon. Drop the retry loop because
> SIGUSR2 is lethal for agent.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Thanks! I noticed this bug and was planning to look into it, but it 
looks like you found the issue first! This was bringing shutdowns to a 
crawl for me.


Return-Path: <prvs=019708acf4=mike.looijmans@topicproducts.com>
Received: from mx6-05.smtp.antispamcloud.com (mx6-05.smtp.antispamcloud.com
	[95.211.2.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8726871A8E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:49:04 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cVuuY-0008Rb-On; Tue, 24 Jan 2017 07:49:01 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 24 Jan 2017 07:48:57 +0100
To: akuster808 <akuster808@gmail.com>, Nathan Rossi <nathan@nathanrossi.com>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2453DBB31E@XSJ-PSEXMBX01.xlnx.xilinx.com>
	<05c7dfd0-38f3-b684-db94-38121b086a67@topic.nl>
	<CA+aJhH03XW19tEX5nP7WgoV6au9xmms6GuASEHMmRvA-1qhh8w@mail.gmail.com>
	<ee6f0244-0fb1-ad27-6056-a358b5eb0112@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <1efda273-0a0f-e75d-1364-6ac1815154fe@topic.nl>
Date: Tue, 24 Jan 2017 07:48:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <ee6f0244-0fb1-ad27-6056-a358b5eb0112@gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.07)
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNHGy
	UK60rSRl/E0C/4o2VdY7L0s9+OyaUXxzxSelTztM3T13K7/ZA76XMy4Ab+mHpGbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAAdpU0oUDqng6Dyy2mQeofiR15rThUhSub+XL+JMh1TLd1el35jO+WJBgrWGjAavfuifnL+9wg
	oTj4ygNPw1XfN1IUJ2+rCMPpQhII5VkEVC//8GRISD+lYCwA5l6/Q4nfg8y63jKKBrO1BroJmvb9
	eW6r2rlUSNsSKfXWKXbAnTtpwWXpE+sdjNmnXWjiNaLzpYbRm1I468S/yL0UV2VaFaHU7TvqT2so
	IjU4ke4l3yHonV+E7OMXRvgtdyMlnmWio7yflOSPePNf+xGd6n5xOT8FIprDRrySYpUp+LukEmRH
	Yub0lE58V6wU3IIDGehSimJBmbX4ZwV05IcNNAgTWJlUOpwpEkpu90COvViIG1i2pq4ZmiLrUtAf
	M6WT3J4Pfkthd2LyVdAPfnUAFBPBei+ki1JSWzoL/v4KbYml18oPHZ39vZyxz3PsCAhaUbwF46Qx
	pzumRa4iEl/ql4bbd9jYPetuvS1gTLvHd4l2YiX4dhjxWPBw+0bdaD0ic0+lmPRjcWSxPkQbCCtX
	XMSPGjGCUW4NQNntXFY0uN7zKvhmraJGWVbN0zdCh+St1HowXT/R4A89JYvUn9hM7l//efY4ocfm
	Wv3Fe9Iziczdq+A=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
X-Recommended-Action: accept
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Tue, 24 Jan 2017 06:49:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 18-01-17 17:09, akuster808 wrote:
>
>
> On 01/18/2017 04:08 AM, Nathan Rossi wrote:
>> On 18 January 2017 at 19:37, Mike Looijmans <mike.looijmans@topic.nl> wr=
ote:
>>> Could someone at least please say "yes" or "no"?
>>>
>>> I now have three projects waiting for this patch to be included in mort=
y. If
>>> it's not going to happen, I'll have to add a bbappend to these layers t=
o fix
>>> it.
>>>
>>> On 16-01-17 18:49, Manjukumar Harthikote Matha wrote:
>>>> Ping, this has been applied to master
>> Armin, you mentioned on IRC ~1 week ago that you had merged it to your
>> staging branch? Any updates?
>> Also I had a look and could not find the change in
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakuster/=
morty-next?
>>
>> Maybe I am looking in the wrong place though for your staging tree?
> I forgot to press go. Its there now.

Much appreciated.

Who's next in line to press "go" now? I still have three projects waiting.

Apparently the ARM64 isn't very popular, no one seems to care about its bui=
ld=20
failures...



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail







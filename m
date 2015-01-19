Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F90760670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 16:48:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0JGmqeF011069
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 19 Jan 2015 08:48:52 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 19 Jan 2015 08:48:52 -0800
Message-ID: <54BD3572.8070304@windriver.com>
Date: Mon, 19 Jan 2015 10:48:50 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <CADV-EXFaVwA2kjDo3e9VvO-sodxpxTo6HFDis1oD_36oq3NehA@mail.gmail.com>	<54BC58EC.6070406@windriver.com>
	<CAP9ODKqmXqdf8ruM6rinkqBPZCiviQJX1ztrmjCvm2iDpGekCw@mail.gmail.com>
In-Reply-To: <CAP9ODKqmXqdf8ruM6rinkqBPZCiviQJX1ztrmjCvm2iDpGekCw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RPM package generation architecture
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
X-List-Received-Date: Mon, 19 Jan 2015 16:48:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 1/19/15 10:31 AM, Otavio Salvador wrote:
> On Sun, Jan 18, 2015 at 11:07 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 1/18/15 4:55 PM, Yevhen Kyriukha wrote:
>>> I'm building RPM packages for ARM board.
>>> I'm getting packages generated for 3 architectures: all, raspberrypi,
>>> armv6hf_vfp.
>>> I can't install any of these packages with rpm as it uses "uname" to
>>> get current machine arch and "uname" outputs "armv6l" arch. Also "all"
>>> should be "noarch" for rpm.
>>> I want that packages have "proper" arch: "noarch" and "armv6l".
>>> Could someone give suggestions on this, please?
>>>
>>
>> You are using the wrong version of RPM.  You need to use the version (RPM5) that
>> is configured by the system during the filesystem generation, along with the
>> platform file (/etc/rpm/platform) to specify to the system what is allowed.
>>
>> RPM4 (which it sounds like you are using) does not have an easily adjustable
>> table of package names.  To install Yocto Project packages, you will need to
>> patch it to define the additional names.
> 
> Shouldn't RPM4 to be removed from OE-Core in this case?
> 
> 

oe-core preferred version in RPM5.  The RPM4 version that was recently added
should have this support.  So if the users have enabled the -oe-core- version of
RPM4 and are getting these failures then bugs should be filed.

I was referring to the community version of RPM 4.  I've seen people trying to
build packages w/ OE, and then install them on their Red Hat or other ARM
targets and it didn't work in the manner described.

--Mark


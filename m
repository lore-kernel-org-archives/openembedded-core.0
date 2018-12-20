Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 289E96C0F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 20:40:06 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id D99B91C002A;
	Fri, 21 Dec 2018 09:40:06 +1300 (NZDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181220054044.29476-1-douglas.royds@taitradio.com>
	<CAJTo0LZ+9K+AbMeWb5PV_0bmivHcv+2JAXtuA2ZxKJMsaL=Tbg@mail.gmail.com>
	<150da13c-a7d6-c6c1-c623-5acba13904df@taitradio.com>
	<CAJTo0Lb6rpmOjJt_kmFr9c3CEnxV_b5nRFjgq52ZvqgfPFUn7A@mail.gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <463a5593-2d35-a468-588c-78c9da01393b@taitradio.com>
Date: Fri, 21 Dec 2018 09:40:06 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb6rpmOjJt_kmFr9c3CEnxV_b5nRFjgq52ZvqgfPFUn7A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpam: reproducibility: Fix host umask leakage at patch-time
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
X-List-Received-Date: Thu, 20 Dec 2018 20:40:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

On 21/12/18 9:37 AM, Burton, Ross wrote:

> On Thu, 20 Dec 2018 at 20:26, Douglas Royds <douglas.royds@taitradio.com> wrote:
>> libpam is unusual in having a patch that creates an entirely new file
>> (tty_secure.c). If that patch eventually goes, then this umask setting
>> can go as well.
>>
>> I haven't come across any other cases of a patch creating a file, but if
>> there are, then we could certainly move this setting. Perhaps we should
>> wait until others emerge.
> I definitely wouldn't want to make the assumption that libpam is the
> only recipe of all time that will create a file.


No indeed. There are very likely others already, libpam is just the one 
I happened to stumble across. I'll shift the setting.



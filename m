Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UMkci-0000iy-Pq
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 21:42:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r31JPKQe005622
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Apr 2013 12:25:20 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Apr 2013 12:25:20 -0700
Message-ID: <5159DF1C.7010000@windriver.com>
Date: Mon, 1 Apr 2013 15:25:16 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1364835699.git.bruce.ashfield@windriver.com>
	<146E9829-6FA3-4124-8BF2-5B31B8CA146C@gmail.com>
In-Reply-To: <146E9829-6FA3-4124-8BF2-5B31B8CA146C@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] linux-yocto: mips, -rt update and yocto-custom fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2013 19:42:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-04-01 03:24 PM, Khem Raj wrote:
>
> On Apr 1, 2013, at 10:09 AM, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>
>> [PATCH 1/3] linux-yocto/3.8: update mips SA_RESTORER fix
>>
>>     During the 3.8.4 integration there was a build issue on MIPS due to
>>     SA_RESTORER changes. A solution was put in place for mips, but it
>>     didn't cover other impacted architectures.
>>
>>     This is a backport of the proposed fix for the next 3.8-stable,
>>     since the full -stable might not be available in the right timeframe.
>
>
> Does this fix systemd/ crash and/or mips64 boot on qemu I wonder

It may .. since the fix is broader than the one that I did before.
Now that this it out, I'm gearing up to do systemd boots with
mips/mips64.

Bruce

>




Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1RphEK-0007Pd-GP
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 15:20:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0OECIUI019945
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jan 2012 06:12:18 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 24 Jan 2012 06:12:18 -0800
Message-ID: <4F1EBC37.7080603@windriver.com>
Date: Tue, 24 Jan 2012 09:12:07 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1327341147.git.bruce.ashfield@windriver.com>
	<6bcfd05bd269dcceaf8629f22900e4a12650cf3b.1327341147.git.bruce.ashfield@windriver.com>
	<1327402947.19643.86.camel@ted>
In-Reply-To: <1327402947.19643.86.camel@ted>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] linux-yocto/qemuppc: fix console and ethernet
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2012 14:20:12 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-01-24 06:02 AM, Richard Purdie wrote:
> On Mon, 2012-01-23 at 12:54 -0500, Bruce Ashfield wrote:
>> Two issues are fixed with this commit, the ability to use the keyboard
>> on a graphical qemu boot and enabling ethernet by default on a 3.0
>> kernel.
>>
>> The keyboard is fixed via the same method as the other simulations with
>> the addition of console=tty on the qemu command line.
>>
>> Ethernet is fixed by adding a dependency of PCNET32 to the qemuppc
>> configuration, which allows us to build ethernet directly into the image.
>>
>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
>>   meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
>>   scripts/runqemu-internal                        |    2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> Merged to master, thanks.
>
> I can confirm qemuppc now has networking as well as graphics which is
> great progress :)

Indeed! It is nice to close out this longstanding issue.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>




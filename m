Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1TFJnC-0007AX-5G
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 09:06:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8M6rWHm004729
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Sep 2012 23:53:32 -0700 (PDT)
Received: from [128.224.18.106] (128.224.18.106) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 21 Sep 2012 23:53:32 -0700
Message-ID: <505D606C.5080406@windriver.com>
Date: Sat, 22 Sep 2012 09:53:32 +0300
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <505C6C8A.9000800@windriver.com> <1348235937.10108.78.camel@ted>
	<505CC452.9040906@windriver.com>
	<CAMKF1srm1JLHray=JEJtRoBjwKvg8KFGno95fjRz+SFN+Fu-Pg@mail.gmail.com>
In-Reply-To: <CAMKF1srm1JLHray=JEJtRoBjwKvg8KFGno95fjRz+SFN+Fu-Pg@mail.gmail.com>
Cc: Patches, discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils fails to set ld.gold as default
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
X-List-Received-Date: Sat, 22 Sep 2012 07:06:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

What exactly do you wanna see in the output? I can post the variables 
you are looking for.

Florin

On 09/22/2012 12:53 AM, Khem Raj wrote:
> On Fri, Sep 21, 2012 at 12:47 PM, Florin Sarbu
> <florin.sarbu@windriver.com> wrote:
>> It is enabled. As I said earlier, ld.gold gets created, it's just that ld is
>> not pointing to it even though the flag says --enable-gold=default. It still
>> point to the regular cross ld. Another config option that creates ld.gold is
>> --enable-ld=yes, so at this point default looks exactly like yes.
>> Just to be extra sure, I did try to add the extra space as you suggested but
>> the behaviour is the same.
> post the output of
> bitbake -e binutils-cross




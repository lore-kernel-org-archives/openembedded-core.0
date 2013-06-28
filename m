Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E10A60780
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 02:53:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5S2r4C8020626
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2013 19:53:04 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 27 Jun 2013 19:53:04 -0700
Message-ID: <51CCFA77.4080506@windriver.com>
Date: Fri, 28 Jun 2013 10:52:39 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <51C963C0.5020009@windriver.com> <1810438.1YW5iENKFC@helios>
	<51CC47DA.8090905@windriver.com> <51CC69DA.3010406@windriver.com>
	<1372351613.9930.225.camel@ted>
In-Reply-To: <1372351613.9930.225.camel@ted>
X-Originating-IP: [128.224.162.205]
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Could qt4.8 build on mips 64 bits platform?
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
X-List-Received-Date: Fri, 28 Jun 2013 02:53:06 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年06月28日 00:46, Richard Purdie wrote:
> On Thu, 2013-06-27 at 12:35 -0400, Randy MacLeod wrote:
>> We ended up with horrid bbapends such as:
>> ---
>> #Valid for all arches except mips64 with 64bit userspace
>> # mips64 with n32 has host: mips64-wrs-linux-gnun32
>> # mips64 with n64 has host: mips64-wrsmllib64-linux
>> # qemumips has host: mips-wrs-linux
>> # qemumips-64 has host: mips64-wrs-linux
>> COMPATIBLE_HOST =
>> '((x86_64.*|i.86.*|powerpc.*|arm.*|mips-.*|mips32.*)-linux|mips64.*-linux-gnun32)'
>> ---
>>
>> so we'll likely need a clue on how to declare a host as incompatible
>> or introduce an INCOMPATIBLE_HOST variable.
> I suspect something like this should work:
>
> COMPATIBLE_HOST_mips64 = ""

Thanks.

We still need include such packages on mips64 with 32 bits filesystem.  
So the following is needed:

COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"

I am little worried that "-gnun32" is a standard name then I'll figure it out.

Regards,
Kai


>
> Cheers,
>
> Richard
>
>


-- 
Regards,
Neil | Kai Kang



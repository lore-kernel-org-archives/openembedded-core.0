Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 839406A9C4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 02:27:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s382RIOU026765
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Apr 2014 19:27:18 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 7 Apr 2014 19:27:17 -0700
Message-ID: <53435E81.9060308@windriver.com>
Date: Tue, 8 Apr 2014 10:27:13 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1396870039-26834-1-git-send-email-ming.liu@windriver.com>
	<1396870039-26834-3-git-send-email-ming.liu@windriver.com>
	<1396870587.24597.35.camel@ted>
In-Reply-To: <1396870587.24597.35.camel@ted>
X-Originating-IP: [128.224.163.186]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] binconfig.bbclass: fix multilib file conflicts
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
X-List-Received-Date: Tue, 08 Apr 2014 02:27:19 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2014 07:36 PM, Richard Purdie wrote:
> On Mon, 2014-04-07 at 19:27 +0800, Ming Liu wrote:
>> In most cases binconfig files conflict among multilib packages, to avoid
>> that, use update-alternatives link *-config from real path with a
>> PACKAGE_ARCH suffix.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/classes/binconfig.bbclass | 65 ++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 56 insertions(+), 9 deletions(-)
> This isn't going in, its complex and supports a minority use case.
> binconfig should be dying out, not being extended and shored up like
> this.
>
> I'd also add this patch is buggy, its pure luck that update-alternatives
> is available at rootfs generation time since its not in a visible
> dependency.
>
> So going forward I'd like to see patches which simply delete binconfig
> scripts. Where there isn't a .pc alternative we should be adding them
> and pushing them upstream.
Did you mean we'd better remove all *-config scripts, insteaded by 
providing .pc files, and send the changes to all upstreams providing and 
using *-config? That seems a huge work and we need co-operate with a lot 
of projects.

//Ming Liu
>
> Cheers,
>
> Richard
>
>
>
>
>



Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0C9A7F7D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 19:20:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9UJKdlT013510
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2019 12:20:40 -0700
Received: from [147.11.119.146] (147.11.119.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 30 Oct 2019 12:20:39 -0700
To: Umesh Kalappa <umesh.kalappa0@gmail.com>, <akuster808@gmail.com>
References: <CAGfacvQhR6zknbOetU2uBTzPwv8nBreyG1-9WcmhiEYzUMD10A@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <a5c8f094-712a-204e-845d-89bb06b9eed0@windriver.com>
Date: Wed, 30 Oct 2019 15:20:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAGfacvQhR6zknbOetU2uBTzPwv8nBreyG1-9WcmhiEYzUMD10A@mail.gmail.com>
X-Originating-IP: [147.11.119.146]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: https://sourceware.org/bugzilla/show_bug.cgi?id=23657
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
X-List-Received-Date: Wed, 30 Oct 2019 19:20:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 10/30/19 5:25 AM, Umesh Kalappa wrote:
> Hi Kuster ,
> 
> Attached patch, fix the subjected issue (where we discard these weird
> sections from the final object file) and verified the same in the
> master.
> 
> Please let us know your comments/suggestions on the same.
> 
> Thank you
> ~Umesh
> 
> 

Hi Umesh,

Thanks for submitting the patch as I requested.
The patch content itself looks fine but since I think that
you will be involved in additional oe-core work involving
the toolchain, please read:
    https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Trevor and I will be happy to help you get the format right but we
should do that off the list initially.

In this case for example the bug should be fixed on the master branch
initially, then a separate email sent for the zeus branch.
There are examples of this on the oe-core list, such as:
    master:
 
http://lists.openembedded.org/pipermail/openembedded-core/2019-October/288405.html

    zeus:
 
http://lists.openembedded.org/pipermail/openembedded-core/2019-October/288400.html

Good luck and let me know if you have any questions.

-- 
# Randy MacLeod
# Wind River Linux


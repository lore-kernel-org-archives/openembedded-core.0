Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5C86BA7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 19:09:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7QJ9Acs007546
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Aug 2013 12:09:10 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 26 Aug 2013 12:09:09 -0700
Message-ID: <521BA7CB.7070206@windriver.com>
Date: Mon, 26 Aug 2013 15:08:59 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Elvis Dowson <elvis.dowson@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
	<521AD896.3000503@windriver.com>
	<6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
In-Reply-To: <6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Mon, 26 Aug 2013 19:09:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-26 11:49 AM, Elvis Dowson wrote:
> Hi Bruce,
>
> On Aug 26, 2013, at 8:24 AM, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>
>> Perhaps the zynq machine definition is the right way to go, since nearly
>> enough support is mainline (in both qemu and the kernel), and we can
>> motivate the rest into their respective upstreams.
>>
>> If someone can come up the right conf files, and machine definition, I
>> can pretty easily support it in linux-yocto.
>
> Could you tell me what's steps I need to follow, to add a new machine
> definition and support to the linux-yocto kernel?

Are you interested in something from scratch, versus something that
isn't already partially in the tree (like qemuarma9) ?

We've got a few docs and tutorials, but I can also help step you through
the process to assist the existing material.

Bruce

>
> I'd like to learn how to do this!
>
> Best regards,
>
> Elvis Dowson
>



Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B90A6BEF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:23:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7TGNWGC020985
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Aug 2013 09:23:33 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 29 Aug 2013 09:23:32 -0700
Message-ID: <521F7578.60909@windriver.com>
Date: Thu, 29 Aug 2013 12:23:20 -0400
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
	<521BA7CB.7070206@windriver.com>
	<2D33FB6A-9F7F-4E8E-8B1A-CED1D571A82C@gmail.com>
	<521D0622.6090802@windriver.com>
	<2AC87191-8D2B-4972-A249-2043B68A0A7B@gmail.com>
	<521E7D2E.6060404@windriver.com>
	<E66BA9BD-07D4-4A90-BFB9-0908608FBD07@gmail.com>
	<521F4020.1080800@windriver.com>
	<9B9DE34A-D9BE-44CB-871D-E9C57510DE38@gmail.com>
In-Reply-To: <9B9DE34A-D9BE-44CB-871D-E9C57510DE38@gmail.com>
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
X-List-Received-Date: Thu, 29 Aug 2013 16:23:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-29 10:02 AM, Elvis Dowson wrote:
> Hi Bruce,
>
> On Aug 29, 2013, at 4:35 PM, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>
>> With that, it's always been a manual setup for me in the past. The typical
>> workflow is to test them via the usermode NFS boot. Have you given
>> that a go ?
>
> Does yocto have some wrapper script/command to setup nfs boot automatically
> without too much manual configuration? The runqemu and runqemu-internal
> scripts seems to indicate that, but haven't tried this before.
>
> Let me know if it exists! If not, if you could point me to a link that describes how
> to set NFS boot, and use it to load a beagleboard image it would be great!

This is supported right out of the box, and it should be documented in
the project docs.

Search for users-space NFS in 
http://www.yoctoproject.org/docs/current/adt-manual/adt-manual.html

Cheers,

Bruce

>
>> Once I'm over the 3.10 introduction curve, I'm happy to dust off my
>> old A9 support and get the right qemu support for a full system boot.
>
> That sounds good. We should aim for adding support for both A8 and A9,
> since that represent the current bulk of last-gen and current-gen platforms
> out there.
>
> Best regards,
>
> Elvis Dowson
>
>



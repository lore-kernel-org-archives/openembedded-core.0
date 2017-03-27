Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.visioncatalog.com [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id E40ED65CC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 07:37:24 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 6D268A0031F;
	Mon, 27 Mar 2017 09:37:58 +0200 (CEST)
Received: from [172.16.25.210] ([172.16.25.210])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017032709372440-411328 ;
	Mon, 27 Mar 2017 09:37:24 +0200 
To: Enrico Joerns <ejo@pengutronix.de>
References: <20170324111502.23474-1-ejo@pengutronix.de>
	<d277a548-fc71-01a7-d995-1f9c9301db51@phytec.de>
	<82c9bea8-d333-c1b8-638a-e24945af795b@pengutronix.de>
From: Daniel Schultz <d.schultz@phytec.de>
Message-ID: <64ec78c3-6932-6d4a-b211-675473c75c85@phytec.de>
Date: Mon, 27 Mar 2017 09:37:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <82c9bea8-d333-c1b8-638a-e24945af795b@pengutronix.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 27.03.2017 09:37:24,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 27.03.2017 09:37:24
X-TNEFEvaluated: 1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: perform fsck on created ext image
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
X-List-Received-Date: Mon, 27 Mar 2017 07:37:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Enrico,

Am 24.03.2017 um 15:01 schrieb Enrico Joerns:
> Hi Daniel,
>
> On 03/24/2017 02:34 PM, Daniel Schultz wrote:
>> Hi Enrico,
>>
>> I have sent fixes for the same problem on Monday.
>> These include a fix of the wrong return code after optimizations (now it
>> returns 0) and an fsck execution after the creation of EXT partitions.
>>
>> The patch which is identical to yours wasn't applied so far, the other
>> ones were.
>
> ouh, we should have checked that before, but we did not assume that
> someone would have posted a fix for this relatively old behavior during
> the last days. Reality disabused us... Anyway, good to see that we are
> not the only one that stumbled across this issue ;)
>
> But, there is another difference between our patches. We use `-pvfD`,
> while you use `-fy` as an fsck.extN option.
>
> I would expect `-p` to be sufficient for letting fsck perform minor
> optimizations. If you use `-y` instead, fsck will fix also real issues.
> This is not what it should do here, even if it will return 1 afterwards.
> If the file system was created with errors I guess we should let the
> image creation fail without further touching the ext4.
>
> -D will let fsck perform further directory optimizations
> -v might be helpful for debugging purpose
>
Yes, that's better. I will them also apply to the WIC tools.

Do you think the test expression is still needed?
My opinion is, that it will obfuscate the return code of fsck to either=20
true or false. This could confuse other people. What do you think?

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen,
With best regards,
   Daniel Schultz


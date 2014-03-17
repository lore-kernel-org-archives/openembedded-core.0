Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 11A7F6AB7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 08:30:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2H8U6Fw021301
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Mar 2014 01:30:06 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 17 Mar 2014 01:30:05 -0700
Message-ID: <5326B28C.5000705@windriver.com>
Date: Mon, 17 Mar 2014 16:30:04 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1394717224-15283-1-git-send-email-ricardo.ribalda@gmail.com>	<1394717224-15283-2-git-send-email-ricardo.ribalda@gmail.com>	<1395010872.3808.16.camel@ted>
	<CAPybu_1RgpyAU++8oiW4avYeyQzKOV6NV65OknFUooaeANdVEA@mail.gmail.com>
In-Reply-To: <CAPybu_1RgpyAU++8oiW4avYeyQzKOV6NV65OknFUooaeANdVEA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] package_deb: Use apt-ftparchive
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
X-List-Received-Date: Mon, 17 Mar 2014 08:30:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ricardo,

On 03/17/2014 03:59 PM, Ricardo Ribalda Delgado wrote:
> Hello Richard.
>
> I have tested it with dora. I can rebase it.
>

If it is for dora, then the Subject should in include [dora]

> Shall I rebase it over git://git.yoctoproject.org/poky or over
> git://git.openembedded.org/openembedded-core
>

I think that openembedded-core is preferred.

// Robert

> Thanks!
>
> On Mon, Mar 17, 2014 at 12:01 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2014-03-13 at 14:27 +0100, Ricardo Ribalda Delgado wrote:
>>> Use apt-ftparchive to create a Release file compatible with SecureApt.
>>>
>>> apt-ftparchive is not compatible with libpseudo. The calls to ftw()
>>> returns the path in absolute format instead of relative. This produces
>>> wrong Packages and Release files.
>>>
>>> ie:
>>> MD5Sum:
>>> d20227a958f6870137ce0e41b7b84307             1453
>>> /home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/all/Release
>>>
>>> This is why it is called with PSEUDO_UNLOAD.
>>>
>>> apt-ftparchive is also a more efficient replacement of dpkg-scanpackages:
>>>
>>> root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/bobcat
>>> _64# time PSEUDO_UNLOAD=1 apt-ftparchive packages . >/tmp/kkk
>>> real 0m26.873s
>>> user 0m20.968s
>>> sys 0m1.212s
>>>
>>> root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/bobcat
>>> _64# time PSEUDO_UNLOAD=1 dpkg-scanpackages . >/tmp/kkk
>>> dpkg-scanpackages: info: Wrote 6022 entries to output Packages file.
>>> real 0m59.721s
>>> user 0m16.668s
>>> sys 0m11.164s
>>>
>>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>>> ---
>>>   meta/classes/package_deb.bbclass | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> This doesn't apply against master? What was this tested against?
>>
>> Cheers,
>>
>> Richard
>>
>
>
>


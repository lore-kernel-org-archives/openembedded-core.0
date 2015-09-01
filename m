Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 879E976A51
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 14:55:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t81EtTac024496
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Sep 2015 07:55:29 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Tue, 1 Sep 2015 07:55:29 -0700
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
	<CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>
	<1440843517.32588.7.camel@linuxfoundation.org>
	<CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
	<20150831152103.GB2465@jama>
	<BC8B1BD5-224C-480C-BFC9-F2BA6B0254E9@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55E5BC60.4010302@windriver.com>
Date: Tue, 1 Sep 2015 09:55:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <BC8B1BD5-224C-480C-BFC9-F2BA6B0254E9@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Tue, 01 Sep 2015 14:55:33 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 8/31/15 10:27 AM, Khem Raj wrote:
> 
>> On Aug 31, 2015, at 8:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> On Mon, Aug 31, 2015 at 10:22:31AM -0300, Otavio Salvador wrote:
>>> On Sat, Aug 29, 2015 at 7:18 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> On Sat, 2015-08-29 at 10:43 +0200, Martin Jansa wrote:
>>>>> Did you enable thumb in that qemuarm build?
>>>>>
>>>>>
>>>>> It's disabled by default and multiple components are broken when you
>>>>> enable it, see:
>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>>>>
>>>> I'm going to draw a line here. People are asking that the old version of
>>>> gmp be brought back due license issues, fine. It doesn't mean that all
>>>> the bugs in said old release should be fixed.
>>>>
>>>> If thumb on arm with old gmp is an issue for people, I'd suggest that
>>>> those people figure out which patches are needed and send the patches.
>>>> Asking Jussi to deal with this isn't right/fair though.
>>>
>>> I disagree. If it will be merged it ought to support what we are
>>> testing nowadays otherwise the backlog will be kept growing forever...
>>
>> FWIW: I don't mind getting it merged as is.
>>
>> It improves situation for non-GPLv3 builds and if there is issue with
>> thumb, then it was there before as well, so returning it doesn't make
>> things worse.
>>
>> My previous reply was just to show that building default qemuarm doesn't
>> show anything, because thumb isn't enabled and gmp even isn't one of the
>> recipes which are failing with thumb-1, maybe Khem meant some issues in
>> runtime I don't know about.
> 
> It has issues working with thumb2 as well. Another problem it creates is building on-device toolchain
> since gcc also depends on gmp and when you pin to older version of GMP, it starts to fail
> Thats why I suggested to use mini-gmp ( same but reduced gmp ) can clear of this situation since it
> will be a mini-gmp recipe and won’t interfere with toolchain.
> 

Do you have any sense of the problems when gcc uses an older version of GMP?  If
a newer version is required for gcc -- then can gcc itself check that it's a
proper minimum version available?  (At this point I would assume if someone is
worried about GPLv3 issues, that they would NOT be putting the compiler and
related tools on the target.)  I know we can specify -runtime- minimum versions
easily enough using the > directive.. but I don't think there is an easy way to
specify minimum build version, other then verify we have the correct version
available to us though a file check of some kind.

--Mark


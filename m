Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A76D165DA3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 10:26:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9BAQeMH016898
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 11 Oct 2014 03:26:40 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 11 Oct 2014 03:26:39 -0700
Message-ID: <543905DC.3070705@windriver.com>
Date: Sat, 11 Oct 2014 18:26:36 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <cover.1412770325.git.hongxu.jia@windriver.com>	<241e2535b1e3f4544e31fdc40406337b26e8f8d9.1412770325.git.hongxu.jia@windriver.com>	<CANyK_8eqiktne2E4EwpWoBpz_-xtDweSS56XdBi6ocKoh_Wq2A@mail.gmail.com>
	<543903BC.6020706@windriver.com>
In-Reply-To: <543903BC.6020706@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg: fix remove pkg with --force-removal-of-dependent-packages failed
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
X-List-Received-Date: Sat, 11 Oct 2014 10:26:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2014 06:17 PM, Hongxu Jia wrote:
> On 10/11/2014 05:31 PM, Paul Barker wrote:
>> Your solution looks fine but I'd prefer it to be solved a different
>> way upstream.
>>
>> It should be possible to ensure that duplicates don't enter the
>> removal queue in the first place by checking the return of
>> pkg_vec_contains(dependent_pkgs, dep_pkg) before calling
>> pkg_vec_insert(dependent_pkgs, dep_pkg) in opkg_remove_dependent_pkgs.
>> This would keep the logic in opkg_remove_pkg clean.
>
> The pkg_vec_contains(dependent_pkgs, dep_pkg) could not work here.
> Because 'dependent_pkgs' is not global which contains all removed pkgs.
>
> The checking will filter duplicated pkg.
>

s/will/will not/

//Hongxu

> //Hongxu
>
>> If you've got time to try this alternative solution could you let me
>> know if it works. If so, send the patch toopkg-devel@googlegroups.com
>> and I'll merge it upstream. If you're too busy I can have a look at
>> this myself next week.
>



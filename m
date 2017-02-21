Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C43FC71D90
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 01:35:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1L1Z1E0010228
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Feb 2017 17:35:02 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Feb 2017 17:35:01 -0800
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1487055395.git.hongxu.jia@windriver.com>
	<247659408552f6a0edba461a59a3cc53e85012ae.1487055395.git.hongxu.jia@windriver.com>
	<lyefz12gkp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYqkQfvgboQ5+wPuz2tVa8s=xDis_dX00ApAcHeLTNDrQ@mail.gmail.com>
	<CAJTo0LZyoG0qMwYYVM2wq7SRkz52QVQ3-CxZovNsiOXC6BVngw@mail.gmail.com>
	<lypoic1ho1.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <3d7395a3-90d4-c7d3-0e1f-066df6de70ba@windriver.com>
Date: Tue, 21 Feb 2017 09:34:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <lypoic1ho1.fsf@ensc-virt.intern.sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] ncurses: fix beaglebone do_configure failure
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
X-List-Received-Date: Tue, 21 Feb 2017 01:35:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年02月21日 09:01, Enrico Scholz wrote:
> "Burton, Ross" <ross.burton@intel.com> writes:
>
>>> c) fix the function that detects the "broken" use of CC as it should be
>>> extracting the flags and moving them to CFLAGS.  Clearly this isn't working
>>> somewhere.
> Upstream tries to do it correctly for nearly a year and fails everytime
> at some cornercases.
>
>
>> I've a local working fix that basically does this:
>>
>> - cf_flags=`echo "$CC" | sed -e 's/^.*[ ]\(-[^ ]\)/\1/'`
>> + cf_flags=`echo "$CC" | cut -f2- -d' '`
> This will break for
>
>    CC='ccache gcc -m32'
>
> Perhaps there are cases (not for OE), where gcc contains a space... How
> to deal with this?

How about directly remove the cf_flags assigning? Because our OE have
correctly assigned it in bitbake.conf.

//Hongxu

>
>
> Enrico




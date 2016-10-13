Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3963A62136
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 06:30:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9D6Udip020449
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Oct 2016 23:30:39 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 23:30:38 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1476263868.git.liezhi.yang@windriver.com>
	<66ca8239a28434c2db142e18a1a112122d13e910.1476263868.git.liezhi.yang@windriver.com>
	<CAJTo0LZgK6spkEd2jZ=Xd5HyJ+3gkxtMLBD30Z1dJLKCzoYhOw@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9a70c1f5-119b-1b2b-de4f-a3764c71f19c@windriver.com>
Date: Thu, 13 Oct 2016 14:30:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZgK6spkEd2jZ=Xd5HyJ+3gkxtMLBD30Z1dJLKCzoYhOw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] package_ipk/rpm/deb: remove unneeded dir settings
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
X-List-Received-Date: Thu, 13 Oct 2016 06:30:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/12/2016 05:37 PM, Burton, Ross wrote:
>
> On 12 October 2016 at 10:19, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     There is a do_package_write_foo[cleandirs], so the
>     do_package_write_foo[dirs] is not needed.
>
>
> [dirs] changes the cwd whereas [cleandirs] doesn't, so assuming that you've
> verified this isn't a problem the message should explain that the tasks chdir()
> themselves.

Thanks, I've verified that it works well after remove the [dirs], but since it
does make sense (change the cwd), so I think that we'd better not remove them
and drop this patch ?

// Robert

>
> Ross


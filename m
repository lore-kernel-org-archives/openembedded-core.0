Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F830610D7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 01:35:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8O1ZWeR003742
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Sep 2013 18:35:32 -0700 (PDT)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 23 Sep 2013 18:35:31 -0700
Message-ID: <5240EC60.3090906@windriver.com>
Date: Tue, 24 Sep 2013 09:35:28 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1379906677.git.liezhi.yang@windriver.com>
	<620b9a68452878b620a520e585cf806db5e8d315.1379906677.git.liezhi.yang@windriver.com>
	<CAJTo0LZJ7AgsHe3B9QCLWL8XBuBnmCBfpe6KnaxASykfMmT44w@mail.gmail.com>
In-Reply-To: <CAJTo0LZJ7AgsHe3B9QCLWL8XBuBnmCBfpe6KnaxASykfMmT44w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] telepathy-mission-control: do_compile failed (race issue)
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
X-List-Received-Date: Tue, 24 Sep 2013 01:35:31 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/23/2013 10:07 PM, Burton, Ross wrote:
> On 23 September 2013 06:54, Robert Yang <liezhi.yang@windriver.com> wrote:
>> This is a race issue, the _gen/gtypes.h and _gen/gtypes-body.h may
>> write(remove/rename) _gen/gtypes.tmp at the same time, then there would
>> be the error.
>
> Looks good.  Can you submit that patch against the upstream bug at
> https://bugs.freedesktop.org/show_bug.cgi?id=69446 too?

thanks, I will.

// Robert

>
> Acked-By: Ross Burton <ross.burton@intel.com>
>
> Ross
>
>


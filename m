Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2C5D60557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 06:19:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9M6Jdwu023625
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Oct 2014 23:19:40 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 21 Oct 2014 23:19:39 -0700
Message-ID: <54474C78.5030509@windriver.com>
Date: Wed, 22 Oct 2014 14:19:36 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1413341569.git.Chong.Lu@windriver.com>
	<b2f5f79f9e08f008043508392775c2bb52f819b3.1413341569.git.Chong.Lu@windriver.com>
	<CAJTo0LboKNAOi7_tx31+m2KOxF_HEKEGePU2wnHXSzGpoeGTgA@mail.gmail.com>
	<5444D3A5.7060208@windriver.com>
	<CAJTo0La=Q6Wx8dTBP6mc6A3=b-oXejiAX94dMtgon5aohA1GQg@mail.gmail.com>
In-Reply-To: <CAJTo0La=Q6Wx8dTBP6mc6A3=b-oXejiAX94dMtgon5aohA1GQg@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Wed, 22 Oct 2014 06:19:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/20/2014 08:31 PM, Burton, Ross wrote:
> On 20 October 2014 10:19, Chong Lu <Chong.Lu@windriver.com> wrote:
>> The data file is different between bit-32 and bit-64 environment.
> And the data file is specific to the daemon, and you only want that
> installed once.  Two gconf daemons will attempt to write the same data
> file, resulting in corruption.
>
> What I meant is this:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/gconf&id=fac86eb3f86618f109e3797422aae53d9c8d3b30.
> Package the client-side libraries into a separate package, so you can
> have gconfd, libgconf, and lib32-libgconf installed at once.  Both
> client libraries will talk over DBus to the single gconfd binary.
>
> (untested, and needs upgrade path dependencies added)
>
> Ross

Hi Ross,

Thanks for your suggestion, I will send a V3.

Best Regards
Chong

>
>



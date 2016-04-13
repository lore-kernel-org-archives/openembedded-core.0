Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CDDA16018C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:58:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3D2wObA015227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Apr 2016 19:58:24 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Apr 2016 19:58:23 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1460513113.git.liezhi.yang@windriver.com>
	<CADkTA4PH7Vw8hGjpkBi0rsSgTXZf0KGZXR3XfiQAKyftBdV3ig@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <570DB5CD.5050107@windriver.com>
Date: Wed, 13 Apr 2016 10:58:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PH7Vw8hGjpkBi0rsSgTXZf0KGZXR3XfiQAKyftBdV3ig@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] linux-yocto-tiny: update SRCREV_meta to support /proc/sys
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
X-List-Received-Date: Wed, 13 Apr 2016 02:58:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/13/2016 10:53 AM, Bruce Ashfield wrote:
>
>
> On Tue, Apr 12, 2016 at 10:07 PM, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Hi RP,
>     I'm sorry to say that I didn't send this yesterday was because I have to
>     wait until the kernel's part get merged (now it is done), otherwise I
>     can't have the correct SRCREV.
>
>
> You shouldn't be bumping the SRCREV at all. That's something that I do when queuing
> changes.
>
> In fact, I already have this done and have it under test.
>
> So please, don't merge this. I have it here and have it stacked with other commits,
> which will all come out tomorrow when my testing completes.
>
> This SRCREV bump is for more than the single change .. hence why I need to do
> the update.

Got it, then please drop this.

// Robert

>
> Bruce
>
>
>     // Robert
>
>     The following changes since commit b3afe7d9bd25a943e947de3ec064ea245173c5a8:
>
>        archiver: Ensure sstate-inputdir directory is created (2016-04-12
>     22:46:48 +0100)
>
>     are available in the git repository at:
>
>        git://git.openembedded.org/openembedded-core-contrib
>     <http://git.openembedded.org/openembedded-core-contrib> rbt/sys
>     http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sys
>
>     Robert Yang (1):
>        linux-yocto-tiny: update SRCREV_meta to support /proc/sys
>
>       meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
>     <http://linux-yocto-tiny_4.1.bb> | 2 +-
>       meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
>     <http://linux-yocto-tiny_4.4.bb> | 2 +-
>       2 files changed, 2 insertions(+), 2 deletions(-)
>
>     --
>     2.8.0
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its
> end"


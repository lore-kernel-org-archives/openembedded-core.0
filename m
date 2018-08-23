Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id A440F7948E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 06:39:58 +0000 (UTC)
Received: from [10.0.0.246] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 7B1CB1C09E8;
	Thu, 23 Aug 2018 08:39:58 +0200 (CEST)
To: Ryan Harkin <ryan.harkin@linaro.org>, Andre McCurdy <armccurdy@gmail.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
	<CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
	<CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
	<CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
	<CAJ86T=UOiE+m=3__e13YpRex22Z9h1ennqyCxQMRDdSWMiFZTw@mail.gmail.com>
	<CAD0U-hJ5Ef8+zV6fumw921=67hwS5yyqaDWWJGVm4D4rFyrYHQ@mail.gmail.com>
	<CAJ86T=WjSNkzHpD0a-CxwmV1JfG7ksfezspi+5LvkdvJHdTcFw@mail.gmail.com>
	<CAD0U-h+yMkaadysGDcmhZHSPY8tgbw_O8jquynJduChJjgypxA@mail.gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <ef756a97-310a-63a9-1a3b-be0bb6634769@geanix.com>
Date: Thu, 23 Aug 2018 08:39:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAD0U-h+yMkaadysGDcmhZHSPY8tgbw_O8jquynJduChJjgypxA@mail.gmail.com>
Cc: daiane.angolini@nxp.com, Patch Tracking <patches@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Thu, 23 Aug 2018 06:39:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

May I suggest using the '-r, --relative' flag from 'ln':

        -r, --relative
               create symbolic links relative to link location

My life felt considerably better after discovering that feature :)

// Martin

On 23/08/2018 08.12, Ryan Harkin wrote:
> 
> 
> On 22 August 2018 at 23:55, Andre McCurdy <armccurdy@gmail.com 
> <mailto:armccurdy@gmail.com>> wrote:
> 
>     On Wed, Aug 22, 2018 at 2:56 PM, Ryan Harkin <ryan.harkin@linaro.org
>     <mailto:ryan.harkin@linaro.org>> wrote:
>      > On Wed, 22 Aug 2018, 21:42 Andre McCurdy, <armccurdy@gmail.com
>     <mailto:armccurdy@gmail.com>> wrote:
>      >> On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin
>     <ryan.harkin@linaro.org <mailto:ryan.harkin@linaro.org>>
>      >> wrote:
>      >> > On Wed, 22 Aug 2018, 20:02 Martin Jansa,
>     <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>> wrote:
>      >> >>
>      >> >> Your 1st parameter is wrong, compare again with the example I
>     gave you
>      >> >> (don't include "brcm/" path in 1st param, because you want
>     the symlink
>      >> >> to
>      >> >> point to just brcmfmac43430-sdio.AP6212.txt like you did in
>     the version
>      >> >> after cd).
>      >> >
>      >> > That doesn't work either. I tried it with the same result, but
>     didn't
>      >> > send a
>      >> > log of it. That works for you?
>      >>
>      >> Martin's example is correct so maybe check your tests again for
>     typos.
>      >> It it still doesn't work then please do send a log.
>      >>
>      >> The link will point to whatever you define via the first
>     parameter, so
>      >> if you changed the first parameter it shouldn't be possible to get
>      >> "the same result".
>      >>
>      >>   $ mkdir foo
>      >>   $ ln -sf test_target foo/test1
>      >>   $ ln -sf brcm/test_target foo/test2
>      >>   $ ls -l foo
>      >>
>      >>   lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -> test_target
>      >>   lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 -> brcm/test_target
>      >
>      > Yes, that's essentially the same as what I'm getting.
>      >
>      > Now try "cat foo/test1" and what happens?
>      >
>      > There is no file called test_target in the foo directory. And
>     neither is
>      > there a file called brcm/test_target in the foo directory.
> 
>     Correct. The above was just an example to show that you can * create
>     symlinks * in the foo directory without cd'ing into the foo directory
>     first.
> 
>     If you'd like the symlinks in the example to point to valid targets
>     then you need to create the targets too, e.g.
> 
>        $ mkdir -p foo/brcm
>        $ echo hello > foo/test_target
>        $ echo hello2 > foo/brcm/test_target
> 
>     But note that the process of creating a symlink is always the same,
>     regardless of whether the symlink points to a valid target or not (so
>     you can run these extra commands to create the targets before or after
>     you create the symlinks).
> 
> 
> So that doesn't work for me how I expect it to work. I must be missing 
> something fundamental here.
> 
> The recipe is trying to create a soft link from a file in the current 
> directory to a file in the sub-directory. On my system, your example 
> creates links from a file in the sub-directory to the another file in 
> the sub-directory.
> 
> So, to copy your example, but creating the file "test_target" from the 
> start:
> 
> $ mkdir -p /tmp/test
> $ cd /tmp/test
> $ mkdir foo
> $ echo 1 > test_target
> $ ln -sf test_target foo/test1
> $ ln -sf brcm/test_target foo/test2
> $ ls -l foo
> total 0
> lrwxrwxrwx 1 ryan ryan 11 Aug 23 06:54 test1 -> test_target
> lrwxrwxrwx 1 ryan ryan 16 Aug 23 06:54 test2 -> brcm/test_target
> $ cat test_target
> 1
> $ cat foo/test1
> cat: foo/test1: No such file or directory
> $ cat foo/test2
> cat: foo/test2: No such file or directory
> $ echo hello > foo/test_target
> $ echo hello2 > foo/brcm/test_target
> bash: foo/brcm/test_target: No such file or directory
> $ cat foo/test1
> hello
> $ cat foo/test2
> cat: foo/test2: No such file or directory
> $ cat test_target
> 1
> $ tree
> .
> ├── foo
> │   ├── test1 -> test_target
> │   ├── test2 -> brcm/test_target
> │   └── test_target
> └── test_target
> 
> 1 directory, 4 files
> 
> So, neither test1 nor test2 are linked to /tmp/test/test_target. test1 
> is linked to /tmp/test/foo/test_target and test2 is linked to 
> /tmp/test/brcm/test_target, which doesn't exist.
> 
> AFAIK, when creating a softlink, you have to give it either an absolute 
> path, or a path relative to the link being created. The path cannot be 
> relative to the original file that you want to link to.
> 
> So, this will work:
> 
> $cd /tmp/test
> $ ln -sf ../test_target foo/test3
> $ cat foo/test3
> 1
> $ cat /tmp/test/foo/test3
> 1
> 
> But that is a strange way to create the soft link, IMO.
> 
> AFAICT, for the recipe, to get rid of the "cd", I'd have to specify an 
> absolute path to the original file:
> 
> +do_install_append_bcm43430-nvram-mur1dx() {
> +       ( ln -sf ${PWD}/brcmfmac43430-sdio.MUR1DX.txt 
> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)
> 
> ... assuming PWD is available to the recipe. There will be a proper 
> Yocto variable I can use, of course, but I can't think of it right now.
> 
> Either way, Martin's example doesn't work for me. And adding the 
> absolute path of the original file doesn't seem any neater or clearer 
> than following the TI example from the do_install a few lines up in the 
> recipe. But I'm happy to do it either way, so long as it works.
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
https://geanix.com
DK39600706


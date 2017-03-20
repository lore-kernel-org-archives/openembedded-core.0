Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8E97795B
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:51:13 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t189so69603042wmt.1
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R0FdfFceGi++cdKpQWVuIRUjvedt5086QL3oiMFq67c=;
	b=ZULMCmrHeqInbY1AnRCue655IujuiM5g2by9RdWagYioZ+OjWtbvZsUDoCR2iiYH/G
	WbPbCh+2pWR7wYf85AtvcCFFdODTpDy0NvIEiMjc2Jk30sd3y0UeMIWV6x9SgVuXuoVh
	wgE0h59cn+FWdMXbqDagglzXs5874lN6vuey/jRUs/QMhviYpcqn2uV7QjzQkGmM+b74
	kUe7O5VPj3SicV4AuE43W6HqTRCJimYxOVCBeAP7ccxIrW+68LaMMZqc44XpPfGw5Yjv
	ZsvbI9LvK77Cl67D48cfKcA9HxWTN2QmvaJniCRTuQ10drSvSqyu0fXvZsLsVApA5Fej
	DmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R0FdfFceGi++cdKpQWVuIRUjvedt5086QL3oiMFq67c=;
	b=DRWL6OGMf2622Gj9OZJIm8KFtNanxazhk7MU0aEBcL5dy89zwhThzxIPMoSxfw/Qj6
	KVGRGout+ekD4jbAzGQ9w8fbYWbGkerY9/VG4AUHhRretIZLZlN8VeePLGkAl2fnwCsM
	hbeUVCpKFu5Wmo/SXp14wWEvF1OPM2pLUyEppYIyeQCb0cIBeXt7fJrnDJpgEUUbAemZ
	K04SRtIJmYzQNV9tOq/cxMM1KetT7bqY/tdN7q/ILcqfmLd6ocd0weyhLKGeLTCImhWv
	fDgNSmX9YExdpO8hoe0ktm5SSPrkFR+v8UfjAYf5ncb616EDe28T6/FK6EHFX2oGvQVx
	EpIg==
X-Gm-Message-State: AFeK/H2WaLm4B9Ijt0Lup3kIve71eHrt7+whDFH3zDKq3XXuiVc77Z9ElMy9OT+8kZ1QqcdlT8ww5xN2TZmqkw==
X-Received: by 10.28.43.129 with SMTP id r123mr3247593wmr.13.1490028674627;
	Mon, 20 Mar 2017 09:51:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Mon, 20 Mar 2017 09:50:44 -0700 (PDT)
In-Reply-To: <CAMKF1sqgsN6Q+JrpOC83hxP3Vm8G0Wm_fjsN3yW=nZMOX88Oiw@mail.gmail.com>
References: <7780ce1c-7e26-0cac-9813-ec713251c7b9@mender.io>
	<CAMKF1sp6C9qqzt1azPQwOpxySj34_KifVosn5aSp2bzDjfoS6w@mail.gmail.com>
	<1490023039.13980.142.camel@linuxfoundation.org>
	<CAMKF1sqgsN6Q+JrpOC83hxP3Vm8G0Wm_fjsN3yW=nZMOX88Oiw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Mar 2017 09:50:44 -0700
Message-ID: <CAMKF1srC3vQpSOb7N9YwVkwjA4Y5Q8N4sCfKXfjpMysyBEEKAw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: go-bootstrap / go-native conflict during do_rootfs
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
X-List-Received-Date: Mon, 20 Mar 2017 16:51:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 20, 2017 at 8:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Mar 20, 2017 at 8:17 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2017-03-20 at 07:49 -0700, Khem Raj wrote:
>>> On Mon, Mar 20, 2017 at 6:47 AM, Kristian Amlie
>>> <kristian.amlie@mender.io> wrote:
>>> >
>>> > --------------------------------------------------
>>> >
>>> > Additionally, in the logs I found these two snippets:
>>> >
>>> > --------------------------------------------------
>>> > Considering setscene task: ['go-native', 'do_populate_sysroot']
>>> >   considering dependency: ['go-native', 'do_populate_sysroot']
>>> >   considering dependency: ['mender-artifact-native',
>>> > 'do_populate_sysroot']
>>> > Adding dependency on go-native
>>> > ...
>>> > Considering setscene task: ['go-bootstrap-native',
>>> > 'do_populate_sysroot']
>>> >   considering dependency: ['go-native', 'do_populate_sysroot']
>>> > Adding dependency on go-bootstrap-native
>>> > --------------------------------------------------
>>> >
>>> > which lead me to believe that all dependencies are being pulled in
>>> > simultaneously by do_rootfs, but go-native and go-bootstrap-native
>>> > are
>>> > in fact mutually exclusive, since they install to the sysroot in
>>> > the
>>> > same location. Note that both compilers build just fine, it's only
>>> > at
>>> > the do_rootfs stage that this shows up.
>>> >
>>> > I think the oe-meta-go layer solved this by having go-bootstrap-
>>> > native
>>> > install in a different location, but I'm unsure what is the best
>>> > approach for OE.
>>> go-bootstrap is only needed for few recipes. I think we should find
>>> out
>>> a way to keep this dep limited to those recipes and not reflect in
>>> final
>>> image rootfs creation. That seems to be not useful.
>>
>> There is code in sstate.bbclass in setscene_depvalid:
>>
>>         # Consider sysroot depending on sysroot tasks
>>         if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
>>             [...]
>>             # Nothing need depend on libc-initial/gcc-cross-initial
>>             if "-initial" in taskdependees[task][0]:
>>                 continue
>>
>> so if go-bootstrap-native were renamed go-native-initial, things might
>> happen to work better...
>
> ah thats right, forgot about that, I think we should rename the recipe
> to go-native-initial
>
>>

Can you try

http://lists.openembedded.org/pipermail/openembedded-core/2017-March/134372.html

and see if this works out for you ?


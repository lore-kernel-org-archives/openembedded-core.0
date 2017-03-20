Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7B2779B0
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 15:29:54 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n11so67573797wma.0
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5L914XEWOt88rncFj6BBo5DpWC7YBn5z2LNiTt7czrc=;
	b=dSjEvkaOzOQ5BupUXNY8QWVeJjNt4DsEpjbGW6nmnXoHAaPelcbR9PFrl+XgxwPXqu
	m3eTFnR4gQLECwtNr5jJU7DgpiCf2Bfwr/aXzpR4iOpxgCL57aTOYdrOlEYmPJW4nBK0
	/plQaDn2fynY2/2/KmluCAo0tXE+cbIzZwYtgZ3cpJhMZMzOSjZ8udmcRCGUC7J42O53
	8C3nqvj1eZdRwibCr24W+r1UadxtelhCQQODq6JuHuewHyAglot241RN5TaChmUAcIoA
	LoLtDeZe8EPZR6Yyo/2MUSCluqMvNtJQaj0fvZsglfO0+wD86XxFmGIquUTesA4p36lr
	Vk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5L914XEWOt88rncFj6BBo5DpWC7YBn5z2LNiTt7czrc=;
	b=FME40Kj3cTpXJTtBvW5ZJvh5IrO770lGJg3LTTUp9//qv7hGBoWTfSDNy/eku3UZXL
	q2VA7lPMu8CsoSQVdtQkYA5Wh/p/bxz7hQSI+DZKZZTqzquRaexjTsEF0lhdl7sjbUKw
	azOqLaKVa/wl/qo1wZX0KfY4NYRkP0oA2h+fkWK5DAIcxDSl75NfdEuaC+I4bZnUfnxG
	U6+nNwYTCjqgSVBo9NLoPMxPJ11lNljaAqNZmgYS930X99dI1If0r4K11oCJ6kmKMRd9
	jynO7f2psppyehHa0kRLrFp2SVduefRpgV7dwQL60PR1UUQvUnOerXK/caaUT1Cw6k8F
	mtRg==
X-Gm-Message-State: AFeK/H0cWffVyiGBuKpw8BcfGEtllIggvGwd6YTy3TPK2q+jcr8sPoAsmEIUk8v/HmkZ31e7HXGg9mXSWiP0xw==
X-Received: by 10.28.165.145 with SMTP id o139mr11149283wme.13.1490023795955; 
	Mon, 20 Mar 2017 08:29:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Mon, 20 Mar 2017 08:29:25 -0700 (PDT)
In-Reply-To: <1490023039.13980.142.camel@linuxfoundation.org>
References: <7780ce1c-7e26-0cac-9813-ec713251c7b9@mender.io>
	<CAMKF1sp6C9qqzt1azPQwOpxySj34_KifVosn5aSp2bzDjfoS6w@mail.gmail.com>
	<1490023039.13980.142.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Mar 2017 08:29:25 -0700
Message-ID: <CAMKF1sqgsN6Q+JrpOC83hxP3Vm8G0Wm_fjsN3yW=nZMOX88Oiw@mail.gmail.com>
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
X-List-Received-Date: Mon, 20 Mar 2017 15:29:55 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 20, 2017 at 8:17 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2017-03-20 at 07:49 -0700, Khem Raj wrote:
>> On Mon, Mar 20, 2017 at 6:47 AM, Kristian Amlie
>> <kristian.amlie@mender.io> wrote:
>> >
>> > --------------------------------------------------
>> >
>> > Additionally, in the logs I found these two snippets:
>> >
>> > --------------------------------------------------
>> > Considering setscene task: ['go-native', 'do_populate_sysroot']
>> >   considering dependency: ['go-native', 'do_populate_sysroot']
>> >   considering dependency: ['mender-artifact-native',
>> > 'do_populate_sysroot']
>> > Adding dependency on go-native
>> > ...
>> > Considering setscene task: ['go-bootstrap-native',
>> > 'do_populate_sysroot']
>> >   considering dependency: ['go-native', 'do_populate_sysroot']
>> > Adding dependency on go-bootstrap-native
>> > --------------------------------------------------
>> >
>> > which lead me to believe that all dependencies are being pulled in
>> > simultaneously by do_rootfs, but go-native and go-bootstrap-native
>> > are
>> > in fact mutually exclusive, since they install to the sysroot in
>> > the
>> > same location. Note that both compilers build just fine, it's only
>> > at
>> > the do_rootfs stage that this shows up.
>> >
>> > I think the oe-meta-go layer solved this by having go-bootstrap-
>> > native
>> > install in a different location, but I'm unsure what is the best
>> > approach for OE.
>> go-bootstrap is only needed for few recipes. I think we should find
>> out
>> a way to keep this dep limited to those recipes and not reflect in
>> final
>> image rootfs creation. That seems to be not useful.
>
> There is code in sstate.bbclass in setscene_depvalid:
>
>         # Consider sysroot depending on sysroot tasks
>         if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
>             [...]
>             # Nothing need depend on libc-initial/gcc-cross-initial
>             if "-initial" in taskdependees[task][0]:
>                 continue
>
> so if go-bootstrap-native were renamed go-native-initial, things might
> happen to work better...

ah thats right, forgot about that, I think we should rename the recipe
to go-native-initial

>
> Cheers,
>
> Richard


Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD177FC9D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 18:31:50 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q13so10495890wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 11:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bFSOHE0eOigdsaf75bKIOI6nNAk+fHSKxXcTlIMnHSw=;
	b=neiggvaUrX8cNvdNqKnfhy1FEZ97Y03PzMby4nQkceCLFRExXqwOGiydoC39GCnReq
	4oO7HXfOfsoDTTmZ6oRtmMEQ4XiHNko1wP2PQRl5mvM/nORfe4CC3w/pebctRud99ijh
	+katpsIjR8y0zdeTeagignQTez79BtrV9T36Hz0j73JXQS/vkLJ0dnrTKsr7QscnYfnp
	zkEZmoAQ8TW8NVHYwKslpVjg+hJdlnR9YoKsNbOkgeQM22NfBxMQixn/84QOYtkcZmSD
	N2sw0npbzvj2p1yDEjr9+pOHLOyBxC8jeG8L1TsGj2fXO43sHW1CAXmNNz9i5oLoPVgd
	yFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bFSOHE0eOigdsaf75bKIOI6nNAk+fHSKxXcTlIMnHSw=;
	b=erIsOiK87MVDcGNNbqO8UhGkRUsl1pjKjv6WsFKMCzii7Of3sW+rNPEVHNFkns4PRg
	rGyNdnaURPyg8UJEyMCELDImteywtC2MTVHv2Ecue7Nfw7rqMijUdQRui2b3q2Dyq2qa
	bTXwQXqBs1tLS6oGVXSv992iDMOPtRiLlQqci5JvwYV4peM4lryh2XkFYtjZdxmZQPPo
	gjsphf9jyE+95Ym0nWHm/5M7GiCJa2psQ5+aKDKfwoj8tfqFVLXUutbWKQlpOFyEMi1p
	VCkum1uRPnQmAw3k0xM+j5sWFBOKRvIlzXy7AJ4ctjYdjScfEHbEKaM3sOhRtZ4pnwjK
	w5lQ==
X-Gm-Message-State: APjAAAVBWyeO8e9IVNRDktE89j1R61PVjJZDDgfxloiiP4qdQfyHrChw
	u64XNwMkUFMB01kZtexdydb+mpSrCb+o1iYIrE0=
X-Google-Smtp-Source: APXvYqxF14PMxBMu6vYq6tcAZcsB6enS0kFdjtriXNtIXNffCUJtW5bdBkVlw5524m3+GJrtEykf5S8WdhLYtQUZuTw=
X-Received: by 2002:a5d:67c2:: with SMTP id n2mr11699892wrw.222.1572633111045; 
	Fri, 01 Nov 2019 11:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1572341125.git.akuster808@gmail.com>
	<ba94d467df1cb0b67842408de3db193612aebdcd.1572341125.git.akuster808@gmail.com>
	<CAHtQpK501hXXF_iwe=SHVQkUvpvj4iPoym45CxD_piWfygEHEg@mail.gmail.com>
	<CAMKF1so_jt85yTaTznmBFreOEfB=E_-E_7T7i_rdVnb4-1ge4Q@mail.gmail.com>
	<CA+chaQdtZNA0+RQFSv0MQg63PNXjnDe2taOFcbJz0ko3kM+Gxw@mail.gmail.com>
In-Reply-To: <CA+chaQdtZNA0+RQFSv0MQg63PNXjnDe2taOFcbJz0ko3kM+Gxw@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Fri, 1 Nov 2019 19:31:40 +0100
Message-ID: <CAHtQpK5LDVJSSRQA+v_FLtr-GuyMFhO_M0JR-gsut88m=0e88Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [warrior 18/19] go: fix CVE-2019-16276
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
X-List-Received-Date: Fri, 01 Nov 2019 18:31:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 1, 2019 at 7:12 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> I've reported the same yesterday:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-October/288638.html
>
> and sent upgrade to match the minor version used in warrior to the one in zeus (which resolves the patch to apply cleanly):
> http://lists.openembedded.org/pipermail/openembedded-core/2019-October/288656.html

I've actually just found your upgrade patches from yesterday, and they
should solve the issue. I guess it was just the fact that upgrade to
1.12.9 didn't make it to warrior yet - I've ended up with the state
where I had 1.12.1 in warrior for recipe, and patch from 1.12.9.

Once your patches would land in warrior repo - this hunk would be
resolved, since the patch is actually made for 1.12.9 and that is why
there are no complaints from master now.

>
> I don't use go for anything, but go 1.11 was also updated in thud:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-October/287724.html
> so I was assuming that this minor upgrade in 1.12 should be safe enough for warrior as well.
>
> Regards,
>
> On Fri, Nov 1, 2019 at 6:40 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Fri, Nov 1, 2019 at 10:33 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>> >
>> > Hello Armin,
>> >
>> > On Tue, Oct 29, 2019 at 10:50 AM Armin Kuster <akuster808@gmail.com> wrote:
>> > >
>> > > From: Chen Qi <Qi.Chen@windriver.com>
>> > >
>> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > > (cherry picked from commit e31f87e289dfd3bbca961e927447a9c7ba816d3f)
>> > > Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> > > (cherry picked from commit e02e8fa2e82cceaaa6a433466f52f97b0984762a)
>> > > Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> > > ---
>> >
>> > This  patch didn't apply clean on warrior, but same patch on master
>> > seems to be OK. I got a hunk in transport_test.go which has been
>> > resolved by build, but since this is security-related patch I wanted
>> > to bring some attention here.
>> >
>>
>> if its failing in testcase as a last report we can drop that if that
>> hunk is not backportable.
>> > >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-core mailing list
>> > > Openembedded-core@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>> > --
>> > Regards,
>> > Andrey.
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Regards,
Andrey.


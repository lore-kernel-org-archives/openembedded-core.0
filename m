Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 642E0605BB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 16:57:38 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id rc4so11893677igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 09:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=gw0GZUZsea3k//f7TpW1v0TXrF6zhVBWxLR4blVh7kE=;
	b=NOymUzEpiLT/xJeOjXf9umQ/1MSn9HZds0amR4oPrni+VvEcjZhJ620b3isrOTb3e/
	40Mvs46pIRj2TSx3UvymPPp2WHJxIeJgpCzVD4qeyYLgiBVwDDLibPsVnaWdusaJkFVE
	DgtG+LU6vBzDjopwvC4RiSQLCn0pN2SQR2uPzQTsro/otSnmqCSyTyZWxZ5+TBro4V2e
	K6CSTaHAHRv+V+8HttCIMHk2mT6mkutEa1+EUz1Mt/SCV8g6m0G/6eBcSe3340l67FG2
	n/E+S1JWbGa/a/uv0974hxpNrnYNgN7YlAYQ2qajlbC1IG0Ub1+wJCeWWdzJSqCnfgXv
	IG0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=gw0GZUZsea3k//f7TpW1v0TXrF6zhVBWxLR4blVh7kE=;
	b=sh1bvCs+JryvQC9hvWSrvse49jFH4P3GnAKM3czNwZbuYtIbCEE9d7H0NRe0wzK561
	CRtMCrt/tyhOXxdd2YZkRgQ++i0NaSqJP6B5OqlrKwVkNcyzvjF/aPJE30/B08cr+mcI
	Ovv3s3BeYF2CNK9ThijZme9bdSWm3LwQygxnVDVetOMsGwOmO6L7KaeIPZgxAJ3BVY3P
	myaHMphHftbF9xgQw8FIgkwElXnpLHSg92qX+WYTKwfU4JtlpYIJ7yvHuTBJZAVbzii/
	E4Cq/Kih5Gn4LNWcJ+DhyNoZWlyLREC317cIQiU8PkoHucN70l4T2v6baEs6ChrDAVEg
	bXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=gw0GZUZsea3k//f7TpW1v0TXrF6zhVBWxLR4blVh7kE=;
	b=kzYVJeCH4dNUhDHFFKnq8iWNzbi5fKfS/YqYEVtT3OGeY3jK86hiTuTDbNxGmsQazE
	futq1nqbSIqT1w6lTDfd3cmbzFIZlST5OoUxNxIFT/KIeAo/VJSi/uGb9PSNJQtx7tmE
	03dUK57zBf6g8xMsfFwN3GkGKjhq/6P6pflRCv5+EY3r1e5ODQ6g2pFinbZhdSErwdji
	aOBjuuFqj+Aru25R5e7W0Ybw9WLTHHxeL9v+5Zjleym0sdi+SOQ/afkb0HHsbs00UGZO
	xfSz7t+0ZLcLRUYEDoq2KNlhgXC/J3ByX2HU2OVrDkhvjU283NaKlu/aoYvNd6/HWZtS
	3IeQ==
X-Gm-Message-State: AOPr4FXhLrHLMNBXJzBkRQHSDA9N+CKsq/7ecPN0BuoBd5G7KWvYuHgNoAz4LtdLQPGqUOd5SAHgbBcRmBNn5g==
X-Received: by 10.50.123.161 with SMTP id mb1mr13131681igb.20.1462813058814;
	Mon, 09 May 2016 09:57:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Mon, 9 May 2016 09:57:19 -0700 (PDT)
In-Reply-To: <CADkTA4MGn2Ju0X-AKeyOJ0ba-kZ6v8XGDr2JcPk5zXWADzyMnA@mail.gmail.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
	<29259d2220b8e6e577a3efaa160b77e3366fb6d5.1462768634.git.paul.eggleton@linux.intel.com>
	<CADkTA4MGn2Ju0X-AKeyOJ0ba-kZ6v8XGDr2JcPk5zXWADzyMnA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 9 May 2016 09:57:19 -0700
X-Google-Sender-Auth: NVlc7l3Y9qqy0Lv-El1cBhi2Tqg
Message-ID: <CABcZANmxKXC9waAVi2i8hs3DGbiNddOvW54t0hLwaEpUt8pWQg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Tom Zanussi <tom.zanussi@intel.com>
Subject: Re: [RFC PATCH 6/6] classes/image: check kernel config supports IMAGE_FSTYPES items
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
X-List-Received-Date: Mon, 09 May 2016 16:57:40 -0000
Content-Type: multipart/alternative; boundary=001a1135e7eabe83e305326bb448

--001a1135e7eabe83e305326bb448
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 5:05 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
>
>> A lot of the IMAGE_FSTYPES items require the appropriate filesystem
>> driver to be enabled in the kernel configuration; e.g. in order to read
>> a btrfs filesystem, the kernel must enable CONFIG_BTRFS_FS. Add a check
>> to ensure that is the case.
>>
>
>
> So what's the overall design for this ? Is it documented anywhere ? This
> is something
> that we talked about a couple of years and I have reservations and
> objections to
> the current implementation.
>
> .. but since I can only see bits and chunks of patches, I'd rather read
> something
> complete and offer some more detailed feedback.
>
> Bottom line: I see a slippery slope to tightly specified option that
> depend on kernel
> versions, I see kernel options sprayed all over layers, etc, etc. Which is
> exactly
> what we've been trying to avoid with the centralized kernel meta-data, and
> again,
> there's a mechanism that I finished early this year to extend those
> options to any
> kernel, enforce, warn, error, etc .. but now, I'll just toss it into the
> bin.
>

Perhaps this functionality should be by feature or capability rather than
individual options, and let the kernel build determine what features it
provides based on its configuration.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1135e7eabe83e305326bb448
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, May 9, 2016 at 5:05 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <span dir=3D"ltr">&lt;=
<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.egg=
leton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">A lot of the IMAGE_FSTYPES items require the appropriate filesystem<br>
driver to be enabled in the kernel configuration; e.g. in order to read<br>
a btrfs filesystem, the kernel must enable CONFIG_BTRFS_FS. Add a check<br>
to ensure that is the case.<br></blockquote><div><br></div><div><br></div><=
/span><div>So what&#39;s the overall design for this ? Is it documented any=
where ? This is something</div><div>that we talked about a couple of years =
and I have reservations and objections to=C2=A0</div><div>the current imple=
mentation.</div><div><br></div><div>.. but since I can only see bits and ch=
unks of patches, I&#39;d rather read something</div><div>complete and offer=
 some more detailed feedback.</div><div><br></div><div>Bottom line: I see a=
 slippery slope to tightly specified option that depend on kernel</div><div=
>versions, I see kernel options sprayed all over layers, etc, etc. Which is=
 exactly</div><div>what we&#39;ve been trying to avoid with the centralized=
 kernel meta-data, and again,</div><div>there&#39;s a mechanism that I fini=
shed early this year to extend those options to any</div><div>kernel, enfor=
ce, warn, error, etc .. but now, I&#39;ll just toss it into the bin.</div><=
/blockquote></div><br>Perhaps this functionality should be by feature or ca=
pability rather than individual options, and let the kernel build determine=
 what features it provides based on its configuration.<br>-- <br><div class=
=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior S=
oftware Engineer, Mentor Graphics</div>
</div></div>

--001a1135e7eabe83e305326bb448--

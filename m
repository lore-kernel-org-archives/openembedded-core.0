Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
	[209.85.221.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7198860CAC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 15:49:12 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id w4so674198vkd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 07:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=joC7zXYw5GnEqY4ZjTnX4r2wAK6Ioo0MFRVdKIVVM+0=;
	b=lB8uZyeI5OpuQZgRRPfEqIvb4f8Dc3CJILEIzPn4E8ImpT6bKKZY1Mz+keHYERcPD6
	kJIf7p9ZKX2yd+ffp1OxaDF6DUKeRrjwYGp+o3a+3pK+Mps0exbIzwoN3PL7MRLA3e1i
	FBlteSDIleL9LA7u9tgQIPX3lurNZDo65mbTm15tfwrDiSs+wJXSA0F66wWuAfyG4+pd
	JwGcUh4hjqhJUWUVlX5ybiifrTGonj7l6friR0zDi1gak4R6+K6u52qdmyPmzbfsiUpT
	31RSUuuf+PcOlBeyUpuW8V7oks/Af0x6S/UKiinPleTDr5r08IKRYsYDKGbYtMtRsy09
	Cc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=joC7zXYw5GnEqY4ZjTnX4r2wAK6Ioo0MFRVdKIVVM+0=;
	b=mZctnzoBCDtzfjpP2VcG+Kb27kICnqxhKGRGYhXfMvb9mwH8Jdgvon/YpJm3q/NADl
	LIscj0E8MfLKH9GU2rUTIK/IS5Dn8uDbJ4xrli/VTY8HbMZEBHAIHax48Fq/2A0v4LoK
	f7hhGa7qVA/Ja64siCLn/yFbchEPNx7Kt7Bw+i1vvGd3MZDCLq/Beo8fvRaWnOrNqKtT
	dz54V0UqbEHMrUsOA3mZK+XCY4xNGTCadKRNNQhp/lZ87neNIVtdQ0UJuAsFPxW7PB2r
	odeF4wgy0fB61hfAUyXcZrWqDhKDIMT9zuuAsHTXGSSiaOD82ltgJM29oL9gZe0Yw6zr
	yM7w==
X-Gm-Message-State: APjAAAXCLmbm9EFEsylci4B1y0SD8oc6dGOvGe+SQHiGWHbtUANRmvgm
	2QH08vITbKrm1hLvMpTAL33b8u4OzhmOzgaOlGs=
X-Google-Smtp-Source: APXvYqybDtl31HLyMWBiflI1CFj71PNBODoFUNnJddFZFHIDK71vVkELFzUO8FzrkveDdUr1X2ZHP/mrYBgQNJJlaVM=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr2032583vkc.29.1580917753297; 
	Wed, 05 Feb 2020 07:49:13 -0800 (PST)
MIME-Version: 1.0
References: <b678f3b8b7dc947dec08b47886eb49e5bd61f097.camel@linuxfoundation.org>
In-Reply-To: <b678f3b8b7dc947dec08b47886eb49e5bd61f097.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Feb 2020 16:49:49 +0100
Message-ID: <CANNYZj8gq3eTMJ+9g5URjhA5j7HQboz2zXsTavW0e9tnnxsNgA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Reproducible Builds Issue Status
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
X-List-Received-Date: Wed, 05 Feb 2020 15:49:12 -0000
Content-Type: multipart/alternative; boundary="0000000000001abdfc059dd61926"

--0000000000001abdfc059dd61926
Content-Type: text/plain; charset="UTF-8"

Good to hear, I am still settling at the new workplace (there's no build
machine yet that I can use, but it's apparently on the way). I'll try to
use the auto builders to look into these issues from home, but can't
promise quick patches.

I think a green a-full looks within reach now!

Alex

On Wed, 5 Feb 2020 at 15:27, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Good news is we're down to a set of specific issues and those issues
> seem "stable". The ones we haven't fixed yet with master-next are:
>
> /srv/autobuilder/
> autobuilder.yoctoproject.org/pub/repro-fail/oe-reproducible-20200205-rtw2qpgl
> :
> (
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200205-rtw2qpgl/
> )
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-dbg_3.24.13-r0_amd64.deb
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-src_3.24.13-r0_amd64.deb
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/libgtk-3.0_3.24.13-r0_amd64.deb
> (needs a bug)
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/libidn2-dev_2.3.0-r0_amd64.deb
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13771)
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/ncurses-doc_6.1+20191019-r0_amd64.deb
> (needs a bug)
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/openssl-ptest_1.1.1d-r0_amd64.deb
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13770)
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-dbg_5.30.1-r0_amd64.deb
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13773)
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-dev_5.30.1-r0_amd64.deb
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13772)
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-config-heavy_5.30.1-r0_amd64.deb
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13774)
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-data-dumper_5.30.1-r0_amd64.deb
> (unfiled, may be related to above 13772)
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-ptest_5.30.1-r0_amd64.deb
> (unfiled, may be related to above 13772)
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl_5.30.1-r0_amd64.deb
> (unfiled, may be related to above 13772)
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/tar-dbg_1.32-r0_amd64.deb
>
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/tar_1.32-r0_amd64.deb
> (needs a bug)
>
> Also:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13776
> (didn't show on this set of builds)
>
> Cheers,
>
> Richard
>
>

--0000000000001abdfc059dd61926
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good to hear, I am still settling at the new workplace (th=
ere&#39;s no build machine yet that I can use, but it&#39;s apparently on t=
he way). I&#39;ll try to use the auto builders to look into these issues fr=
om home, but can&#39;t promise quick patches.<div><br></div><div>I think a =
green a-full looks within reach now!</div><div><br></div><div>Alex</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, 5 Feb 2020 at 15:27, Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,20=
4,204);padding-left:1ex">Good news is we&#39;re down to a set of specific i=
ssues and those issues<br>
seem &quot;stable&quot;. The ones we haven&#39;t fixed yet with master-next=
 are:<br>
<br>
/srv/autobuilder/<a href=3D"http://autobuilder.yoctoproject.org/pub/repro-f=
ail/oe-reproducible-20200205-rtw2qpgl" rel=3D"noreferrer" target=3D"_blank"=
>autobuilder.yoctoproject.org/pub/repro-fail/oe-reproducible-20200205-rtw2q=
pgl</a>:<br>
(<a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-202=
00205-rtw2qpgl/" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.y=
octo.io/pub/repro-fail/oe-reproducible-20200205-rtw2qpgl/</a>)<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/gtk+3-dbg_3.24.13-r0_amd64.deb<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/gtk+3-src_3.24.13-r0_amd64.deb<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/libgtk-3.0_3.24.13-r0_amd64.deb<br>
(needs a bug)<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/libidn2-dev_2.3.0-r0_amd64.deb<br>
(<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13771" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13771</a>)<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/ncurses-doc_6.1+20191019-r0_amd64.deb<br>
(needs a bug)<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/openssl-ptest_1.1.1d-r0_amd64.deb<br>
(<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13770" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13770</a>)<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/perl-dbg_5.30.1-r0_amd64.deb<br>
(<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13773" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13773</a>)<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/perl-dev_5.30.1-r0_amd64.deb<br>
(<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13772" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13772</a>)<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/perl-module-config-heavy_5.30.1-r0_amd64.=
deb<br>
(<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13774" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13774</a>)<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/perl-module-data-dumper_5.30.1-r0_amd64.d=
eb<br>
(unfiled, may be related to above 13772)<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/perl-ptest_5.30.1-r0_amd64.deb<br>
(unfiled, may be related to above 13772)<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/perl_5.30.1-r0_amd64.deb<br>
(unfiled, may be related to above 13772)<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/tar-dbg_1.32-r0_amd64.deb<br>
/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reprod=
ucibleB/tmp/deploy/deb/./core2-64/tar_1.32-r0_amd64.deb<br>
(needs a bug)<br>
<br>
Also:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13776" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13776</a><br>
(didn&#39;t show on this set of builds)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000001abdfc059dd61926--

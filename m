Return-Path: <loic.poulain@linaro.org>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id 486747EC92
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 16:26:48 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id u6so2729991edq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UI0nE8QX2rWtScTwG6J9AxDON3Xy4eHo8yCw/25Wk+A=;
	b=BnJEdn1gOVRx7DbFRZ1Q0MdAN3F9ABiJJQNVmOPpWqO77G7o+9WqFDIpPdSjER6Odq
	CoQiKBlK8NqA9vQcnl3w699JoF8ZP8ni2IvF54SOFVziJ1/2VK8tfMXO1gJM2nDHJCWU
	NOXFVQLR1Nr2ED1La7koV6VL1yseo0hbklYpnIapjXO3E7Q92ZqXuZ7NtbD6zKjkrpAr
	vUUjrJ3UtavM5z3bBdLDz+aD3VBICSV0/t6S7+fekyHUZZUKLSS2fORx2Agwxcc/UlEZ
	BPZF+gssxcDWNSquFjjzUTCZmR1z1T4RrlKtI696+A6E3H9GLg01iO8SiSviSJ5A9v6d
	j+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UI0nE8QX2rWtScTwG6J9AxDON3Xy4eHo8yCw/25Wk+A=;
	b=uQiDO6DMPVV2NBVKhIS0aFrXlPdyLdMYNVAM6W3zXvxJiEliYzrC1FJAMRd1AhwJgl
	5u92h3ADUIsqkQ8ZD6DoEMwVmB/pTzdi5u4pVlYGZM90BUPeu3QP9xZAY5R98ZSiIotU
	D4fvWjQTLI06FgkLsR7OwZB4WBsEoVWYUFVaj9g6a62RjydyKvUD/WXEGdk8Jh9mn+h9
	Gm7Lf3bTs6nTm2HljiqvF56rrYLcRf7uokCXS5GvakMTUpiPUGYROtk8rGJsHUqbhnw5
	DfZGftGS7znZ1LiHGGAaDLERlxoauv+mDCgMOLr2Nhi4+O50jDekjJ4Fe/GPtZmpX9Ju
	nBtA==
X-Gm-Message-State: APjAAAVaJ/4NwasK/ZxKGYcuHwWo6JF29SDw/mNqwLSXCOBK/JAv4vqB
	lzVf6opjgiHvsKENx0MnfGAl493w/EuPOHrS6BfEgA==
X-Google-Smtp-Source: APXvYqwvLYxIpHt2n1wucJTQG3pf/g4tO/8yPBQx2mPoGiQo2rVcauwdH+l4xPNqLN1J3IaZleX36gyrzPIaFmcEN60=
X-Received: by 2002:a17:906:1493:: with SMTP id
	x19mr7872714ejc.39.1567182408894; 
	Fri, 30 Aug 2019 09:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAMZdPi_2=mFZFgwzUVis4BE7P3C4boOZmVB6_eYeLCaT0wLJaA@mail.gmail.com>
	<CAJ86T=XwwjSZR6oNdXCr=bvbOKw5trKWJ=na4=_+83vXXJo6Bw@mail.gmail.com>
In-Reply-To: <CAJ86T=XwwjSZR6oNdXCr=bvbOKw5trKWJ=na4=_+83vXXJo6Bw@mail.gmail.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Fri, 30 Aug 2019 18:27:27 +0200
Message-ID: <CAMZdPi_bvV1Lcg_V3U1HpA_tH1AzWtpa0YMRg4MsNEgsOzApiQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Automatic prebuilt management
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
X-List-Received-Date: Fri, 30 Aug 2019 16:26:48 -0000
Content-Type: multipart/alternative; boundary="000000000000c7df670591581673"

--000000000000c7df670591581673
Content-Type: text/plain; charset="UTF-8"

HI Andre,

On Fri, 23 Aug 2019 at 20:11, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Aug 5, 2019 at 9:06 AM Loic Poulain <loic.poulain@linaro.org>
> wrote:
> > Say a company works with an OE internal tree, with open-source and
> closed-source packages. The company wants to release the tree so that its
> customers can fully customize the images/distro. The closed sources being
> only available internally, the company has to generate and handle prebuilt
> binaries for proprietary packages. Ideally, with a unified public/internal
> OE tree (same recipes for internal/public build).
> >
> > This question is actually similar to an older thread:
> > https://marc.info/?l=openembedded-core&m=146779329804683
>
> That very old thread was also referenced recently in a follow up where
> I shared a later solution, see:
>
>
> http://lists.openembedded.org/pipermail/openembedded-core/2019-July/284896.html


Thanks, I missed that one.


>
> > I started to work on this and added a 'generate-prebuilt' class which
> generates a tarball of ${D} in deploy/prebuilts after do_install task.
> Symmetrically, It's also possible to create an 'install-prebuilt' class
> which bypasses do_fetch, do_unpack, ..., do_install with noexec flag and
> instead uncompresses a previously generated prebuilt tarball into ${D} and
> continue normally. But I would like something smarter, e.g. first trying to
> check if the SRC_URI is available, if not switching on using the prebuilt
> package if available (e.g. in a DIR_PREBUILT)...
> >
> > Before going further is there already an existing solution for that? do
> you have any recommendation on the easier/best way to achieve this?
>
> I did initially try the approach of having a single recipe which can
> automatically support both building from source and extracting a
> prebuilts tar file, but that (for me anyway) turned out to be a dead
> end. Building from source requires build dependencies and config
> options but extracting a prebuilt tar file does not, so the two end up
> sharing very little... so 90% of the recipe ends up being conditional
> on which mode it's running in. The solution I ended up with (see link
> above) was for the class which creates the prebuilt tar file to also
> create a dedicated mini recipe to extract it.
>

> From my experience however an equally hard part of the problem is the
> distribution of prebuilts. It starts off easy (you share a tar file
> via email or an ftp site and the receiver manually copies to their
> downloads directory...) but that doesn't scale if you need to make
> regular updates.


Very good point. maybe having binaries also in a repo could help a bit
(e.g. using git LFS).


> My solution is discussed a little more in the thread
> linked to above.
>

Your solution is interesting and I'll probably jump on the thread with more
questions.
Having an upstream solution part of oe-core would be nice though.

Regards,
Loic

That's a very good point

--000000000000c7df670591581673
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>HI Andre,<br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, 23 Aug 2019 at 20:11, Andre McCu=
rdy &lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, Aug 5, 2019 at 9:06 AM Loic Poulain &lt;<a href=3D"mailt=
o:loic.poulain@linaro.org" target=3D"_blank">loic.poulain@linaro.org</a>&gt=
; wrote:<br>&gt; Say a company works with an OE internal tree, with open-so=
urce and closed-source packages. The company wants to release the tree so t=
hat its customers can fully customize the images/distro. The closed sources=
 being only available internally, the company has to generate and handle pr=
ebuilt binaries for proprietary packages. Ideally, with a unified public/in=
ternal OE tree (same recipes for internal/public build).<br>&gt;<br>&gt; Th=
is question is actually similar to an older thread:<br>&gt; <a href=3D"http=
s://marc.info/?l=3Dopenembedded-core&amp;m=3D146779329804683" rel=3D"norefe=
rrer" target=3D"_blank">https://marc.info/?l=3Dopenembedded-core&amp;m=3D14=
6779329804683</a><br>
<br>That very old thread was also referenced recently in a follow up where<=
br>I shared a later solution, see:<br>
<br>=C2=A0 <a href=3D"http://lists.openembedded.org/pipermail/openembedded-=
core/2019-July/284896.html" rel=3D"noreferrer" target=3D"_blank">http://lis=
ts.openembedded.org/pipermail/openembedded-core/2019-July/284896.html</a></=
blockquote><div><br></div><div>Thanks, I missed that one.</div><div> <br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>&gt; I started to work on this and added a &#39;generate-prebuilt&#39; =
class which generates a tarball of ${D} in deploy/prebuilts after do_instal=
l task. Symmetrically, It&#39;s also possible to create an &#39;install-pre=
built&#39; class which bypasses do_fetch, do_unpack, ..., do_install with n=
oexec flag and instead uncompresses a previously generated prebuilt tarball=
 into ${D} and continue normally. But I would like something smarter, e.g. =
first trying to check if the SRC_URI is available, if not switching on usin=
g the prebuilt package if available (e.g. in a DIR_PREBUILT)...<br>&gt;<br>=
&gt; Before going further is there already an existing solution for that? d=
o you have any recommendation on the easier/best way to achieve this?<br>
<br>I did initially try the approach of having a single recipe which can<br=
>automatically support both building from source and extracting a<br>prebui=
lts tar file, but that (for me anyway) turned out to be a dead<br>end. Buil=
ding from source requires build dependencies and config<br>options but extr=
acting a prebuilt tar file does not, so the two end up<br>sharing very litt=
le... so 90% of the recipe ends up being conditional<br>on which mode it&#3=
9;s running in. The solution I ended up with (see link<br>above) was for th=
e class which creates the prebuilt tar file to also<br>create a dedicated m=
ini recipe to extract it. <br></blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>From my experience however an equally hard part of the problem is the<b=
r>distribution of prebuilts. It starts off easy (you share a tar file<br>vi=
a email or an ftp site and the receiver manually copies to their<br>downloa=
ds directory...) but that doesn&#39;t scale if you need to make<br>regular =
updates.</blockquote><div><br></div><div>Very good point. maybe having bina=
ries also in a repo could help a bit (e.g. using git LFS).</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">My solution is disc=
ussed a little more in the thread<br>linked to above.<br></blockquote><div>=
<br></div><div>Your solution is interesting and I&#39;ll probably jump on t=
he thread with more questions.</div><div>Having an upstream solution part o=
f oe-core would be nice though.<br></div><br><div>Regards,</div><div>Loic<b=
r></div><div><br></div><div>That&#39;s a very good point <br></div></div></=
div>

--000000000000c7df670591581673--

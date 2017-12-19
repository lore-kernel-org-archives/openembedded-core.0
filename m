Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id E59DE6E666
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 12:31:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513686711; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=TDPtfR5x+9sF83s9eTODtNjEYKYg2QHDn/OKlXdad9s=;
	b=q+iZ005QS5i0B0LSUOb32yZtqxZPyKnASrStRehbhTbrXH5/4RgxA3w4G6wXFD5OZqhuW8Dn
	siCw+9xqeaBAltQpywFMkPatFn7G877y9i+TGeLw8BdxhkbTWYaNIMZDlmKCrKzElM2Ig9YD
	sB4+Z9/yR5BFJusndE1a82ikFBI=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Sender: derek@asterius.io
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mxa.mailgun.org with ESMTP id 5a3906b7.7f312014c1f0-smtp-out-n03;
	Tue, 19 Dec 2017 12:31:51 -0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id x7so4848002qkb.0;
	Tue, 19 Dec 2017 04:31:51 -0800 (PST)
X-Gm-Message-State: AKGB3mIJSYFPzf0AFE4HQ3avTUD7KyBn3B7yY2G8RgrG16lZ4do8Ubmx
	FOL3ySObcSkz5QpljML/1DMrJTJekPX34upou74=
X-Google-Smtp-Source: ACJfBott8mh25ZKzo0RhRwr/zb2NGB+J5TugtvlmPv3m9Oburtg+D/szyGw4TIt94zXCYROqiWuJ6jw5TtLdgxX+Or4=
X-Received: by 10.55.191.1 with SMTP id p1mr4526262qkf.152.1513686710560; Tue,
	19 Dec 2017 04:31:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Tue, 19 Dec 2017 04:31:49 -0800 (PST)
Received: by 10.140.21.177 with HTTP; Tue, 19 Dec 2017 04:31:49 -0800 (PST)
In-Reply-To: <2bc1c40c-3f63-7311-b8a3-81bd05ea474f@linux.intel.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
	<CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
	<CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
	<20171218210256.GQ27580@vctlabs.com>
	<2bc1c40c-3f63-7311-b8a3-81bd05ea474f@linux.intel.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 19 Dec 2017 07:31:49 -0500
X-Gmail-Original-Message-ID: <CADNbA1oCH=x1SoZn-pb50bZabf+rurd1w_o7D9P9FM4u=FXXsQ@mail.gmail.com>
Message-ID: <CADNbA1oCH=x1SoZn-pb50bZabf+rurd1w_o7D9P9FM4u=FXXsQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: splitting python's standard library
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
X-List-Received-Date: Tue, 19 Dec 2017 12:31:51 -0000
Content-Type: multipart/alternative; boundary="94eb2c0437b0af2d9d0560b0a613"

--94eb2c0437b0af2d9d0560b0a613
Content-Type: text/plain; charset="UTF-8"

Well, I've been able to do it just fine for the majority of packages in
meta-python by myself.  Since I contribute the majority of the patches and
maintain the layer, I want this capability maintained in meta-python.  If
you plan on removing that functionality in oe-core, I'd like to have the
opportunity to maintain the python recipes there as well rather than have a
feature unilaterally removed.  I don't consider it a burden and my
customers find it valuable to split things out.

On Dec 19, 2017 2:55 AM, "Alexander Kanavin" <
alexander.kanavin@linux.intel.com> wrote:

On 12/18/2017 11:02 PM, S. Lockwood-Childs wrote:

> On Mon, Dec 18, 2017 at 03:17:25PM -0500, Derek Straka wrote:
>
>> I have several customers who have optimized for space and would like to
>> see
>> the capability maintained unless core removes the ability to split python
>> packages out.  They also remove the *.py files in favor of *.pyo files
>> (via
>> a custom packaging mechanism).  I have automated tests that go through the
>> module importing on each of the meta-python packages to ensure it works on
>> minimal python installations.  When other contributors don't do provide
>> that functionality, I either catch it when I do package update or when it
>> breaks for one of my customers.  I'm fine if you don't want to perform the
>> checks yourself and it breaks my use case with missing dependencies, but I
>> would prefer that you don't remove the dependencies that are currently in
>> place.  Thanks.
>>
>
> Me too -- some of my projects still use NAND for rootfs, where space is
> tight and
> ability to split out python modules is very useful. Thus it is not an
> unused
> feature, though many projects have SD/eMMC for rootfs and those ones
> generally
> will not care about it.
>

This configuration can be supported by making a custom python3-modules
package that whitelists precisely the needed files. But it shouldn't be
imposed on everyone else - it's a significant burden to maintain the
dependencies in every single python package, and keep the splitting working
correctly in core python as well.

So I'd like to drop that - do keep in mind that very few people maintain
oe-core (as opposed to sending occasional drive-by patches to fix specific
issues raised in product development), and the headcount keeps getting
smaller.

Alex

--94eb2c0437b0af2d9d0560b0a613
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Well, I&#39;ve been able to do it just fine for the =
majority of packages in meta-python by myself.=C2=A0 Since I contribute the=
 majority of the patches and maintain the layer, I want this capability mai=
ntained in meta-python.=C2=A0 If you plan on removing that functionality in=
 oe-core, I&#39;d like to have the opportunity to maintain the python recip=
es there as well rather than have a feature unilaterally removed.=C2=A0 I d=
on&#39;t consider it a burden and my customers find it valuable to split th=
ings out.=C2=A0=C2=A0<br><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Dec 19, 2017 2:55 AM, &quot;Alexander Kanavin&quot; &lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin@linux.intel=
.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 12/=
18/2017 11:02 PM, S. Lockwood-Childs wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Mon, Dec 18, 2017 at 03:17:25PM -0500, Derek Straka wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I have several customers who have optimized for space and would like to see=
<br>
the capability maintained unless core removes the ability to split python<b=
r>
packages out.=C2=A0 They also remove the *.py files in favor of *.pyo files=
 (via<br>
a custom packaging mechanism).=C2=A0 I have automated tests that go through=
 the<br>
module importing on each of the meta-python packages to ensure it works on<=
br>
minimal python installations.=C2=A0 When other contributors don&#39;t do pr=
ovide<br>
that functionality, I either catch it when I do package update or when it<b=
r>
breaks for one of my customers.=C2=A0 I&#39;m fine if you don&#39;t want to=
 perform the<br>
checks yourself and it breaks my use case with missing dependencies, but I<=
br>
would prefer that you don&#39;t remove the dependencies that are currently =
in<br>
place.=C2=A0 Thanks.<br>
</blockquote>
<br>
Me too -- some of my projects still use NAND for rootfs, where space is tig=
ht and<br>
ability to split out python modules is very useful. Thus it is not an unuse=
d<br>
feature, though many projects have SD/eMMC for rootfs and those ones genera=
lly<br>
will not care about it.<br>
</blockquote>
<br>
This configuration can be supported by making a custom python3-modules pack=
age that whitelists precisely the needed files. But it shouldn&#39;t be imp=
osed on everyone else - it&#39;s a significant burden to maintain the depen=
dencies in every single python package, and keep the splitting working corr=
ectly in core python as well.<br>
<br>
So I&#39;d like to drop that - do keep in mind that very few people maintai=
n oe-core (as opposed to sending occasional drive-by patches to fix specifi=
c issues raised in product development), and the headcount keeps getting sm=
aller.<br>
<br>
Alex<br>
</blockquote></div><br></div></div></div>

--94eb2c0437b0af2d9d0560b0a613--

Return-Path: <liu.ming50@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id D555F78289
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 12:50:24 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id c19so3590611qtm.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 04:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Gp9UCL4nr5oc3RawdzJnUuN1qggUWSwNNOwqStr8gQs=;
	b=rN5g5/WX+/NPCU/d8qTq/5zZdSXCGPwhlwT9KmLJt2hjP3bA3N9ylHsdg/te57KrX5
	QypRsA4LnS6XzyAmueSsTC0E9AUi63qmm0V7GwzMSG9Ev29bLlZNM8qHNFSQ4WJF+g+9
	z/4CMqSj7K129TJfAKABlZcYM2Jqa8Dh6vj3yXljo59sFpFI4pOsHJCqrJtXS0lvzxpm
	lmrM5w66VCPK4+viDWhu8s786vrXjt6ZNGeV+csDBlQ4X75LcFoBlh3A5eYrNjMLygaO
	mCeWxOZuykDxBLwsBgtq7Aot73YGJ4iuE6kEpDrurIe0V1v12PkTnqBVhYa50UCaABHW
	UIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Gp9UCL4nr5oc3RawdzJnUuN1qggUWSwNNOwqStr8gQs=;
	b=bhkoM9bTN+4HxcAp4OeMD3gIpK1P9ey0v0skJ3dfaoDqIM1oXkAQWor1hL1TxzogQZ
	YXB8mHbL+mr3PYAm05YQI8oUgxlb8gbZmzUWipLCMuT/hAW/JUNBSoW/00L7FWcCW+1F
	8BLSZFk4hxPRfkn94CsCw8vBXd+64OLvDrhwZA/RFDE78W9FhaBQ3g46Z9C+A8WOkOCi
	LicyFF/4h4rt4uvpm8Uo8bqfq5D9B2qvfkCDnQ4OKVeZKaEDZGQwWlvzb+T9JNnIFfHh
	E++/xdY1n4kcQf8NnpKHsnYnvThStCzCJq0NAafTqBH0b/wDZlGgUh29yDPtPo/KV4a0
	2j7A==
X-Gm-Message-State: APf1xPDufrk8dpVY4IvPFw9YwtIDSPmiBQgIOp66S1P8IurIV+s1Sv1w
	DHR/CcRyprMHjt3YOVlJ2w4cAiCmgV0t/ENUX08=
X-Google-Smtp-Source: AH8x2265vshnCDrOuzjEIJRmhmZGWybsvQxLzvlVxzMxVHXoyxUjNjuAYNqFNwWSW9V0qeBkbrMUFw+eTzNLj4zVQiA=
X-Received: by 10.237.43.167 with SMTP id e36mr8137990qtd.160.1518785425783;
	Fri, 16 Feb 2018 04:50:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.62.153 with HTTP; Fri, 16 Feb 2018 04:50:25 -0800 (PST)
In-Reply-To: <1518707240.24236.157.camel@linuxfoundation.org>
References: <1518698953-23437-1-git-send-email-liu.ming50@gmail.com>
	<1518701655.24236.146.camel@linuxfoundation.org>
	<CALatG=7Fxnseh+qrNYuO0q85_H7y3eZkv9FaKsMMQ-_819FZvA@mail.gmail.com>
	<1518707240.24236.157.camel@linuxfoundation.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Fri, 16 Feb 2018 13:50:25 +0100
Message-ID: <CALatG=5rH5J62wosFfH8vQ3B4OXB8RMq_ZmrRxNQuie-QdgL6g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.bbclass: set do_bootimg recrdeptask on do_populate_lic
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
X-List-Received-Date: Fri, 16 Feb 2018 12:50:25 -0000
Content-Type: multipart/alternative; boundary="94eb2c068094cb47a6056553c9e2"

--94eb2c068094cb47a6056553c9e2
Content-Type: text/plain; charset="UTF-8"

Hi, Richard:

I think the license deploy manifests should be at do_image_complete, since
it not only deal with package licenses, but also licenses of deployed
tools, like u-boot, and so on. So do you think if we set:

do_image_complete[recrdeptask] += "do_populate_lic"

would help fix the problem?

//Ming Liu


2018-02-15 16:07 GMT+01:00 Richard Purdie <
richard.purdie@linuxfoundation.org>:

> On Thu, 2018-02-15 at 15:11 +0100, Ming Liu wrote:
> > I observed this issue on rocko branch, but I think upstream also
> > needs it. Since even recrdepends handling had been changed in
> > bitbake, the problem here is the "recrdepends" is missing between
> > do_bootimg and do_populate_lic, actually there was a bug record for
> > it, see: https://bugzilla.yoctoproject.org/show_bug.cgi?id=9446, but
> > the fix only considered the missing recrdepends of do_image, but
> > looking into get_deployed_dependencies->get_boot_dependencies, the
> > do_bootimg also needs a similar fix.
>
> I've looked at this and this patch is not appropriate to be merged, its
> a hack, piled on top of other hacks which still don't actually solve
> the real problem.
>
> do_bootimg is added before do_image_complete, after do_image, along
> with a number of other image processing tasks. Either:
>
> a) license.bbclass requires the do_image dependencies for license
> processing.
>
> b) license.bbclass requires the do_image_complete dependencies and
> includes the tools used to produce the image.
>
> There is no "in between" state. Creating some kind of mismash of
> including some image tasks in the dependency list is simply not
> appropriate, its defined as one or the other.
>
> There is already "get_boot_dependencies" in license.bbclass which sets
> of alarm bells. Your problem is clearly that you're not getting the
> dependencies recursively.
>
> Also, the license deploy manifest creation step is based on do_image
> time, *not* do_image_complete. Its thereby defined as the manifest of
> the things *in* the image, not the tools used to build the image.
> Perhaps it should be at do_image_complete? If it were we might be able
> to drop some of these other hacks too...
>
> Cheers,
>
> Richard
>
>
>
>
>

--94eb2c068094cb47a6056553c9e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Richard:<div><br></div><div><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">I think the lice=
nse deploy manifests should be at=C2=A0</span><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:14px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">do_i=
mage_complete, since it not only deal with package licenses, but also licen=
ses of deployed tools, like u-boot, and so on. So do you think if we set:=
=C2=A0</span></div><div><span style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:14px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline"><br></span></div><div><spa=
n style=3D"text-align:start;text-indent:0px;background-color:rgb(255,255,25=
5);text-decoration-style:initial;text-decoration-color:initial;float:none;d=
isplay:inline"><span style=3D"font-size:14px">do_image_complete[recrdeptask=
] +=3D &quot;do_populate_lic&quot;</span><br></span></div><div><span style=
=3D"text-align:start;text-indent:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline"><span style=3D"font-size:14px"><br></span></span></div><div><span s=
tyle=3D"text-align:start;text-indent:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline"><span style=3D"font-size:14px">would help fix the problem?</spa=
n></span></div><div><br></div><div><span style=3D"font-size:14px">//Ming Li=
u</span></div><div><span style=3D"text-align:start;text-indent:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline"><span style=3D"font-size:14px"><br></=
span></span></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">2018-02-15 16:07 GMT+01:00 Richard Purdie <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard=
.purdie@linuxfoundation.org</a>&gt;</span>:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On Thu, 2018-02-15 at 15:11 +0100, Ming Liu wrote:<br>
&gt; I observed this issue on=C2=A0rocko branch, but I think upstream also<=
br>
&gt; needs it. Since even=C2=A0recrdepends handling had been changed in<br>
&gt; bitbake, the problem here is the &quot;recrdepends&quot; is missing be=
tween<br>
&gt; do_bootimg and=C2=A0do_populate_lic, actually there was a bug record f=
or<br>
&gt; it, see:=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D9446" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.<wbr>yoc=
toproject.org/show_bug.cgi?<wbr>id=3D9446</a>, but<br>
&gt; the fix only considered the missing=C2=A0recrdepends of do_image, but<=
br>
&gt; looking into=C2=A0get_deployed_<wbr>dependencies-&gt;get_boot_<wbr>dep=
endencies, the<br>
&gt; do_bootimg also needs a similar fix.<br>
<br>
</span>I&#39;ve looked at this and this patch is not appropriate to be merg=
ed, its<br>
a hack, piled on top of other hacks which still don&#39;t actually solve<br=
>
the real problem.<br>
<br>
do_bootimg is added before do_image_complete, after do_image, along<br>
with a number of other image processing tasks. Either:<br>
<br>
a) license.bbclass requires the do_image dependencies for license<br>
processing.<br>
<br>
b) license.bbclass requires the do_image_complete dependencies and<br>
includes the tools used to produce the image.<br>
<br>
There is no &quot;in between&quot; state. Creating some kind of mismash of<=
br>
including some image tasks in the dependency list is simply not<br>
appropriate, its defined as one or the other.<br>
<br>
There is already &quot;get_boot_dependencies&quot; in license.bbclass which=
 sets<br>
of alarm bells. Your problem is clearly that you&#39;re not getting the<br>
dependencies recursively.<br>
<br>
Also, the license deploy manifest creation step is based on do_image<br>
time, *not* do_image_complete. Its thereby defined as the manifest of<br>
the things *in* the image, not the tools used to build the image.<br>
Perhaps it should be at do_image_complete? If it were we might be able<br>
to drop some of these other hacks too...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div><br></div>

--94eb2c068094cb47a6056553c9e2--

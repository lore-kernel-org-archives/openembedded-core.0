Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 122DD6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 02:31:18 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id bg3so272919obb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 19:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=rUKFHMSCps9+qAxZVGDJqFf/S2eMcXIkpYZ9mRx3ZJI=;
	b=CMp+LfxKc3nkHT+toZh5RHIm2SrBrVxWrpKCjbO5K/0G00lZD6D5+8/i788tDxl2Yn
	BwDT6+8oljXVmII9KqfqEfSy1aB/S43fKL47XdECjE7cNbkZGh/S+bUH5i0Mfr+YA1T2
	JcNXdBCV3lth90enSoX/r+G6tqGHDHXIfEobR1rWkgcpHLiPzUg/1SlLgMBEhh3/KBrr
	Efr2jq1nqp7CCM5OIRr+utZbjJ/ztg8eTlIJIB17GwSJAsT0w+Px0cO88al4bPHn0n/4
	166IYgGB3gXPYU66ACSnkqcBfUEHYK/95rPF6m0kWod+y63BiU7PT3THwiyFSMMKLtUP
	coTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=rUKFHMSCps9+qAxZVGDJqFf/S2eMcXIkpYZ9mRx3ZJI=;
	b=mp00G4RH6xO9qpLZDFhUivwwud0m8UHP9AHepO/CqQH+1+ME14yrhBstRKtuHLo4W2
	Ty/oyuFXeFIqHSBI9iyjoTSiR0OQL+WJjpJd85dih3SYbtf8an8YKAeXvX4jH3JKtEAN
	ynBuin6mcRsNbhC/K0vPD/fsH/HD7mSGXu87savQNPyYcuwkxO39LkN41vxsOG5r5rER
	kzBJhfj4jdODqlMdkfvKYhhy4Z+q2wtXLHr3WzoDhn+Zti1cinAoPHfA+vlxUHQRE+nB
	wsdJGXsR8fC2XhTRpoJfCEBsag0N45/UMvCG81gktz7h5HSy8byBhhOpzOFbhEGdw1kj
	Cprg==
X-Gm-Message-State: AD7BkJJOv6L03o+j69b/YI/ZT2GAmrQ7/XfE6j0+5Unl7z/YdGd+S4TGlRMy/T9nJ0Uslf/+C6Yi35YqFDk97g==
MIME-Version: 1.0
X-Received: by 10.60.227.72 with SMTP id ry8mr12848461oec.49.1459823479025;
	Mon, 04 Apr 2016 19:31:19 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Mon, 4 Apr 2016 19:31:18 -0700 (PDT)
In-Reply-To: <57031A9C.3040000@windriver.com>
References: <cover.1459677330.git.liezhi.yang@windriver.com>
	<637f6783157bb0e9449d153133485401bcf2dbb1.1459677330.git.liezhi.yang@windriver.com>
	<CADkTA4NVbCvZwHt62hZzrV+NLpq0qytN_duRv8EigM12mUJs7g@mail.gmail.com>
	<1459719999.7348.142.camel@linuxfoundation.org>
	<CADkTA4Pz5sHPmRMVmQQsoPoQH1tmPkK93QUhtA7LmzibH7-tjQ@mail.gmail.com>
	<57031A9C.3040000@windriver.com>
Date: Mon, 4 Apr 2016 22:31:18 -0400
Message-ID: <CADkTA4M=kwVZnHi-3EfdjkhV4rA6Ep+hWw3EpZrcfu3Q7pz85A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto 4.4: enable overlayfs by default
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
X-List-Received-Date: Tue, 05 Apr 2016 02:31:23 -0000
Content-Type: multipart/alternative; boundary=001a1136ab06e6f90f052fb3a35f

--001a1136ab06e6f90f052fb3a35f
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 4, 2016 at 9:53 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
> Hi Bruce,
>
> How many union fs on Linux, please? AFAIK:
> * unionfs: not supported by kernel any more.
> * aufs
> * overlayfs
>
> If aufs and overlayfs are conflicted, how about:
>
> KERNEL_UNION_FS ?= "features/overlayfs/overlayfs.scc"
>
> KERNEL_EXTRA_FEATURES ?= "[snip] ${KERNEL_UNION_FS}"
>
> I think that we really need a way to make iso/hddimg work by default
> to enhance the OOBE.
>

That sort of mechanism can work, but not if it is enabled by default. out
of box experience
is one thing, but there are plenty of boot and image types that don't need
a unionfs, and
we can't force these as =y for those image types.

If we make a modular config, and a built-in config, we could pick the
modular config by
default, and then have the package list for the images that need them,
rdepend on the
appropriate modules.

Bruce


>
> // Robert
>
> On 04/04/2016 07:56 AM, Bruce Ashfield wrote:
>
>>
>>
>> On Sun, Apr 3, 2016 at 5:46 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org <mailto:
>> richard.purdie@linuxfoundation.org>>
>> wrote:
>>
>>     On Sun, 2016-04-03 at 06:11 -0400, Bruce Ashfield wrote:
>>     >
>>     >
>>     > On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang <
>>     >liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>> wrote:
>>     > > So that iso can work well, otherwise the iso is readonly and there
>>     > > would
>>     > > be errors. The other way is aufs, but overlayfs is more pupolar
>> and
>>     > > had
>>     > > been merged by kernel mainline, we need make iso work well by
>>     > > default.
>>     > Nope. As I mentioned before, this can't be a always on default. It
>>     > will conflict
>>     > with other unionFS use cases.
>>     >
>>     > If you want overlayfs enabled, it needs to be triggered from a
>>     > specific image
>>     > or distro feature.
>>
>>     We can't change the kernel config from an image so it would have to be
>>     a distro setting. Is there a problem with enabling both as modules
>> btw?
>>     I assume they can coexist?
>>
>>
>> I've always found it limiting that we can't trigger kernel features based
>> on
>> what an image'
>> type actually needs, but I understand why/how it works like this.
>>
>> If it can't be triggered by an image setting, then just keeping a layer
>> that is
>> added
>> to the build, that has a bbappend with the appropriate KERNEL_FEATURES
>> would
>> also work, and is the approach that I've also taken.
>>
>> Not that the existing configs are great in this respect (they need a lot
>> of
>> streamlining),
>> but building modules 'just in case' eventually leads to allmodconfig :)
>>
>> I'd imagine they could co-exist, but it isn't something I've tried.
>>
>> Bruce
>>
>>
>>     Cheers,
>>
>>     Richard
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its
>> end"
>>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1136ab06e6f90f052fb3a35f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 4, 2016 at 9:53 PM, Robert Yang <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Hi Bruce,<br>
<br>
How many union fs on Linux, please? AFAIK:<br>
* unionfs: not supported by kernel any more.<br>
* aufs<br>
* overlayfs<br>
<br>
If aufs and overlayfs are conflicted, how about:<br>
<br>
KERNEL_UNION_FS ?=3D &quot;features/overlayfs/overlayfs.scc&quot;<br>
<br>
KERNEL_EXTRA_FEATURES ?=3D &quot;[snip] ${KERNEL_UNION_FS}&quot;<br>
<br>
I think that we really need a way to make iso/hddimg work by default<br>
to enhance the OOBE.<br></blockquote><div><br></div><div>That sort of mecha=
nism can work, but not if it is enabled by default. out of box experience<b=
r></div><div>is one thing, but there are plenty of boot and image types tha=
t don&#39;t need a unionfs, and<br></div><div>we can&#39;t force these as =
=3Dy for those image types.<br><br></div><div>If we make a modular config, =
and a built-in config, we could pick the modular config by<br></div><div>de=
fault, and then have the package list for the images that need them, rdepen=
d on the<br></div><div>appropriate modules.<br><br></div><div>Bruce<br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
// Robert<span class=3D""><br>
<br>
On 04/04/2016 07:56 AM, Bruce Ashfield wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
<br>
On Sun, Apr 3, 2016 at 5:46 PM, Richard Purdie<br></span>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a> &lt;mailto:<a href=3D"mailto:richar=
d.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundat=
ion.org</a>&gt;&gt;<span class=3D""><br>
wrote:<br>
<br>
=C2=A0 =C2=A0 On Sun, 2016-04-03 at 06:11 -0400, Bruce Ashfield wrote:<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang &lt;<br></sp=
an><div><div class=3D"h5">
=C2=A0 =C2=A0 &gt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_b=
lank">liezhi.yang@windriver.com</a> &lt;mailto:<a href=3D"mailto:liezhi.yan=
g@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;&gt; wr=
ote:<br>
=C2=A0 =C2=A0 &gt; &gt; So that iso can work well, otherwise the iso is rea=
donly and there<br>
=C2=A0 =C2=A0 &gt; &gt; would<br>
=C2=A0 =C2=A0 &gt; &gt; be errors. The other way is aufs, but overlayfs is =
more pupolar and<br>
=C2=A0 =C2=A0 &gt; &gt; had<br>
=C2=A0 =C2=A0 &gt; &gt; been merged by kernel mainline, we need make iso wo=
rk well by<br>
=C2=A0 =C2=A0 &gt; &gt; default.<br>
=C2=A0 =C2=A0 &gt; Nope. As I mentioned before, this can&#39;t be a always =
on default. It<br>
=C2=A0 =C2=A0 &gt; will conflict<br>
=C2=A0 =C2=A0 &gt; with other unionFS use cases.<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; If you want overlayfs enabled, it needs to be triggered =
from a<br>
=C2=A0 =C2=A0 &gt; specific image<br>
=C2=A0 =C2=A0 &gt; or distro feature.<br>
<br>
=C2=A0 =C2=A0 We can&#39;t change the kernel config from an image so it wou=
ld have to be<br>
=C2=A0 =C2=A0 a distro setting. Is there a problem with enabling both as mo=
dules btw?<br>
=C2=A0 =C2=A0 I assume they can coexist?<br>
<br>
<br>
I&#39;ve always found it limiting that we can&#39;t trigger kernel features=
 based on<br>
what an image&#39;<br>
type actually needs, but I understand why/how it works like this.<br>
<br>
If it can&#39;t be triggered by an image setting, then just keeping a layer=
 that is<br>
added<br>
to the build, that has a bbappend with the appropriate KERNEL_FEATURES woul=
d<br>
also work, and is the approach that I&#39;ve also taken.<br>
<br>
Not that the existing configs are great in this respect (they need a lot of=
<br>
streamlining),<br>
but building modules &#39;just in case&#39; eventually leads to allmodconfi=
g :)<br>
<br>
I&#39;d imagine they could co-exist, but it isn&#39;t something I&#39;ve tr=
ied.<br>
<br>
Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 Cheers,<br>
<br>
=C2=A0 =C2=A0 Richard<br>
<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its<br>
end&quot;<br>
</div></div></blockquote>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature">&quot;Thou shalt not follow the NULL pointer, for chaos and madness=
 await thee at its end&quot;</div>
</div></div>

--001a1136ab06e6f90f052fb3a35f--

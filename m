Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1939760119
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 06:33:21 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id j9so3056094obd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 23:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=kV/wWPb/QnXDrTqzNkKsqHLqakGE8LQT+0Bvudc1K/o=;
	b=c+CF1YaaVT7QsxhQcYg5OCbO1arR5Aihwlvt1qJVmJd1Uoy57m3ZWp1aetzId4HA16
	rCP4QgH/sCM8PTEIbFbCEb8ENXlWc+fL6KgQ9NI0wX9oCfg1396DDbc/rf4nbdByMfF2
	mSNtzRLKGEf/O/ZxWa9ymiwDVWfogb8VaetBtg4KWzcOy1KX1XELDr6IyCBgIkJpR3XJ
	iol99JEu/TzlbVt0LIBNVU5uQE2ekwzegXoZ1JP3eDgd3L710SVmQs1EetOgRyV8iHhQ
	j7EgywRZzPmes6EtOR/vP9FNdXsmeKLQez9gTTIK73ouWI7mpEYAKEsGtGnsJMyhaQWG
	e0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=kV/wWPb/QnXDrTqzNkKsqHLqakGE8LQT+0Bvudc1K/o=;
	b=US6U1hXzzMEwPTn25eTO1D98lTHtIh+QcTofVXmRn/TxYu9muH5Z4KIcCmrM+StzZP
	wGzaEoR/e/PxT2DCxrLhxxm84fRUnPUamP/CXAsN7K0JBjUX7+j0QNRvZX4EPD96ch6U
	mWm8QSmniADU7LMoOrPGU9XZPtOAmxeGcTl+JQjo+ZwjBwmVuMs4/jSVj8vMUvVvY7HX
	7A83zpRqEAv5xV4jm5P4aBzTSICCjZZqxOnD7O8cExomwlJAHUGYjmZkcWDEUUblrvuV
	puA/IQhkyIP/zlnuBqKPRCm8TyC538dNe4rPp0caPs0KD7sv2w2pjq+ISnklwWtPw2rx
	5aNw==
X-Gm-Message-State: AD7BkJIVVFeo+pbrnTuj/iOQCt+V8wPSZoyNYCiRKtMIfD6ATJslDaQQ3mkBZ+Cd1TVkbAKwCK9vorIWNtLLiA==
MIME-Version: 1.0
X-Received: by 10.60.227.72 with SMTP id ry8mr13242757oec.49.1459838001751;
	Mon, 04 Apr 2016 23:33:21 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Mon, 4 Apr 2016 23:33:21 -0700 (PDT)
In-Reply-To: <57032796.3020302@windriver.com>
References: <cover.1459677330.git.liezhi.yang@windriver.com>
	<637f6783157bb0e9449d153133485401bcf2dbb1.1459677330.git.liezhi.yang@windriver.com>
	<CADkTA4NVbCvZwHt62hZzrV+NLpq0qytN_duRv8EigM12mUJs7g@mail.gmail.com>
	<1459719999.7348.142.camel@linuxfoundation.org>
	<CADkTA4Pz5sHPmRMVmQQsoPoQH1tmPkK93QUhtA7LmzibH7-tjQ@mail.gmail.com>
	<57031A9C.3040000@windriver.com>
	<CADkTA4M=kwVZnHi-3EfdjkhV4rA6Ep+hWw3EpZrcfu3Q7pz85A@mail.gmail.com>
	<57032796.3020302@windriver.com>
Date: Tue, 5 Apr 2016 02:33:21 -0400
Message-ID: <CADkTA4PtLF1tYBdSQLuz5Z-zRtNX46NV2LVNJuJtAb2jStR8dw@mail.gmail.com>
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
X-List-Received-Date: Tue, 05 Apr 2016 06:33:23 -0000
Content-Type: multipart/alternative; boundary=001a1136ab06862b38052fb705e4

--001a1136ab06862b38052fb705e4
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 4, 2016 at 10:48 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
>
> On 04/05/2016 10:31 AM, Bruce Ashfield wrote:
>
>>
>>
>> On Mon, Apr 4, 2016 at 9:53 PM, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>
>>     Hi Bruce,
>>
>>     How many union fs on Linux, please? AFAIK:
>>     * unionfs: not supported by kernel any more.
>>     * aufs
>>     * overlayfs
>>
>>     If aufs and overlayfs are conflicted, how about:
>>
>>     KERNEL_UNION_FS ?= "features/overlayfs/overlayfs.scc"
>>
>>     KERNEL_EXTRA_FEATURES ?= "[snip] ${KERNEL_UNION_FS}"
>>
>>     I think that we really need a way to make iso/hddimg work by default
>>     to enhance the OOBE.
>>
>>
>> That sort of mechanism can work, but not if it is enabled by default. out
>> of box
>> experience
>> is one thing, but there are plenty of boot and image types that don't
>> need a
>> unionfs, and
>> we can't force these as =y for those image types.
>>
>> If we make a modular config, and a built-in config, we could pick the
>> modular
>> config by
>> default, and then have the package list for the images that need them,
>> rdepend
>> on the
>> appropriate modules.
>>
>
> Sounds good, so how about:
>
> 1) Update kernel to make overlayfs as module rather than builtin
>

Having two fragments make sense. one for built in, and one that is modules.
Since these are
distinct use case both sets of configuration are reasonable.


> 2) let core-image-minimal-initramfs RDEPENEDS on the module.
>
>
I'd still prefer that this be set in a distro or optional layer. Since why
should core image
minimal be the target for this ? There are any number of targets that might
be used for
live boot.

Bruce


> // Robert
>
>
>> Bruce
>>
>>
>>     // Robert
>>
>>     On 04/04/2016 07:56 AM, Bruce Ashfield wrote:
>>
>>
>>
>>         On Sun, Apr 3, 2016 at 5:46 PM, Richard Purdie
>>         <richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>
>>         <mailto:richard.purdie@linuxfoundation.org
>>         <mailto:richard.purdie@linuxfoundation.org>>>
>>         wrote:
>>
>>              On Sun, 2016-04-03 at 06:11 -0400, Bruce Ashfield wrote:
>>              >
>>              >
>>              > On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang <
>>              >liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com
>> >
>>         <mailto:liezhi.yang@windriver.com <mailto:
>> liezhi.yang@windriver.com>>>
>>
>>         wrote:
>>              > > So that iso can work well, otherwise the iso is readonly
>> and there
>>              > > would
>>              > > be errors. The other way is aufs, but overlayfs is more
>> pupolar and
>>              > > had
>>              > > been merged by kernel mainline, we need make iso work
>> well by
>>              > > default.
>>              > Nope. As I mentioned before, this can't be a always on
>> default. It
>>              > will conflict
>>              > with other unionFS use cases.
>>              >
>>              > If you want overlayfs enabled, it needs to be triggered
>> from a
>>              > specific image
>>              > or distro feature.
>>
>>              We can't change the kernel config from an image so it would
>> have to be
>>              a distro setting. Is there a problem with enabling both as
>> modules btw?
>>              I assume they can coexist?
>>
>>
>>         I've always found it limiting that we can't trigger kernel
>> features based on
>>         what an image'
>>         type actually needs, but I understand why/how it works like this.
>>
>>         If it can't be triggered by an image setting, then just keeping a
>> layer
>>         that is
>>         added
>>         to the build, that has a bbappend with the appropriate
>> KERNEL_FEATURES would
>>         also work, and is the approach that I've also taken.
>>
>>         Not that the existing configs are great in this respect (they
>> need a lot of
>>         streamlining),
>>         but building modules 'just in case' eventually leads to
>> allmodconfig :)
>>
>>         I'd imagine they could co-exist, but it isn't something I've
>> tried.
>>
>>         Bruce
>>
>>
>>              Cheers,
>>
>>              Richard
>>
>>
>>
>>
>>         --
>>         "Thou shalt not follow the NULL pointer, for chaos and madness
>> await
>>         thee at its
>>         end"
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

--001a1136ab06862b38052fb705e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 4, 2016 at 10:48 PM, Robert Yang <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D""><br>
<br>
On 04/05/2016 10:31 AM, Bruce Ashfield wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
<br>
On Mon, Apr 4, 2016 at 9:53 PM, Robert Yang &lt;<a href=3D"mailto:liezhi.ya=
ng@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></span=
><span class=3D"">
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.com</a>&gt;&gt; wrote:<br>
<br>
<br>
=C2=A0 =C2=A0 Hi Bruce,<br>
<br>
=C2=A0 =C2=A0 How many union fs on Linux, please? AFAIK:<br>
=C2=A0 =C2=A0 * unionfs: not supported by kernel any more.<br>
=C2=A0 =C2=A0 * aufs<br>
=C2=A0 =C2=A0 * overlayfs<br>
<br>
=C2=A0 =C2=A0 If aufs and overlayfs are conflicted, how about:<br>
<br>
=C2=A0 =C2=A0 KERNEL_UNION_FS ?=3D &quot;features/overlayfs/overlayfs.scc&q=
uot;<br>
<br>
=C2=A0 =C2=A0 KERNEL_EXTRA_FEATURES ?=3D &quot;[snip] ${KERNEL_UNION_FS}&qu=
ot;<br>
<br>
=C2=A0 =C2=A0 I think that we really need a way to make iso/hddimg work by =
default<br>
=C2=A0 =C2=A0 to enhance the OOBE.<br>
<br>
<br>
That sort of mechanism can work, but not if it is enabled by default. out o=
f box<br>
experience<br>
is one thing, but there are plenty of boot and image types that don&#39;t n=
eed a<br>
unionfs, and<br>
we can&#39;t force these as =3Dy for those image types.<br>
<br>
If we make a modular config, and a built-in config, we could pick the modul=
ar<br>
config by<br>
default, and then have the package list for the images that need them, rdep=
end<br>
on the<br>
appropriate modules.<br>
</span></blockquote>
<br>
Sounds good, so how about:<br>
<br>
1) Update kernel to make overlayfs as module rather than builtin<br></block=
quote><div><br></div><div>Having two fragments make sense. one for built in=
, and one that is modules. Since these are<br></div><div>distinct use case =
both sets of configuration are reasonable.<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
2) let core-image-minimal-initramfs RDEPENEDS on the module.<br>
<br></blockquote><div><br></div><div>I&#39;d still prefer that this be set =
in a distro or optional layer. Since why should core image<br></div><div>mi=
nimal be the target for this ? There are any number of targets that might b=
e used for<br></div><div>live boot.<br><br></div><div>Bruce<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
// Robert<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
<br>
Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 // Robert<br>
<br>
=C2=A0 =C2=A0 On 04/04/2016 07:56 AM, Bruce Ashfield wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 On Sun, Apr 3, 2016 at 5:46 PM, Richard Purdie<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a><=
span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Sun, 2016-04-03 at 06:11=
 -0400, Bruce Ashfield wrote:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Sun, Apr 3, 2016 at=
 5:58 AM, Robert Yang &lt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<a href=3D"mailto:liezh=
i.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a> &lt;m=
ailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi=
.yang@windriver.com</a>&gt;<br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:liezhi.yang@windri=
ver.com" target=3D"_blank">liezhi.yang@windriver.com</a> &lt;mailto:<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;&gt;&gt;<div><div class=3D"h5"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wrote:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; So that iso can w=
ork well, otherwise the iso is readonly and there<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; would<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; be errors. The ot=
her way is aufs, but overlayfs is more pupolar and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; had<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; been merged by ke=
rnel mainline, we need make iso work well by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; default.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Nope. As I mentioned b=
efore, this can&#39;t be a always on default. It<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; will conflict<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; with other unionFS use=
 cases.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; If you want overlayfs =
enabled, it needs to be triggered from a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; specific image<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; or distro feature.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0We can&#39;t change the ker=
nel config from an image so it would have to be<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a distro setting. Is there =
a problem with enabling both as modules btw?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I assume they can coexist?<=
br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 I&#39;ve always found it limiting that we can&#=
39;t trigger kernel features based on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 what an image&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type actually needs, but I understand why/how i=
t works like this.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 If it can&#39;t be triggered by an image settin=
g, then just keeping a layer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 that is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 added<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 to the build, that has a bbappend with the appr=
opriate KERNEL_FEATURES would<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 also work, and is the approach that I&#39;ve al=
so taken.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Not that the existing configs are great in this=
 respect (they need a lot of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 streamlining),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 but building modules &#39;just in case&#39; eve=
ntually leads to allmodconfig :)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 I&#39;d imagine they could co-exist, but it isn=
&#39;t something I&#39;ve tried.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Richard<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Thou shalt not follow the NULL pointer, f=
or chaos and madness await<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 thee at its<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 end&quot;<br>
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

--001a1136ab06862b38052fb705e4--

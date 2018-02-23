Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1741A786F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 15:35:07 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id o9so3441989itc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 07:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wdCqJyMx0+NLegz1jiGY3EC5dvQ9/CDdC0Wxd6benbM=;
	b=okSC76GzGzvDxKXFasyJnWOdq/NVYUJeyuN1dicgNMMfCPLmTFUJa5I4TXYREipOlJ
	O4FdLm0YJI/3N74zlNJ6RPytXW8C48+2yG9jcOriy5ktcA3tilGkkYpOFNmK6drhMjsd
	ZIVxKroHbEAGRPwLospP3rzH2Bs+6IvmGZQ+i5cIpIR1AYYf1QCUVHlseaSvV8pNqYO3
	atjzI9oTkxs0YzC55L6uxHbXGL4gu5uMiyJboq2qvogcLOMDkZDXUy3iEZD1YAcl/7fU
	x5e6xd5bm3+8mAj1wCOzfxrc7KSJYMSnq6F+f6B1CUmzDp326qx/do8tYeYsW1mIHba+
	hFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wdCqJyMx0+NLegz1jiGY3EC5dvQ9/CDdC0Wxd6benbM=;
	b=fqCoKAbwurz2G/rRZUwkteX7HZg+uzT3D8m147CPIq96DIuyNwXUjT7MxM12hWxlYr
	mdn1SdNT3lAaT07sUSDppTI2fZV/A/nxmiOKCQcBj3PNA1pirb04aGb1aVOwVarnod3J
	690NSG+n/EtbB1epRjRb/Bwtw8wCFMNf7SIuzwxE8mKMMVqDQ4CFLeXriLIpXGQxjZR6
	8dYQsQWSm7sXSdpoFKzehXrIwDdbCAh0ukSNydwTTcZgNj2iJ2/d1QiQEPA4FYx47Pyv
	CEkp6riODypL/KKcK0K1sf4rd3bD4HPQLGmhctBjVXeA3G910LXNHxeRUf3VaxdFdkdI
	+oGw==
X-Gm-Message-State: APf1xPBYogivxc4grU9gL8BKlN/E+2v5YAYSElLHoZfRDC6+K8JN7XNA
	U2Lo5G+TkH98L/iYdI9ubHHnvc2sutsDp8okfJOaUQ==
X-Google-Smtp-Source: AH8x224+XibMG3ZYR32QHjpYShyfOWRdUCa2cHjvKm8hpxNcXhzUcwLkNhAcsiwa5t/7ysS3ztXXL7OWGcJNt+Jra7k=
X-Received: by 10.36.185.24 with SMTP id w24mr2677843ite.127.1519400109221;
	Fri, 23 Feb 2018 07:35:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Fri, 23 Feb 2018 07:34:48 -0800 (PST)
In-Reply-To: <CAMKF1so1HXcc9gTaZuOBCBQ+DPNNqtQqQEoOocb839nP8wLBjA@mail.gmail.com>
References: <cover.1517524576.git.raj.khem@gmail.com>
	<aa96375d5517a1f0170609aac7283bd71566f46a.1517524576.git.raj.khem@gmail.com>
	<CAJTo0Lax4NpwLPN2Ly_9seKFLYp-qCVJCuyzXhtN6aiXKgVKRg@mail.gmail.com>
	<CAMKF1sp8riyhF=6N_ak-TyZ6_w=aj+az=qx+mjepXPQagV7vqw@mail.gmail.com>
	<CAJTo0LYEO1e2i_dnXDT7sNRyScH_KT3Ge38yWundnr2hk3de9g@mail.gmail.com>
	<089d4714-011d-5cca-5af6-8f7a8e3568c4@gmail.com>
	<CAMKF1spdL49Ny-yqk+n-k0JSU8PGVQyv43MgpZU_fOwVc1Fr4A@mail.gmail.com>
	<CAJTo0LZ8ycUQ_SYb3gWYhirHC1nv3MVJsmnas=7a30m3Jp1vPA@mail.gmail.com>
	<CAMKF1so1HXcc9gTaZuOBCBQ+DPNNqtQqQEoOocb839nP8wLBjA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Feb 2018 15:34:48 +0000
Message-ID: <CAJTo0LYc6tALbc_ifPq6GsqojkPeLcs60_1btFfht5_QQXTpoA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Fri, 23 Feb 2018 15:35:08 -0000
Content-Type: multipart/alternative; boundary="f403045d9a50c841f90565e2e7d9"

--f403045d9a50c841f90565e2e7d9
Content-Type: text/plain; charset="UTF-8"

Yep, overriding it for nativesdk now (and will propose we change the
default later)

On 23 February 2018 at 14:45, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Feb 23, 2018 at 4:29 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > I've made it work!  See the patches in poky-contrib:ross/glibc, although
> I'm
> > cleaning them up now.
> >
>
>
> LOCALE_UTF8_IS_DEFAULT setting is in conf/distro/include/default-
> distrovars.inc
>
> > Ross
> >
> > On 23 February 2018 at 03:06, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> glibc community thinks that the way we are depending upon old
> >> localedata while using newer
> >> glibc in nativesdk is not a supported usecase, and there is no
> >> guarantees of internal data structures changes between major releases,
> >> like what we are facing here. The suggestion is
> >> to ship own localedata instead of relying on SDK host. You can follow
> >> the discussion on glibc
> >> thread I added in previous email and if have some suggestions or
> >> inputs feel free.
> >>
> >> I will try to come up with a patch along with this upgrade to add
> >> nativesdk locale along and
> >> check if this fixes the issue we have
> >>
> >> On Sat, Feb 17, 2018 at 11:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > Wanted to send update on this issue
> >> >
> >> > I got to bottom of this issue and Ross you should have known it :)
> >> >
> >> > https://patchwork.openembedded.org/patch/127105/
> >> >
> >> > introduced an optimization into nativesdk glibc to let it ride on
> >> > localedate
> >> > from SDK host. This has now broken in glibc with
> >> >
> >> >
> >> > https://github.com/kraj/glibc/commit/95cb863a1ef7760a11272bbd7ba5fe
> 62dc41be54
> >> >
> >> > it is recommended for static programs to be relinked if using glibc
> 2.27
> >> > our case is also similar mismatch of libc version and localedata just
> in
> >> > opposite direction where we are trying to read old data with new glibc
> >> > instead.
> >> >
> >> > I have initiated a discussion within glibc community on it to explore
> >> > what
> >> > options we have, but be prepared to ship full localedata in worst case
> >> > with
> >> > glibc 2.27,  this might be the worst case option if no alternative is
> >> > found.
> >> >
> >> > Thank you
> >> > -Khem
> >> >
> >> > On 2/15/18 4:12 AM, Burton, Ross wrote:
> >> >>
> >> >> Yes, that's it.
> >> >>
> >> >> Ross
> >> >>
> >> >> On 12 February 2018 at 07:32, Khem Raj <raj.khem@gmail.com
> >> >> <mailto:raj.khem@gmail.com>> wrote:
> >> >>
> >> >>     On Sat, Feb 3, 2018 at 2:21 AM, Burton, Ross <
> ross.burton@intel.com
> >> >>     <mailto:ross.burton@intel.com>> wrote:
> >> >>     > Getting there: https://autobuilder.yocto.io/tgrid
> >> >> <https://autobuilder.yocto.io/tgrid>
> >> >>     >
> >> >>     > Just two actual problems:
> >> >>     > - The non-gplv3 build failed as the make fix needs to be
> >> >> backported
> >> >> to
> >> >>     > meta-gplv2
> >> >>     > - The eSDK selftests all failed with en_US.UTF-8 problems, the
> >> >> new
> >> >> glibc
> >> >>     > shouldn't be causing a problem with uninative so this is
> >> >> interesting, maybe
> >> >>     > the new one is behaving slightly differently.  Should be easy
> to
> >> >> replicate.
> >> >>     > The same problem caused selftest to fail.
> >> >>     >
> >> >>
> >> >>     is the UTF error like this one
> >> >>     https://gist.github.com/25a84d23618824f0e5e6857a960eaca4
> >> >>     <https://gist.github.com/25a84d23618824f0e5e6857a960eaca4>
> >> >>
> >> >>      > Ross
> >> >>
> >> >>
> >> >
> >
> >
>

--f403045d9a50c841f90565e2e7d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yep, overriding it for nativesdk now (and will propose we =
change the default later)</div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 23 February 2018 at 14:45, Khem Raj <span dir=3D"ltr">&lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On=
 Fri, Feb 23, 2018 at 4:29 AM, Burton, Ross &lt;<a href=3D"mailto:ross.burt=
on@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; I&#39;ve made it work!=C2=A0 See the patches in poky-contrib:ross/glib=
c, although I&#39;m<br>
&gt; cleaning them up now.<br>
&gt;<br>
<br>
<br>
</span>LOCALE_UTF8_IS_DEFAULT setting is in conf/distro/include/default-<wb=
r>distrovars.inc<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Ross<br>
&gt;<br>
&gt; On 23 February 2018 at 03:06, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; glibc community thinks that the way we are depending upon old<br>
&gt;&gt; localedata while using newer<br>
&gt;&gt; glibc in nativesdk is not a supported usecase, and there is no<br>
&gt;&gt; guarantees of internal data structures changes between major relea=
ses,<br>
&gt;&gt; like what we are facing here. The suggestion is<br>
&gt;&gt; to ship own localedata instead of relying on SDK host. You can fol=
low<br>
&gt;&gt; the discussion on glibc<br>
&gt;&gt; thread I added in previous email and if have some suggestions or<b=
r>
&gt;&gt; inputs feel free.<br>
&gt;&gt;<br>
&gt;&gt; I will try to come up with a patch along with this upgrade to add<=
br>
&gt;&gt; nativesdk locale along and<br>
&gt;&gt; check if this fixes the issue we have<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Feb 17, 2018 at 11:58 PM, Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; Wanted to send update on this issue<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I got to bottom of this issue and Ross you should have known =
it :)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://patchwork.openembedded.org/patch/127105/" =
rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openembedded.or=
g/patch/127105/</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; introduced an optimization into nativesdk glibc to let it rid=
e on<br>
&gt;&gt; &gt; localedate<br>
&gt;&gt; &gt; from SDK host. This has now broken in glibc with<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://github.com/kraj/glibc/commit/95cb863a1ef77=
60a11272bbd7ba5fe62dc41be54" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/kraj/glibc/<wbr>commit/<wbr>95cb863a1ef7760a11272bbd7ba5fe<wbr>62=
dc41be54</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; it is recommended for static programs to be relinked if using=
 glibc 2.27<br>
&gt;&gt; &gt; our case is also similar mismatch of libc version and localed=
ata just in<br>
&gt;&gt; &gt; opposite direction where we are trying to read old data with =
new glibc<br>
&gt;&gt; &gt; instead.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I have initiated a discussion within glibc community on it to=
 explore<br>
&gt;&gt; &gt; what<br>
&gt;&gt; &gt; options we have, but be prepared to ship full localedata in w=
orst case<br>
&gt;&gt; &gt; with<br>
&gt;&gt; &gt; glibc 2.27,=C2=A0 this might be the worst case option if no a=
lternative is<br>
&gt;&gt; &gt; found.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thank you<br>
&gt;&gt; &gt; -Khem<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On 2/15/18 4:12 AM, Burton, Ross wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Yes, that&#39;s it.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Ross<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On 12 February 2018 at 07:32, Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a><br>
&gt;&gt; &gt;&gt; &lt;mailto:<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0On Sat, Feb 3, 2018 at 2:21 AM, Burton=
, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</=
a><br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ross.burt=
on@intel.com">ross.burton@intel.com</a>&gt;<wbr>&gt; wrote:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Getting there: <a href=3D"https:/=
/autobuilder.yocto.io/tgrid" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yocto.io/<wbr>tgrid</a><br>
&gt;&gt; &gt;&gt; &lt;<a href=3D"https://autobuilder.yocto.io/tgrid" rel=3D=
"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/<wbr>tgrid</a>&=
gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Just two actual problems:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; - The non-gplv3 build failed as t=
he make fix needs to be<br>
&gt;&gt; &gt;&gt; backported<br>
&gt;&gt; &gt;&gt; to<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; meta-gplv2<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; - The eSDK selftests all failed w=
ith en_US.UTF-8 problems, the<br>
&gt;&gt; &gt;&gt; new<br>
&gt;&gt; &gt;&gt; glibc<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; shouldn&#39;t be causing a proble=
m with uninative so this is<br>
&gt;&gt; &gt;&gt; interesting, maybe<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; the new one is behaving slightly =
differently.=C2=A0 Should be easy to<br>
&gt;&gt; &gt;&gt; replicate.<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; The same problem caused selftest =
to fail.<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0is the UTF error like this one<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gist.github.com/25a=
84d23618824f0e5e6857a960eaca4" rel=3D"noreferrer" target=3D"_blank">https:/=
/gist.github.com/<wbr>25a84d23618824f0e5e6857a960eac<wbr>a4</a><br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gist.github.com=
/25a84d23618824f0e5e6857a960eaca4" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gist.github.com/<wbr>25a84d23618824f0e5e6857a960eac<wbr>a4</a>&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Ross<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--f403045d9a50c841f90565e2e7d9--

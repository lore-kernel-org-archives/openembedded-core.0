Return-Path: <krussell7711@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0DD6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 13:58:26 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id r204so9875458ywb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 05:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=OSMtHYGVHMYHmP0BQrtbpSJGpdlK9rIrqUVqXPFZGcY=;
	b=M3qGTdqwN8M4l6kp9LlK5QKaXIshlFbhptjAyZG0mMv5PkfI4NLmsZ+3s48LLkHMVu
	B1eBwg0qgyJqzTmZ48zZc8O1nFVYxf1tQuGf0LOlIez/2dyud65rdjuNmjyTQ+2bo/IH
	oz6xrRXjVSuI91gmiBusizA2rkFr9TaVb5vUlBcgQbmfkg9/alb2bjaEyOVH2rs9DTSN
	WFoWNZJyYRUXBqOhhYhsei1ZabJC4VqZsPKro7CbXKN2Fyebzv9Ug0ndSiZwff/59wvu
	UqUubePI/bKixjnSLQWILZIkjKuNFl5Le897Lk1DmO2QFM3RVRuE/M2GVJRRtZTRm2HU
	SeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=OSMtHYGVHMYHmP0BQrtbpSJGpdlK9rIrqUVqXPFZGcY=;
	b=FGxwW2i7DEiE1yoXQ8AypWwNnDhwhgud6McCLfQMssxFpCZ/ekKrVWRecWnMbYbOPW
	aJysSJu9aO54HJlOC6xFs2uwpvClCKnPAHC6hNXTl6Hj4jp1/ErHfZCZhY/gXaJs9L/s
	jG1XgFglzXczMgGW19fM5Ch5i4C7AdWHONAe7r8ILVhFOwTN3aPgobX882ADTXj5asMJ
	9t9Dk3egjgKClR63xG63LPShkovSXdDXVaM+bTfktZAO9OgDc5lpyHYYnA7RfxNyFlwA
	n2koFr6BYNfUyJM7XXDB6iJ4EcIout5BwF4k4UjYVm1bG2mKmdnjtdX6xWeDEXEvPwaV
	XlNA==
X-Gm-Message-State: ABUngvd5MnGhufhBE1Lr6m/MSXpi6TfUZyVIwxpcStjVvXGE3XriimPFa30e591P4JSNcGQMqPRsxy7VXx49UQ==
X-Received: by 10.13.219.69 with SMTP id d66mr4950367ywe.148.1478786308130;
	Thu, 10 Nov 2016 05:58:28 -0800 (PST)
MIME-Version: 1.0
Sender: krussell7711@gmail.com
Received: by 10.13.255.131 with HTTP; Thu, 10 Nov 2016 05:58:07 -0800 (PST)
In-Reply-To: <CAFrQVPMDPit+MZh47cUYef91vespyrh2X3_v9Edk2shXxin0aw@mail.gmail.com>
References: <1476195437-24040-1-git-send-email-bkylerussell@gmail.com>
	<1476195437-24040-2-git-send-email-bkylerussell@gmail.com>
	<CAJTo0LahAKipF1Dz9TQw8TVM3vp361ZATtVPHjXy5ZupRDdZkQ@mail.gmail.com>
	<CAFrQVPPXkV_dy9G7qWhGNd-5AFY-pVhG33sYUjMVPupaXxyd1A@mail.gmail.com>
	<CAJTo0LZa4z4zy-TT9z9=+Bq2SAsWd6NqFkgx+jrsNTNCMJqZLQ@mail.gmail.com>
	<CAFrQVPMDPit+MZh47cUYef91vespyrh2X3_v9Edk2shXxin0aw@mail.gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Thu, 10 Nov 2016 08:58:07 -0500
X-Google-Sender-Auth: XaQDHvR46LNA0V6p6aau3ybt_ig
Message-ID: <CAFrQVPNGCOLcM==SuHWjXFi707WZ-3zNQ9tuwb=2NaauS=054w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] librsvg: Add missing pixbufcache dependencies
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
X-List-Received-Date: Thu, 10 Nov 2016 13:58:28 -0000
Content-Type: multipart/alternative; boundary=001a114fc6c09888530540f2c47f

--001a114fc6c09888530540f2c47f
Content-Type: text/plain; charset=UTF-8

We were able to capture a full cooker log with the libpixbufloader-jpeg
failure, and I only see the populate_lic_setscene tasks being run for
jpeg-native.  We were running jethro with the two patches I originally
provided in this thread.

Is there a specific task dependency chain you'd like for me to look for in
the log?

On Fri, Oct 14, 2016 at 5:55 AM, Kyle Russell <bkylerussell@gmail.com>
wrote:

> Actually, we just hit another failure mode running with these two
> patches.  Again, we're currently running on the jethro branch.
>
> g_module_open() failed for /poky/build/tmp/sysroots/x86_
> 64-linux/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-jpeg.so:
> libjpeg.so.9: cannot open shared object file: No such file or directory
>
> Looking at the build output itself, I was reminded of another signature of
> this failure.  It seems like the do_populate_lice_setscene runs for the
> package that should have provided libjpeg.so.9, but no
> do_populate_sysroot_setscene.  I remember also seeing this on the other
> failures I mentioned.
>
> $ cat build-output.log | grep jpeg-native
> NOTE: recipe jpeg-native-9a-r0: task do_populate_lic_setscene: Started
> NOTE: recipe jpeg-native-9a-r0: task do_populate_lic_setscene: Succeeded
>
> I can try to get the full cooker log from the build slave if you want.  Do
> you mean the file from tmp/log/cooker/<machine>/?  If I can get it, how
> would you prefer me send that to you?
>
> On Thu, Oct 13, 2016 at 9:09 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>>
>> On 11 October 2016 at 17:44, Kyle Russell <bkylerussell@gmail.com> wrote:
>>
>>> I suspect this list may still not be entirely complete, because ldd
>>> shows several dependencies for libpixbufloader-svg.so.  However, I'm not
>>> really that familiar with all the dependencies going on here; we are
>>> definitely seeing sporadic failures for various native libraries during the
>>> pixbufcache postinst task though.  Best I could tell, it looked like the
>>> PIXBUFCACHE_SYSROOT_DEPS functionality was accidentally removed from the
>>> pixbufcache.bbclass a while back (hence, my first patch).  Adding that hunk
>>> back in has seemed to help most of the failures, but we still see lingering
>>> failures for pixman and libXdmcp on occasion.
>>
>>
>> This bit of code is particularly tangled, so I'm hoping I can remember
>> the details.  The AB just hit a related problem earlier in the week so I'm
>> trying to remember how all this ties together.
>>
>> The SYSROOT_DEPS bit wasn't removed accidentally because the way the
>> query-loaders script is executed has changed.  It used to be ran via
>> SSTATEPOSTINSTFUNCS so would execute the moment that gdk-pixbuf-native or
>> librsvg-native was unpacked.  As sstate installation is top-down instead of
>> bottom-up this would generally mean that librsvg-native would be installed
>> before even gdk-pixbuf-native was installed, and typically before stuff
>> like libpng-native or the rest of the stack.
>>
>> This was changed so that the SSTATEPOSTINSTFUNC simply writes a
>> sstate-completion script that is executed once all of sstate has been
>> unpacked, so ordering isn't a problem. The logic to add explicit
>> dependencies isn't required anymore.
>>
>> Of course native dependencies are not as neat as target dependencies
>> which is something I'd really like to see fixed, but in general I can't
>> understand why this happens for you: if gdk-pixbuf-native can be extracted
>> from sstate then all of its dependencies must have been too, and they
>> include recipes such as libxdmcp-native.  If the dependencies need a
>> rebuild then gdk-pixbuf should need a rebuild too...
>>
>> A full cooker log with the bug would be appreciated, but I know that's
>> unlikely to happen!
>>
>> Ross
>>
>
>

--001a114fc6c09888530540f2c47f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We were able to capture a full cooker log with the libpixb=
ufloader-jpeg failure, and I only see the populate_lic_setscene tasks being=
 run for jpeg-native.=C2=A0 We were running jethro with the two patches I o=
riginally provided in this thread.<div><br></div><div>Is there a specific t=
ask dependency chain you&#39;d like for me to look for in the log?</div></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Oct 14=
, 2016 at 5:55 AM, Kyle Russell <span dir=3D"ltr">&lt;<a href=3D"mailto:bky=
lerussell@gmail.com" target=3D"_blank">bkylerussell@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Actually, we ju=
st hit another failure mode running with these two patches.=C2=A0 Again, we=
&#39;re currently running on the jethro branch.<div><br></div><div>g_module=
_open() failed for /poky/build/tmp/sysroots/x86_<wbr>64-linux/usr/lib/gdk-p=
ixbuf-2.<wbr>0/2.10.0/loaders/<wbr>libpixbufloader-jpeg.so: libjpeg.so.9: c=
annot open shared object file: No such file or directory<br></div><div><br>=
</div><div>Looking at the build output itself, I was reminded of another si=
gnature of this failure.=C2=A0 It seems like the do_populate_lice_setscene =
runs for the package that should have provided libjpeg.so.9, but no do_popu=
late_sysroot_setscene.=C2=A0 I remember also seeing this on the other failu=
res I mentioned.</div><div><br></div><div><div>$ cat build-output.log | gre=
p jpeg-native</div><div>NOTE: recipe jpeg-native-9a-r0: task do_populate_li=
c_setscene: Started</div><div>NOTE: recipe jpeg-native-9a-r0: task do_popul=
ate_lic_setscene: Succeeded</div></div><div><br></div><div>I can try to get=
 the full cooker log from the build slave if you want.=C2=A0 Do you mean th=
e file from tmp/log/cooker/&lt;machine&gt;/?=C2=A0 If I can get it, how wou=
ld you prefer me send that to you?</div></div><div class=3D"HOEnZb"><div cl=
ass=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu=
, Oct 13, 2016 at 9:09 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div clas=
s=3D"gmail_extra"><span><br><div class=3D"gmail_quote">On 11 October 2016 a=
t 17:44, Kyle Russell <span dir=3D"ltr">&lt;<a href=3D"mailto:bkylerussell@=
gmail.com" target=3D"_blank">bkylerussell@gmail.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid=
;padding-left:1ex">I suspect this list may still not be entirely complete, =
because ldd shows several dependencies for libpixbufloader-svg.so.=C2=A0 Ho=
wever, I&#39;m not really that familiar with all the dependencies going on =
here; we are definitely seeing sporadic failures for various native librari=
es during the pixbufcache postinst task though.=C2=A0 Best I could tell, it=
 looked like the PIXBUFCACHE_SYSROOT_DEPS functionality was accidentally re=
moved from the pixbufcache.bbclass a while back (hence, my first patch).=C2=
=A0 Adding that hunk back in has seemed to help most of the failures, but w=
e still see lingering failures for pixman and libXdmcp on occasion.</blockq=
uote></div><br></span>This bit of code is particularly tangled, so I&#39;m =
hoping I can remember the details.=C2=A0 The AB just hit a related problem =
earlier in the week so I&#39;m trying to remember how all this ties togethe=
r.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The=
 SYSROOT_DEPS bit wasn&#39;t removed accidentally because the way the query=
-loaders script is executed has changed.=C2=A0 It used to be ran via SSTATE=
POSTINSTFUNCS so would execute the moment that gdk-pixbuf-native or librsvg=
-native was unpacked.=C2=A0 As sstate installation is top-down instead of b=
ottom-up this would generally mean that librsvg-native would be installed b=
efore even gdk-pixbuf-native was installed, and typically before stuff like=
 libpng-native or the rest of the stack.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">This was changed so that the SSTATEPOSTI=
NSTFUNC simply writes a sstate-completion script that is executed once all =
of sstate has been unpacked, so ordering isn&#39;t a problem. The logic to =
add explicit dependencies isn&#39;t required anymore.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Of course native dependenci=
es are not as neat as target dependencies which is something I&#39;d really=
 like to see fixed, but in general I can&#39;t understand why this happens =
for you: if gdk-pixbuf-native can be extracted from sstate then all of its =
dependencies must have been too, and they include recipes such as libxdmcp-=
native.=C2=A0 If the dependencies need a rebuild then gdk-pixbuf should nee=
d a rebuild too...</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">A full cooker log with the bug would be appreciated, but I kno=
w that&#39;s unlikely to happen!</div><span class=3D"m_7922029541788901824H=
OEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a114fc6c09888530540f2c47f--

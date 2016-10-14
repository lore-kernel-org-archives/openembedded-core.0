Return-Path: <krussell7711@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1EC60132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 09:56:01 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id e5so3918999ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 02:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=0c3NfFDhe2ErgbrkoIX8pVzPOIO6ROotGRxh2hYAFbI=;
	b=JPC1xwkTtVX+TaBWqmSHTWPTh/SB4wmBoXtb/A0Ki//zm5W/0UX4WSnhEzuYNarRVr
	4ziyUljH8JKnPfwZsxpeD9ifBPieXVmTXzOID7raJ9kI3PAWw3zo3q1Oyb7rqxQXJlhy
	tqCNa/rRCHjlWS9NAWlRYcnWXTt7KtMHCsbv5l+zDLZuGCtQ27EVVPv1Z7oIEDEuip5E
	i+cYdvhlfBjw/qoJ4MD4Ith0NSk/zc4JUJk69h9NLViresuEDHIz2V8RxRFFdjggZeJW
	AIW+kTTGZ3ZWdRJTdIoyLEueNWL7qtVZ15+8PlotsiraV5ypSinAEEV8LqYIEgaYtYw7
	AGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=0c3NfFDhe2ErgbrkoIX8pVzPOIO6ROotGRxh2hYAFbI=;
	b=SnfnbeFr3URcYZ++lqzIivZpbWf5l853JazHEpnGB/yI1NRd6mMrjZTwqniaLBGRjJ
	D+MQEle7++0/uZPs49SQKL6aU1rb1EGbhlj4LCtO17L1+Cgx70jw+5/Di2Y1jm903jTL
	f9tiUU/nQPsA90wu+7RlPaJJfAHl3BeHzOycq0pzktZZ9pIE56Kwb+btcw+Y2kmV+tOh
	/OKIWASYyEN+4EIz8UpntfmTvYUgl6vMU/Pc2XYLA2Q6Aq30OXUEG6JN9HPM8UbB6bJc
	y2CO4IHV9cenMh/jIFzRIn7r5D60bKtFmheHwTWnSYbXdroo64ufNAtzL+M75/GwrwqZ
	hW6w==
X-Gm-Message-State: AA6/9RlFKiBPJg3yEhEbJKzsFKTB8aDRaGJGoyRSciEcw93y+Ba1uBbINFMEc0Fc/UgmV7zZWjBjy4vuB270Fw==
X-Received: by 10.13.203.80 with SMTP id n77mr9497509ywd.220.1476438962765;
	Fri, 14 Oct 2016 02:56:02 -0700 (PDT)
MIME-Version: 1.0
Sender: krussell7711@gmail.com
Received: by 10.129.155.145 with HTTP; Fri, 14 Oct 2016 02:55:42 -0700 (PDT)
In-Reply-To: <CAJTo0LZa4z4zy-TT9z9=+Bq2SAsWd6NqFkgx+jrsNTNCMJqZLQ@mail.gmail.com>
References: <1476195437-24040-1-git-send-email-bkylerussell@gmail.com>
	<1476195437-24040-2-git-send-email-bkylerussell@gmail.com>
	<CAJTo0LahAKipF1Dz9TQw8TVM3vp361ZATtVPHjXy5ZupRDdZkQ@mail.gmail.com>
	<CAFrQVPPXkV_dy9G7qWhGNd-5AFY-pVhG33sYUjMVPupaXxyd1A@mail.gmail.com>
	<CAJTo0LZa4z4zy-TT9z9=+Bq2SAsWd6NqFkgx+jrsNTNCMJqZLQ@mail.gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Fri, 14 Oct 2016 05:55:42 -0400
X-Google-Sender-Auth: c8LU3NFxRL9tzvmmaRfYX4unpvw
Message-ID: <CAFrQVPMDPit+MZh47cUYef91vespyrh2X3_v9Edk2shXxin0aw@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 09:56:02 -0000
Content-Type: multipart/alternative; boundary=001a114829fce886e7053ed03bfe

--001a114829fce886e7053ed03bfe
Content-Type: text/plain; charset=UTF-8

Actually, we just hit another failure mode running with these two patches.
Again, we're currently running on the jethro branch.

g_module_open() failed for
/poky/build/tmp/sysroots/x86_64-linux/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-jpeg.so:
libjpeg.so.9: cannot open shared object file: No such file or directory

Looking at the build output itself, I was reminded of another signature of
this failure.  It seems like the do_populate_lice_setscene runs for the
package that should have provided libjpeg.so.9, but no
do_populate_sysroot_setscene.  I remember also seeing this on the other
failures I mentioned.

$ cat build-output.log | grep jpeg-native
NOTE: recipe jpeg-native-9a-r0: task do_populate_lic_setscene: Started
NOTE: recipe jpeg-native-9a-r0: task do_populate_lic_setscene: Succeeded

I can try to get the full cooker log from the build slave if you want.  Do
you mean the file from tmp/log/cooker/<machine>/?  If I can get it, how
would you prefer me send that to you?

On Thu, Oct 13, 2016 at 9:09 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 11 October 2016 at 17:44, Kyle Russell <bkylerussell@gmail.com> wrote:
>
>> I suspect this list may still not be entirely complete, because ldd shows
>> several dependencies for libpixbufloader-svg.so.  However, I'm not really
>> that familiar with all the dependencies going on here; we are definitely
>> seeing sporadic failures for various native libraries during the
>> pixbufcache postinst task though.  Best I could tell, it looked like the
>> PIXBUFCACHE_SYSROOT_DEPS functionality was accidentally removed from the
>> pixbufcache.bbclass a while back (hence, my first patch).  Adding that hunk
>> back in has seemed to help most of the failures, but we still see lingering
>> failures for pixman and libXdmcp on occasion.
>
>
> This bit of code is particularly tangled, so I'm hoping I can remember the
> details.  The AB just hit a related problem earlier in the week so I'm
> trying to remember how all this ties together.
>
> The SYSROOT_DEPS bit wasn't removed accidentally because the way the
> query-loaders script is executed has changed.  It used to be ran via
> SSTATEPOSTINSTFUNCS so would execute the moment that gdk-pixbuf-native or
> librsvg-native was unpacked.  As sstate installation is top-down instead of
> bottom-up this would generally mean that librsvg-native would be installed
> before even gdk-pixbuf-native was installed, and typically before stuff
> like libpng-native or the rest of the stack.
>
> This was changed so that the SSTATEPOSTINSTFUNC simply writes a
> sstate-completion script that is executed once all of sstate has been
> unpacked, so ordering isn't a problem. The logic to add explicit
> dependencies isn't required anymore.
>
> Of course native dependencies are not as neat as target dependencies which
> is something I'd really like to see fixed, but in general I can't
> understand why this happens for you: if gdk-pixbuf-native can be extracted
> from sstate then all of its dependencies must have been too, and they
> include recipes such as libxdmcp-native.  If the dependencies need a
> rebuild then gdk-pixbuf should need a rebuild too...
>
> A full cooker log with the bug would be appreciated, but I know that's
> unlikely to happen!
>
> Ross
>

--001a114829fce886e7053ed03bfe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Actually, we just hit another failure mode running with th=
ese two patches.=C2=A0 Again, we&#39;re currently running on the jethro bra=
nch.<div><br></div><div>g_module_open() failed for /poky/build/tmp/sysroots=
/x86_64-linux/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-jpeg.so=
: libjpeg.so.9: cannot open shared object file: No such file or directory<b=
r></div><div><br></div><div>Looking at the build output itself, I was remin=
ded of another signature of this failure.=C2=A0 It seems like the do_popula=
te_lice_setscene runs for the package that should have provided libjpeg.so.=
9, but no do_populate_sysroot_setscene.=C2=A0 I remember also seeing this o=
n the other failures I mentioned.</div><div><br></div><div><div>$ cat build=
-output.log | grep jpeg-native</div><div>NOTE: recipe jpeg-native-9a-r0: ta=
sk do_populate_lic_setscene: Started</div><div>NOTE: recipe jpeg-native-9a-=
r0: task do_populate_lic_setscene: Succeeded</div></div><div><br></div><div=
>I can try to get the full cooker log from the build slave if you want.=C2=
=A0 Do you mean the file from tmp/log/cooker/&lt;machine&gt;/?=C2=A0 If I c=
an get it, how would you prefer me send that to you?</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Oct 13, 2016 at 9:0=
9 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@inte=
l.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><sp=
an class=3D""><br><div class=3D"gmail_quote">On 11 October 2016 at 17:44, K=
yle Russell <span dir=3D"ltr">&lt;<a href=3D"mailto:bkylerussell@gmail.com"=
 target=3D"_blank">bkylerussell@gmail.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-l=
eft:1ex">I suspect this list may still not be entirely complete, because ld=
d shows several dependencies for libpixbufloader-svg.so.=C2=A0 However, I&#=
39;m not really that familiar with all the dependencies going on here; we a=
re definitely seeing sporadic failures for various native libraries during =
the pixbufcache postinst task though.=C2=A0 Best I could tell, it looked li=
ke the PIXBUFCACHE_SYSROOT_DEPS functionality was accidentally removed from=
 the pixbufcache.bbclass a while back (hence, my first patch).=C2=A0 Adding=
 that hunk back in has seemed to help most of the failures, but we still se=
e lingering failures for pixman and libXdmcp on occasion.</blockquote></div=
><br></span>This bit of code is particularly tangled, so I&#39;m hoping I c=
an remember the details.=C2=A0 The AB just hit a related problem earlier in=
 the week so I&#39;m trying to remember how all this ties together.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The SYSROOT_D=
EPS bit wasn&#39;t removed accidentally because the way the query-loaders s=
cript is executed has changed.=C2=A0 It used to be ran via SSTATEPOSTINSTFU=
NCS so would execute the moment that gdk-pixbuf-native or librsvg-native wa=
s unpacked.=C2=A0 As sstate installation is top-down instead of bottom-up t=
his would generally mean that librsvg-native would be installed before even=
 gdk-pixbuf-native was installed, and typically before stuff like libpng-na=
tive or the rest of the stack.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">This was changed so that the SSTATEPOSTINSTFUNC si=
mply writes a sstate-completion script that is executed once all of sstate =
has been unpacked, so ordering isn&#39;t a problem. The logic to add explic=
it dependencies isn&#39;t required anymore.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Of course native dependencies are not=
 as neat as target dependencies which is something I&#39;d really like to s=
ee fixed, but in general I can&#39;t understand why this happens for you: i=
f gdk-pixbuf-native can be extracted from sstate then all of its dependenci=
es must have been too, and they include recipes such as libxdmcp-native.=C2=
=A0 If the dependencies need a rebuild then gdk-pixbuf should need a rebuil=
d too...</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">A full cooker log with the bug would be appreciated, but I know that&#39=
;s unlikely to happen!</div><span class=3D"HOEnZb"><font color=3D"#888888">=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/font></span></div>
</blockquote></div><br></div>

--001a114829fce886e7053ed03bfe--

Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2B46378347
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:03:20 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id s37so25922345ioe.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 08:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HyFlyfKORscv60APwta5Y59Vk/Rw4l2E839my7JJP/o=;
	b=DzTBX/apIsyCfrOEBRUwDR7mjQKTM4dWpRtsC8hwkfuKYDYGLMzb+6cr1wx6zfDLBE
	L7+QI3h6v6KnwEzGC/9uz8IsxGLArzaOB9lUBhhrz3JM6gveRQyCne4TRvwzFukCqhgT
	HkhTUAP7SnCE7BfJsVcXfwsvbnQVxaZDu2PO+YM/dimigvaTxr58d2eSMQJaZC8O3/oF
	w61pcj6grpqx1F80R5y8yVXV5s0ADLZrMtLyGbEQ7jpZie6XDY9haoq69SD+QtRQleBU
	igGSb+G4VdfPx/Xs48JDAKnW5OFCWsShIQK1D8NbHI3xcj/psVDkrJczGkmsy2/nqV5H
	E/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HyFlyfKORscv60APwta5Y59Vk/Rw4l2E839my7JJP/o=;
	b=Ln1eOTSOBMmhvZrt8FkTvjkSrv1dIx69l3ogL484nAsL6gkvGCfkN1j4AtIwIRtjkz
	tknLW7CxCCDxxllIcs6wo524QUQCB4kyyhAuBiTO9vNlulM5tpwzGGEKBsr9lUhDnhQS
	CYKmwmqOGmVawEC3TZ9gVGwDMEaZ/IL8JeoOxK2XoJIogH646MJPyA/TqjBOcCp+LeGx
	8nMH3ciYNAVAAkRYpoomJ95sa8xUvD+b2g8vAx6OJ5D0mrfHNlJ8QZ1DQoNQnEh4Cvvp
	KndmuvO7yaJ+QPo4Gu9mRQ4fDa5Bh3CgdJe+Add2z0WIw+jU1x9actGpP3TTigmdRQe3
	WFeA==
X-Gm-Message-State: AJaThX4yt4E26qnB4oizeXw4Jaqrg0Ie6ecya1WXE5uN2gzjSMArKOQz
	9jpZer8wrapxW/IL96+CKEDbaRMhheTcIhfoNXw1sg==
X-Google-Smtp-Source: AGs4zMaZ8A6B2ox6DqVsoiBf5ucD7GSi46lWc8s/Jp2k569z3nbrn+eMhrMuLDIg+SNb5PtAqUdM9WbVeIJP6kIsPRI=
X-Received: by 10.107.47.1 with SMTP id j1mr36224584ioo.217.1511798601828;
	Mon, 27 Nov 2017 08:03:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Mon, 27 Nov 2017 08:03:01 -0800 (PST)
In-Reply-To: <CABcZANms469xJTfjSuRbmZpjJFBMKrsoJZ_zeHzSvgtjakPLcw@mail.gmail.com>
References: <cover.1477448814.git.hongxu.jia@windriver.com>
	<f1a7d03a68bf628db677027d48281c55f2b8dfba.1477448814.git.hongxu.jia@windriver.com>
	<CABcZANms469xJTfjSuRbmZpjJFBMKrsoJZ_zeHzSvgtjakPLcw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Nov 2017 16:03:01 +0000
Message-ID: <CAJTo0LYVTGCuJNAhC+WW8t62yMEp337Pibav0Em3ULtS61U=1Q@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] fontcache: fix fonts postinst failed
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
X-List-Received-Date: Mon, 27 Nov 2017 16:03:21 -0000
Content-Type: multipart/alternative; boundary="001a11377fbca2e1c4055ef90a24"

--001a11377fbca2e1c4055ef90a24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, that would be why I have this in a local branch:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/all=
arch

I rediscovered this on Friday...  personally I think my solution is better
as it's global instead of needing to be worked around in each place where
this can happen, but am open to debate on this.

Ross

On 27 November 2017 at 15:20, Christopher Larson <kergoth@gmail.com> wrote:

> On Tue, Oct 25, 2016 at 7:31 PM, Hongxu Jia <hongxu.jia@windriver.com>
> wrote:
>
>> While instal liberation-fonts to image, the fonts postinst
>> failed at do_rootfs time:
>> -----------------------------------------------
>> |WARNING: core-image-minimal-1.0-r0 do_rootfs: The postinstall intercept
>> hook
>> 'update_font_cache' failed (exit code: 139)! See log for details!
>> |WARNING: core-image-minimal-1.0-r0 do_rootfs: The postinstalls for the
>> following packages will be postponed for first boot: liberation-fonts
>> -----------------------------------------------
>>
>> Since the following commit applied in oe-core
>> -----------------------------------------------
>> commit ce1e7fcc60276040477c1d5e3129e029bb9f204b
>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Date:   Fri Sep 30 17:43:23 2016 +0100
>>
>>     allarch: Fixes to stop rebuilds when change multilibs
>> -----------------------------------------------
>> It assignes base_libdir=3D"/none" which caused fonts postinst failed at
>> do_rootfs.
>>
>> The fonts postinst invoke qemu to update font cache which requires
>> base_libdir arch relative(such as base_libdir=3D"/lib64").
>>
>> We refer what meta/conf/multilib.conf does, assign it with arch relative=
.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
>
> Without this, we get the mentioned warnings with every qemux86-64 or
> intel-corei7-64 build using our external toolchain. Were there any
> objections to merging this? It doesn=E2=80=99t seem as though it ever wen=
t in, but
> this was a year ago now.
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>

--001a11377fbca2e1c4055ef90a24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah, that would be why I have this in a local branch:<div><=
br></div><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-con=
trib/commit/?h=3Dross/allarch">http://git.yoctoproject.org/cgit/cgit.cgi/po=
ky-contrib/commit/?h=3Dross/allarch</a><br></div><div><br></div><div>I redi=
scovered this on Friday... =C2=A0personally I think my solution is better a=
s it&#39;s global instead of needing to be worked around in each place wher=
e this can happen, but am open to debate on this.</div><div><br></div><div>=
Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n 27 November 2017 at 15:20, Christopher Larson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span cla=
ss=3D"">On Tue, Oct 25, 2016 at 7:31 PM, Hongxu Jia <span dir=3D"ltr">&lt;<=
a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@win=
driver.com</a>&gt;</span> wrote:<br></span><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><span class=3D""><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">While=
 instal liberation-fonts to image, the fonts postinst<br>
failed at do_rootfs time:<br>
------------------------------<wbr>-----------------<br>
|WARNING: core-image-minimal-1.0-r0 do_rootfs: The postinstall intercept ho=
ok<br>
&#39;update_font_cache&#39; failed (exit code: 139)! See log for details!<b=
r>
|WARNING: core-image-minimal-1.0-r0 do_rootfs: The postinstalls for the<br>
following packages will be postponed for first boot: liberation-fonts<br>
------------------------------<wbr>-----------------<br>
<br>
Since the following commit applied in oe-core<br>
------------------------------<wbr>-----------------<br>
commit ce1e7fcc60276040477c1d5e3129e0<wbr>29bb9f204b<br>
Author: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation=
.org" target=3D"_blank">richard.purdie@linuxfoundatio<wbr>n.org</a>&gt;<br>
Date:=C2=A0 =C2=A0Fri Sep 30 17:43:23 2016 +0100<br>
<br>
=C2=A0 =C2=A0 allarch: Fixes to stop rebuilds when change multilibs<br>
------------------------------<wbr>-----------------<br>
It assignes base_libdir=3D&quot;/none&quot; which caused fonts postinst fai=
led at<br>
do_rootfs.<br>
<br>
The fonts postinst invoke qemu to update font cache which requires<br>
base_libdir arch relative(such as base_libdir=3D&quot;/lib64&quot;).<br>
<br>
We refer what meta/conf/multilib.conf does, assign it with arch relative.<b=
r>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;</blockquote><div><br></di=
v></span><div>Without this, we get the mentioned warnings with every qemux8=
6-64 or intel-corei7-64 build using our external toolchain. Were there any =
objections to merging this? It doesn=E2=80=99t seem as though it ever went =
in, but this was a year ago now.</div></div><span class=3D"HOEnZb"><font co=
lor=3D"#888888">-- <br><div class=3D"m_-1324916150860928660gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">=
Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEm=
bedded, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div>=
</div></div>
</font></span></div></div>
</blockquote></div><br></div>

--001a11377fbca2e1c4055ef90a24--

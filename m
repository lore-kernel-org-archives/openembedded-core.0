Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id E2CA4731D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 23:17:00 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id n143so48944178ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 16:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bGHDiBJS0jNmeM67SXV1bjyTU1PisFdtZzGwO6qKlV4=;
	b=suKSF2AxNAts53EheaixQaij6aK1usEIJI/NCf8gd+pmT8gAbahl6IgJAixAFj8pX+
	MiHkeLaHzUbqdlof4WknhsbRaOn0dNxle7b7K4VnknmEOm3ZvFYETiM8JIae+OpkV69a
	sZQFkWhTskaxSd8x2zWMIhtxSoFr+QBaf6rdF69v99BKdwaEG6dxDwWOhIRHKMBBNtlg
	B0c2WHR6N/d2VseQIWBtu/GIUZCAnjCvpzz4QpcQ1jDYYgJLcLYF/CXb1zpcP80LFiG2
	/8kYb155vh048yiATurKWT5x40HM+a2gwD11VMCxleP1eKOxSGPPgPbMiEJVPNo6gYiv
	wTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bGHDiBJS0jNmeM67SXV1bjyTU1PisFdtZzGwO6qKlV4=;
	b=QqC4lx/7mhYfHALQJbI8gjMqtixwkjyAZFdPIy37/OwCGEBzT4OEet0uP5o4DPnraJ
	qRdjYTAgtXE1v9qa3lG3KlvvgbeuUkAuohMfxL+8G8NRWc6TaI9CQUOs5pgFSE2y9pHs
	clBSKfd+aW6I2K8zBSO13ch3okDomijAkW1oOPa1Fzmhpce3g4vVanDjJZ5vNDMwfgU4
	juM348H9wCGTR9a9J0LWRL+lnZY2jkcjZAneGz2QwPEi9NiPhNMDwumwsEWXCWkhp7x+
	0miXKJPDMRT1MJ3lEdko5X5WchOencFQ1esP3xKprLnkh9hhXxrJyYYltRTkwX0qXGJC
	vBPA==
X-Gm-Message-State: AE9vXwOKhZNrTq3ix7vEPlk6KyYD2v2dZISbuKlDiwHvFD1YXOT1ufpQD4XEvO9BpgIhHgXRqwAaAZHiPTLcGzLs
X-Received: by 10.107.35.13 with SMTP id j13mr10797986ioj.189.1473895021259;
	Wed, 14 Sep 2016 16:17:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 14 Sep 2016 16:16:40 -0700 (PDT)
In-Reply-To: <CAP9ODKqJ3OwCsccW8Tgj19LDHt0TmZDOaugSJv3UhUSPY0TsGg@mail.gmail.com>
References: <1473856229-907-1-git-send-email-fabio.berton@ossystems.com.br>
	<CAP9ODKqJ3OwCsccW8Tgj19LDHt0TmZDOaugSJv3UhUSPY0TsGg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Sep 2016 00:16:40 +0100
Message-ID: <CAJTo0LZoFX8ne7Ahip-UOAoOj0d3mPq+rnXYHK7CDPC-gHE8ig@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] patchelf: Update to version 0.9
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
X-List-Received-Date: Wed, 14 Sep 2016 23:17:01 -0000
Content-Type: multipart/alternative; boundary=001a1140292a2dd8dc053c7fedf9

--001a1140292a2dd8dc053c7fedf9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Note that we're past M3 now, so this will have to wait until 2.3.

Ross

On 14 September 2016 at 15:25, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Wed, Sep 14, 2016 at 9:30 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> >  * Remove patch maxsize.patch already applied upstream.
> >
> >  * Add patch Skip-empty-section-fixes-66.patch to prevent errors like:
> >
> >   /
> >   |ERROR: go-cross-1.6.2-r0 do_populate_sysroot_setscene:
> '('patchelf-uninative',
> >   |'--set-interpreter', '/home/user/src/prj/build/tmp/
> sysroots-uninative/
> >   |x86_64-linux/lib/ld-linux-x86-64.so.2',
> '/home/user/src/prj/build/tmp/
> >   |work/x86_64-linux/go-cross/1.6.2-r0/sstate-install-
> populate_sysroot/x86_64-
> >   |linux/usr/bin/aarch64-prj-linux/go')'
> >   |failed with exit code 1 and the following output:
> >   |cannot find section .rela.dyn
> >   \
> >
> >   * Add patch handle-read-only-files.patch to fix error when building
> >     eSKD, the following error appears on task do_testsdkext
> >
> >   /
> >   |ERROR: db-native-6.0.30-r1 do_populate_sysroot_setscene:
> '('patchelf-uninative',
> >   |'--set-interpreter', 'src/fsl-community-bsp/build/
> tmp/work/qemuarm-poky-linux-
> >   |gnueabi/core-image-minimal/1.0-r0/testsdkext/tc/tmp/
> sysroots-uninative/
> >   |x86_64-linux/lib/ld-linux-x86-64.so.2', 'src/fsl-community-bsp/build=
/
> tmp/work/
> >   |qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/
> testsdkext/tc/tmp/work/
> >   |x86_64-linux/db-native/6.0.30-r1/sstate-install-populate_
> sysroot/x86_64-linux/
> >   |usr/bin/db_tuner')' failed with exit code 1 and the following output=
:
> >   |b'open: Permission denied\n
> >   \
> >
> >   * Add patch Increase-maxSize-to-64MB.patch to fix error described
> >   bellow, the same issue is discussed here:
> >     - https://github.com/NixOS/patchelf/issues/47
> >
> >   /
> >   |ERROR: qemu-native-2.5.0-r1 do_populate_sysroot_setscene:
> '('patchelf-uninative',
> >   |'--set-interpreter', '../build/tmp/sysroots-
> uninative/x86_64-linux/lib/
> >   |ld-linux-x86-64.so.2', '../build/tmp/work/x86_64-
> linux/qemu-native/2.5.0-r1/
> >   |sstate-install-populate_sysroot/x86_64-linux/usr/bin/qemu-mips64')'
> >   |failed with exit code 1 and the following output:
> >   |warning: working around a Linux kernel bug by creating a hole of
> 36032512
> >   |bytes in =E2=80=98../build/tmp/work/x86_64-linux/qemu-native/2.5.0-r=
1/
> >   |sstate-install-populate_sysroot/x86_64-linux/usr/bin/qemu-mips64=E2=
=80=99
> >   |maximum file size exceeded
> >   \
> >
> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140292a2dd8dc053c7fedf9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Note that we&#39;re past M3 now, so this will have to wait=
 until 2.3.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On 14 September 2016 at 15:25, Otavio Salvado=
r <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br"=
 target=3D"_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On=
 Wed, Sep 14, 2016 at 9:30 AM, Fabio Berton<br>
&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossystems=
.com.br</a><wbr>&gt; wrote:<br>
&gt;=C2=A0 * Remove patch maxsize.patch already applied upstream.<br>
&gt;<br>
&gt;=C2=A0 * Add patch Skip-empty-section-fixes-66.<wbr>patch to prevent er=
rors like:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/<br>
&gt;=C2=A0 =C2=A0|ERROR: go-cross-1.6.2-r0 do_populate_sysroot_setscene: &#=
39;(&#39;patchelf-uninative&#39;,<br>
&gt;=C2=A0 =C2=A0|&#39;--set-interpreter&#39;, &#39;/home/user/src/prj/buil=
d/tmp/<wbr>sysroots-uninative/<br>
&gt;=C2=A0 =C2=A0|x86_64-linux/lib/ld-linux-<wbr>x86-64.so.2&#39;, &#39;/ho=
me/user/src/prj/build/tmp/<br>
&gt;=C2=A0 =C2=A0|work/x86_64-linux/go-cross/1.<wbr>6.2-r0/sstate-install-<=
wbr>populate_sysroot/x86_64-<br>
&gt;=C2=A0 =C2=A0|linux/usr/bin/aarch64-prj-<wbr>linux/go&#39;)&#39;<br>
&gt;=C2=A0 =C2=A0|failed with exit code 1 and the following output:<br>
&gt;=C2=A0 =C2=A0|cannot find section .rela.dyn<br>
&gt;=C2=A0 =C2=A0\<br>
&gt;<br>
&gt;=C2=A0 =C2=A0* Add patch handle-read-only-files.patch to fix error when=
 building<br>
&gt;=C2=A0 =C2=A0 =C2=A0eSKD, the following error appears on task do_testsd=
kext<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/<br>
&gt;=C2=A0 =C2=A0|ERROR: db-native-6.0.30-r1 do_populate_sysroot_setscene: =
&#39;(&#39;patchelf-uninative&#39;,<br>
&gt;=C2=A0 =C2=A0|&#39;--set-interpreter&#39;, &#39;src/fsl-community-bsp/b=
uild/<wbr>tmp/work/qemuarm-poky-linux-<br>
&gt;=C2=A0 =C2=A0|gnueabi/core-image-minimal/1.<wbr>0-r0/testsdkext/tc/tmp/=
<wbr>sysroots-uninative/<br>
&gt;=C2=A0 =C2=A0|x86_64-linux/lib/ld-linux-<wbr>x86-64.so.2&#39;, &#39;src=
/fsl-community-bsp/build/<wbr>tmp/work/<br>
&gt;=C2=A0 =C2=A0|qemuarm-poky-linux-gnueabi/<wbr>core-image-minimal/1.0-r0=
/<wbr>testsdkext/tc/tmp/work/<br>
&gt;=C2=A0 =C2=A0|x86_64-linux/db-native/6.0.<wbr>30-r1/sstate-install-popu=
late_<wbr>sysroot/x86_64-linux/<br>
&gt;=C2=A0 =C2=A0|usr/bin/db_tuner&#39;)&#39; failed with exit code 1 and t=
he following output:<br>
&gt;=C2=A0 =C2=A0|b&#39;open: Permission denied\n<br>
&gt;=C2=A0 =C2=A0\<br>
&gt;<br>
&gt;=C2=A0 =C2=A0* Add patch Increase-maxSize-to-64MB.patch to fix error de=
scribed<br>
&gt;=C2=A0 =C2=A0bellow, the same issue is discussed here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- <a href=3D"https://github.com/NixOS/patchelf/issu=
es/47" rel=3D"noreferrer" target=3D"_blank">https://github.com/NixOS/<wbr>p=
atchelf/issues/47</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0/<br>
&gt;=C2=A0 =C2=A0|ERROR: qemu-native-2.5.0-r1 do_populate_sysroot_setscene:=
 &#39;(&#39;patchelf-uninative&#39;,<br>
&gt;=C2=A0 =C2=A0|&#39;--set-interpreter&#39;, &#39;../build/tmp/sysroots-<=
wbr>uninative/x86_64-linux/lib/<br>
&gt;=C2=A0 =C2=A0|ld-linux-x86-64.so.2&#39;, &#39;../build/tmp/work/x86_64-=
<wbr>linux/qemu-native/2.5.0-r1/<br>
&gt;=C2=A0 =C2=A0|sstate-install-populate_<wbr>sysroot/x86_64-linux/usr/bin=
/<wbr>qemu-mips64&#39;)&#39;<br>
&gt;=C2=A0 =C2=A0|failed with exit code 1 and the following output:<br>
&gt;=C2=A0 =C2=A0|warning: working around a Linux kernel bug by creating a =
hole of 36032512<br>
&gt;=C2=A0 =C2=A0|bytes in =E2=80=98../build/tmp/work/x86_64-<wbr>linux/qem=
u-native/2.5.0-r1/<br>
&gt;=C2=A0 =C2=A0|sstate-install-populate_<wbr>sysroot/x86_64-linux/usr/bin=
/<wbr>qemu-mips64=E2=80=99<br>
&gt;=C2=A0 =C2=A0|maximum file size exceeded<br>
&gt;=C2=A0 =C2=A0\<br>
&gt;<br>
&gt; Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossyste=
ms.com.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
<br>
</div></div>Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystem=
s.com.br">otavio@ossystems.com.br</a>&gt;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1140292a2dd8dc053c7fedf9--

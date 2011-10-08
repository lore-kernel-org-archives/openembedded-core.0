Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RCYTc-00026K-F4
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 17:06:12 +0200
Received: by pzd13 with SMTP id 13so13022649pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Oct 2011 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=t48mCgCkzEhbNU/v2OWGPOO6BcT87izJQHTgiZ+X8Rg=;
	b=WjYnolJbOePPgh+x74qk3hyC3d0rkGmUkCNLGAUHIBj/V+gL6ypvDcjG7Mlp3pZISm
	l7KPlPeUnPd9V8SWwBGR9EEohia9TAct3aYXihscH/q128imoDtdkv7bcf2PMkokGV6+
	WYd1dnr8bWh26qC90reAPRVm+Eo6axs9SmY9w=
MIME-Version: 1.0
Received: by 10.68.31.199 with SMTP id c7mr23021662pbi.73.1318086033231; Sat,
	08 Oct 2011 08:00:33 -0700 (PDT)
Received: by 10.68.49.129 with HTTP; Sat, 8 Oct 2011 08:00:33 -0700 (PDT)
In-Reply-To: <201110081556.38345.schnitzeltony@gmx.de>
References: <201110081543.11799.schnitzeltony@gmx.de>
	<201110081556.38345.schnitzeltony@gmx.de>
Date: Sat, 8 Oct 2011 08:00:33 -0700
Message-ID: <CAMKF1spn7bCDxwtV_r4pi34V_q0gcum6P+4sbfHQPs76CuXegg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: tiff compile fails
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Oct 2011 15:06:12 -0000
Content-Type: multipart/alternative; boundary=bcaec520ecdbcb513e04aecad1c6

--bcaec520ecdbcb513e04aecad1c6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Saturday, October 8, 2011, Andreas M=C3=BCller <schnitzeltony@gmx.de> wr=
ote:
> On Saturday, October 08, 2011 03:43:11 PM Andreas M=C3=BCller wrote:
>> With latest git pull for oe-core/meta-oe... & clean build dir I get
>>
>> | arm-angstrom-linux-gnueabi-libtool: compile:  ccache
arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -fno-tree-vectorize
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8
-mthumb-interwork -mno-thumb
--sysroot=3D/home/Superandy/tmp/oe-core-eglibc/sysroots/overo -DHAVE_CONFIG=
_H
-I. -O2 -pipe -g -feliminate-unused-debug-types -fpermissive
-fvisibility-inlines-hidden -fvisibility-inlines-hidden -MT tif_stream.lo
-MD -MP -MF .deps/tif_stream.Tpo -c tif_stream.cxx  -fPIC -DPIC -o
.libs/tif_stream.o
>> | tif_stream.cxx:31:20: fatal error: iostream: No such file or directory
>> | compilation terminated.
>> | make[2]: *** [tif_stream.lo] Error 1
>>
>> I think it is not tiff to blame - but which one is it?
>>
> In tiff's config.log I find
>
> Configured with: ... --with-gxx-include-dir=3D/usr/include/c++ ...
>

Seems that libstdc++ headers are not installed or compiler is not finding
then
Try a small hello.cc example and include iostream see if that compiles fine
with
Your g++

> Hmm
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec520ecdbcb513e04aecad1c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, October 8, 2011, Andreas M=C3=BCller &lt;<a href=3D"ma=
ilto:schnitzeltony@gmx.de">schnitzeltony@gmx.de</a>&gt; wrote:<br>&gt; On S=
aturday, October 08, 2011 03:43:11 PM Andreas M=C3=BCller wrote:<br>&gt;&gt=
; With latest git pull for oe-core/meta-oe... &amp; clean build dir I get<b=
r>
&gt;&gt;<br>&gt;&gt; | arm-angstrom-linux-gnueabi-libtool: compile: =C2=A0c=
cache arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -fno-tree-vectorize -=
mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -mthu=
mb-interwork -mno-thumb --sysroot=3D/home/Superandy/tmp/oe-core-eglibc/sysr=
oots/overo -DHAVE_CONFIG_H -I. -O2 -pipe -g -feliminate-unused-debug-types =
-fpermissive -fvisibility-inlines-hidden -fvisibility-inlines-hidden -MT ti=
f_stream.lo -MD -MP -MF .deps/tif_stream.Tpo -c tif_stream.cxx =C2=A0-fPIC =
-DPIC -o .libs/tif_stream.o<br>
&gt;&gt; | tif_stream.cxx:31:20: fatal error: iostream: No such file or dir=
ectory<br>&gt;&gt; | compilation terminated.<br>&gt;&gt; | make[2]: *** [ti=
f_stream.lo] Error 1<br>&gt;&gt;<br>&gt;&gt; I think it is not tiff to blam=
e - but which one is it?<br>
&gt;&gt;<br>&gt; In tiff&#39;s config.log I find<br>&gt;<br>&gt; Configured=
 with: ... --with-gxx-include-dir=3D/usr/include/c++ ...<br>&gt;<br><br>See=
ms that libstdc++ headers are not installed or compiler is not finding then=
<br>
Try a small hello.cc example and include iostream see if that compiles fine=
 with<br>Your g++<br><br>&gt; Hmm<br>&gt;<br>&gt; _________________________=
______________________<br>&gt; Openembedded-core mailing list<br>&gt; <a hr=
ef=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@li=
sts.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--bcaec520ecdbcb513e04aecad1c6--

Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 14DD2748CC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 22:05:21 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id a137-v6so16764743wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dCsN8c5xOyV+5YpZ8dTHz0eIJcbqclJsCQKh19Ugbt0=;
	b=MJ3vLAGVAhyqwM2l7tBd+/F/vRVFlasMpxZsdD00FEsZwY3Py9Lw+OsYwk+OGimsf6
	wDRWIcZAJjycYzXel00V/gzdnXOWZhfa0pjMS2kd7w74wK7roT6r1A531+jXxq0ZV/+m
	fshLa3hGMWQLa5xbB1KSQ61s0exuUA6JJ+uyqKUZDt2cgOqk+A61bHeXkQxwKYNxotPx
	gKND2ZBLOiF1hQpqXrS3IasXzU2Ck/g8TgL3DHt5oUTxJXhhgJgGhCckS7SX5KgbQi4Z
	ylYgFCC1llKYkImMLr4IFJNfXMTk7pqmTBGKUAv/TbZfkmSEnFlsjM0HmZ51JjBM313J
	yF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dCsN8c5xOyV+5YpZ8dTHz0eIJcbqclJsCQKh19Ugbt0=;
	b=Uy7QgqdnbV9CG2cFpx9F3ersL9yB/SnAzCMhJvoxolgTByBieq1kCzpE3CoIruDi5h
	vDbw5lwecBbdiGYz+Ls7Cn0W8kOLYTXhJhk6Zm+v1faBN+OlzjNI6xQXQ4/bFLTU7Xys
	CWjZXRubOqbtvdBDTJ6Cqp3ptUsHsdK1DZMLqF1wML5t9zVUxY1WAsSzSnUhCubdTb4y
	6gqwxwThbdY/dyVbqUGIxP7bZbYT3ZoK91xR4FHDhUpntZ3mn7CFC/woKEf/pJ2S2M7T
	vVi4FZS4c79J/zKJ2HX9L7T+SZbMKkZwngJcNRpa+Syz9L+vaHaxXSb6nOS94f0/xLwI
	sxgg==
X-Gm-Message-State: ALQs6tAMUrA26VqDaPTDqHTdvpkMFPqWfx/RmVP+xBLk8b1S5fhfcQAG
	4a9pQmkqoUoJPnuYe7rJW655mR2UHP4yeH3LuMF5iw==
X-Google-Smtp-Source: AB8JxZpeGgeuZSvBp6LhhmmRIecv8nhxwYA/yZf84TSsQxqrCMMBxoOhUdj9g396kPYZGGmNUNoD8vmgrFdJwv1ozBg=
X-Received: by 2002:aa7:c309:: with SMTP id
	l9-v6mr19163282edq.304.1525730722501; 
	Mon, 07 May 2018 15:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAEQ58sjQvtnCH1h20y8D6H3NVSbnCTqLe=pSLj6X8=xTL6KWbQ@mail.gmail.com>
	<CY4PR02MB3334657A081A9A23510452D1AC860@CY4PR02MB3334.namprd02.prod.outlook.com>
	<CAEQ58sj_699mSB4zaZ2e6APP7aKR2siZ7+j3qyxfCanPNZSgDw@mail.gmail.com>
	<3ad68764-e349-9816-b579-b335f3724ba4@xilinx.com>
In-Reply-To: <3ad68764-e349-9816-b579-b335f3724ba4@xilinx.com>
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Mon, 07 May 2018 22:05:11 +0000
Message-ID: <CAEQ58sgLobMz9+vqPQJsL8YMviZCDivVHVqm6LhiyrkRNHD+Cw@mail.gmail.com>
To: alejandro.enedino.hernandez-samaniego@xilinx.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: python recipes with extensions fail to find/link with proper libraries
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
X-List-Received-Date: Mon, 07 May 2018 22:05:22 -0000
Content-Type: multipart/alternative; boundary="000000000000bcd9f0056ba4ddc3"

--000000000000bcd9f0056ba4ddc3
Content-Type: text/plain; charset="UTF-8"

Hi Alejandro,

Thank you for your support. I will try to explain better the situation. I
can attach the recipes but it is useless, the problem is not at recipe
level.

python3-numpy has an optional dependency on BLAS interface, and openblas is
an implementation of that interface.
python3-scipy has a mandatory dependency on BLAS interface, and openblas is
an implementation of that interface.

So, as simple as it seems, I added a python3-numpy_%.bbappend with
DEPENDS += "openblas".

Given the fact that openblas has a lot of issues when cross compiling, I
compiled it separately on the target (Raspberry Pi 3) and then the built
package has been tar'ed and gzip'ed.

After this step, I wrote a simple recipe (openblas.bb) which install as
binary files the content of the aforementioned tar archive (obviously
setting the compatible machine with arm only). At the end of the day, this
is just a not-so-clever hack to have a working openblas on the target,
including -dev packages.

After all this effort, I expected the job to be done: given that, after my
append file, the python3-numpy recipe depends on openblas, it will be
scheduled only after openblas.
At that point, given that the recipe for python3-numpy has access to the
include files and the library development files, I expect that running
setup.py would suffice in order to find & link the python C extensions to
openblas.
Unfortunately, given that the setup.py script is executed by the
python3-native package, the path the interpreter is searching for the
native libraries are not the ones for the sys root... And thus when
setup.py searches for libopenblas.so(arm) it will fail as openblas is not
deployed on x86_64 (native) variant.

Sorry for the very long mail, but I hope that the scenario is now clearer.

Long story short, python setuptools is failing to find correct libraries
for the target, and is searching for them in the native path, where it
won't find them. (Look at my first email with log attached).

Thanks,
Francesco Giancane


Il giorno lun 7 mag 2018 alle ore 23:28 Alejandro Enedino Hernandez
Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com> ha scritto:

> Hello Francesco,
>
>
> Please hit the reply-all button, otherwise I wont be getting notified when
> you reply.
>
>
> I think you're doing something very specific since you're building on
> target and tweaking the build system so to help you more I would need to
> take a look at the recipes you are using.
>
>
> Alejandro
>
> On 05/04/2018 01:19 AM, Francesco Giancane wrote:
>
> Hi Alejandro,
>
> Thank you for your response.
> I know that openblas recipe is a pain, given that its Makefile is not
> correctly written with respect to cross-compilation. However, the library
> has been built locally on the target (sigh!) and then it is being deployed
> with a recipe which unpacks the built binary and copy them into the sys
> root.
>
> So, from the openblas side, everything is OK.
>
> What is actually wrong is the configuration step for python3-numpy and
> python3-scipy: in the setup.py they are instructed to search for some
> libraries (namely, openblas amongst them) but they fail to search for them
> given that the path they are searching for is the sysroot-native, rather
> than sysroot. (you can see it clearly from the logs attached in the first
> message).
>
> Installing the packages using pip3 install scipy numpy on the target
> results on a correct execution (and libraries are properly found and
> linked).
>
> Thank you,
> Francesco Giancane
>
>
>
>
> Il giorno ven 4 mag 2018 alle ore 03:01 Alejandro Enedino Hernandez
> Samaniego <alejandr@xilinx.com> ha scritto:
>
>> Hello Francesco,
>>
>>
>>
>> It would be helpful if you could provide more information about this,
>> e.g. access to your layer or your recipes, to make sure they are actually
>> being built correctly, also I would start by manually linking it against
>> the built library to see if the error is just not having them on the
>> correct path, but I seem to remember a lot of issues when trying to cross
>> compile openblas, specially for an arm MACHINE.
>>
>>
>>
>> Alejandro
>>
>>
>>
>> *From:* openembedded-core-bounces@lists.openembedded.org [mailto:
>> openembedded-core-bounces@lists.openembedded.org] *On Behalf Of *Francesco
>> Giancane
>> *Sent:* Wednesday, May 2, 2018 2:33 PM
>> *To:* OE-core <openembedded-core@lists.openembedded.org>
>> *Subject:* [OE-core] python recipes with extensions fail to find/link
>> with proper libraries
>>
>>
>>
>> Hi Everyone,
>>
>> I found a problem working with python(3) and C extensions.
>>
>>
>>
>> The use-case is the recipe for python(3)-numpy, which can be linked
>> against a BLAS/LAPACK library to use accelerated matricial and vectorial
>> operations.
>>
>>
>>
>> As it is currently shipped, the recipe fails to find any proper library
>> and then does not use extensions.
>>
>>
>>
>> I wrote a custom recipe for openblas which is correctly built & deploy
>> using standard commands.
>>
>> openblas is also added as a DEPENDS in a bbappend file for numpy.
>>
>>
>>
>> However, the do_compile phase cannot find the aforementioned library.
>>
>>
>>
>> Log attached:
>>
>>
>>
>> DEBUG: Executing shell function do_compile
>>
>> blas_opt_info:
>>
>> blas_mkl_info:
>>
>> customize UnixCCompiler
>>
>>   libraries mkl_rt not found in
>> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>>
>>   NOT AVAILABLE
>>
>>
>>
>> blis_info:
>>
>> customize UnixCCompiler
>>
>>   libraries blis not found in
>> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>>
>>   NOT AVAILABLE
>>
>>
>>
>> openblas_info:
>>
>> customize UnixCCompiler
>>
>> customize UnixCCompiler
>>
>>   libraries openblas not found in
>> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>>
>>   NOT AVAILABLE
>>
>>
>>
>> atlas_3_10_blas_threads_info:
>>
>> Setting PTATLAS=ATLAS
>>
>> customize UnixCCompiler
>>
>>   libraries tatlas not found in
>> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>>
>>   NOT AVAILABLE
>>
>>
>>
>> atlas_3_10_blas_info:
>>
>> customize UnixCCompiler
>>
>>   libraries satlas not found in
>> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>>
>>   NOT AVAILABLE
>>
>>
>>
>> atlas_blas_threads_info:
>>
>> Setting PTATLAS=ATLAS
>>
>> customize UnixCCompiler
>>
>>   libraries ptf77blas,ptcblas,atlas not found in
>> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>>
>>   NOT AVAILABLE
>>
>>
>>
>> atlas_blas_info:
>>
>> customize UnixCCompiler
>>
>>   libraries f77blas,cblas,atlas not found in
>> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>>
>>   NOT AVAILABLE
>>
>>
>>
>> blas_info:
>>
>> customize UnixCCompiler
>>
>>   libraries blas not found in
>> ['/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib']
>>
>>   NOT AVAILABLE
>>
>>
>>
>> blas_src_info:
>>
>>   NOT AVAILABLE
>>
>>
>>
>>   NOT AVAILABLE
>>
>>
>>
>> ...And it is correct for it to fail as it is searching for openblas in
>> the wrong path (sysroot-native vs sysroot).
>>
>>
>>
>> I would assume that this is a setuptools.bbclass issue, does anyone know
>> what to do? Is it trivial to fix?
>>
>>
>>
>> I noticed that all the shipped python extensions were built as if we were
>> building for x86, even though the MACHINE is an arm target.
>>
>>
>>
>> Thank you for your attention,
>>
>>
>> Francesco Giancane
>>
>>
>>
>
>

--000000000000bcd9f0056ba4ddc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alejandro,<div><br></div><div>Thank you for your suppor=
t. I will try to explain better the situation. I can attach the recipes but=
 it is useless, the problem is not at recipe level.</div><div><br></div><di=
v>python3-numpy has an optional dependency on BLAS interface, and openblas =
is an implementation of that interface.</div><div>python3-scipy has a manda=
tory dependency on BLAS interface, and openblas is an implementation of tha=
t interface.</div><div><br></div><div>So, as simple as it seems, I added a =
python3-numpy_%.bbappend with DEPENDS=C2=A0+=3D &quot;openblas&quot;.</div>=
<div><br></div><div>Given the fact that openblas has a lot of issues when c=
ross compiling, I compiled it separately on the target (Raspberry Pi 3) and=
 then the built package has been tar&#39;ed and gzip&#39;ed.</div><div><br>=
</div><div>After this step, I wrote a simple recipe (<a href=3D"http://open=
blas.bb">openblas.bb</a>) which install as binary files the content of the =
aforementioned tar archive (obviously setting the compatible machine with a=
rm only). At the end of the day, this is just a not-so-clever hack to have =
a working openblas on the target, including -dev packages.</div><div><br></=
div><div>After all this effort, I expected the job to be done: given that, =
after my append file, the python3-numpy recipe depends on openblas, it will=
 be scheduled only after openblas.</div><div>At that point, given that the =
recipe for python3-numpy has access to the include files and the library de=
velopment files, I expect that running setup.py would suffice in order to f=
ind &amp; link the python C extensions to openblas.</div><div>Unfortunately=
, given that the setup.py script is executed by the python3-native package,=
 the path the interpreter is searching for the native libraries are not the=
 ones for the sys root... And thus when setup.py searches for libopenblas.s=
o(arm) it will fail as openblas is not deployed on x86_64 (native) variant.=
</div><div><br></div><div>Sorry for the very long mail, but I hope that the=
 scenario is now clearer.</div><div><br></div><div>Long story short, python=
 setuptools is failing to find correct libraries for the target, and is sea=
rching for them in the native path, where it won&#39;t find them. (Look at =
my first email with log attached).</div><div><br></div><div>Thanks,</div><d=
iv><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">Fra=
ncesco Giancane</div></div></div></div></div></div></div><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr">Il giorno lun 7 mag 2018 alle=
 ore 23:28 Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailto:alej=
andro.enedino.hernandez-samaniego@xilinx.com">alejandro.enedino.hernandez-s=
amaniego@xilinx.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p>Hello Francesco,</p>
    <p><br>
    </p>
    <p>Please hit the reply-all button, otherwise I wont be getting
      notified when you reply.</p>
    <p><br>
    </p>
    <p>I think you&#39;re doing something very specific since you&#39;re
      building on target and tweaking the build system so to help you
      more I would need to take a look at the recipes you are using.<br>
    </p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <br>
    <div class=3D"m_7470399816009918527moz-cite-prefix">On 05/04/2018 01:19=
 AM, Francesco
      Giancane wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Hi Alejandro,
        <div><br>
        </div>
        <div>Thank you for your response.</div>
        <div>I know that openblas recipe is a pain, given that its
          Makefile is not correctly written with respect to
          cross-compilation. However, the library has been built locally
          on the target (sigh!) and then it is being deployed with a
          recipe which unpacks the built binary and copy them into the
          sys root.</div>
        <div><br>
        </div>
        <div>So, from the openblas side, everything is OK.</div>
        <div><br>
        </div>
        <div>What is actually wrong is the configuration step for
          python3-numpy and python3-scipy: in the setup.py they are
          instructed to search for some libraries (namely, openblas
          amongst them) but they fail to search for them given that the
          path they are searching for is the sysroot-native, rather than
          sysroot. (you can see it clearly from the logs attached in the
          first message).</div>
        <div><br>
        </div>
        <div>Installing the packages using pip3 install scipy numpy on
          the target results on a correct execution (and libraries are
          properly found and linked).</div>
        <div><br>
        </div>
        <div>Thank you,</div>
        <div>
          <div>
            <div dir=3D"ltr" class=3D"m_7470399816009918527gmail_signature"=
 data-smartmail=3D"gmail_signature">
              <div dir=3D"ltr">
                <div dir=3D"ltr">
                  <div>
                    <div dir=3D"ltr">Francesco Giancane</div>
                    <div dir=3D"ltr"><br>
                    </div>
                  </div>
                  <div><dl><dd style=3D"margin:0px;padding:0px;border:0px;f=
ont-style:inherit;font-family:inherit;vertical-align:top;line-height:inheri=
t;display:inline-block"><span style=3D"margin:0px;padding:0px;border:0px;fo=
nt-style:inherit;font-family:inherit;vertical-align:baseline;line-height:in=
herit;direction:ltr"><br>
                      </span></dd></dl>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr">Il giorno ven 4 mag 2018 alle ore 03:01 Alejandro
          Enedino Hernandez Samaniego &lt;<a href=3D"mailto:alejandr@xilinx=
.com" target=3D"_blank">alejandr@xilinx.com</a>&gt;
          ha scritto:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
          <div link=3D"#0563C1" vlink=3D"#954F72" lang=3D"EN-US">
            <div class=3D"m_7470399816009918527m_-8611667753301666364WordSe=
ction1">
              <p class=3D"MsoNormal">Hello Francesco,</p>
              <p class=3D"MsoNormal">=C2=A0</p>
              <p class=3D"MsoNormal">It would be helpful if you could
                provide more information about this, e.g. access to your
                layer or your recipes, to make sure they are actually
                being built correctly, also I would start by manually
                linking it against the built library to see if the error
                is just not having them on the correct path, but I seem
                to remember a lot of issues when trying to cross compile
                openblas, specially for an arm MACHINE.</p>
              <p class=3D"MsoNormal">=C2=A0</p>
              <p class=3D"MsoNormal">Alejandro</p>
              <p class=3D"MsoNormal"><a name=3D"m_7470399816009918527_m_-86=
11667753301666364__MailEndCompose">=C2=A0</a></p>
              <span></span>
              <p class=3D"MsoNormal"><b>From:</b> <a href=3D"mailto:openemb=
edded-core-bounces@lists.openembedded.org" target=3D"_blank">openembedded-c=
ore-bounces@lists.openembedded.org</a>
                [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.o=
penembedded.org" target=3D"_blank">openembedded-core-bounces@lists.openembe=
dded.org</a>]
                <b>On Behalf Of </b>Francesco Giancane<br>
                <b>Sent:</b> Wednesday, May 2, 2018 2:33 PM<br>
                <b>To:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@=
lists.openembedded.org" target=3D"_blank">openembedded-core@lists.openembed=
ded.org</a>&gt;<br>
                <b>Subject:</b> [OE-core] python recipes with extensions
                fail to find/link with proper libraries</p>
              <p class=3D"MsoNormal">=C2=A0</p>
              <div>
                <p class=3D"MsoNormal">Hi Everyone,</p>
                <div>
                  <p class=3D"MsoNormal">I found a problem working with
                    python(3) and C extensions.</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">=C2=A0</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">The use-case is the recipe for
                    python(3)-numpy, which can be linked against a
                    BLAS/LAPACK library to use accelerated matricial and
                    vectorial operations.</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">=C2=A0</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">As it is currently shipped, the
                    recipe fails to find any proper library and then
                    does not use extensions.</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">=C2=A0</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">I wrote a custom recipe for
                    openblas which is correctly built &amp; deploy using
                    standard commands.</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">openblas is also added as a
                    DEPENDS in a bbappend file for numpy.</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">=C2=A0</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">However, the do_compile phase
                    cannot find the aforementioned library.</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">=C2=A0</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">Log attached:</p>
                </div>
                <div>
                  <p class=3D"MsoNormal">=C2=A0</p>
                </div>
                <div>
                  <div>
                    <p class=3D"MsoNormal">DEBUG: Executing shell function
                      do_compile</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">blas_opt_info:</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">blas_mkl_info:</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 libraries mkl_rt not foun=
d in
[&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnue=
abi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">blis_info:</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 libraries blis not found =
in
[&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnue=
abi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">openblas_info:</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 libraries openblas not fo=
und
                      in
[&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnue=
abi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">atlas_3_10_blas_threads_info:</p=
>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">Setting PTATLAS=3DATLAS</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 libraries tatlas not foun=
d in
[&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnue=
abi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">atlas_3_10_blas_info:</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 libraries satlas not foun=
d in
[&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnue=
abi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">atlas_blas_threads_info:</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">Setting PTATLAS=3DATLAS</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 libraries
                      ptf77blas,ptcblas,atlas not found in
[&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnue=
abi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">atlas_blas_info:</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 libraries f77blas,cblas,a=
tlas
                      not found in
[&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnue=
abi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">blas_info:</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">customize UnixCCompiler</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 libraries blas not found =
in
[&#39;/home/fgp/poky/rpi3_64/tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnue=
abi/python3-numpy/1.14.2-r0/recipe-sysroot-native/usr/lib&#39;]</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">blas_src_info:</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0 NOT AVAILABLE</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">...And it is correct for it to
                      fail as it is searching for openblas in the wrong
                      path (sysroot-native vs sysroot).</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">I would assume that this is a
                      setuptools.bbclass issue, does anyone know what to
                      do? Is it trivial to fix?</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">I noticed that all the shipped
                      python extensions were built as if we were
                      building for x86, even though the MACHINE is an
                      arm target.</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">=C2=A0</p>
                  </div>
                  <div>
                    <p class=3D"MsoNormal">Thank you for your attention,</p=
>
                  </div>
                  <div>
                    <p class=3D"MsoNormal"><br clear=3D"all">
                    </p>
                    <div>
                      <div>
                        <div>
                          <div>
                            <div>
                              <div>
                                <p class=3D"MsoNormal">Francesco Giancane</=
p>
                              </div>
                            </div>
                            <div>
                              <p class=3D"MsoNormal" style=3D"margin-left:.=
5in;vertical-align:top"><span style=3D"font-family:&quot;inherit&quot;,seri=
f">=C2=A0</span></p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--000000000000bcd9f0056ba4ddc3--

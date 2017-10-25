Return-Path: <shubhabrata.sen@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 361AD60621
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 14:48:11 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id y23so299683qkb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RsJOGyupgdckQRjaJaFz2GcIu2dBuClXyqDNNfYSOlA=;
	b=XnNCcYhXBzP57PCxOXi6+UbRtBOknN+Bz+O+Z+7faveHyr6KOhu7VMDsO5+bpXZIRS
	d9friCbIbLbapCriztaC7dR0OHgJ8tP1QA+G9S0QEw+R1DgFKnh/FOAVbQQ2VQv+ddlR
	b4Xw+4IdCugV/CN24KTj0nVp1HklWeJcwKAtFVkeQ0QVnrFm8fJAir/+ePE5pIgRx/ND
	U+vnRu40E2X37Ny33Ke9WLe6lKAdHBrgA4GwTUc5jAAYY7vAsZrvQET3QxMF+91PhJtn
	yXmIL4mzhka2ZDR+XrBwsqVg1fODoFKNNnN/LaUBbzNcuey4wumvyf22j5+4NWryVe2V
	VMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RsJOGyupgdckQRjaJaFz2GcIu2dBuClXyqDNNfYSOlA=;
	b=n7OpcAcQhUf/mLENeK3szS2b3vGLNjrqxY3UlT79JuyGbF8Sse3D4LzBRzsi+0Llsq
	z55hQIUa8GYjldIFUOKz66eaIZ3p8EKXqFRsCddb3eqA4ZwlLGRezDCnnZnsSEivcWSd
	SdHfrmnARNGy+0X0x5wBuowyqYJSvGj0me5uAbuNZurbOrJdeBaUCOIDi5RHtsT8Mpfz
	AwOWUyDH9vpEMulAMgUJyhx0Mc17f2juZjhnEt0IZe5fgBiS5US3WIptZ21RDDf1CHoa
	1uB7TofOSFU3a2R/F+wd8Nt62RaIJBItDFibd3/S5QsWfXefTYNoV5YZZPaMuro4/ucQ
	ZQkA==
X-Gm-Message-State: AMCzsaXmsnr5Zd1ZnlxTnhwaad7gy7eoD2RP46wbi3M9V0YqPmq3Yv9p
	2QNnwo36+MIABpVu1gEc4gcQin3qrwpEGJ8DPsY=
X-Google-Smtp-Source: ABhQp+TB/2fKeygYHYGZW7vYABk680qaQgzcxRHTitNt9dT5DZJhpntqwJdu1KlEfDLXrlggOdhNHWlgdfM9ODy426A=
X-Received: by 10.55.107.3 with SMTP id g3mr3350050qkc.24.1508942893094; Wed,
	25 Oct 2017 07:48:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.35.52 with HTTP; Wed, 25 Oct 2017 07:48:12 -0700 (PDT)
In-Reply-To: <CA+chaQdWrh9Xe=QP31AnAxbShOQNDx4yjQ9xJTZbDqUq1e=uww@mail.gmail.com>
References: <CA+jxWbeubv1tSJLXs5v6wP0do_+jzgepSMc2okvj4imip=+yjA@mail.gmail.com>
	<CA+chaQfdT_wySFELWqaDtMC3Q-1k6MQ-0ApnwZEHmAPzvuMWcA@mail.gmail.com>
	<CA+jxWbfRDk9Fms1QtAQ6y1HQ-uVzE2Pwt_NZ8RiZC8jkMohj0w@mail.gmail.com>
	<CA+chaQdWrh9Xe=QP31AnAxbShOQNDx4yjQ9xJTZbDqUq1e=uww@mail.gmail.com>
From: shubhabrata sen <shubhabrata.sen@gmail.com>
Date: Wed, 25 Oct 2017 16:48:12 +0200
Message-ID: <CA+jxWbf+PRx5WFLu=u8RYV518ciHtUwA2mj-Y2TtKPD_y8rzKA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Swig dependency error while building firmware with apparmor
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
X-List-Received-Date: Wed, 25 Oct 2017 14:48:12 -0000
Content-Type: multipart/alternative; boundary="001a1148716a2126a3055c60252a"

--001a1148716a2126a3055c60252a
Content-Type: text/plain; charset="UTF-8"

It works perfectly now. Thanks a lot !! Really appreciate the help.

On Wed, Oct 25, 2017 at 2:15 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> swig-native builds swig for your host system, so that it can be executed
> during the build. So your apparmor configure most likely searches for swig
> in PATH and swig-native dependency will make sure it's there.
>
> On Wed, Oct 25, 2017, 13:56 shubhabrata sen <shubhabrata.sen@gmail.com>
> wrote:
>
>> Hi Martin,
>>
>> Thank you for your reply. Could you please give a bit more details about
>> this ? I'm relatively new to the openembedded environment.
>>
>> On Wed, Oct 25, 2017 at 12:28 PM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>> you probably want swig-native dependency.
>>>
>>> On Wed, Oct 25, 2017, 11:09 shubhabrata sen <shubhabrata.sen@gmail.com>
>>> wrote:
>>>
>>>> Hi,
>>>>
>>>> I'm trying to build a firmware with the apparmor recipe and I keep
>>>> getting the following error
>>>>
>>>> *checking for swig... no*
>>>> | checking whether the libapparmor debug output should be enabled... no
>>>> | checking whether the libapparmor man pages should be generated... yes
>>>> | checking for podchecker... podchecker
>>>> | checking for pod2man... pod2man
>>>> | checking whether python bindings are enabled... yes
>>>> *| configure: error: swig is required when enabling python bindings*
>>>> | WARNING: /home/shubhabs/dists/cvp/builds/p1367/tmp/work/
>>>> cortexa9hf-neon-poky-linux-gnueabi/apparmor/2.10.95-r0/temp/run.do_configure.8464:1
>>>> exit 1 from 'PERL="${PERL}" PYTHON="/home/shubhabs/dists/
>>>> cvp/builds/p1367/tmp/work/cortexa9hf-neon-poky-linux-
>>>> gnueabi/apparmor/2.10.95-r0/recipe-sysroot-native/usr/bin/python-native/python"
>>>> ./configure --build=x86_64-linux --host=arm-poky-linux-gnueabi
>>>> --target=arm-poky-linux-gnueabi --prefix=/usr --libdir=/usr/lib
>>>> --mandir=/usr/share/man --includedir=/usr/include --with-perl --with-python'
>>>>
>>>> I've included the SWIG recipe in the build and I can successfully build
>>>> the firmware including swig with the bitbake command but somehow the
>>>> apparmor recipe can't find the swig package. Any help regarding this would
>>>> be appreciated.
>>>>
>>>> Thanks
>>>>
>>>> Shubh
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>
>>

--001a1148716a2126a3055c60252a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It works perfectly now. Thanks a lot !! Really appreciate =
the help.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On=
 Wed, Oct 25, 2017 at 2:15 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p dir=3D"ltr">swi=
g-native builds swig for your host system, so that it can be executed durin=
g the build. So your apparmor configure most likely searches for swig in PA=
TH and swig-native dependency will make sure it&#39;s there.</p><div class=
=3D"HOEnZb"><div class=3D"h5">
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 25, 2017, 13:56=
 shubhabrata sen &lt;<a href=3D"mailto:shubhabrata.sen@gmail.com" target=3D=
"_blank">shubhabrata.sen@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr">Hi Martin,<div><br></div><div>Thank you for=
 your reply. Could you please give a bit more details about this ? I&#39;m =
relatively new to the openembedded environment.</div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Wed, Oct 25, 2017 at 12:28 PM,=
 Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.co=
m" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><p dir=3D"ltr">you probably want swig-native depen=
dency.</p>
<br><div class=3D"gmail_quote"><div><div class=3D"m_7004330896236099633m_87=
43088144790962283h5"><div dir=3D"ltr">On Wed, Oct 25, 2017, 11:09 shubhabra=
ta sen &lt;<a href=3D"mailto:shubhabrata.sen@gmail.com" target=3D"_blank">s=
hubhabrata.sen@gmail.com</a>&gt; wrote:<br></div></div></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div><div class=3D"m_7004330896236099633m_8743088144790962=
283h5"><div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying to build a fi=
rmware with the apparmor recipe and I keep getting the following error</div=
><div><br></div><div><div><b>checking for swig... no</b></div><div>| checki=
ng whether the libapparmor debug output should be enabled... no</div><div>|=
 checking whether the libapparmor man pages should be generated... yes</div=
><div>| checking for podchecker... podchecker</div><div>| checking for pod2=
man... pod2man</div><div>| checking whether python bindings are enabled... =
yes</div><div><b>| configure: error: swig is required when enabling python =
bindings</b></div><div>| WARNING: /home/shubhabs/dists/cvp/<wbr>builds/p136=
7/tmp/work/<wbr>cortexa9hf-neon-poky-linux-<wbr>gnueabi/apparmor/2.10.95-r0=
/<wbr>temp/run.do_configure.8464:1 exit 1 from &#39;PERL=3D&quot;${PERL}&qu=
ot; PYTHON=3D&quot;/home/shubhabs/dists/<wbr>cvp/builds/p1367/tmp/work/<wbr=
>cortexa9hf-neon-poky-linux-<wbr>gnueabi/apparmor/2.10.95-r0/<wbr>recipe-sy=
sroot-native/usr/bin/<wbr>python-native/python&quot; ./configure --build=3D=
x86_64-linux --host=3Darm-poky-linux-gnueabi --target=3Darm-poky-linux-<wbr=
>gnueabi --prefix=3D/usr --libdir=3D/usr/lib --mandir=3D/usr/share/man --in=
cludedir=3D/usr/include --with-perl --with-python&#39;</div></div><div><br>=
</div><div>I&#39;ve included the SWIG recipe in the build and I can success=
fully build the firmware including swig with the bitbake command but someho=
w the apparmor recipe can&#39;t find the swig package. Any help regarding t=
his would be appreciated.</div><div><br></div><div>Thanks</div><div><br></d=
iv><div>Shubh</div></div></div></div><span class=3D"m_7004330896236099633m_=
8743088144790962283HOEnZb"><font color=3D"#888888">
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div>
</blockquote></div><br></div>
</blockquote></div>
</div></div></blockquote></div><br></div>

--001a1148716a2126a3055c60252a--

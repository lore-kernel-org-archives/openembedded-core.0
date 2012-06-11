Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Se0yO-00011n-SD
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 11:31:45 +0200
Received: by ggnp4 with SMTP id p4so2159167ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 02:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=NFDEWVVTB5SbtyyzYBoze8N38g+U+OB33//akHw1of4=;
	b=axuIiT7ETGUUm0ZZMWJud/FklGDDjDQr6DnU+5F049FkhGAHs1MvmrAI/Ocy0xsIpw
	mhOotqdKGSifVxdUZx4Gl7iMv33mEwENvc/v9XJXRGnNpIzlkBUqTWcnxn76rw3a6u/l
	6iOW/9j11+2sF17A1eMhDtd9IOXUP9HJ7jLXshtLNs297NNufT9A4YaDASL0MWVFw7e2
	N5U9wgK/wihSkIl2zUqUPzCuvouZxPiWbA0LlZDxpBUFtQwWynKavZPCe4NhlyDnIb4B
	R92Iiwj3VFQ9hdNiKDnZ9ybZFLZmWYFDVWdgS/mzejn6tUPz+R5Y+hMHGWoRKFwstNmM
	02xw==
Received: by 10.50.95.132 with SMTP id dk4mr5742620igb.67.1339406471054; Mon,
	11 Jun 2012 02:21:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.162.166 with HTTP; Mon, 11 Jun 2012 02:20:50 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <4FD2326D.5050109@intel.com>
References: <4FD2326D.5050109@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 11 Jun 2012 12:20:50 +0300
Message-ID: <CAK18fxHappNpa9vK6DQMm94TVeb-A8xT+wJSFbYjy8R0q1ftZw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlyDbeu8RSQ5kcZiLpsfijSo+mQ4M6zqb9Pg3SU9mIWKyku2js5OJ726iQolFQZDqPcxaP1
Subject: Re: initial setup on my laptop
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
X-List-Received-Date: Mon, 11 Jun 2012 09:31:45 -0000
Content-Type: multipart/alternative; boundary=e89a8f234555eac3df04c22ede86

--e89a8f234555eac3df04c22ede86
Content-Type: text/plain; charset=ISO-8859-1

Just delete the last character in REV. And wait for merge.


On Fri, Jun 8, 2012 at 8:12 PM, Radu Moisan <radu.moisan@intel.com> wrote:

>  I'm trying to setup everything on my laptop and I cannot start any build.
> I must have missed something, the following is the error I get:
>
> radu@elitebook> bitbake core-image-minimal
> Pseudo is not present but is required, building this first before the main
> build
> Loading cache: 100%
> |##################################################################################################################################################|
> ETA:  00:00:00
> Loaded 1146 entries from dependency cache.
> NOTE: Error expanding variable
> do_patch
> | ETA:  --:--:--
> NOTE: Error during finalise of
> /home/radu/Documents/Development/Yocto/poky/meta/recipes-kernel/linux/
> linux-yocto_3.2.bb
> ERROR: ExpansionError during parsing
> /home/radu/Documents/Development/Yocto/poky/meta/recipes-kernel/linux/
> linux-yocto_3.2.bb: Failure expanding variable SRCPV, expression was
> ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher
> failure for URL: 'git://
> git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=standard/default/common-pc/base,meta;name=machine,meta'.
> The command git ls-remote git://git.yoctoproject.org/linux-yocto-3.2ee78519365bdb25287703bbc31c06b193263c654l gave empty output unexpectedly
> ERROR: No recipes available for:
>
> /home/radu/Documents/Development/Yocto/poky/meta-yocto/recipes-kernel/linux/linux-yocto_3.2.bbappend
> ERROR: Command execution failed: Exited with 1
>
> Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
>
>
> Thanks,
> Radu
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--e89a8f234555eac3df04c22ede86
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Just delete the last character in REV. And wait for merge.<br>
<br><br><div class=3D"gmail_quote">On Fri, Jun 8, 2012 at 8:12 PM, Radu Moi=
san <span dir=3D"ltr">&lt;<a href=3D"mailto:radu.moisan@intel.com" target=
=3D"_blank">radu.moisan@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">


 =20

   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    I&#39;m trying to setup everything on my laptop and I cannot start any
    build. I must have missed something, the following is the error I
    get:<br>
    <br>
    <small><font face=3D"DejaVu Sans Mono">radu@elitebook&gt; bitbake
        core-image-minimal<br>
        Pseudo is not present but is required, building this first
        before the main build<br>
        Loading cache: 100%
        |##################################################################=
###########################################################################=
#####|
        ETA:=A0 00:00:00<br>
        Loaded 1146 entries from dependency cache.<br>
        NOTE: Error expanding variable
        do_patch=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0
        | ETA:=A0 --:--:--<br>
        NOTE: Error during finalise of
/home/radu/Documents/Development/Yocto/poky/meta/recipes-kernel/linux/<a hr=
ef=3D"http://linux-yocto_3.2.bb" target=3D"_blank">linux-yocto_3.2.bb</a><b=
r>
        ERROR: ExpansionError during parsing
        /home/radu/Documents/Development/Yocto/poky/meta/recipes-kernel/lin=
ux/<a href=3D"http://linux-yocto_3.2.bb" target=3D"_blank">linux-yocto_3.2.=
bb</a>:
        Failure expanding variable SRCPV, expression was
        ${@bb.fetch2.get_srcrev(d)} which triggered exception
        FetchError: Fetcher failure for URL:
        &#39;git://<a href=3D"http://git.yoctoproject.org/linux-yocto-3.2;p=
rotocol=3Dgit;bareclone=3D1;branch=3Dstandard/default/common-pc/base,meta;n=
ame=3Dmachine,meta" target=3D"_blank">git.yoctoproject.org/linux-yocto-3.2;=
protocol=3Dgit;bareclone=3D1;branch=3Dstandard/default/common-pc/base,meta;=
name=3Dmachine,meta</a>&#39;.
        The command git ls-remote
        git://<a href=3D"http://git.yoctoproject.org/linux-yocto-3.2" targe=
t=3D"_blank">git.yoctoproject.org/linux-yocto-3.2</a>
        ee78519365bdb25287703bbc31c06b193263c654l gave empty output
        unexpectedly<br>
        ERROR: No recipes available for:<br>
        =A0
/home/radu/Documents/Development/Yocto/poky/meta-yocto/recipes-kernel/linux=
/linux-yocto_3.2.bbappend<br>
        ERROR: Command execution failed: Exited with 1<br>
        <br>
        Summary: There were 3 ERROR messages shown, returning a non-zero
        exit code.</font></small><br>
    <br>
    <br>
    Thanks,<br>
    Radu<br>
  </div>

<br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br>

--e89a8f234555eac3df04c22ede86--

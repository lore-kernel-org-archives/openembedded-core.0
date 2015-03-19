Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB5865CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 23:44:15 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so80096423qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 16:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=euyRULe+Di6Y28o+hgoOJ6OL50MaBFbhr+DmPX1IImo=;
	b=QmFZe/Laa+g/JIZKqr4CeQGei3QOfAspP/2cFOMbwv+23o5u6pA1jUCHMYQSTR2K2l
	CyvyYbuhJN8TbgjTTfzWE+/cfdn9hf/m0fb20Ud9NoN4F173Bi6BWOBlAVNn9WSZtStj
	eM8XS/DlhbmFtLxkORantriwnXswViAytv5bbM7th0GQUwxc2OxpZn53BSi0G2mHC1Ct
	hhdB8MzEEDotphXJ9pblvouAcdYJ0vPTlS3FrA7FnDzrpSrSJk6xkSViQTXvTSoyZsV3
	Hg3ffosm7iu0pLrybZsGvffPlApe4hjvjocbQCmyaTE8xLTNlgJj7Cc9hPhwConoqP29
	2P4A==
X-Gm-Message-State: ALoCoQmqMcfwQhuegEaXY6SilhnNC4aBDtoR3zHbz2iRTTf8KWI289VnP/qVfbCNzQXoSLMVgxYO
X-Received: by 10.140.41.169 with SMTP id z38mr95957164qgz.56.1426808656896;
	Thu, 19 Mar 2015 16:44:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 19 Mar 2015 16:43:56 -0700 (PDT)
In-Reply-To: <1426718042-18369-1-git-send-email-jslater@windriver.com>
References: <1426718042-18369-1-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Mar 2015 01:43:56 +0200
Message-ID: <CAJTo0LbWnUu4f=+g_jLVi4O4ob41OQ1jURd38siPAexGcTfAWg@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ltp: find all .debug directories
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
X-List-Received-Date: Thu, 19 Mar 2015 23:44:18 -0000
Content-Type: multipart/alternative; boundary=001a11c11dba2839330511acc782

--001a11c11dba2839330511acc782
Content-Type: text/plain; charset=UTF-8

On 19 March 2015 at 00:34, Joe Slater <jslater@windriver.com> wrote:

>  FILES_${PN}-dbg += "\
>      /opt/ltp/runtest/.debug \
> -    /opt/ltp/testcases/bin/.debug \
> -    /opt/ltp/testcases/bin/*/bin/.debug \
> -    /opt/ltp/testcases/bin/*/test/.debug \
> +    /opt/ltp/testcases/*/.debug \
> +    /opt/ltp/testcases/*/*/.debug \
> +    /opt/ltp/testcases/*/*/*/.debug \
>

Interestingly now ltp is failing on edgerouter (mips64):

NOTE: Skipping file /opt/ltp/testcases/bin/test_arch_stripped from ltp for
already-stripped QA test
ERROR: debugedit failed with exit code 256 (cmd was
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/build/tmp/sysroots/x86_64-linux/usr/lib/rpm/bin/debugedit'
-b
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/build/tmp/work/mips64-poky-linux'
-d '/usr/src/debug' -i -l
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/build/tmp/work/mips64-poky-linux/ltp/20150119-r0/debugsources.list'
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/build/tmp/work/mips64-poky-linux/ltp/20150119-r0/package/opt/ltp/testcases/bin/d1.obj'):
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/build/tmp/sysroots/x86_64-linux/usr/lib/rpm/bin/debugedit:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/build/tmp/work/mips64-poky-linux/ltp/20150119-r0/package/opt/ltp/testcases/bin/d1.obj:
Unhandled relocation 2 in .debug_info section

I'm off to bed now, any idea what "relocation 2 in ._debug_info" means?

Ross

--001a11c11dba2839330511acc782
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 March 2015 at 00:34, Joe Slater <span dir=3D"ltr">&lt;<a href=3D"mail=
to:jslater@windriver.com" target=3D"_blank">jslater@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><div id=3D":27x" class=3D"" style=3D"overf=
low:hidden">=C2=A0FILES_${PN}-dbg +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0/opt/<span class=3D"">ltp</span>/runtest/.debug \<br>
-=C2=A0 =C2=A0 /opt/<span class=3D"">ltp</span>/testcases/bin/.debug \<br>
-=C2=A0 =C2=A0 /opt/<span class=3D"">ltp</span>/testcases/bin/*/bin/.debug =
\<br>
-=C2=A0 =C2=A0 /opt/<span class=3D"">ltp</span>/testcases/bin/*/test/.debug=
 \<br>
+=C2=A0 =C2=A0 /opt/<span class=3D"">ltp</span>/testcases/*/.debug \<br>
+=C2=A0 =C2=A0 /opt/<span class=3D"">ltp</span>/testcases/*/*/.debug \<br>
+=C2=A0 =C2=A0 /opt/<span class=3D"">ltp</span>/testcases/*/*/*/.debug \</d=
iv></blockquote></div><br></div><div class=3D"gmail_extra">Interestingly no=
w ltp is failing on edgerouter (mips64):</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">NOTE: Skippin=
g file /opt/ltp/testcases/bin/test_arch_stripped from ltp for already-strip=
ped QA test</div><div class=3D"gmail_extra">ERROR: debugedit failed with ex=
it code 256 (cmd was &#39;/home/pokybuild/yocto-autobuilder/yocto-worker/ni=
ghtly-mips/build/build/tmp/sysroots/x86_64-linux/usr/lib/rpm/bin/debugedit&=
#39; -b &#39;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/bu=
ild/build/tmp/work/mips64-poky-linux&#39; -d &#39;/usr/src/debug&#39; -i -l=
 &#39;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/bui=
ld/tmp/work/mips64-poky-linux/ltp/20150119-r0/debugsources.list&#39; &#39;/=
home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/build/tmp/=
work/mips64-poky-linux/ltp/20150119-r0/package/opt/ltp/testcases/bin/d1.obj=
&#39;):</div><div class=3D"gmail_extra">/home/pokybuild/yocto-autobuilder/y=
octo-worker/nightly-mips/build/build/tmp/sysroots/x86_64-linux/usr/lib/rpm/=
bin/debugedit: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/=
build/build/tmp/work/mips64-poky-linux/ltp/20150119-r0/package/opt/ltp/test=
cases/bin/d1.obj: Unhandled relocation 2 in .debug_info section</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;m off to be=
d now, any idea what &quot;relocation 2 in ._debug_info&quot; means?</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div></div>

--001a11c11dba2839330511acc782--

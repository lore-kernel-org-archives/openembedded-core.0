Return-Path: <andani.prashant@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 09CF377341
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:18:25 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id h65so25431163lfi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vZZhV1e5Qwv7Q0FNZ11pwya+7S2Ed6WosCY9a7vbYkk=;
	b=MNkUFFkOPT7jvipIN/QVDZHwKL95td1TEGr0L1GLL9Y1enitxaKxY7RtQBLKgWju3f
	nJhu4Tv1+/WTVy6v7cN6568k/Q4LC8yLu4EDFrMPLaEqvDihaGSpSOZ2/xLZn7EzlGaL
	KhnTo3VRWCuPxaYxpsWtL1bX/8GS2gJXnhmdOYSuBJKdwVBlWoNq1adTHbufFxiiv74r
	BgxAS9gDQGraQF2Fza9cdOWyDc5Xwu0iwsg9do7THEHFTrFtGh5iBew0AJVyjXtqFmPn
	DERz1nBqRg4cxg1q4THM+2vpOq/+AIkvDrBrFilddOKSozcwlOnG/wWeFZnxWaoN4EVG
	tWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vZZhV1e5Qwv7Q0FNZ11pwya+7S2Ed6WosCY9a7vbYkk=;
	b=e7FO3Pmmo0LJ0yr0f1zCPmPwoGN9ER9Yrkx2Xyj+SOHtbDeNvcxMYhlKO3E07k0qIP
	bamGMbuvLovaBbJS7wEETnM4DgTer0TvJuRh4TmofJOs76d+Ag1Ck0Hqptow1P9thYlk
	rUNtuTETYH0LCzlx6E3DlCnWXDZAe7N089mkP4qyeRa05fcqzA+0HMiDfi89xjKmiLnP
	2XfxNoZc6vI6xhiwWhOKzq2oyhFlOXTf64YmfsMLEbFwe/LayN/uKtkChjn56cKf/8XJ
	GHYj899GVzHCdyDoAxMY/R1FTvL89lKPTpp9t6WxvActZGVuiAwhvGhEwzPotM22jVaA
	9a8A==
X-Gm-Message-State: AIkVDXJ27Ij0GwKFkwwFMAhZk69Ht7oMjKEZCE3uqYIOZ4F1ijMLAiqiGQ2McaYLMVqYw7X6vfm+TXQU0ClOZA==
X-Received: by 10.25.210.79 with SMTP id j76mr2065414lfg.129.1485508705668;
	Fri, 27 Jan 2017 01:18:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.156.140 with HTTP; Fri, 27 Jan 2017 01:18:25 -0800 (PST)
In-Reply-To: <CAMKF1sptvTie9m7sOZMXzdBXOi9ep5GVCuRmQMdGkSs5S1LDNQ@mail.gmail.com>
References: <CAACupd1tgY3BaRkwgXzjARko5AV2nJPZh5JrMbXh8MsWco2NZg@mail.gmail.com>
	<CAMKF1spkJQirqezCjZS=4Kw-P+9sy76wOrSxCxruNEeF8rRRUg@mail.gmail.com>
	<CAACupd0FNewBRPeUMv8C9LswK8e0017Y-_RT5es_kRagFMcJVQ@mail.gmail.com>
	<CAMKF1sptvTie9m7sOZMXzdBXOi9ep5GVCuRmQMdGkSs5S1LDNQ@mail.gmail.com>
From: ANDANI PRASHANT <andani.prashant@gmail.com>
Date: Fri, 27 Jan 2017 14:48:25 +0530
Message-ID: <CAACupd2kZvN7Z7dZOkfZ+JhjHqW44+Ln316avUR=tRuNAf5Uzw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-core build fail package_fixsymlinks
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
X-List-Received-Date: Fri, 27 Jan 2017 09:18:26 -0000
Content-Type: multipart/alternative; boundary=001a11412f48b65a9f05470ff28e

--001a11412f48b65a9f05470ff28e
Content-Type: text/plain; charset=UTF-8

Hi Raj,

I am new to yocto and systemd.
Can you please tell me how to remove meta-linaro-toolchain?

On Fri, Jan 27, 2017 at 12:01 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jan 26, 2017 at 10:29 PM, ANDANI PRASHANT
> <andani.prashant@gmail.com> wrote:
> > Hi Raj,
> >
> > Thank you for reply.
> >
> > Yes i am using gcc-linaro-6.2.1-arm-linux-gnueabi toolchain
> >
> > If i comment below line from python package_fixsymlinks () function, it
> > works
> >
> >                 rtarget = cpath.realpath(path, inst_root, True,
> assume_dir = True)
> >                 if not cpath.lexists(rtarget):
> >
> > dangling_links[pkg].append(os.path.normpath(rtarget[len(inst_root):]))
> >
>
> I asked something else ? please read the last reply carefully.
>
> > Regards,
> > Prashant
> >
> >
> > On Fri, Jan 27, 2017 at 11:45 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> does this happen if you remove meta-linaro-toolchain from your layer
> mix ?
> >>
> >> On Thu, Jan 26, 2017 at 8:23 PM, ANDANI PRASHANT
> >> <andani.prashant@gmail.com> wrote:
> >> > Hi,
> >> >
> >> > If i remove package_fixsymlinks from meta/classes/package.bbclass, it
> >> > works
> >> > else giving error as below:
> >> >
> >> > ERROR: external-linaro-toolchain-2017.01~dev-r0.arago30 do_package:
> >> > Error
> >> > executing a python function in exec_python_func() autogenerated:
> >> >
> >> > The stack trace of python calls that resulted in this
> exception/failure
> >> > was:
> >> > File: 'exec_python_func() autogenerated', lineno: 2, function:
> <module>
> >> >      0001:
> >> >  *** 0002:package_fixsymlinks(d)
> >> >      0003:
> >> > File: 'tisdk/sources/oe-core/meta/classes/package.bbclass', lineno:
> >> > 1210,
> >> > function: package_fixsymlinks
> >> >      1206:        inst_root = os.path.join(pkgdest, pkg)
> >> >      1207:        for path in pkgfiles[pkg]:
> >> >      1208:                rpath = path[len(inst_root):]
> >> >      1209:                pkg_files[pkg].append(rpath)
> >> >  *** 1210:                rtarget = cpath.realpath(path, inst_root,
> >> > True,
> >> > assume_dir = True)
> >> >      1211:                if not cpath.lexists(rtarget):
> >> >      1212:
> >> > dangling_links[pkg].append(os.path.normpath(rtarget[len(inst
> _root):]))
> >> >      1213:
> >> >      1214:    newrdepends = {}
> >> > File: tisdk/sources/oe-core/meta/lib/oe/cachedpath.py', lineno: 229,
> >> > function: realpath
> >> >      0225:                # be printed a backtrace with 100s of
> OSError
> >> > exceptions
> >> >      0226:                # else
> >> >      0227:                raise OSError(errno.ELOOP,
> >> >      0228:                              "too much recursions while
> >> > resolving
> >> > '%s'; loop in '%s'" %
> >> >  *** 0229:                              (file, e.strerror))
> >> >      0230:
> >> >      0231:            raise
> >> >      0232:
> >> >      0233:        return file
> >> > Exception: OSError: [Errno 40] too much recursions while resolving
> >> >
> >> > 'tisdk/build/arago-tmp-external-linaro-toolchain/work/armv5-
> linux-gnueabi/external-linaro-toolchain/2017.01~dev-r0.
> arago30/packages-split/libstdc++-dev/usr/include/c++/
> 6.2.1/arm-linux-gnueabi/arm-linux-gnueabi';
> >> > loop in
> >> >
> >> > 'tisdk/build/arago-tmp-external-linaro-toolchain/work/armv5-
> linux-gnueabi/external-linaro-toolchain/2017.01~dev-r0.
> arago30/packages-split/libstdc++-dev/usr/include/c++/
> 6.2.1/arm-linux-gnueabi/arm-linux-gnueabi'
> >> >
> >> > ERROR: external-linaro-toolchain-2017.01~dev-r0.arago30 do_package:
> >> > Function
> >> > failed: package_fixsymlinks
> >> > ERROR: Logfile of failure stored in:
> >> >
> >> > tisdk/build/arago-tmp-external-linaro-toolchain/work/armv5-
> linux-gnueabi/external-linaro-toolchain/2017.01~dev-r0.
> arago30/temp/log.do_package.10039
> >> > ERROR: Task 437
> >> >
> >> > (tisdk/sources/meta-linaro/meta-linaro-toolchain/recipes-dev
> tools/external-linaro-toolchain/external-linaro-toolchain.bb,
> >> > do_package) failed with exit code '1'
> >> > NOTE: Tasks Summary: Attempted 642 tasks of which 629 didn't need to
> be
> >> > rerun and 1 failed.
> >> > NOTE: Writing buildhistory
> >> > Waiting for 0 running tasks to finish:
> >> >
> >> > Summary: 1 task failed:
> >> >
> >> > tisdk/sources/meta-linaro/meta-linaro-toolchain/recipes-devt
> ools/external-linaro-toolchain/external-linaro-toolchain.bb,
> >> > do_package
> >> > Summary: There were 3 WARNING messages shown.
> >> > Summary: There were 2 ERROR messages shown, returning a non-zero exit
> >> > code.
> >> >
> >> >
> >> > --
> >> > Regards,
> >> > Prashant
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >
> >
> >
>

--001a11412f48b65a9f05470ff28e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Raj,<div><br></div><div>I am new to yocto and systemd.<=
/div><div>Can you please=C2=A0tell me how to remove meta-linaro-toolchain?<=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jan =
27, 2017 at 12:01 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 26, 2017 a=
t 10:29 PM, ANDANI PRASHANT<br>
&lt;<a href=3D"mailto:andani.prashant@gmail.com" target=3D"_blank">andani.p=
rashant@gmail.com</a>&gt; wrote:<br>
&gt; Hi Raj,<br>
&gt;<br>
&gt; Thank you for reply.<br>
&gt;<br>
&gt; Yes i am using gcc-linaro-6.2.1-arm-linux-gnu<wbr>eabi toolchain<br>
&gt;<br>
&gt; If i comment below line from python package_fixsymlinks () function, i=
t<br>
&gt; works<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtarget =
=3D cpath.realpath(path, inst_root, True, assume_dir =3D True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not cp=
ath.lexists(rtarget):<br>
<span class=3D"gmail-m_8900158673371057057gmail-">&gt;<br>
&gt; dangling_links[pkg].append(os.<wbr>path.normpath(rtarget[len(inst<wbr>=
_root):]))<br>
&gt;<br>
<br>
</span>I asked something else ? please read the last reply carefully.<br>
<br>
&gt; Regards,<br>
&gt; Prashant<br>
<div class=3D"gmail-m_8900158673371057057gmail-HOEnZb"><div class=3D"gmail-=
m_8900158673371057057gmail-h5">&gt;<br>
&gt;<br>
&gt; On Fri, Jan 27, 2017 at 11:45 AM, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; does this happen if you remove meta-linaro-toolchain from your lay=
er mix ?<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Jan 26, 2017 at 8:23 PM, ANDANI PRASHANT<br>
&gt;&gt; &lt;<a href=3D"mailto:andani.prashant@gmail.com" target=3D"_blank"=
>andani.prashant@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If i remove package_fixsymlinks from meta/classes/package.bbc=
lass, it<br>
&gt;&gt; &gt; works<br>
&gt;&gt; &gt; else giving error as below:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: external-linaro-toolchain-2017<wbr>.01~dev-r0.arago30 =
do_package:<br>
&gt;&gt; &gt; Error<br>
&gt;&gt; &gt; executing a python function in exec_python_func() autogenerat=
ed:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The stack trace of python calls that resulted in this excepti=
on/failure<br>
&gt;&gt; &gt; was:<br>
&gt;&gt; &gt; File: &#39;exec_python_func() autogenerated&#39;, lineno: 2, =
function: &lt;module&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0001:<br>
&gt;&gt; &gt;=C2=A0 *** 0002:package_fixsymlinks(d)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0003:<br>
&gt;&gt; &gt; File: &#39;tisdk/sources/oe-core/meta/cl<wbr>asses/package.bb=
class&#39;, lineno:<br>
&gt;&gt; &gt; 1210,<br>
&gt;&gt; &gt; function: package_fixsymlinks<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 1206:=C2=A0 =C2=A0 =C2=A0 =C2=A0 inst_roo=
t =3D os.path.join(pkgdest, pkg)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 1207:=C2=A0 =C2=A0 =C2=A0 =C2=A0 for path=
 in pkgfiles[pkg]:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 1208:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rpath =3D path[len(inst_root):]<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 1209:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 pkg_files[pkg].append(rpath)<br>
&gt;&gt; &gt;=C2=A0 *** 1210:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rtarget =3D cpath.realpath(path, inst_root,<br>
&gt;&gt; &gt; True,<br>
&gt;&gt; &gt; assume_dir =3D True)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 1211:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if not cpath.lexists(rtarget):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 1212:<br>
&gt;&gt; &gt; dangling_links[pkg].append(os.<wbr>path.normpath(rtarget[len(=
inst<wbr>_root):]))<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 1213:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 1214:=C2=A0 =C2=A0 newrdepends =3D {}<br>
&gt;&gt; &gt; File: tisdk/sources/oe-core/meta/lib<wbr>/oe/cachedpath.py&#3=
9;, lineno: 229,<br>
&gt;&gt; &gt; function: realpath<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0225:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # be printed a backtrace with 100s of OSError<br>
&gt;&gt; &gt; exceptions<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0226:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # else<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0227:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 raise OSError(errno.ELOOP,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0228:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;too much recursions while<br>
&gt;&gt; &gt; resolving<br>
&gt;&gt; &gt; &#39;%s&#39;; loop in &#39;%s&#39;&quot; %<br>
&gt;&gt; &gt;=C2=A0 *** 0229:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (file, e.strerr=
or))<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0230:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0231:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 raise<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0232:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 0233:=C2=A0 =C2=A0 =C2=A0 =C2=A0 return f=
ile<br>
&gt;&gt; &gt; Exception: OSError: [Errno 40] too much recursions while reso=
lving<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &#39;tisdk/build/arago-tmp-externa<wbr>l-linaro-toolchain/wor=
k/armv5-<wbr>linux-gnueabi/external-linaro-<wbr>toolchain/2017.01~dev-r0.<w=
br>arago30/packages-split/<wbr>libstdc++-dev/usr/include/c++/<wbr>6.2.1/arm=
-linux-gnueabi/arm-<wbr>linux-gnueabi&#39;;<br>
&gt;&gt; &gt; loop in<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &#39;tisdk/build/arago-tmp-externa<wbr>l-linaro-toolchain/wor=
k/armv5-<wbr>linux-gnueabi/external-linaro-<wbr>toolchain/2017.01~dev-r0.<w=
br>arago30/packages-split/<wbr>libstdc++-dev/usr/include/c++/<wbr>6.2.1/arm=
-linux-gnueabi/arm-<wbr>linux-gnueabi&#39;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: external-linaro-toolchain-2017<wbr>.01~dev-r0.arago30 =
do_package:<br>
&gt;&gt; &gt; Function<br>
&gt;&gt; &gt; failed: package_fixsymlinks<br>
&gt;&gt; &gt; ERROR: Logfile of failure stored in:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; tisdk/build/arago-tmp-external<wbr>-linaro-toolchain/work/arm=
v5-<wbr>linux-gnueabi/external-linaro-<wbr>toolchain/2017.01~dev-r0.<wbr>ar=
ago30/temp/log.do_package.<wbr>10039<br>
&gt;&gt; &gt; ERROR: Task 437<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; (tisdk/sources/meta-linaro/met<wbr>a-linaro-toolchain/recipes=
-dev<wbr>tools/external-linaro-toolchai<wbr>n/<a href=3D"http://external-li=
naro-toolchain.bb" rel=3D"noreferrer" target=3D"_blank">external-linaro-too=
lchain.bb</a><wbr>,<br>
&gt;&gt; &gt; do_package) failed with exit code &#39;1&#39;<br>
&gt;&gt; &gt; NOTE: Tasks Summary: Attempted 642 tasks of which 629 didn&#3=
9;t need to be<br>
&gt;&gt; &gt; rerun and 1 failed.<br>
&gt;&gt; &gt; NOTE: Writing buildhistory<br>
&gt;&gt; &gt; Waiting for 0 running tasks to finish:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Summary: 1 task failed:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; tisdk/sources/meta-linaro/meta<wbr>-linaro-toolchain/recipes-=
devt<wbr>ools/external-linaro-toolchain<wbr>/<a href=3D"http://external-lin=
aro-toolchain.bb" rel=3D"noreferrer" target=3D"_blank">external-linaro-tool=
chain.bb</a>,<br>
&gt;&gt; &gt; do_package<br>
&gt;&gt; &gt; Summary: There were 3 WARNING messages shown.<br>
&gt;&gt; &gt; Summary: There were 2 ERROR messages shown, returning a non-z=
ero exit<br>
&gt;&gt; &gt; code.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Regards,<br>
&gt;&gt; &gt; Prashant<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; ______________________________<wbr>_________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a11412f48b65a9f05470ff28e--

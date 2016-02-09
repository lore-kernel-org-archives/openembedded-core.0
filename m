Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EC57973197
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 10:39:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 128so2585617wmz.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 02:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KR3nPNcXKcFP7GO/RoPI41M57bGoaisJ/uevrp6uxnY=;
	b=Qmewbx5YGIg6zNLFnb4eVQF2F8qzZ5JJs+oUql3fYMR/ZPlQkLk6Bx7qtDnHvUwXvA
	ta5DXX0blBYuFwUpj5iAY2/AmvgD5LKeBrfqfHBSiiQLn7frNyIwkuJdEKwEkC08P4Je
	iQAlnaDR/o75c71Q2fE1yCHEEJtIAclC/4OjeR1Dgh22cPGk6MzlNpGf83S90biw/hqF
	mHjK64MPURxXbyiAW08wSoGAiIkHLUp2ug/IB0JTeQG8Im1AI1SThmj2E3wUEVPkOwSQ
	RBnUMzzAbE2Ngulu5z7DzsH4vdALVGj7ET411NQCQ10cMlJf0F17Ey2M7maJa/fBU6zB
	GUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=KR3nPNcXKcFP7GO/RoPI41M57bGoaisJ/uevrp6uxnY=;
	b=FAUfGbrNeIoFbXlnTWtZxF59Mxe6sA8dJnMCoX/zOYPtQNrPMVJo4ecDB3Y/UOPphb
	ZAcWZ3S/9Jo2vSXR254DPrgEYaYu6P5kHkuro7EoljI7e6ccNwjMtOHhqeu6XA8XIRHN
	X1AjePI6jyLQZfN/1lPZIaOJPJZhYFZ1l0ULcP7TWiUT8IeD7knSGlqLLLjImQGxksui
	4fpK49N32UyiBN4WS2gp7svDe8DdzGYAXE+S37laTMkY8aJ5oTEgeM0kosZsAsQE0+6T
	pv8Wy3kemsqWXeJu1bh8vtDdwRWcLZn3PkQ1SVoxVVJ2BScpPL30XBwGBrW3VZQuteXl
	g0fQ==
X-Gm-Message-State: AG10YOT3ZVeYmMib0Bqb6SxSmGeRZ4f9q43V2W6ubEI3GF73oSsOMNzdefMzx7xPw4De2ztPdeHslz5e3RcJLg==
MIME-Version: 1.0
X-Received: by 10.28.218.81 with SMTP id r78mr4100659wmg.91.1455014357223;
	Tue, 09 Feb 2016 02:39:17 -0800 (PST)
Received: by 10.194.67.168 with HTTP; Tue, 9 Feb 2016 02:39:17 -0800 (PST)
In-Reply-To: <CA+chaQeGfQQ5r=Z+MEzuv1rX93ZLgrVDWzbwx6fXrkaftZ-w-g@mail.gmail.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202161726.GC2607@jama>
	<CA+chaQdGzUm96SViWvLW8xinxSLrjZbZxi843A282geN+T5Ffw@mail.gmail.com>
	<20160206204110.GA21969@mcrowe.com>
	<20160207220741.GA12339@mcrowe.com>
	<CA+chaQeGfQQ5r=Z+MEzuv1rX93ZLgrVDWzbwx6fXrkaftZ-w-g@mail.gmail.com>
Date: Tue, 9 Feb 2016 11:39:17 +0100
Message-ID: <CA+chaQfVbnjSV5Casif1b5_vxp4ysThnJLCShGAp89PCXd1tTw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 09 Feb 2016 10:39:19 -0000
Content-Type: multipart/alternative; boundary=001a1145ae1ee7d389052b53ed04

--001a1145ae1ee7d389052b53ed04
Content-Type: text/plain; charset=UTF-8

I've sent complete world report yesterday:
http://lists.openembedded.org/pipermail/openembedded-core/2016-February/117135.html

Now there is new qemuarm build which shows even more issues, because more
recipes were tested after dependencies were fixed:

ummary: 32 tasks failed:
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb,
do_package_qa
  /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtbase_git.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtbase_git.bb,
do_package_qa
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb,
do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb,
do_package
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.21.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/farsight/libnice_0.0.13.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-browser/recipes-mozilla/firefox/firefox_38.4.0esr.bb,
do_install
  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-support/invensense/invensense_git.bb,
do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.7.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb,
do_install
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb,
do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb,
do_install
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb,
do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb,
do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb,
do_configure
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb,
do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb,
do_compile
Summary: There were 32 WARNING messages shown.
Summary: There were 116 ERROR messages shown, returning a non-zero exit code.


On Mon, Feb 8, 2016 at 1:07 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> > I also saw similar failures with vsftpd and vpnc which you didn't see
> for
> some reason. I have patches ready for those too.
>
> Most likely one of their dependencies failed, so it didn't try to compile
> them yet (until I apply your patches for oe-core).
>
> > This recipe fails to compile for me too but it doesn't seem to be
> related
> to EXTRA_OEMAKE.
>
> There are many issues not caused by EXTRA_OEMAKE, see previous bitbake
> world report (which didn't have your EXTRA_OEMAKE change).
>
> http://lists.openembedded.org/pipermail/openembedded-core/2016-February/116994.html
>
>
> On Sun, Feb 7, 2016 at 11:07 PM, Mike Crowe <mac@mcrowe.com> wrote:
>
>> Further to my previous response, I've tried another build with qemuarm
>> this
>> time and more layers enabled.
>>
>> > On Saturday 06 February 2016 at 18:32:18 +0100, Martin Jansa wrote:
>> > >
>> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-mkv/libebml/
>> libebml_1.3.0.bb,
>> > >
>> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/vlan/
>> vlan_1.9.bb,
>> > >
>> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-protocols/pptp-linux/
>> pptp-linux_1.7.2.bb,
>> > >
>> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-support/pimd/
>> pimd_2.1.8.bb,
>>
>> These recipes all appear to require EXTRA_OEMAKE = "-e MAKEFLAGS=". I have
>> patches ready to post.
>>
>> I also saw similar failures with vsftpd and vpnc which you didn't see for
>> some reason. I have patches ready for those too.
>>
>> > >
>> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-initramfs/recipes-devtools/klibc/
>> klibc_2.0.4.bb,
>> > >
>> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/soci/
>> soci_3.2.2.bb,
>> > >
>> virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libwmf/
>> libwmf_0.2.8.4.bb,
>> > >
>> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/cunit/
>> cunit_2.1-3.bb,
>> > >
>> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-irc/znc/
>> znc_git.bb,
>>
>> These recipes all compiled successfully for me with EXTRA_OEMAKE = "".
>> Perhaps they are non-deterministic or they failed for you for other
>> reasons?
>>
>> > >
>> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libtinyxml2/
>> libtinyxml2_git.bb,
>>
>> This recipe doesn't appear to call oe_runmake. It failed to compile for me
>> even after explicitly setting EXTRA_OEMAKE back to "-e MAKEFLAGS=".
>>
>> > >
>> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
>> svn502.bb,
>>
>> This recipe fails to compile for me too but it doesn't seem to be related
>> to EXTRA_OEMAKE. I think it can't find the kernel headers it needs which
>> may be due to an error in my configuration.
>>
>> > >
>> /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-support/invensense/
>> invensense_git.bb,
>>
>> I haven't yet tried meta-android.
>>
>> Thanks.
>>
>> Mike.
>>
>
>

--001a1145ae1ee7d389052b53ed04
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve sent complete world report yesterday:<div><a href=
=3D"http://lists.openembedded.org/pipermail/openembedded-core/2016-February=
/117135.html">http://lists.openembedded.org/pipermail/openembedded-core/201=
6-February/117135.html</a><br><div><br></div><div>Now there is new qemuarm =
build which shows even more issues, because more recipes were tested after =
dependencies were fixed:</div><div><pre class=3D"" style=3D"white-space:pre=
-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51=
,51);font-size:13px">ummary: 32 tasks failed:
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-core/ll=
vm/<a href=3D"http://llvm3.3_3.3.bb">llvm3.3_3.3.bb</a>, do_package_qa
  /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/<a href=3D"http:/=
/qtbase_git.bb">qtbase_git.bb</a>, do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/<a href=3D"http:/=
/qtbase_git.bb">qtbase_git.bb</a>, do_package_qa
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia=
/ffmpeg/<a href=3D"http://ffmpeg_2.8.5.bb">ffmpeg_2.8.5.bb</a>, do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-initramfs/recipes-=
devtools/klibc/<a href=3D"http://klibc_2.0.4.bb">klibc_2.0.4.bb</a>, do_pac=
kage_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support=
/wmiconfig/<a href=3D"http://wmiconfig_svn.bb">wmiconfig_svn.bb</a>, do_pac=
kage
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extende=
d/mml-widget/<a href=3D"http://gtkmathview_0.8.0.bb">gtkmathview_0.8.0.bb</=
a>, do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extende=
d/efivar/<a href=3D"http://efivar_0.21.bb">efivar_0.21.bb</a>, do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support=
/farsight/<a href=3D"http://libnice_0.0.13.bb">libnice_0.0.13.bb</a>, do_po=
pulate_sysroot
  /home/jenkins/oe/world/shr-core/meta-browser/recipes-mozilla/firefox/<a h=
ref=3D"http://firefox_38.4.0esr.bb">firefox_38.4.0esr.bb</a>, do_install
  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-supp=
ort/invensense/<a href=3D"http://invensense_git.bb">invensense_git.bb</a>, =
do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-extended/iscsitarget/iscsitarget_1.4.20.3+<a href=3D"http://svn502.bb">svn=
502.bb</a>, do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-daemons/squid/<a href=3D"http://squid_3.5.7.bb">squid_3.5.7.bb</a>, do_com=
pile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-support/curlpp/<a href=3D"http://curlpp_0.7.3.bb">curlpp_0.7.3.bb</a>, do_=
populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support=
/system-setup-keyboard/<a href=3D"http://system-setup-keyboard_0.8.8.bb">sy=
stem-setup-keyboard_0.8.8.bb</a>, do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnom=
e/themes/<a href=3D"http://gnome-themes_2.32.1.bb">gnome-themes_2.32.1.bb</=
a>, do_install
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes=
-mkv/libmatroska/<a href=3D"http://libmatroska_1.4.1.bb">libmatroska_1.4.1.=
bb</a>, do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-exte=
nded/gtk-theme-torturer/<a href=3D"http://gtk-theme-torturer_git.bb">gtk-th=
eme-torturer_git.bb</a>, do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-support/dovecot/<a href=3D"http://dovecot_2.2.21.bb">dovecot_2.2.21.bb</a>=
, do_package_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphic=
s/tesseract/<a href=3D"http://tesseract_3.02.02.bb">tesseract_3.02.02.bb</a=
>, do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-connectivity/inetutils/<a href=3D"http://inetutils_1.9.4.bb">inetutils_1.9=
.4.bb</a>, do_install
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtool=
s/cunit/<a href=3D"http://cunit_2.1-3.bb">cunit_2.1-3.bb</a>, do_populate_s=
ysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-connectivity/snort/<a href=3D"http://snort_2.9.7.5.bb">snort_2.9.7.5.bb</a=
>, do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/3rdp=
arty/<a href=3D"http://atd-over-fso_0.70.bb">atd-over-fso_0.70.bb</a>, do_c=
ompile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-filesystems/recipe=
s-filesystems/yaffs2/<a href=3D"http://yaffs2-utils_git.bb">yaffs2-utils_gi=
t.bb</a>, do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphic=
s/wayland/<a href=3D"http://wayland-fits_git.bb">wayland-fits_git.bb</a>, d=
o_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes=
-irc/znc/<a href=3D"http://znc_git.bb">znc_git.bb</a>, do_populate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-core/fa=
keroot/<a href=3D"http://fakeroot_1.18.4.bb">fakeroot_1.18.4.bb</a>, do_pac=
kage_qa
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtool=
s/xerces-c/<a href=3D"http://xerces-c_3.1.2.bb">xerces-c_3.1.2.bb</a>, do_p=
opulate_sysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-xfce/recipes-bindi=
ngs/vala/<a href=3D"http://xfce4-vala_4.10.3.bb">xfce4-vala_4.10.3.bb</a>, =
do_configure
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtool=
s/mpich/<a href=3D"http://mpich_3.1.1.bb">mpich_3.1.1.bb</a>, do_populate_s=
ysroot
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support=
/libtinyxml2/<a href=3D"http://libtinyxml2_git.bb">libtinyxml2_git.bb</a>, =
do_compile
Summary: There were 32 WARNING messages shown.
Summary: There were 116 ERROR messages shown, returning a non-zero exit cod=
e.</pre></div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Mon, Feb 8, 2016 at 1:07 AM, Martin Jansa <span dir=3D"ltr">&lt=
;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><span class=3D"">&gt;=C2=A0<span style=3D"font-size:12.8px">I also=
 saw similar failures with vsftpd and vpnc which you didn&#39;t see for</sp=
an><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">some rea=
son. I have patches ready for those too.</span><div><span style=3D"font-siz=
e:12.8px"><br></span></div></span><div><span style=3D"font-size:12.8px">Mos=
t likely one of their dependencies failed, so it didn&#39;t try to compile =
them yet (until I apply your patches for oe-core).</span></div><span class=
=3D""><div><span style=3D"font-size:12.8px"><br></span></div><div><span sty=
le=3D"font-size:12.8px">&gt;=C2=A0</span><span style=3D"font-size:12.8px">T=
his recipe fails to compile for me too but it doesn&#39;t seem to be relate=
d</span></div><span style=3D"font-size:12.8px">to EXTRA_OEMAKE.</span><div>=
<span style=3D"font-size:12.8px"><br></span></div></span><div><span style=
=3D"font-size:12.8px">There are many issues not caused by EXTRA_OEMAKE, see=
 previous bitbake world report (which didn&#39;t have your EXTRA_OEMAKE cha=
nge).</span></div><div><span style=3D"font-size:12.8px"><a href=3D"http://l=
ists.openembedded.org/pipermail/openembedded-core/2016-February/116994.html=
" target=3D"_blank">http://lists.openembedded.org/pipermail/openembedded-co=
re/2016-February/116994.html</a></span><br><div><span style=3D"font-size:12=
.8px"><br></span></div></div></div><div class=3D"HOEnZb"><div class=3D"h5">=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Feb 7, 20=
16 at 11:07 PM, Mike Crowe <span dir=3D"ltr">&lt;<a href=3D"mailto:mac@mcro=
we.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Further to my previous response, I&#39;ve tried anoth=
er build with qemuarm this<br>
time and more layers enabled.<br>
<span><br>
&gt; On Saturday 06 February 2016 at 18:32:18 +0100, Martin Jansa wrote:<br=
>
</span>&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-mul=
timedia/recipes-mkv/libebml/<a href=3D"http://libebml_1.3.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">libebml_1.3.0.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking=
/recipes-connectivity/vlan/<a href=3D"http://vlan_1.9.bb" rel=3D"noreferrer=
" target=3D"_blank">vlan_1.9.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking=
/recipes-protocols/pptp-linux/<a href=3D"http://pptp-linux_1.7.2.bb" rel=3D=
"noreferrer" target=3D"_blank">pptp-linux_1.7.2.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking=
/recipes-support/pimd/<a href=3D"http://pimd_2.1.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">pimd_2.1.8.bb</a>,<br>
<br>
These recipes all appear to require EXTRA_OEMAKE =3D &quot;-e MAKEFLAGS=3D&=
quot;. I have<br>
patches ready to post.<br>
<br>
I also saw similar failures with vsftpd and vpnc which you didn&#39;t see f=
or<br>
some reason. I have patches ready for those too.<br>
<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-initramfs/=
recipes-devtools/klibc/<a href=3D"http://klibc_2.0.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">klibc_2.0.4.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes=
-support/soci/<a href=3D"http://soci_3.2.2.bb" rel=3D"noreferrer" target=3D=
"_blank">soci_3.2.2.bb</a>,<br>
&gt; &gt; virtual:native:/home/jenkins/oe/world/shr-core/meta-openembedded/=
meta-oe/recipes-extended/libwmf/<a href=3D"http://libwmf_0.2.8.4.bb" rel=3D=
"noreferrer" target=3D"_blank">libwmf_0.2.8.4.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes=
-devtools/cunit/<a href=3D"http://cunit_2.1-3.bb" rel=3D"noreferrer" target=
=3D"_blank">cunit_2.1-3.bb</a>,<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking=
/recipes-irc/znc/<a href=3D"http://znc_git.bb" rel=3D"noreferrer" target=3D=
"_blank">znc_git.bb</a>,<br>
<br>
These recipes all compiled successfully for me with EXTRA_OEMAKE =3D &quot;=
&quot;.<br>
Perhaps they are non-deterministic or they failed for you for other reasons=
?<br>
<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes=
-support/libtinyxml2/<a href=3D"http://libtinyxml2_git.bb" rel=3D"noreferre=
r" target=3D"_blank">libtinyxml2_git.bb</a>,<br>
<br>
This recipe doesn&#39;t appear to call oe_runmake. It failed to compile for=
 me<br>
even after explicitly setting EXTRA_OEMAKE back to &quot;-e MAKEFLAGS=3D&qu=
ot;.<br>
<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking=
/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+<a href=3D"http://svn502=
.bb" rel=3D"noreferrer" target=3D"_blank">svn502.bb</a>,<br>
<br>
This recipe fails to compile for me too but it doesn&#39;t seem to be relat=
ed<br>
to EXTRA_OEMAKE. I think it can&#39;t find the kernel headers it needs whic=
h<br>
may be due to an error in my configuration.<br>
<br>
&gt; &gt; /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/reci=
pes-support/invensense/<a href=3D"http://invensense_git.bb" rel=3D"noreferr=
er" target=3D"_blank">invensense_git.bb</a>,<br>
<br>
I haven&#39;t yet tried meta-android.<br>
<br>
Thanks.<br>
<span><font color=3D"#888888"><br>
Mike.<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a1145ae1ee7d389052b53ed04--

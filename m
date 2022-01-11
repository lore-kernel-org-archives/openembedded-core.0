Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011C9C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:38:07 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web12.12898.1641929886265824370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LK+NcbQm;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id o1so578868uap.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rwrKkM516zOmtl/Ps71qE8t+8yz69OFYQkY/V11x36M=;
        b=LK+NcbQmPWd3O9Ss53K1ttagf88AxVPr2wDpWDufwxD0XnI9qrmXaHTrfpYU8tj0mM
         nOxjmJ0lZfrClc3Cg6UDKITCyFVac5L0neIEU6wVs663oCiDHHo/Gr8mYJ01hKMzk/Dm
         zI2ey4o5V1z6XNwFiVFByICpFzeNgcbzTg9w17IU3hbVxyZuz/0sh9ID2/aNROGG3GYN
         mtV5kx0YI6KRyhgU4MXjJnOp5rV3NNz32nmRcisRQI0qZhEVubWdtQUigWn8WT6F5cb1
         pUVKQ9l5tiG/kROcr3ImSlZD9jBM6zD9dnPG5JDjCDEH5zT6QnyXEhZyoSngtV8infaT
         X7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rwrKkM516zOmtl/Ps71qE8t+8yz69OFYQkY/V11x36M=;
        b=Ij+qroZhGpnb1SvGrncWvMHVIf4nN2qdS75Y8Qy6yTqoVYSnDx7z3w2biU8c3x3TMT
         Uq9LAg6b8QYI5o6xbEXhPkCw0qjhDfh9LZkGMtrSRECju7i+TJLRoIhs4EBiPJP9435v
         LTzdH9hsFng2Fjoq0v0OSN0G2c6Jy5Vuf4ldWMSF8QP3qy7sI6oKAlOEe/Vmsmbybweq
         WoN+XUcFYKhcrV+WtCMjWP8vIvbgKVhAU2hpUh/7N4LByXz2o7bC6J7LVYObkvzU+x6N
         pls1Rr28zRu2p0ItUGd04/N3XOpUyP2zcwzq+Zsb5cISOFr5VE3HgTj+LWL76c+OXS1C
         qFVA==
X-Gm-Message-State: AOAM532wV/virXwSOdTYd+61aPK8a/zDcr1rXFbnnLaPpS8RlPzgJCSN
	IetUBdKlb6usmvVOzL3ukScA9Lcas+KT/LEq1Y0=
X-Google-Smtp-Source: 
 ABdhPJx0V3O6heIbJ/shiJG17OVo08jta0IwPiozHrnWu9hwOIKBIXbb/uroG1V/jl0l42wtMFbSRkS874GC8Se69Aw=
X-Received: by 2002:a67:c40e:: with SMTP id c14mr2457488vsk.73.1641929885234;
 Tue, 11 Jan 2022 11:38:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641920605.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jan 2022 20:37:53 +0100
Message-ID: 
 <CANNYZj-5-kriYmGKXK-2dy7Q9E8Eb6-7v0nzhYmVJzWAC4ur-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 00/22] deprecation of distutils
To: Tim Orling <ticotimo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008e39c805d553979f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:38:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160459

--0000000000008e39c805d553979f
Content-Type: text/plain; charset="UTF-8"

Thanks Tim, does this address the issue of building items that don't ship a
setup.py anymore?

Alex

On Tue, 11 Jan 2022 at 20:01, Tim Orling <ticotimo@gmail.com> wrote:

> distutils is deprecated in Python 3.10 and will be removed in Python
> 3.12 (~October 2023).
>
> This series inserts a deprecation warning into the distutils*.bbclasses
> and drops or replaces distutils usage wherever possible.
>
> Instead of distutils3-base, we introduce setuptools3-base, which also
> incorporates distutils-common-base.
>
> Remaining usage is in:
>   * lib/recipetool/create_buildsys_python.py until we are ready to
>     factor it out (and add pyproject.toml and setup.cfg handling)
>   * oeqa selftests which are testing distutils3 functionality
>   * glib-2.0: upstream is still using distutils.version.LooseVersion
>   * gpgme: Still checks for distutils in m4/ax_python_devel.m4
>   * python3-numpy: upstream still has a distutils/ module
>   * python3-setuptools has a vendored _distutils
>
> I might have missed something else.
>
> No attempt has been made to look at layers outside of oe-core.
>
> The intent is to let this percolate for a few weeks and then drop
> distutils*.bbclasses (and move them to meta-python, but with the
> warnings).
>
> [YOCTO #14610]
>
> Changes in v2:
>   - dropped the import of distutils.version into bb. in favor of
>     bb.utils.vercmp_string_op()
>   - dropped some patches that have been addressed already
>   - update email
>   - fix typos
>   - drop already merged scripts/buildhistory-diff patch
> The following changes since commit
> 16110cdca7211b0efc59464afbb253527c033cad:
>
>   oeqa/sstate: Fix allarch samesigs test (2022-01-11 15:48:11 +0000)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/git/poky-contrib
> timo/deprecate_distutils_14610_v2
>
> http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=timo/deprecate_distutils_14610_v2
>
> Tim Orling (22):
>   classes/distutils-*: add warning of deprecation
>   setuptools3: refactor for no distutils bbclasses
>   python3-cython: DISTUTILS_* -> SETUPTOOLS_*
>   dnf: inherit setuptools3-base instead of distutils
>   libdnf: inherit setuptools3-base not distutils
>   python3-dbus: inherit setuptools3-base not distuils
>   gpgme: inherit setuptools-base not distuils
>   python3-pip: inherit setuptools3 not distuils3
>   systemtap: use setuptools-base not distutils
>   libcomps: inherit setuptools3-base not distutils
>   createrepo-c: inherit setuptools3-base not distutils
>   librepo: inherit setuptools3-base not distutils
>   btrfs-tools: use setuptools3-base not distutils
>   python3-pygobject: setuptools instead of distuils
>   bind: inherit setuptools3-base instead of distutils
>   python3-setuptools: do not depend on distutils
>   gstreamer1.0-python: inherit setuptools3-base
>   recipetool/create_buildsys_python.py: less distutils
>   waf.bbclass: drop usage of distutils
>   dnf: drop python3-distutils dependency
>   python3native.bbclass: distutils -> sysconfig
>   rootfs_rpm.bbclass: distutils -> sysconfig module
>
>  meta/classes/distutils-common-base.bbclass    |  3 +
>  meta/classes/distutils3-base.bbclass          |  3 +
>  meta/classes/distutils3.bbclass               |  4 ++
>  meta/classes/python3native.bbclass            |  2 +-
>  meta/classes/rootfs_rpm.bbclass               |  2 +-
>  meta/classes/setuptools3-base.bbclass         | 31 +++++++++
>  meta/classes/setuptools3.bbclass              | 66 ++++++++++++++++++-
>  meta/classes/waf.bbclass                      |  3 +-
>  .../recipes-connectivity/bind/bind_9.16.24.bb |  2 +-
>  .../btrfs-tools/btrfs-tools_5.15.1.bb         |  2 +-
>  .../createrepo-c/createrepo-c_0.18.0.bb       |  2 +-
>  meta/recipes-devtools/dnf/dnf_4.10.0.bb       |  3 +-
>  .../libcomps/libcomps_0.1.18.bb               |  2 +-
>  meta/recipes-devtools/libdnf/libdnf_0.65.0.bb |  2 +-
>  .../librepo/librepo_1.14.2.bb                 |  2 +-
>  .../python/python3-cython_0.29.26.bb          |  2 +-
>  .../python/python3-dbus_1.2.18.bb             |  2 +-
>  .../python/python3-pip_21.3.1.bb              |  2 +-
>  .../python/python3-pygobject_3.42.0.bb        |  2 +-
>  .../python/python3-setuptools_59.5.0.bb       |  1 -
>  .../recipes-kernel/systemtap/systemtap_git.bb |  2 +-
>  .../gstreamer/gstreamer1.0-python_1.18.5.bb   |  2 +-
>  meta/recipes-support/gpgme/gpgme_1.16.0.bb    |  2 +-
>  .../lib/recipetool/create_buildsys_python.py  |  8 ++-
>  24 files changed, 129 insertions(+), 23 deletions(-)
>  create mode 100644 meta/classes/setuptools3-base.bbclass
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160436):
> https://lists.openembedded.org/g/openembedded-core/message/160436
> Mute This Topic: https://lists.openembedded.org/mt/88356412/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008e39c805d553979f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Tim, does this address the issue of building i=
tems that don&#39;t ship a setup.py anymore?</div><div><br></div><div>Alex<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, 11 Jan 2022 at 20:01, Tim Orling &lt;<a href=3D"mailto:tic=
otimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">distutils is deprecated in Python 3.10 a=
nd will be removed in Python<br>
3.12 (~October 2023).<br>
<br>
This series inserts a deprecation warning into the distutils*.bbclasses<br>
and drops or replaces distutils usage wherever possible.<br>
<br>
Instead of distutils3-base, we introduce setuptools3-base, which also<br>
incorporates distutils-common-base.<br>
<br>
Remaining usage is in:<br>
=C2=A0 * lib/recipetool/create_buildsys_python.py until we are ready to<br>
=C2=A0 =C2=A0 factor it out (and add pyproject.toml and setup.cfg handling)=
<br>
=C2=A0 * oeqa selftests which are testing distutils3 functionality<br>
=C2=A0 * glib-2.0: upstream is still using distutils.version.LooseVersion<b=
r>
=C2=A0 * gpgme: Still checks for distutils in m4/ax_python_devel.m4<br>
=C2=A0 * python3-numpy: upstream still has a distutils/ module<br>
=C2=A0 * python3-setuptools has a vendored _distutils<br>
<br>
I might have missed something else.<br>
<br>
No attempt has been made to look at layers outside of oe-core.<br>
<br>
The intent is to let this percolate for a few weeks and then drop<br>
distutils*.bbclasses (and move them to meta-python, but with the<br>
warnings).<br>
<br>
[YOCTO #14610]<br>
<br>
Changes in v2:<br>
=C2=A0 - dropped the import of distutils.version into bb. in favor of<br>
=C2=A0 =C2=A0 bb.utils.vercmp_string_op()<br>
=C2=A0 - dropped some patches that have been addressed already<br>
=C2=A0 - update email<br>
=C2=A0 - fix typos<br>
=C2=A0 - drop already merged scripts/buildhistory-diff patch<br>
The following changes since commit 16110cdca7211b0efc59464afbb253527c033cad=
:<br>
<br>
=C2=A0 oeqa/sstate: Fix allarch samesigs test (2022-01-11 15:48:11 +0000)<b=
r>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/git/poky-contrib" rel=
=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/git/poky-contrib</a>=
 timo/deprecate_distutils_14610_v2<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log=
/?h=3Dtimo/deprecate_distutils_14610_v2" rel=3D"noreferrer" target=3D"_blan=
k">http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=3Dtimo/depr=
ecate_distutils_14610_v2</a><br>
<br>
Tim Orling (22):<br>
=C2=A0 classes/distutils-*: add warning of deprecation<br>
=C2=A0 setuptools3: refactor for no distutils bbclasses<br>
=C2=A0 python3-cython: DISTUTILS_* -&gt; SETUPTOOLS_*<br>
=C2=A0 dnf: inherit setuptools3-base instead of distutils<br>
=C2=A0 libdnf: inherit setuptools3-base not distutils<br>
=C2=A0 python3-dbus: inherit setuptools3-base not distuils<br>
=C2=A0 gpgme: inherit setuptools-base not distuils<br>
=C2=A0 python3-pip: inherit setuptools3 not distuils3<br>
=C2=A0 systemtap: use setuptools-base not distutils<br>
=C2=A0 libcomps: inherit setuptools3-base not distutils<br>
=C2=A0 createrepo-c: inherit setuptools3-base not distutils<br>
=C2=A0 librepo: inherit setuptools3-base not distutils<br>
=C2=A0 btrfs-tools: use setuptools3-base not distutils<br>
=C2=A0 python3-pygobject: setuptools instead of distuils<br>
=C2=A0 bind: inherit setuptools3-base instead of distutils<br>
=C2=A0 python3-setuptools: do not depend on distutils<br>
=C2=A0 gstreamer1.0-python: inherit setuptools3-base<br>
=C2=A0 recipetool/create_buildsys_python.py: less distutils<br>
=C2=A0 waf.bbclass: drop usage of distutils<br>
=C2=A0 dnf: drop python3-distutils dependency<br>
=C2=A0 python3native.bbclass: distutils -&gt; sysconfig<br>
=C2=A0 rootfs_rpm.bbclass: distutils -&gt; sysconfig module<br>
<br>
=C2=A0meta/classes/distutils-common-base.bbclass=C2=A0 =C2=A0 |=C2=A0 3 +<b=
r>
=C2=A0meta/classes/distutils3-base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 3 +<br>
=C2=A0meta/classes/distutils3.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 ++<br>
=C2=A0meta/classes/python3native.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/classes/rootfs_rpm.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/classes/setuptools3-base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 31 +++++++++<br>
=C2=A0meta/classes/setuptools3.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 66 ++++++++++++++++++-<br>
=C2=A0meta/classes/waf.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
=C2=A0.../recipes-connectivity/bind/<a href=3D"http://bind_9.16.24.bb" rel=
=3D"noreferrer" target=3D"_blank">bind_9.16.24.bb</a> |=C2=A0 2 +-<br>
=C2=A0.../btrfs-tools/<a href=3D"http://btrfs-tools_5.15.1.bb" rel=3D"noref=
errer" target=3D"_blank">btrfs-tools_5.15.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../createrepo-c/<a href=3D"http://createrepo-c_0.18.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">createrepo-c_0.18.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.10.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">dnf_4.10.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 3 +-<br>
=C2=A0.../libcomps/<a href=3D"http://libcomps_0.1.18.bb" rel=3D"noreferrer"=
 target=3D"_blank">libcomps_0.1.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.65.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.65.0.bb</a> |=C2=A0 2 +-<br>
=C2=A0.../librepo/<a href=3D"http://librepo_1.14.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">librepo_1.14.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../python/<a href=3D"http://python3-cython_0.29.26.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-cython_0.29.26.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../python/<a href=3D"http://python3-dbus_1.2.18.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-dbus_1.2.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../python/<a href=3D"http://python3-pip_21.3.1.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-pip_21.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../python/<a href=3D"http://python3-pygobject_3.42.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-pygobject_3.42.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../python/<a href=3D"http://python3-setuptools_59.5.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-setuptools_59.5.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0.../recipes-kernel/systemtap/<a href=3D"http://systemtap_git.bb" rel=
=3D"noreferrer" target=3D"_blank">systemtap_git.bb</a> |=C2=A0 2 +-<br>
=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-python_1.18.5.bb" rel=3D=
"noreferrer" target=3D"_blank">gstreamer1.0-python_1.18.5.bb</a>=C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-support/gpgme/<a href=3D"http://gpgme_1.16.0.bb" rel=3D"=
noreferrer" target=3D"_blank">gpgme_1.16.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 2 +-=
<br>
=C2=A0.../lib/recipetool/create_buildsys_python.py=C2=A0 |=C2=A0 8 ++-<br>
=C2=A024 files changed, 129 insertions(+), 23 deletions(-)<br>
=C2=A0create mode 100644 meta/classes/setuptools3-base.bbclass<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160436): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160436" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160436</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88356412/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88356412/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008e39c805d553979f--


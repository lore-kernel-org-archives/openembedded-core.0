Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13261C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 05:50:55 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web09.6222.1637041853489399416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 21:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UpfvjLNZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id e7so26171054ljq.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 21:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=eAGXEhAS4FUyGaSTbjrZEZ4QOx42ECNhSMndH/xgNZg=;
        b=UpfvjLNZ7p4ixBbL7LKLkCtww4nw2UghLz0uh6/TC8J+H00SDwD84nLFsE9xwV7FiK
         vOTUoJhDPM/d3nXJmcBlSUioiLG/CiOkF0ZyGeh4pJ5JabPxCsKklNG3uu1jLpQJSE4X
         FQeuSpmevx5D7d3EaUpgEc977sC6LQTIRoclPX5N7QCG5NTxZCC6q4+qDqQzTdvEE3PF
         Jii7o+R5V9RO0wNBaTTyUHlWDzkTkKBnGT4AOjmTZO97qeCa00ZmCr2Ubm3NT01r7qjE
         CH+EnqIkGV9ZMXa/aWtZu+nBBlilgJX9vcRg7SkblRTe17kReeCxnxuAiNEIcZwEIpvv
         KmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eAGXEhAS4FUyGaSTbjrZEZ4QOx42ECNhSMndH/xgNZg=;
        b=hiNgadVWFMmk8HECgpL31W0oVl+OPM4HYe+ljtDYYPO08uoc1Zk8kOf2k4Sb29vaPk
         3Xan1W4LEUzWAhy2NX6rPpq4HVmOXHOW0QMkUF+5BAbEhOXPcKdEEoYQR3Y8BK3rLGfu
         MNVEq7nVYEloIquhSywGZevqbEoH4Pq9m1T3ssUDM8e+jb+EW2WmiwzyuEvTEVfJYeh0
         3hmhI3RfqsSBMunQsq/YtotppDxpMWvvrchdKJlEfSsNmJj81KrhuppEYaX+oR+z2lDs
         qx76qV6GJEi2qGxz1utfIQLlwSW2vuSCS+CFHoFbi5wMvUHfrq6/loc9/sZLKyMwcjuz
         gAYg==
X-Gm-Message-State: AOAM531n42kSF7HXiWKqTpR/7sOfZ4NLciu+Dmu0KZUHxMB5Gh06cx2L
	8cjLpdFKQ07tTKOCG9tIhC4=
X-Google-Smtp-Source: 
 ABdhPJzNSlF9GUwCrXfz47kngmUINmqVeZynLRyvzH1lnqmQ/EU7khdIqig0erH3Xo09c8r99vcvgw==
X-Received: by 2002:a2e:8515:: with SMTP id j21mr4090075lji.531.1637041851576;
        Mon, 15 Nov 2021 21:50:51 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 k13sm1647761lfg.23.2021.11.15.21.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 21:50:51 -0800 (PST)
Message-ID: <42006279-7435-62aa-752d-698d72ae2dfd@gmail.com>
Date: Tue, 16 Nov 2021 06:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [OE-core] [hardknott][PATCH 00/14] Review request
Content-Language: en-US
To: Anuj Mittal <anuj.mittal@intel.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1637032974.git.anuj.mittal@intel.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <cover.1637032974.git.anuj.mittal@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 05:50:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158339

On 11/16/21 04:24, Anuj Mittal wrote:
> Please review these changes for hardknott. No issues seen while testing
> on autobuilder.
> 
> Thanks,
> 
> Anuj
> 
> The following changes since commit 0ca080a23c2770a15138f702d4c879bbd90ca360:
> 
>    build-appliance-image: Update to hardknott head revision (2021-11-04 11:58:28 +0000)
> 
> are available in the Git repository at:
> 
>    git://push.openembedded.org/openembedded-core-contrib anujm/hardknott
> 
> Alexander Kanavin (2):
>    linux-firmware: upgrade 20210919 -> 20211027
>    cross-canadian: correct the location of pkg-config files
> 
> Anuj Mittal (2):
>    meta: add explicit branch and protocol to SRC_URI
>    llvm: bump HASHEQUIV_HASH_VERSION
> 
> Bruce Ashfield (2):
>    linux-yocto/5.10: update to v5.10.76
>    linux-yocto-rt/5.10: update to -rt54
> 
> Chen Qi (1):
>    avahi: update CVE id fixed by local-ping.patch
> 
> Jose Quaresma (1):
>    sstate: another fix for touching files inside pseudo
> 
> Manuel Leonhardt (1):
>    sstate: Account for reserved characters when shortening sstate
>      filenames
> 
> Richard Purdie (5):
>    linunistring: Add missing gperf-native dependency
>    pseudo: Add in ability to flush database with shutdown request
>    pseudo: Add fcntl64 wrapper
>    scripts/convert-srcuri: Backport SRC_URI conversion script from master
>      branch
>    meta/scripts: Manual git url branch additions
> 
>   .../devtool/devtool-upgrade-test2_git.bb      |  2 +-
>   .../devtool-upgrade-test2_git.bb.upgraded     |  2 +-
>   .../git-submodule-test/git-submodule-test.bb  |  2 +-
>   meta/classes/cross-canadian.bbclass           |  2 +-
>   meta/classes/devupstream.bbclass              |  2 +-
>   meta/classes/sstate.bbclass                   | 14 ++--
>   .../distro/include/default-distrovars.inc     |  2 +-
>   meta/lib/oeqa/selftest/cases/devtool.py       |  4 +-
>   meta/lib/oeqa/selftest/cases/fetch.py         |  2 +-
>   meta/lib/oeqa/selftest/cases/recipetool.py    |  6 +-
>   meta/lib/oeqa/selftest/cases/sstatetests.py   |  2 +-
>   meta/recipes-bsp/efibootmgr/efibootmgr_17.bb  |  2 +-
>   meta/recipes-bsp/efivar/efivar_37.bb          |  2 +-
>   meta/recipes-bsp/opensbi/opensbi_0.9.bb       |  2 +-
>   meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb  |  2 +-
>   meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
>   .../avahi/files/local-ping.patch              |  1 +
>   .../connman/connman-gnome_0.7.bb              |  2 +-
>   .../libnss-mdns/libnss-mdns_0.14.1.bb         |  2 +-
>   .../libuv/libuv_1.41.0.bb                     |  2 +-
>   .../mobile-broadband-provider-info_git.bb     |  2 +-
>   meta/recipes-core/dbus-wait/dbus-wait_git.bb  |  2 +-
>   meta/recipes-core/fts/fts_1.2.7.bb            |  2 +-
>   .../glibc/cross-localedef-native_2.33.bb      |  2 +-
>   meta/recipes-core/ifupdown/ifupdown_0.8.36.bb |  2 +-
>   .../initscripts/init-system-helpers_1.60.bb   |  2 +-
>   meta/recipes-core/libxcrypt/libxcrypt.inc     |  2 +-
>   meta/recipes-core/musl/libucontext_git.bb     |  2 +-
>   meta/recipes-core/musl/musl-obstack.bb        |  2 +-
>   meta/recipes-core/musl/musl-utils.bb          |  2 +-
>   meta/recipes-core/musl/musl_git.bb            |  2 +-
>   meta/recipes-core/ncurses/ncurses.inc         |  2 +-
>   meta/recipes-core/netbase/netbase_6.2.bb      |  2 +-
>   meta/recipes-core/psplash/psplash_git.bb      |  2 +-
>   meta/recipes-core/systemd/systemd.inc         |  2 +-
>   .../update-rc.d/update-rc.d_0.8.bb            |  2 +-
>   .../bootchart2/bootchart2_0.14.9.bb           |  2 +-
>   .../btrfs-tools/btrfs-tools_5.10.1.bb         |  2 +-
>   .../createrepo-c/createrepo-c_0.17.0.bb       |  2 +-
>   meta/recipes-devtools/distcc/distcc_3.3.5.bb  |  2 +-
>   meta/recipes-devtools/dnf/dnf_4.6.0.bb        |  2 +-
>   meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  2 +-
>   meta/recipes-devtools/file/file_5.39.bb       |  2 +-
>   meta/recipes-devtools/glide/glide_0.13.3.bb   |  2 +-
>   .../gnu-config/gnu-config_git.bb              |  2 +-
>   .../libcomps/libcomps_0.1.15.bb               |  2 +-
>   meta/recipes-devtools/libdnf/libdnf_0.58.0.bb |  2 +-
>   .../librepo/librepo_1.13.0.bb                 |  2 +-
>   meta/recipes-devtools/llvm/llvm_git.bb        |  6 +-
>   meta/recipes-devtools/mtd/mtd-utils_git.bb    |  2 +-
>   meta/recipes-devtools/ninja/ninja_1.10.2.bb   |  2 +-
>   .../patchelf/patchelf_0.12.bb                 |  2 +-
>   meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
>   meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |  2 +-
>   .../squashfs-tools/squashfs-tools_git.bb      |  2 +-
>   .../systemd-bootchart_234.bb                  |  2 +-
>   .../tcf-agent/tcf-agent_git.bb                |  2 +-
>   meta/recipes-devtools/unfs3/unfs3_git.bb      |  2 +-
>   meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  2 +-
>   .../go-examples/go-helloworld_0.1.bb          |  2 +-
>   .../iputils/iputils_s20200821.bb              |  2 +-
>   .../recipes-extended/libaio/libaio_0.3.112.bb |  2 +-
>   meta/recipes-extended/libnsl/libnsl2_git.bb   |  2 +-
>   .../recipes-extended/libnss-nis/libnss-nis.bb |  2 +-
>   .../libsolv/libsolv_0.7.17.bb                 |  2 +-
>   meta/recipes-extended/ltp/ltp_20210121.bb     |  2 +-
>   .../net-tools/net-tools_2.10.bb               |  2 +-
>   meta/recipes-extended/procps/procps_3.3.17.bb |  2 +-
>   meta/recipes-extended/psmisc/psmisc_23.4.bb   |  2 +-
>   .../rpcsvc-proto/rpcsvc-proto.bb              |  2 +-
>   .../sysklogd/sysklogd_2.2.2.bb                |  2 +-
>   .../xinetd/xinetd_2.3.15.4.bb                 |  2 +-
>   meta/recipes-extended/zstd/zstd_1.4.9.bb      |  2 +-
>   meta/recipes-gnome/libhandy/libhandy_1.2.0.bb |  2 +-
>   meta/recipes-gnome/libportal/libportal_0.3.bb |  2 +-
>   .../glslang/glslang_11.2.0.bb                 |  2 +-
>   .../igt-gpu-tools/igt-gpu-tools_git.bb        |  2 +-
>   .../libfakekey/libfakekey_git.bb              |  2 +-
>   .../libmatchbox/libmatchbox_1.12.bb           |  2 +-
>   .../libva/libva-utils_2.10.0.bb               |  2 +-
>   .../matchbox-wm/matchbox-wm_1.2.2.bb          |  2 +-
>   meta/recipes-graphics/mx/mx-1.0_1.4.7.bb      |  2 +-
>   meta/recipes-graphics/piglit/piglit_git.bb    |  2 +-
>   .../spir/spirv-headers_1.5.4.bb               |  2 +-
>   .../spir/spirv-tools_2020.7.bb                |  2 +-
>   .../virglrenderer/virglrenderer_0.8.2.bb      |  2 +-
>   meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |  2 +-
>   .../vulkan/vulkan-headers_1.2.170.0.bb        |  2 +-
>   .../vulkan/vulkan-loader_1.2.170.0.bb         |  2 +-
>   .../vulkan/vulkan-samples_git.bb              |  2 +-
>   .../vulkan/vulkan-tools_1.2.170.0.bb          |  2 +-
>   .../xinput-calibrator_git.bb                  |  2 +-
>   .../xorg-driver/xf86-video-intel_git.bb       |  2 +-
>   meta/recipes-kernel/blktrace/blktrace_git.bb  |  2 +-
>   meta/recipes-kernel/cryptodev/cryptodev.inc   |  2 +-
>   meta/recipes-kernel/dtc/dtc.inc               |  2 +-
>   .../kern-tools/kern-tools-native_git.bb       |  2 +-
>   meta/recipes-kernel/kmod/kmod.inc             |  2 +-
>   ...20210919.bb => linux-firmware_20211027.bb} |  4 +-
>   .../linux/linux-yocto-rt_5.10.bb              |  6 +-
>   .../linux/linux-yocto-tiny_5.10.bb            |  8 +-
>   meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++---
>   meta/recipes-kernel/powertop/powertop_2.13.bb |  2 +-
>   .../systemtap/systemtap_git.inc               |  2 +-
>   meta/recipes-multimedia/x264/x264_git.bb      |  2 +-
>   meta/recipes-sato/l3afpad/l3afpad_git.bb      |  2 +-
>   .../matchbox-config-gtk_0.2.bb                |  2 +-
>   .../matchbox-desktop/matchbox-desktop_2.2.bb  |  2 +-
>   .../matchbox-panel-2/matchbox-panel-2_2.11.bb |  2 +-
>   .../matchbox-terminal_0.2.bb                  |  2 +-
>   .../matchbox-theme-sato_0.2.bb                |  2 +-
>   .../sato-screenshot/sato-screenshot_0.3.bb    |  2 +-
>   .../settings-daemon/settings-daemon_0.0.2.bb  |  2 +-
>   .../bmap-tools/bmap-tools_3.6.bb              |  2 +-
>   .../boost/boost-build-native_4.3.0.bb         |  2 +-
>   .../ca-certificates_20211016.bb               |  2 +-
>   .../dos2unix/dos2unix_7.4.2.bb                |  2 +-
>   .../gnome-desktop-testing_2018.1.bb           |  2 +-
>   meta/recipes-support/libgit2/libgit2_1.1.0.bb |  2 +-
>   .../libjitterentropy_3.0.1.bb                 |  2 +-
>   .../libunistring/libunistring_0.9.10.bb       |  1 +
>   meta/recipes-support/lz4/lz4_1.9.3.bb         |  2 +-
>   meta/recipes-support/numactl/numactl_git.bb   |  2 +-
>   .../p11-kit/p11-kit_0.23.22.bb                |  2 +-
>   .../ptest-runner/ptest-runner_2.4.2.bb        |  2 +-
>   .../rng-tools/rng-tools_6.11.bb               |  2 +-
>   .../shared-mime-info/shared-mime-info_git.bb  |  2 +-
>   meta/recipes-support/vim/vim.inc              |  2 +-
>   meta/recipes-support/xxhash/xxhash_0.8.0.bb   |  2 +-
>   scripts/contrib/convert-srcuri.py             | 77 +++++++++++++++++++
>   scripts/lib/recipetool/create.py              |  3 +
>   131 files changed, 239 insertions(+), 153 deletions(-)
>   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210919.bb => linux-firmware_20211027.bb} (99%)
>   create mode 100755 scripts/contrib/convert-srcuri.py
> 

Can we please add the forward-port below from dunfell branch to fix 
using Yocto on distros with gcc 11:

commit ef8b7946b4793db653ef7dd716e1d3f919a84725
Author: Andrej Valek <andrej.valek@siemens.com>
Date:   Mon Aug 23 19:17:20 2021 +0200

     mklibs-native: drop deprecated cpp17 exceptions

     gcc11 has -std=gnu++17 as default. Remove deprecated C++17 
exceptions based
     on 
http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html.

     Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
     Signed-off-by: Steve Sakoman <steve@sakoman.com>

/Jacob


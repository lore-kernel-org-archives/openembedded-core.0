Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.45070.1597676081013303452
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 07:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lxm1ZI/B;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id u128so8354441pfb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 07:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=wzuOvXWqP8FHroOsfbbPkNWf2jmpf53MU5flUHck2ak=;
        b=Lxm1ZI/BYLVlT2n9/6Eo9M9KRs6Yjd0GbCLkccIZR2RpsXEQOytoz9OZq0jdRiWTB3
         aYUX8/b5voAQzYqWMJJdQim7LSGldJ4btG3Uh7x2FXX7K8YS8/K65cYGm2HpHbL6GuqR
         c/p7BQX4qGWJVNsO+lc0hjCB2Axxy5h/N/ItF3k/4IdC5zmVJg3NHh91BWk2tbcOj/YO
         +E7Ua0FVc5LrOtfcXK4FQzAsZDTu+DMLgYYcEtUvLlj9ZuFxKbDxQ2Dbv6y+W1zqNoqz
         S+aKQ4dwkyvfRjCpqrDDgVizWtoJGxUG9xj2lhrtV6U/wq5XYaJ2TEW93OSIlq8GOiM5
         y9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=wzuOvXWqP8FHroOsfbbPkNWf2jmpf53MU5flUHck2ak=;
        b=EVMXunEuVmrTNVJ6HPuqv5T2ZsRmgp8uPz+6ljxqVNm2SfP13uS4u+n6GQ2O1YaOm0
         7sDk10fIWEXND9wMYYHgkvT3nk24d+IM6UfcVfINRx1Jt3mVOYwgT1wfyh9UXoBOxswe
         5UICzNsm+JuGsCi1/NNPV6d6dXvg/KVHG9seNBYkpIMD4sXXAsj4S/h7OhiHMdo0QNcY
         8iFlj0Lv7ME/lgsbQ2vDnDZhS9WMqN82J5G6lzW914oVfw7U+SsAOVJ2zqahQ6QiYprP
         QM+FXFgmrPoWgtmL7aADpsx5n8mTY+RLnavNhDcAkbAGm34X75LX/iqlsnJvQpMOegRc
         n9jg==
X-Gm-Message-State: AOAM5302aaO9nH3NuesLR6kBBAiqmyMj42ipz1A7uUGggAZ9UyM0Yr92
	pctAh60IaQMLIZm/pxqSMUrAD5BKAIg=
X-Google-Smtp-Source: ABdhPJxBdWzfQ9DVoU4IrAHmDvNZWUl751z4EfGkYR2YEcbnGi2kAlu9DutAMNJJBxPOSOIlltz3JA==
X-Received: by 2002:aa7:8c09:: with SMTP id c9mr8839937pfd.157.1597676080277;
        Mon, 17 Aug 2020 07:54:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:3543:531d:382f:ed2a? ([2601:202:4180:a5c0:3543:531d:382f:ed2a])
        by smtp.gmail.com with ESMTPSA id k88sm10789910pjk.19.2020.08.17.07.54.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 07:54:39 -0700 (PDT)
Subject: Re: [AUH] bind: upgrading to 9.16.5 FAILED
Cc: openembedded-core@lists.openembedded.org
References: <20200816061950.DC33EE02022@yocto-www.yoctoproject.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <8e231e5b-22fd-dd94-1aee-cfdc6f7abe53@gmail.com>
Date: Mon, 17 Aug 2020 07:54:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200816061950.DC33EE02022@yocto-www.yoctoproject.org>
Content-Type: multipart/alternative;
 boundary="------------ABC01E2BB14608EC6AEDC70D"
Content-Language: en-US

--------------ABC01E2BB14608EC6AEDC70D
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

This update has been attempted a few times. It has many moving parts.

the latest work is sitting @

https://git.openembedded.org/openembedded-core-contrib
akuster/bind_update
<https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dakuster/=
bind_update>

- armin

On 8/15/20 11:19 PM, auh@auh.yoctoproject.org wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *bind* to *9.16.5* has=
 Failed (devtool error).
>
> Detailed error information:
>
> The following devtool command failed:  upgrade bind -V 9.16.5
> NOTE: Starting bitbake server...
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)...
> Loading cache...done.
> Loaded 1342 entries from dependency cache.
> INFO: Extracting current version source...
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "1.47.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "3.1+snapshot-20200815"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta                =20
> meta-poky           =20
> meta-yocto-bsp       =3D "tmp-auh-upgrades:641bf8cec1666761209f05c01316=
59f2f6a15d46"
> workspace            =3D "master:bd1da2aca0bc26720f438a9c1d54f5b04084da=
4e"
>
> Initialising tasks...done.
> Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% co=
mplete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be r=
erun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> INFO: Adding local source files to srctree...
> INFO: Extracting upgraded version source...
> INFO: Fetching https://ftp.isc.org/isc/bind9/9.16.5/bind-9.16.5.tar.gz.=
=2E.
> Loading cache...done.
> Loaded 1342 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 779 .bb files complete (777 cached, 2 parsed). 1343 targets,=
 33 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "1.47.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "3.1+snapshot-20200815"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta                =20
> meta-poky           =20
> meta-yocto-bsp       =3D "tmp-auh-upgrades:641bf8cec1666761209f05c01316=
59f2f6a15d46"
> workspace            =3D "master:bd1da2aca0bc26720f438a9c1d54f5b04084da=
4e"
>
> Initialising tasks...done.
> Sstate summary: Wanted 0 Found 0 Missed 0 Current 0 (0% match, 0% compl=
ete)
> NOTE: No setscene tasks
> NOTE: Executing Tasks
> WARNING: Failed to fetch URL https://ftp.isc.org/isc/bind9/9.16.5/bind-=
9.16.5.tar.gz, attempting MIRRORS if available
> ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset=
 _PYTHON_SYSCONFIGDATA_NAME; export ftp_proxy=3D"http://proxy.yocto.io:51=
87/"; export FTP_PROXY=3D"http://proxy.yocto.io:5187/"; export PATH=3D"/h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x=
86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scr=
ipts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipeto=
ol-uda27hb7/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-uda27hb7/w=
ork/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/=
build/build/build/tmp/work/recipetool-uda27hb7/work/recipe-sysroot-native=
/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/rec=
ipetool-uda27hb7/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto=
-worker/auh/build/build/build/tmp/work/recipetool-uda27hb7/work/recipe-sy=
sroot-native/sbin:/home/pokybuild/yocto-worker/auh/
>  build/build/build/tmp/work/recipetool-uda27hb7/work/recipe-sysroot-nat=
ive/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HO=
ME=3D"/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp --no-c=
heck-certificate -P /home/pokybuild/yocto-worker/auh/build/build/build/do=
wnloads 'https://ftp.isc.org/isc/bind9/9.16.5/bind-9.16.5.tar.gz' --progr=
ess=3Ddot -v failed with exit code 8, output:
> --2020-08-15 11:36:33--  https://ftp.isc.org/isc/bind9/9.16.5/bind-9.16=
=2E5.tar.gz
> Resolving ftp.isc.org (ftp.isc.org)... 2001:4f8:1:f::49, 149.20.1.49
> Connecting to ftp.isc.org (ftp.isc.org)|2001:4f8:1:f::49|:443... connec=
ted.
> HTTP request sent, awaiting response... 404 Not Found
> 2020-08-15 11:36:33 ERROR 404: Not Found.
>
>
> ERROR: Fetcher failure for URL: 'https://ftp.isc.org/isc/bind9/9.16.5/b=
ind-9.16.5.tar.gz'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/recipetool-uda27hb7/work/temp/log.do_fetch.4514=
9
> NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rer=
un and 1 failed.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> ERROR: Failed to fetch URL https://ftp.isc.org/isc/bind9/9.16.5/bind-9.=
16.5.tar.gz
>
>
>
> Please review the attached files for further information and build/upda=
te failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/ente=
r_bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper


--------------ABC01E2BB14608EC6AEDC70D
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsKICAgICAgY2hhcnNldD13aW5kb3dzLTEyNTIiPgogIDwvaGVh
ZD4KICA8Ym9keT4KICAgIFRoaXMgdXBkYXRlIGhhcyBiZWVuIGF0dGVtcHRlZCBhIGZldyB0
aW1lcy4gSXQgaGFzIG1hbnkgbW92aW5nCiAgICBwYXJ0cy48YnI+CiAgICA8YnI+CiAgICB0
aGUgbGF0ZXN0IHdvcmsgaXMgc2l0dGluZyBAPGJyPgogICAgPGJyPgogICAgPGEgY2xhc3M9
Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVk
Lm9yZy9vcGVuZW1iZWRkZWQtY29yZS1jb250cmliIj5odHRwczovL2dpdC5vcGVuZW1iZWRk
ZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlLWNvbnRyaWI8L2E+IDxhCmhyZWY9Imh0dHBzOi8v
Z2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUtY29udHJpYi9sb2cvP2g9
YWt1c3Rlci9iaW5kX3VwZGF0ZSI+YWt1c3Rlci9iaW5kX3VwZGF0ZTwvYT48YnI+CiAgICA8
YnI+CiAgICAtIGFybWluPGJyPgogICAgPGJyPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUt
cHJlZml4Ij5PbiA4LzE1LzIwIDExOjE5IFBNLAogICAgICA8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86YXVoQGF1aC55b2N0b3Byb2plY3Qub3Jn
Ij5hdWhAYXVoLnlvY3RvcHJvamVjdC5vcmc8L2E+IHdyb3RlOjxicj4KICAgIDwvZGl2Pgog
ICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKICAgICAgY2l0ZT0ibWlkOjIwMjAwODE2MDYx
OTUwLkRDMzNFRTAyMDIyQHlvY3RvLXd3dy55b2N0b3Byb2plY3Qub3JnIj4KICAgICAgPHBy
ZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5IZWxsbywKCnRoaXMgZW1haWwgaXMg
YSBub3RpZmljYXRpb24gZnJvbSB0aGUgQXV0byBVcGdyYWRlIEhlbHBlcgp0aGF0IHRoZSBh
dXRvbWF0aWMgYXR0ZW1wdCB0byB1cGdyYWRlIHRoZSByZWNpcGUgKmJpbmQqIHRvICo5LjE2
LjUqIGhhcyBGYWlsZWQgKGRldnRvb2wgZXJyb3IpLgoKRGV0YWlsZWQgZXJyb3IgaW5mb3Jt
YXRpb246CgpUaGUgZm9sbG93aW5nIGRldnRvb2wgY29tbWFuZCBmYWlsZWQ6ICB1cGdyYWRl
IGJpbmQgLVYgOS4xNi41Ck5PVEU6IFN0YXJ0aW5nIGJpdGJha2Ugc2VydmVyLi4uCk5PVEU6
IFJlY29ubmVjdGluZyB0byBiaXRiYWtlIHNlcnZlci4uLgpOT1RFOiBSZXRyeWluZyBzZXJ2
ZXIgY29ubmVjdGlvbiAoIzEpLi4uCkxvYWRpbmcgY2FjaGUuLi5kb25lLgpMb2FkZWQgMTM0
MiBlbnRyaWVzIGZyb20gZGVwZW5kZW5jeSBjYWNoZS4KSU5GTzogRXh0cmFjdGluZyBjdXJy
ZW50IHZlcnNpb24gc291cmNlLi4uCk5PVEU6IFJlc29sdmluZyBhbnkgbWlzc2luZyB0YXNr
IHF1ZXVlIGRlcGVuZGVuY2llcwoKQnVpbGQgQ29uZmlndXJhdGlvbjoKQkJfVkVSU0lPTiAg
ICAgICAgICAgPSAiMS40Ny4wIgpCVUlMRF9TWVMgICAgICAgICAgICA9ICJ4ODZfNjQtbGlu
dXgiCk5BVElWRUxTQlNUUklORyAgICAgID0gInVuaXZlcnNhbCIKVEFSR0VUX1NZUyAgICAg
ICAgICAgPSAieDg2XzY0LXBva3ktbGludXgiCk1BQ0hJTkUgICAgICAgICAgICAgID0gInFl
bXV4ODYtNjQiCkRJU1RSTyAgICAgICAgICAgICAgID0gInBva3kiCkRJU1RST19WRVJTSU9O
ICAgICAgID0gIjMuMStzbmFwc2hvdC0yMDIwMDgxNSIKVFVORV9GRUFUVVJFUyAgICAgICAg
PSAibTY0IGNvcmUyIgpUQVJHRVRfRlBVICAgICAgICAgICA9ICIiCm1ldGEgICAgICAgICAg
ICAgICAgIAptZXRhLXBva3kgICAgICAgICAgICAKbWV0YS15b2N0by1ic3AgICAgICAgPSAi
dG1wLWF1aC11cGdyYWRlczo2NDFiZjhjZWMxNjY2NzYxMjA5ZjA1YzAxMzE2NTlmMmY2YTE1
ZDQ2Igp3b3Jrc3BhY2UgICAgICAgICAgICA9ICJtYXN0ZXI6YmQxZGEyYWNhMGJjMjY3MjBm
NDM4YTljMWQ1NGY1YjA0MDg0ZGE0ZSIKCkluaXRpYWxpc2luZyB0YXNrcy4uLmRvbmUuClNz
dGF0ZSBzdW1tYXJ5OiBXYW50ZWQgMCBGb3VuZCAwIE1pc3NlZCAwIEN1cnJlbnQgMjAgKDAl
IG1hdGNoLCAxMDAlIGNvbXBsZXRlKQpOT1RFOiBFeGVjdXRpbmcgVGFza3MKTk9URTogVGFz
a3MgU3VtbWFyeTogQXR0ZW1wdGVkIDkzIHRhc2tzIG9mIHdoaWNoIDkwIGRpZG4ndCBuZWVk
IHRvIGJlIHJlcnVuIGFuZCBhbGwgc3VjY2VlZGVkLgpOT1RFOiBXcml0aW5nIGJ1aWxkaGlz
dG9yeQpOT1RFOiBXcml0aW5nIGJ1aWxkaGlzdG9yeSB0b29rOiAxIHNlY29uZHMKSU5GTzog
QWRkaW5nIGxvY2FsIHNvdXJjZSBmaWxlcyB0byBzcmN0cmVlLi4uCklORk86IEV4dHJhY3Rp
bmcgdXBncmFkZWQgdmVyc2lvbiBzb3VyY2UuLi4KSU5GTzogRmV0Y2hpbmcgPGEgY2xhc3M9
Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2Mv
YmluZDkvOS4xNi41L2JpbmQtOS4xNi41LnRhci5neiI+aHR0cHM6Ly9mdHAuaXNjLm9yZy9p
c2MvYmluZDkvOS4xNi41L2JpbmQtOS4xNi41LnRhci5nejwvYT4uLi4KTG9hZGluZyBjYWNo
ZS4uLmRvbmUuCkxvYWRlZCAxMzQyIGVudHJpZXMgZnJvbSBkZXBlbmRlbmN5IGNhY2hlLgpQ
YXJzaW5nIHJlY2lwZXMuLi5kb25lLgpQYXJzaW5nIG9mIDc3OSAuYmIgZmlsZXMgY29tcGxl
dGUgKDc3NyBjYWNoZWQsIDIgcGFyc2VkKS4gMTM0MyB0YXJnZXRzLCAzMyBza2lwcGVkLCAw
IG1hc2tlZCwgMCBlcnJvcnMuCk5PVEU6IFJlc29sdmluZyBhbnkgbWlzc2luZyB0YXNrIHF1
ZXVlIGRlcGVuZGVuY2llcwoKQnVpbGQgQ29uZmlndXJhdGlvbjoKQkJfVkVSU0lPTiAgICAg
ICAgICAgPSAiMS40Ny4wIgpCVUlMRF9TWVMgICAgICAgICAgICA9ICJ4ODZfNjQtbGludXgi
Ck5BVElWRUxTQlNUUklORyAgICAgID0gInVuaXZlcnNhbCIKVEFSR0VUX1NZUyAgICAgICAg
ICAgPSAieDg2XzY0LXBva3ktbGludXgiCk1BQ0hJTkUgICAgICAgICAgICAgID0gInFlbXV4
ODYtNjQiCkRJU1RSTyAgICAgICAgICAgICAgID0gInBva3kiCkRJU1RST19WRVJTSU9OICAg
ICAgID0gIjMuMStzbmFwc2hvdC0yMDIwMDgxNSIKVFVORV9GRUFUVVJFUyAgICAgICAgPSAi
bTY0IGNvcmUyIgpUQVJHRVRfRlBVICAgICAgICAgICA9ICIiCm1ldGEgICAgICAgICAgICAg
ICAgIAptZXRhLXBva3kgICAgICAgICAgICAKbWV0YS15b2N0by1ic3AgICAgICAgPSAidG1w
LWF1aC11cGdyYWRlczo2NDFiZjhjZWMxNjY2NzYxMjA5ZjA1YzAxMzE2NTlmMmY2YTE1ZDQ2
Igp3b3Jrc3BhY2UgICAgICAgICAgICA9ICJtYXN0ZXI6YmQxZGEyYWNhMGJjMjY3MjBmNDM4
YTljMWQ1NGY1YjA0MDg0ZGE0ZSIKCkluaXRpYWxpc2luZyB0YXNrcy4uLmRvbmUuClNzdGF0
ZSBzdW1tYXJ5OiBXYW50ZWQgMCBGb3VuZCAwIE1pc3NlZCAwIEN1cnJlbnQgMCAoMCUgbWF0
Y2gsIDAlIGNvbXBsZXRlKQpOT1RFOiBObyBzZXRzY2VuZSB0YXNrcwpOT1RFOiBFeGVjdXRp
bmcgVGFza3MKV0FSTklORzogRmFpbGVkIHRvIGZldGNoIFVSTCA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS85
LjE2LjUvYmluZC05LjE2LjUudGFyLmd6Ij5odHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5k
OS85LjE2LjUvYmluZC05LjE2LjUudGFyLmd6PC9hPiwgYXR0ZW1wdGluZyBNSVJST1JTIGlm
IGF2YWlsYWJsZQpFUlJPUjogRmV0Y2hlciBmYWlsdXJlOiBGZXRjaCBjb21tYW5kIGV4cG9y
dCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVNDT05GSUdEQVRBX05BTUU7
IGV4cG9ydCBmdHBfcHJveHk9PGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJl
Zj0iaHR0cDovL3Byb3h5LnlvY3RvLmlvOjUxODcvIj4iaHR0cDovL3Byb3h5LnlvY3RvLmlv
OjUxODcvIjwvYT47IGV4cG9ydCBGVFBfUFJPWFk9PGEgY2xhc3M9Im1vei10eHQtbGluay1y
ZmMyMzk2RSIgaHJlZj0iaHR0cDovL3Byb3h5LnlvY3RvLmlvOjUxODcvIj4iaHR0cDovL3By
b3h5LnlvY3RvLmlvOjUxODcvIjwvYT47IGV4cG9ydCBQQVRIPSIvaG9tZS9wb2t5YnVpbGQv
eW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC9idWlsZC90bXAvc3lzcm9vdHMtdW5pbmF0
aXZlL3g4Nl82NC1saW51eC91c3IvYmluOi9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIv
YXVoL2J1aWxkL2J1aWxkL3Bva3kvc2NyaXB0czovaG9tZS9wb2t5YnVpbGQveW9jdG8td29y
a2VyL2F1aC9idWlsZC9idWlsZC9idWlsZC90bXAvd29yay9yZWNpcGV0b29sLXVkYTI3aGI3
L3dvcmsvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4veDg2XzY0LXBva3ktbGludXg6
L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvYnVpbGQvdG1w
L3dvcmsvcmVjaXBldG9vbC11ZGEyN2hiNy93b3JrL3JlY2lwZS1zeXNyb290L3Vzci9iaW4v
Y3Jvc3NzY3JpcHRzOi9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1
aWxkL2J1aWxkL3RtcC93b3JrL3JlY2lwZXRvb2wtdWRhMjdoYjcvd29yay9yZWNpcGUtc3lz
cm9vdC1uYXRpdmUvdXNyL3NiaW46L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgv
YnVpbGQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvcmVjaXBldG9vbC11ZGEyN2hiNy93b3JrL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluOi9ob21lL3Bva3lidWlsZC95b2N0by13b3Jr
ZXIvYXVoL2J1aWxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL3JlY2lwZXRvb2wtdWRhMjdoYjcv
d29yay9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvc2JpbjovaG9tZS9wb2t5YnVpbGQveW9jdG8t
d29ya2VyL2F1aC8KIGJ1aWxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL3JlY2lwZXRvb2wtdWRh
MjdoYjcvd29yay9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvYmluOi9ob21lL3Bva3lidWlsZC95
b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL3Bva3kvYml0YmFrZS9iaW46L2hvbWUvcG9r
eWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvYnVpbGQvdG1wL2hvc3R0b29s
cyI7IGV4cG9ydCBIT01FPSIvaG9tZS9wb2t5YnVpbGQiOyAvdXNyL2Jpbi9lbnYgd2dldCAt
dCAyIC1UIDMwIC0tcGFzc2l2ZS1mdHAgLS1uby1jaGVjay1jZXJ0aWZpY2F0ZSAtUCAvaG9t
ZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL2F1aC9idWlsZC9idWlsZC9idWlsZC9kb3dubG9h
ZHMgJzxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZnRw
LmlzYy5vcmcvaXNjL2JpbmQ5LzkuMTYuNS9iaW5kLTkuMTYuNS50YXIuZ3oiPmh0dHBzOi8v
ZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LzkuMTYuNS9iaW5kLTkuMTYuNS50YXIuZ3o8L2E+JyAt
LXByb2dyZXNzPWRvdCAtdiBmYWlsZWQgd2l0aCBleGl0IGNvZGUgOCwgb3V0cHV0OgotLTIw
MjAtMDgtMTUgMTE6MzY6MzMtLSAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIg
aHJlZj0iaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvOS4xNi41L2JpbmQtOS4xNi41
LnRhci5neiI+aHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvOS4xNi41L2JpbmQtOS4x
Ni41LnRhci5nejwvYT4KUmVzb2x2aW5nIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2
aWF0ZWQiIGhyZWY9ImZ0cDovL2Z0cC5pc2Mub3JnIj5mdHAuaXNjLm9yZzwvYT4gKDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9ImZ0cDovL2Z0cC5pc2Mub3Jn
Ij5mdHAuaXNjLm9yZzwvYT4pLi4uIDIwMDE6NGY4OjE6Zjo6NDksIDE0OS4yMC4xLjQ5CkNv
bm5lY3RpbmcgdG8gPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0i
ZnRwOi8vZnRwLmlzYy5vcmciPmZ0cC5pc2Mub3JnPC9hPiAoPGEgY2xhc3M9Im1vei10eHQt
bGluay1hYmJyZXZpYXRlZCIgaHJlZj0iZnRwOi8vZnRwLmlzYy5vcmciPmZ0cC5pc2Mub3Jn
PC9hPil8MjAwMTo0Zjg6MTpmOjo0OXw6NDQzLi4uIGNvbm5lY3RlZC4KSFRUUCByZXF1ZXN0
IHNlbnQsIGF3YWl0aW5nIHJlc3BvbnNlLi4uIDQwNCBOb3QgRm91bmQKMjAyMC0wOC0xNSAx
MTozNjozMyBFUlJPUiA0MDQ6IE5vdCBGb3VuZC4KCgpFUlJPUjogRmV0Y2hlciBmYWlsdXJl
IGZvciBVUkw6ICc8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRw
czovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS85LjE2LjUvYmluZC05LjE2LjUudGFyLmd6Ij5o
dHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS85LjE2LjUvYmluZC05LjE2LjUudGFyLmd6
PC9hPicuIFVuYWJsZSB0byBmZXRjaCBVUkwgZnJvbSBhbnkgc291cmNlLgpFUlJPUjogTG9n
ZmlsZSBvZiBmYWlsdXJlIHN0b3JlZCBpbjogL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtl
ci9hdWgvYnVpbGQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvcmVjaXBldG9vbC11ZGEyN2hiNy93
b3JrL3RlbXAvbG9nLmRvX2ZldGNoLjQ1MTQ5Ck5PVEU6IFRhc2tzIFN1bW1hcnk6IEF0dGVt
cHRlZCAxIHRhc2tzIG9mIHdoaWNoIDAgZGlkbid0IG5lZWQgdG8gYmUgcmVydW4gYW5kIDEg
ZmFpbGVkLgpOT1RFOiBXcml0aW5nIGJ1aWxkaGlzdG9yeQpOT1RFOiBXcml0aW5nIGJ1aWxk
aGlzdG9yeSB0b29rOiAxIHNlY29uZHMKRVJST1I6IEZhaWxlZCB0byBmZXRjaCBVUkwgPGEg
Y2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9mdHAuaXNjLm9y
Zy9pc2MvYmluZDkvOS4xNi41L2JpbmQtOS4xNi41LnRhci5neiI+aHR0cHM6Ly9mdHAuaXNj
Lm9yZy9pc2MvYmluZDkvOS4xNi41L2JpbmQtOS4xNi41LnRhci5nejwvYT4KCgoKUGxlYXNl
IHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5k
IGJ1aWxkL3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcg
YXQgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9idWd6
aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQl
MjBVcGRhdGUlMjBIYW5kbGVyIj5odHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcv
ZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUyMFVwZGF0ZSUyMEhhbmRsZXI8L2E+
CgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXI8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4K
ICAgIDxicj4KICA8L2JvZHk+CjwvaHRtbD4K

--------------ABC01E2BB14608EC6AEDC70D--

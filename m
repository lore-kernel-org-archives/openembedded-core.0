Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF5165C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 18:55:09 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id q92so101427051ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 11:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r/Dvq7UoZj4o/htnfBudhcBiNI46FC63MOZgC6uhuYU=;
	b=o42Z++bngY51mUNthaoMQ6rN6ujFWCkd6rZfbh24hELoyvX+Mudo5Egyk1xqImRxLW
	OUfAh7htTpzmqhk523BbEeiWe6BJ4Oy+W0TQ45EjiONsfslrwA72Zak6W+bituFgErBR
	SvIoIog/ynYQErxNsuvC0lOB/oQqjgz34dhzwqj+ngc/ucjShtKplQ9o3D6bu3vRpYjF
	0jmpFhBdJZPx3j5K3bClkNENiTB7HZ2lreGAa6ezg25edEOgBaRFrtyPbMl+Nwu4qrOf
	8fNnVH1nEeuUVbqEc6CRuHcK6gvNzTXjIOGJd6sGYWDsGPV7dhVR4O5k9t3oRcmRLxkG
	h3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r/Dvq7UoZj4o/htnfBudhcBiNI46FC63MOZgC6uhuYU=;
	b=antPK2zfzjYWoQfTUUQHOesxIxGD8i/BpSvdObObcLRPNstKXGERhBgN+SS+SPzaSp
	n9fU/fE8Dq6Fd2l2piCGulV3dztEu8HM+kGQvUriFJ8zQ9393PmnIAPMHPdRxaPqjurD
	m4bIp6t+AZFpi5cOS2NhnYOsqpw3WI8bvbnR24rfMouuxlV3kTF9f6O20Vt3FvdcRm3p
	0kHBSNCUWEh61eeJaxgYcS6LwMnc1lCvWHxJ7ONgDsopks5ouEoEYjwFewAMgSdwRnsm
	HWw1IBTs3f0LREt2Ct6B1GGgkUsCU8H+suWOWog/S3CgIcxwLxPpQIRc0+DF2RxjexuJ
	Ce7g==
X-Gm-Message-State: AE9vXwN23cYUjq0MECUyEcTTMavi82GsH1rBXplgAi1Utp9hCNFx692wmiu6uikR0vOs82tiSPPPAeyINCsjhCdE
X-Received: by 10.107.53.206 with SMTP id k75mr38956886ioo.195.1474311309692; 
	Mon, 19 Sep 2016 11:55:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Mon, 19 Sep 2016 11:54:49 -0700 (PDT)
In-Reply-To: <db821c4f-4099-94de-f2d2-17ddf2486bbc@intel.com>
References: <1474069704-24428-1-git-send-email-california.l.sullivan@intel.com>
	<2c06b548-62b4-5766-4ac4-6a18972be549@windriver.com>
	<CAJTo0LbqExZ796Jn1_mtJBFjoLoFZ76VzgwAMB_Bm6NWUGAvVw@mail.gmail.com>
	<CAJTo0LbQKKuWXfWuPw4R1uh_A8R=NM4YEpaR2yOH3ePs40FbqA@mail.gmail.com>
	<db821c4f-4099-94de-f2d2-17ddf2486bbc@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Sep 2016 19:54:49 +0100
Message-ID: <CAJTo0LYTP5LGgxDxJj1Y+88YnoXDQa8G7yD2QyU5dF3kKN+1TQ@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Mon, 19 Sep 2016 18:55:09 -0000
Content-Type: multipart/alternative; boundary=001a11449504e73030053ce0d9a4

--001a11449504e73030053ce0d9a4
Content-Type: text/plain; charset=UTF-8

On 19 September 2016 at 18:05, Cal Sullivan <california.l.sullivan@intel.com
> wrote:

> It looks like the function is doing as its supposed to, and we need to
> update some PVs or SRCREVs to match PVs.
>
> E.g., on the error below, SRCREV d6237b3b24 is indeed 4.1.31.
>

And some more builders failed with 4.4:

ERROR: linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0
do_kernel_version_sanity_check: Package Version
(4.4.20+gitAUTOINC+e66032e2d9_628bf62756) does not match of kernel being
built (4.4.11). Please update the PV variable to match the kernel source.
ERROR: linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0
do_kernel_version_sanity_check: Function failed:
do_kernel_version_sanity_check (log file is located at
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0/temp/log.do_kernel_version_sanity_check.30210)
NOTE: recipe usbutils-008-r0: task do_fetch: Started
ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0/temp/log.do_kernel_version_sanity_check.30210
ERROR: Task
(/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-kernel/linux/linux-yocto_4.4.bb:do_kernel_version_sanity_check)
failed with exit code '1'

(ditto for ppc and x86)

Ross

--001a11449504e73030053ce0d9a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 September 2016 at 18:05, Cal Sullivan <span dir=3D"ltr">&lt;<a href=
=3D"mailto:california.l.sullivan@intel.com" target=3D"_blank">california.l.=
sullivan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-colo=
r:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div bgcolor=
=3D"#FFFFFF">It looks like the function is doing as its supposed to, and we=
 need
    to update some PVs or SRCREVs to match PVs.<br>
    <br>
    E.g., on the error below, SRCREV d6237b3b24 is indeed 4.1.31.</div></bl=
ockquote></div><br>And some more builders failed with 4.4:</div><br>ERROR: =
linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0 do_kernel_version_sa=
nity_check: Package Version (4.4.20+gitAUTOINC+e66032e2d9_628bf62756) does =
not match of kernel being built (4.4.11). Please update the PV variable to =
match the kernel source.<br>ERROR: linux-yocto-4.4.20+gitAUTOINC+e66032e2d9=
_628bf62756-r0 do_kernel_version_sanity_check: Function failed: do_kernel_v=
ersion_sanity_check (log file is located at /home/pokybuild/yocto-autobuild=
er/yocto-worker/nightly-arm/build/build/tmp/work/beaglebone-poky-linux-gnue=
abi/linux-yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0/temp/log.do_kern=
el_version_sanity_check.30210)<br>NOTE: recipe usbutils-008-r0: task do_fet=
ch: Started<br>ERROR: Logfile of failure stored in: /home/pokybuild/yocto-a=
utobuilder/yocto-worker/nightly-arm/build/build/tmp/work/beaglebone-poky-li=
nux-gnueabi/linux-yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0/temp/log=
.do_kernel_version_sanity_check.30210<br>ERROR: Task (/home/pokybuild/yocto=
-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-kernel/linux/linux=
-yocto_4.4.bb:do_kernel_version_sanity_check) failed with exit code &#39;1&=
#39;<div><br></div><div>(ditto for ppc and x86)</div><div><br></div><div>Ro=
ss</div></div>

--001a11449504e73030053ce0d9a4--

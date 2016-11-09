Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id CD11C719B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 10:04:31 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id n204so239312833qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 02:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IHqgN/gOeLZgeEuqVhNF/+vjEQEmDPfZd7IbXXx7QC4=;
	b=SRpWajGCR9B2qUYmn99497Yk4DpNnEoHoAr+aQoexuZhAxav7blVbRVW5wGPTOnlFC
	Vec405an6L3C+lQhZAIVNMcCGI5qRg4+ejm2xN0XRTToVoeVunx03eHiB8RHVBBv/bXz
	pyoXLBQS2V8RSmjgPC9fuY+YhYNZbjVdGlPSUJG1EgFuNfui6cOPyT/cRqzsS7odCAYj
	BMcBwc6JYGq3ZPSDGDXfWLAzO0JV6rPBLkpJ5Zw8pdV6ED32qZG9cv8Xf+c+/V9ozADR
	BQ6TymdMZWeCbLJSD8PnWEs05MfVt/NEQDBFBY09Lf7ZR/E25CfN15osBn1D4/uOA9Kg
	0dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IHqgN/gOeLZgeEuqVhNF/+vjEQEmDPfZd7IbXXx7QC4=;
	b=eoFENsrKC+8xP8RGkB0LeJcxOR7Ui6k/LMvHaWjpzw2bMSK1Y/CwmCSzH6eOBmALRs
	/VON/1j/oAecNrUkOb7OoW6xsSUWYmaIk96T1oIblJB9sWysBCoV4nWXvc/MhKTB05PA
	wRfx/33tv7mKGpL7das0QujVM9x4t75v9f6j3YfGix+WaAe+AmVsAlU+d1EYQrGTBsk1
	GCIM+znsUiX5QSk2wqKTDMLa75rbP2KNSwaPlFejCaxnT/QzBny1MZuvWgdWI7wUjJYc
	lvQ1agpA8QTNNR5Nqs/2d3g5n1WmVfoP5XlkXKoppHGU6iLaOoxtXkIuyhy5aVJFwB7W
	fNOA==
X-Gm-Message-State: ABUngveBOtAfIUz2xKLMM1wQy0pEOcZcHi5/F0IMNZ2vdGV28/eiKl5gQvT1Cudm2BY6MzJUUj4eeUQGtuuRqWQy
X-Received: by 10.55.31.157 with SMTP id n29mr16877639qkh.221.1478685872700;
	Wed, 09 Nov 2016 02:04:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 9 Nov 2016 02:04:12 -0800 (PST)
In-Reply-To: <CADkTA4OaRgUJwFwT=S_h41EW4OO_Koa+QQr=t3t+X+6pszrzBQ@mail.gmail.com>
References: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
	<20161105101438.1ef1f627@nuc.betafive.co.uk>
	<CAJTo0LbB0eGStoFbyinDYP0zzEJ27BL0eDyGKFkjdh=AaWBPVA@mail.gmail.com>
	<CADkTA4OaRgUJwFwT=S_h41EW4OO_Koa+QQr=t3t+X+6pszrzBQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Nov 2016 10:04:12 +0000
Message-ID: <CAJTo0LZxGYzpjUetPspX6mKktoL_XnDqfncyHFWN5Kzfij8-UQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OpenEmbedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Allow ${S} to be overridden
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
X-List-Received-Date: Wed, 09 Nov 2016 10:04:32 -0000
Content-Type: multipart/alternative; boundary=001a1147f2282d532f0540db62cc

--001a1147f2282d532f0540db62cc
Content-Type: text/plain; charset=UTF-8

On 9 November 2016 at 02:23, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> I can ack this patch, since no defaults change .. there's no risk to
> existing users.
>

Saying that of course doomed the patch:

ERROR: hello-mod-0.1-r0 do_make_scripts: Function failed: do_make_scripts
(log file is located at
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work/qemux86_64-poky-linux/hello-mod/0.1-r0/temp/log.do_make_scripts.14071)
ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work/qemux86_64-poky-linux/hello-mod/0.1-r0/temp/log.do_make_scripts.14071
Log data follows:
| DEBUG: Executing shell function do_make_scripts
| make: Entering directory
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work-shared/qemux86-64/kernel-source'
| make: *** No rule to make target 'scripts'.  Stop.
| make: Leaving directory
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work-shared/qemux86-64/kernel-source'
| WARNING:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work/qemux86_64-poky-linux/hello-mod/0.1-r0/temp/run.do_make_scripts.14071:1
exit 2 from 'make CC="x86_64-poky-linux-gcc  -fuse-ld=bfd"
LD="x86_64-poky-linux-ld.bfd " AR="x86_64-poky-linux-ar " -C
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work-shared/qemux86-64/kernel-source
O=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work-shared/qemux86-64/kernel-build-artifacts
scripts'
| ERROR: Function failed: do_make_scripts (log file is located at
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work/qemux86_64-poky-linux/hello-mod/0.1-r0/temp/log.do_make_scripts.14071)
NOTE: recipe hello-mod-0.1-r0: task do_make_scripts: Failed

The autobuilder builds hello-mod from meta-skeleton, which inherits module
and sets S=${WORKDIR}.

Ross

--001a1147f2282d532f0540db62cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 November 2016 at 02:23, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div>I can ack this patch, s=
ince no defaults change .. there&#39;s no risk to existing users.</div><div=
></div></blockquote></div><br>Saying that of course doomed the patch:</div>=
<br>ERROR: hello-mod-0.1-r0 do_make_scripts: Function failed: do_make_scrip=
ts (log file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly-qa-skeleton/build/build/tmp/work/qemux86_64-poky-linux/hello-mod/0.1=
-r0/temp/log.do_make_scripts.14071)<br>ERROR: Logfile of failure stored in:=
 /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/b=
uild/tmp/work/qemux86_64-poky-linux/hello-mod/0.1-r0/temp/log.do_make_scrip=
ts.14071<br>Log data follows:<br>| DEBUG: Executing shell function do_make_=
scripts<br>| make: Entering directory &#39;/home/pokybuild/yocto-autobuilde=
r/yocto-worker/nightly-qa-skeleton/build/build/tmp/work-shared/qemux86-64/k=
ernel-source&#39;<br>| make: *** No rule to make target &#39;scripts&#39;.=
=C2=A0 Stop.<br>| make: Leaving directory &#39;/home/pokybuild/yocto-autobu=
ilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work-shared/qemux86-=
64/kernel-source&#39;<br>| WARNING: /home/pokybuild/yocto-autobuilder/yocto=
-worker/nightly-qa-skeleton/build/build/tmp/work/qemux86_64-poky-linux/hell=
o-mod/0.1-r0/temp/run.do_make_scripts.14071:1 exit 2 from &#39;make CC=3D&q=
uot;x86_64-poky-linux-gcc =C2=A0-fuse-ld=3Dbfd&quot; LD=3D&quot;x86_64-poky=
-linux-ld.bfd &quot; AR=3D&quot;x86_64-poky-linux-ar &quot; -C /home/pokybu=
ild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work=
-shared/qemux86-64/kernel-source O=3D/home/pokybuild/yocto-autobuilder/yoct=
o-worker/nightly-qa-skeleton/build/build/tmp/work-shared/qemux86-64/kernel-=
build-artifacts scripts&#39;<br>| ERROR: Function failed: do_make_scripts (=
log file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/night=
ly-qa-skeleton/build/build/tmp/work/qemux86_64-poky-linux/hello-mod/0.1-r0/=
temp/log.do_make_scripts.14071)<br>NOTE: recipe hello-mod-0.1-r0: task do_m=
ake_scripts: Failed<div><br></div><div>The autobuilder builds hello-mod fro=
m meta-skeleton, which inherits module and sets S=3D${WORKDIR}.</div><div><=
br></div><div>Ross</div></div>

--001a1147f2282d532f0540db62cc--

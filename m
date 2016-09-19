Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id BEBD4731B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 15:10:11 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id m186so94122399ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 08:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6egJxFv3O5/R296n2y+ZPtyl0ov4dvIrUWOyLH9k7CM=;
	b=LUI25YeLkKoBuntM2kHd+h4OOgAineK2rm9FwWM+68HT06zqK6lZmvegIGXhH9iLe0
	j5HA6bLRdp5+f8RqrlioDGoZAire45chrH4VYKHQrZ3z0+zVixNm0Iq8c5JQGZNfmw4X
	paXAjM2wFbnV1Bvlytwuo+T10wm0W88dCKZO6REj2tXA3pZt7oPTGBU3APxwk3puzROc
	WxjqKGh0/Q7rEqbCJKl8gwjzrmzsbWpf44eQsObFFNllu3mBgLxtrIrXzKej7zsSKipZ
	29Cut0Fn6mUtahOOau5uoa4LCAqks+0rUmmyhrxve8JblaXSaRdq8tnKpBmvvlPjDfdA
	Aq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6egJxFv3O5/R296n2y+ZPtyl0ov4dvIrUWOyLH9k7CM=;
	b=VPlYAWJFghvytnXjI93aGtFM21NGAx0XSop7C/vIDt7p3QUhGC1sAZGjRjIEK2TSot
	GiVpNedBJE3kx3WMOXjrhcSsmcn+Vbqb9rzBH66//cg1AzsSANScw9Voh4+QK25pfTXG
	dz9VwRPy7+pwXn2537xcRbf07tUoDySZrErT9FeL2k9cmRFCMorZrnteVHJr5H3FSBc5
	spjnsCqRyp+lPvJ3mGPZwgLL2hPKsG1Oa1zJdHnlPHCSLT8vdC5VuJWLiFVbyD/iOLFz
	0uXZhlvq1U3lgp3szj7RWixdf+6dDB4J7YcM0L6ECelmGmedOd1mUuIqByG1DWTle8sJ
	mhTw==
X-Gm-Message-State: AE9vXwPdl0ooHK6d6Mnn795LzI2OdQkfRfYxzl5mp7hpwewq0Mb7EV+KHdfg8dJNQ2OtUvZlc21g8KCGdRFI7AjA
X-Received: by 10.107.142.147 with SMTP id q141mr13755092iod.67.1474297812032; 
	Mon, 19 Sep 2016 08:10:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Mon, 19 Sep 2016 08:09:51 -0700 (PDT)
In-Reply-To: <2c06b548-62b4-5766-4ac4-6a18972be549@windriver.com>
References: <1474069704-24428-1-git-send-email-california.l.sullivan@intel.com>
	<2c06b548-62b4-5766-4ac4-6a18972be549@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Sep 2016 16:09:51 +0100
Message-ID: <CAJTo0LbqExZ796Jn1_mtJBFjoLoFZ76VzgwAMB_Bm6NWUGAvVw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 19 Sep 2016 15:10:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c05b2de63077e053cddb5d7

--94eb2c05b2de63077e053cddb5d7
Content-Type: text/plain; charset=UTF-8

On 19 September 2016 at 16:04, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> Otherwise, I don't see anything obviously wrong (I looked at the regexs
> but didn't study them in detail) .. and it looks sane to me. A good
> balance between checking and not needing the entire kernel to be built
> and exported to work-shared.
>

This is being fired on the AB:

ERROR: linux-yocto-4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0
do_kernel_version_sanity_check: Package Version
(4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24) does not match of kernel being
built (4.1.31). Please update the PV variable to match the kernel source.
ERROR: linux-yocto-4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0
do_kernel_version_sanity_check: Function failed:
do_kernel_version_sanity_check (log file is located at
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/qemumips-poky-linux/linux-yocto/4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0/temp/log.do_kernel_version_sanity_check.9143)
ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/qemumips-poky-linux/linux-yocto/4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0/temp/log.do_kernel_version_sanity_check.9143

Ross

--94eb2c05b2de63077e053cddb5d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 September 2016 at 16:04, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(=
204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:11=
w" class=3D"gmail-a3s gmail-aXjCH gmail-m15742fa94aa6b477">Otherwise, I don=
&#39;t see anything obviously wrong (I looked at the regexs<br>
but didn&#39;t study them in detail) .. and it looks sane to me. A good<br>
balance between checking and not needing the entire kernel to be built<br>
and exported to work-shared.<br></div></blockquote></div><br></div><div cla=
ss=3D"gmail_extra">This is being fired on the AB:</div><div class=3D"gmail_=
extra"><br></div>ERROR: linux-yocto-4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24=
-r0 do_kernel_version_sanity_check: Package Version (4.1.32+gitAUTOINC+b30b=
6b9ef2_d6237b3b24) does not match of kernel being built (4.1.31). Please up=
date the PV variable to match the kernel source.<br>ERROR: linux-yocto-4.1.=
32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0 do_kernel_version_sanity_check: Func=
tion failed: do_kernel_version_sanity_check (log file is located at /home/p=
okybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/wo=
rk/qemumips-poky-linux/linux-yocto/4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-=
r0/temp/log.do_kernel_version_sanity_check.9143)<br>ERROR: Logfile of failu=
re stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-l=
sb/build/build/tmp/work/qemumips-poky-linux/linux-yocto/4.1.32+gitAUTOINC+b=
30b6b9ef2_d6237b3b24-r0/temp/log.do_kernel_version_sanity_check.9143<div><b=
r></div><div>Ross</div></div>

--94eb2c05b2de63077e053cddb5d7--

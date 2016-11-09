Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5883C60684
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 13:09:09 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n204so17613169qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 05:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=idiAImEs4VXb4SLxaQ2T9rQsc9LK9cV7YfghF/xTgMA=;
	b=DzZ9gglQG/EPlPmrl4a2DUJKFrUdtaSYbjJ9Ir93+OqcfRe4Vn1w6fvfQtO0ldqjpG
	68hUB5JddVz7WAg0m1umaOC74bg673uV+HGEXprXjpyzN7RScTTEGy/VPaN6whcW1VGf
	0+P4W1/V4g4VoFgGvUZEO+/yMLwnXKWHvnnajKXMP8FHtmMJiGofwBzvEu88MYRHrLOg
	kI/nV/S7tDflEGKzES77bsGyHezMC3Rp5BexdHX6rTnL1xhc9IV5Il0EyilK+ZlJEOht
	EdA71xRZ1RnFardJo56cSjraMdIEAvABR4e8VSjUn8emLF7cJHAcmx5nlDdIyzRiH0Bf
	TR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=idiAImEs4VXb4SLxaQ2T9rQsc9LK9cV7YfghF/xTgMA=;
	b=lYTDC3LMDDLwiRsWW6I4P4TX24/UEqZobi+Y4eXpgMSssodLZkYORPAGzIwWsdvQlR
	7sKoY5Ie65jQBzRpGfQyXcBsXVlq3DX178mfDyABKyVjzSScedINk5MoMVJ1VCTg6q/D
	05JbeyrZgiyoGdxXqrZzLUx5/T5ZMaQurl6WhedwZ/hMxBbjSYRDbCY+hdmwLBki6cVs
	F0hnFNMSAJAvsrn8DGGRzuEfqpP3/SBwGsZ9xwCHncZykt6m4WTXp1g/9dZ8XeJPZYtr
	5V7sObzE/2BGzGwH3gJivgQ1jU8op65Xmoil+CbQFNuxsuY5RGLIf5VNtahcK8ZTtH0a
	PtZw==
X-Gm-Message-State: ABUngvdrajnx9ikPYf9HgwNY16smGvxfbouVudgpc9i064gJdq2oU/ePtqWzFGt/c8ve6jZxsFfJ97aVWeca+w==
X-Received: by 10.55.164.206 with SMTP id n197mr19984381qke.197.1478696950547; 
	Wed, 09 Nov 2016 05:09:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Wed, 9 Nov 2016 05:09:09 -0800 (PST)
In-Reply-To: <CAJTo0LZxGYzpjUetPspX6mKktoL_XnDqfncyHFWN5Kzfij8-UQ@mail.gmail.com>
References: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
	<20161105101438.1ef1f627@nuc.betafive.co.uk>
	<CAJTo0LbB0eGStoFbyinDYP0zzEJ27BL0eDyGKFkjdh=AaWBPVA@mail.gmail.com>
	<CADkTA4OaRgUJwFwT=S_h41EW4OO_Koa+QQr=t3t+X+6pszrzBQ@mail.gmail.com>
	<CAJTo0LZxGYzpjUetPspX6mKktoL_XnDqfncyHFWN5Kzfij8-UQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 9 Nov 2016 08:09:09 -0500
Message-ID: <CADkTA4NmhstuGn7cZLD-MGB1OdNbAFLkiOKrf20Bri0KSEsuQA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Wed, 09 Nov 2016 13:09:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c06567a77eef20540ddf6c2

--94eb2c06567a77eef20540ddf6c2
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 9, 2016 at 5:04 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 9 November 2016 at 02:23, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>> I can ack this patch, since no defaults change .. there's no risk to
>> existing users.
>>
>
> Saying that of course doomed the patch:
>

interesting.

Paul: obviously you were building with this in place, and my local test did
work here
as well .. so any idea to the difference ?

Let me know if you want any help looking into it.

Cheers,

Bruce


>
> ERROR: hello-mod-0.1-r0 do_make_scripts: Function failed: do_make_scripts
> (log file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-qa-skeleton/build/build/tmp/work/qemux86_64-
> poky-linux/hello-mod/0.1-r0/temp/log.do_make_scripts.14071)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-qa-skeleton/build/
> build/tmp/work/qemux86_64-poky-linux/hello-mod/0.1-r0/
> temp/log.do_make_scripts.14071
> Log data follows:
> | DEBUG: Executing shell function do_make_scripts
> | make: Entering directory '/home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-qa-skeleton/build/
> build/tmp/work-shared/qemux86-64/kernel-source'
> | make: *** No rule to make target 'scripts'.  Stop.
> | make: Leaving directory '/home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-qa-skeleton/build/build/tmp/work-shared/qemux86-64/kernel-source'
> | WARNING: /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-qa-skeleton/build/build/tmp/work/qemux86_64-
> poky-linux/hello-mod/0.1-r0/temp/run.do_make_scripts.14071:1 exit 2 from
> 'make CC="x86_64-poky-linux-gcc  -fuse-ld=bfd" LD="x86_64-poky-linux-ld.bfd
> " AR="x86_64-poky-linux-ar " -C /home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-qa-skeleton/build/
> build/tmp/work-shared/qemux86-64/kernel-source O=/home/pokybuild/yocto-
> autobuilder/yocto-worker/nightly-qa-skeleton/build/
> build/tmp/work-shared/qemux86-64/kernel-build-artifacts scripts'
> | ERROR: Function failed: do_make_scripts (log file is located at
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/
> build/tmp/work/qemux86_64-poky-linux/hello-mod/0.1-r0/
> temp/log.do_make_scripts.14071)
> NOTE: recipe hello-mod-0.1-r0: task do_make_scripts: Failed
>
> The autobuilder builds hello-mod from meta-skeleton, which inherits module
> and sets S=${WORKDIR}.
>
> Ross
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c06567a77eef20540ddf6c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Nov 9, 2016 at 5:04 AM, Burton, Ross <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">=
On 9 November 2016 at 02:23, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div>I can ack this patch, s=
ince no defaults change .. there&#39;s no risk to existing users.</div><div=
></div></blockquote></div><br></span>Saying that of course doomed the patch=
:</div></div></blockquote><div><br></div><div>interesting.=C2=A0</div><div>=
<br></div><div>Paul: obviously you were building with this in place, and my=
 local test did work here</div><div>as well .. so any idea to the differenc=
e ?</div><div><br></div><div>Let me know if you want any help looking into =
it.</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br>ERROR: h=
ello-mod-0.1-r0 do_make_scripts: Function failed: do_make_scripts (log file=
 is located at /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nig=
htly-qa-skeleton/build/<wbr>build/tmp/work/qemux86_64-<wbr>poky-linux/hello=
-mod/0.1-r0/<wbr>temp/log.do_make_scripts.<wbr>14071)<br>ERROR: Logfile of =
failure stored in: /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr=
>nightly-qa-skeleton/build/<wbr>build/tmp/work/qemux86_64-<wbr>poky-linux/h=
ello-mod/0.1-r0/<wbr>temp/log.do_make_scripts.14071<br>Log data follows:<br=
>| DEBUG: Executing shell function do_make_scripts<br>| make: Entering dire=
ctory &#39;/home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly=
-qa-skeleton/build/<wbr>build/tmp/work-shared/qemux86-<wbr>64/kernel-source=
&#39;<br>| make: *** No rule to make target &#39;scripts&#39;.=C2=A0 Stop.<=
br>| make: Leaving directory &#39;/home/pokybuild/yocto-<wbr>autobuilder/yo=
cto-worker/<wbr>nightly-qa-skeleton/build/<wbr>build/tmp/work-shared/qemux8=
6-<wbr>64/kernel-source&#39;<br>| WARNING: /home/pokybuild/yocto-<wbr>autob=
uilder/yocto-worker/<wbr>nightly-qa-skeleton/build/<wbr>build/tmp/work/qemu=
x86_64-<wbr>poky-linux/hello-mod/0.1-r0/<wbr>temp/run.do_make_scripts.<wbr>=
14071:1 exit 2 from &#39;make CC=3D&quot;x86_64-poky-linux-gcc =C2=A0-fuse-=
ld=3Dbfd&quot; LD=3D&quot;x86_64-poky-linux-ld.bfd &quot; AR=3D&quot;x86_64=
-poky-linux-ar &quot; -C /home/pokybuild/yocto-<wbr>autobuilder/yocto-worke=
r/<wbr>nightly-qa-skeleton/build/<wbr>build/tmp/work-shared/qemux86-<wbr>64=
/kernel-source O=3D/home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr=
>nightly-qa-skeleton/build/<wbr>build/tmp/work-shared/qemux86-<wbr>64/kerne=
l-build-artifacts scripts&#39;<br>| ERROR: Function failed: do_make_scripts=
 (log file is located at /home/pokybuild/yocto-<wbr>autobuilder/yocto-worke=
r/<wbr>nightly-qa-skeleton/build/<wbr>build/tmp/work/qemux86_64-<wbr>poky-l=
inux/hello-mod/0.1-r0/<wbr>temp/log.do_make_scripts.<wbr>14071)<br>NOTE: re=
cipe hello-mod-0.1-r0: task do_make_scripts: Failed<div><br></div><div>The =
autobuilder builds hello-mod from meta-skeleton, which inherits module and =
sets S=3D${WORKDIR}.</div><span class=3D"HOEnZb"><font color=3D"#888888"><d=
iv><br></div><div>Ross</div></font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c06567a77eef20540ddf6c2--

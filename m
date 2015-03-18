Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 808706013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 11:53:28 +0000 (UTC)
Received: by qcbkw5 with SMTP id kw5so35137308qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 04:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+aMUt7HG4EQh3lbB9zWLOfP89vexlowM2D4pfwTRtdM=;
	b=d3d/6doOmMVloGI0ruPuCk/O7qV/YAARG2qayON13Rm+E0Y2qMaKBHMQf4vbv2WKDw
	LBHf7i7xDoetUKyzmXBR6A19HAo6VvReR0vZWBC3WTBJSlbMqUBOWI+xbn77rwc5umZO
	YPSyi/c5BvQh5YBMeLe3Ho27qKbpX68fNp3gyDJeiQkzoklhfzmAJuA5aXLdOqDb4PvA
	L6YHG9BS2DBOBixKp9N5NHdq31y5sRQLA9EVyQKaMjlVuVek7RQY2ejRqKtHJHMDGM3V
	J9NvvOU7sYd3OAqJKqcUWtfn0XEI17QUBv7m7tncEV5aZQkx8UaVk4UK7g40f/YIcqYL
	D0nA==
X-Gm-Message-State: ALoCoQk60e0sDkApHNO5x8OgzKZSl3B1CkoM55AqBu+S0N72PAPlbxOu65LzL2R/2BEIgOENB1UX
X-Received: by 10.140.150.79 with SMTP id 76mr46054145qhw.66.1426679610046;
	Wed, 18 Mar 2015 04:53:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 18 Mar 2015 04:53:09 -0700 (PDT)
In-Reply-To: <1426496025-26942-2-git-send-email-rep.dot.nop@gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
	<1426496025-26942-2-git-send-email-rep.dot.nop@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Mar 2015 13:53:09 +0200
Message-ID: <CAJTo0LbC_-Cj6VdfCNL65bO6OyMeQKMpsgXdXEHhxahor7OtAQ@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] rpcbind: respin patches
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
X-List-Received-Date: Wed, 18 Mar 2015 11:53:30 -0000
Content-Type: multipart/alternative; boundary=001a1135487a5da06205118ebb0b

--001a1135487a5da06205118ebb0b
Content-Type: text/plain; charset=UTF-8

On 16 March 2015 at 10:53, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
wrote:

> Due to libc-dependant conditional patching (which should be completely
> forbidden -- fix it properly instead) the last PV bump forgot to adjust
> patches so they failed to apply.
>
> Fix this by redoing the patches. These patches were submitted for
> upstream master, add backported patches for the current tarball.
>

The autobuilder is failing on this recipe (
http://errors.yoctoproject.org/Errors/Details/9409/):

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/sysroots/qemux86-64/usr/lib/../lib/libtirpc.so:
undefined reference to `_yp_check'

Ross

--001a1135487a5da06205118ebb0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2015 at 10:53, Bernhard Reutner-Fischer <span dir=3D"ltr">&lt;<=
a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div id=3D":3ih" class=3D"" =
style=3D"overflow:hidden">Due to libc-dependant conditional patching (which=
 should be completely<br>
forbidden -- fix it properly instead) the last PV bump forgot to adjust<br>
patches so they failed to apply.<br>
<br>
Fix this by redoing the patches. These patches were submitted for<br>
upstream master, add backported patches for the current tarball.</div></blo=
ckquote></div><br>The autobuilder is failing on this recipe (<a href=3D"htt=
p://errors.yoctoproject.org/Errors/Details/9409/">http://errors.yoctoprojec=
t.org/Errors/Details/9409/</a>):</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">/home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly-qa-skeleton/build/build/tmp/sysroots/qemux86-64/usr/lib/../lib/libti=
rpc.so: undefined reference to `_yp_check&#39;<br></div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135487a5da06205118ebb0b--

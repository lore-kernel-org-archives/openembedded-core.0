Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9856013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 10:55:22 +0000 (UTC)
Received: by qku63 with SMTP id 63so83615635qku.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 03:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cDyToObP+9q021BPGttpccY6JUg69dJ+uet2qvHmvfw=;
	b=J5skZW4p8BopGUnON/T4HPuBad/oig9o/hfpT4NgpxwZTpPiz9SMLWfqhvQVApKRV6
	jBt2SvfGNH1crnzFrt+2yFqz4Ls+gOyE5VBuWo8PkLStiIVxFdMorz17yFK7zhGTOmtf
	dwEuw/fBR6u/bUFNU1iCujrwjhocbryiItTNtN6tywLqeRsg7PghI4FsOvmAoLQsNACe
	Y4Y6zocw8yaH9VbAQpHQoHf1U+bM3SqP0Os+iD+t3Wi/jUs04OkIuFQFyOQpWniQKwTA
	jkGZerx21BA7I+0s5DqvJPDUwIQz0B/wwuLpU3eWPXgBwVvzuZQFPEZ5OEkRKRIqzHKz
	0mGQ==
X-Gm-Message-State: ALoCoQnheup2R7w2qKBTgrkmGCg/ZvEQef+j3/Kh8Csd/ejMkZc2PXp2aVxXfiieYRoNIJRbub1/
X-Received: by 10.140.216.5 with SMTP id m5mr13152674qhb.52.1431341723534;
	Mon, 11 May 2015 03:55:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 11 May 2015 03:55:03 -0700 (PDT)
In-Reply-To: <1431124779-28516-1-git-send-email-juro.bystricky@intel.com>
References: <1431124779-28516-1-git-send-email-juro.bystricky@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 May 2015 11:55:03 +0100
Message-ID: <CAJTo0Lb4sfifeBx_T+a=acfk9TjRfVNaCqp+KngUccPKS609LA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for VirtualBox VDI images
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
X-List-Received-Date: Mon, 11 May 2015 10:55:25 -0000
Content-Type: multipart/alternative; boundary=001a11354e68fbdd960515cc36d9

--001a11354e68fbdd960515cc36d9
Content-Type: text/plain; charset=UTF-8

Thanks Juro,

On 8 May 2015 at 23:39, Juro Bystricky <juro.bystricky@intel.com> wrote:

> Yocto does not support VirtualBox sparse image VDI file format.
> This could be achieved by the attached patch. The support mimics
> the VMDK support for VMware. The only subtle difference is that
> qemu-native has be be built with uuid enabled, as VDI images
> need a valid UUID in order to be recognized by VirtualBox.
>
> [YOCTO #7374]
>

This needs to be split up into logical patches.  For example one to enable
UUID into Qemu, one to add the new image type, another to update the checks.

Ross

--001a11354e68fbdd960515cc36d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Thanks Juro,</div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On 8 May 2015 at 23:39, Juro B=
ystricky <span dir=3D"ltr">&lt;<a href=3D"mailto:juro.bystricky@intel.com" =
target=3D"_blank">juro.bystricky@intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div id=3D":2bx" class=3D"a3s" style=3D"overflow:hi=
dden">Yocto does not support VirtualBox sparse image VDI file format.<br>
This could be achieved by the attached patch. The support mimics<br>
the VMDK support for VMware. The only subtle difference is that<br>
qemu-native has be be built with uuid enabled, as VDI images<br>
need a valid UUID in order to be recognized by VirtualBox.<br>
<br>
[YOCTO #7374]</div></blockquote></div><br>This needs to be split up into lo=
gical patches.=C2=A0 For example one to enable UUID into Qemu, one to add t=
he new image type, another to update the checks.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11354e68fbdd960515cc36d9--

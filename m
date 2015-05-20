Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0B7601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 22:28:47 +0000 (UTC)
Received: by qcir1 with SMTP id r1so30836862qci.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=05kVKWiTHw7C4hK0hncZ5aqqQKAFN5XLWoriVuhtkOU=;
	b=I2RneQnBptW+lT2TREHDqoHAi9QIIsMeZOjFNHKRNygKU+y/x+CR3pM1nuXJmSo89i
	xBJtZxWdxxW00OO0fWalQf/7AkmaFfteoGzd2JOTPewS4CO/gOkUDI5P586wAvqrrx+V
	qlSLCggNPJsU/uCFvZHUN/CLRNDHDnpaWoWfF+HUmtOY10vxNWoAb/t0xLuiPIl2rxnU
	MCsz/BAtN8hXsF+RrICgae+Ei2xEHi9EnPxTQL64JlUsfmXp+zy/6dLUGY+plOeLi1Zw
	7t2YO7jVPGibTkS7OsYnaT/snZlQw006OoSTBFDUzeNfoCcYjRtDFLAknAeyEPoWiQIi
	caSw==
X-Gm-Message-State: ALoCoQlG7Vg/LkdgTVk2nZ/5IEwUP7GK16naqy5CCJg9Obr4MoNe4iPjxzvXDoxdz3j30ZsUAG3A
X-Received: by 10.55.20.10 with SMTP id e10mr77294514qkh.36.1432160928516;
	Wed, 20 May 2015 15:28:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 15:28:28 -0700 (PDT)
In-Reply-To: <1431957520-14510-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1431957520-14510-1-git-send-email-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 23:28:28 +0100
Message-ID: <CAJTo0LaJddtsS52m0vo+RhRrcEY+uve_1nVXNTuqhCPWx4n3DA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Remove unsupported GStreamer 0.10
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
X-List-Received-Date: Wed, 20 May 2015 22:28:49 -0000
Content-Type: multipart/alternative; boundary=001a1137de3267ddf405168af3d5

--001a1137de3267ddf405168af3d5
Content-Type: text/plain; charset=UTF-8

On 18 May 2015 at 14:58, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> These patches remove the unsupported GStreamer 0.10 framework from
> oe-core.
> GStreamer 0.10 will still be available from meta-oe, but is no longer
> recommended to use.
>

Can you send a follow-up patch to poky@ to remove the deleted recipes from
the tracking files in meta-yocto/conf/distro/*.inc?

Thanks,
Ross

--001a1137de3267ddf405168af3d5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2015 at 14:58, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":3gg" class=3D"a3s" style=3D"overflow:hidden">These patches rem=
ove the unsupported <span class=3D"il">GStreamer</span> 0.10 framework from=
 oe-core.<br>
<span class=3D"il">GStreamer</span> 0.10 will still be available from meta-=
oe, but is no longer recommended to use.<br></div></blockquote></div><br>Ca=
n you send a follow-up patch to poky@ to remove the deleted recipes from th=
e tracking files in meta-yocto/conf/distro/*.inc?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Thanks,</div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a1137de3267ddf405168af3d5--

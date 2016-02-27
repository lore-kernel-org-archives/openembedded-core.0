Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id BA1E377447
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 01:29:09 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 9so134811589iom.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 17:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SLCGt4mBltK3m4NyKf5aBgb/mNG7852/py3B1yqF4Z8=;
	b=g8BEXg1mRvHGKpbXeltJgcWlyD3t/TEkzGqE5wn4Po8RDiCQnV5+jfmkuXtaQoUbxq
	Ey0XPFlc2wqq59y+LUhSMey1p94iqSTHLS96o7dZh77xXBcV2tx0t4RNC3ccvXEyLkqt
	EPe31HFMdCP6IEy1T76fR5h4SSkY1yDg3jU5F4fnWAgknT/FX6vsvIFc75urzVsupgtV
	pm4HkNxuPvCWVawKWfjKWeYnsFglW0B1htcogMMs+zlXmryii2EsvFM1SQhYzSyJ4q5y
	MMED8H/Op+hnOwFjvSt+2tIiExn3wMNbgoGXPPzNaeKauvuD6JIyQgC8PYExwdMdpEQl
	Ennw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SLCGt4mBltK3m4NyKf5aBgb/mNG7852/py3B1yqF4Z8=;
	b=RzZpb9+SZb5MDQRv1SUAJJhhUxGfIrTCl5FTM3/Rp02FWZ/2I9jyuuifEfIRBhumtl
	fauG6x08qx4/AzXirText1QOxsbhrS6BwR90CbnKsoRnqQWEPdiciH2OppMlzh4bnVCf
	EIZcI5OHrwPk8J9cHNoqte28JORlSur9i4T7/An9ubQypRRtah3wfuirTFDvqL2eqrP9
	fZa1iLMIC73ZOpN8x53jmUEdA+3K6uZqcuh0tQKLJrNm4ox2W+wfNmRDnEt1yEmamrxo
	kaw8SwXtim93Hs7Y43vx/FaQg9oEItsLEGXGTvIHKlsPOBj/vI7K1w56LfNVBDPXXT+X
	EeeA==
X-Gm-Message-State: AG10YOSrJWkqffK18/Bh5wJGQIoRlIna3//OARwU1FQjv2sYA54QFodtE3m8sMVXT4cFcK6cOuTMSIKwYDcg3w==
X-Received: by 10.107.12.226 with SMTP id 95mr11380307iom.70.1456536550619;
	Fri, 26 Feb 2016 17:29:10 -0800 (PST)
MIME-Version: 1.0
References: <1456508168.11498.95.camel@linuxfoundation.org>
	<56D09D35.8040002@balister.org>
	<1456512644.11498.108.camel@linuxfoundation.org>
	<2042150.gN3rpHrprf@rjs-zotac.streifs.net>
	<56D0B298.9050108@balister.org>
	<CAJTo0LbNVZ9k5P+ugk-kg4_PBG0P8nbkJpBHjkv2XqvJrjsdyA@mail.gmail.com>
In-Reply-To: <CAJTo0LbNVZ9k5P+ugk-kg4_PBG0P8nbkJpBHjkv2XqvJrjsdyA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 27 Feb 2016 01:29:00 +0000
Message-ID: <CABcZANnFXbde4wY5wTzZb0FMfJN4z_zZjNLb2GtMu-tuRws+xA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	Philip Balister <philip@balister.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Rudolf J Streif <rudolf.streif@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Yocto Project Status WW09
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
X-List-Received-Date: Sat, 27 Feb 2016 01:29:10 -0000
Content-Type: multipart/alternative; boundary=001a113f8f8eb3c123052cb6574c

--001a113f8f8eb3c123052cb6574c
Content-Type: text/plain; charset=UTF-8

This is the sort of case where it'd be nice if bitbake provided a plugin
mechanism, pure python, no metadata parsing. Something to think about in
the long term..
On Fri, Feb 26, 2016 at 1:59 PM Burton, Ross <ross.burton@intel.com> wrote:

>
> On 26 February 2016 at 20:16, Philip Balister <philip@balister.org> wrote:
>
>> I must admit, I'm surprised this is tricky. I look forward to seeing
>> what needs doing. Hopefully, it shows me things I can avoid in my work.
>>
>
> The moral of the story is don't rename layers if you want to maintain a
> semblance of migration.  Renaming meta-yocto to meta-poky means the
> bblayers.conf is invalid, so the migration code can't run because bitbake
> aborts too early.
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113f8f8eb3c123052cb6574c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is the sort of case where it&#39;d be nice if bitbake provided a plugi=
n mechanism, pure python, no metadata parsing. Something to think about in =
the long term..<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Feb =
26, 2016 at 1:59 PM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.co=
m">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On 26 February 2016 at 20:16, Philip Balister <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:philip@balister.org" target=3D"_blank">philip@balister.org<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overf=
low:hidden">I must admit, I&#39;m surprised this is tricky. I look forward =
to seeing<br>
what needs doing. Hopefully, it shows me things I can avoid in my work.<br>=
</div></blockquote></div><br></div></div><div dir=3D"ltr"><div class=3D"gma=
il_extra">The moral of the story is don&#39;t rename layers if you want to =
maintain a semblance of migration.=C2=A0 Renaming meta-yocto to meta-poky m=
eans the bblayers.conf is invalid, so the migration code can&#39;t run beca=
use bitbake aborts too early.</div></div><div dir=3D"ltr"><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a113f8f8eb3c123052cb6574c--

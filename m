Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 949006FF72
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 20:35:44 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id q130so273906101qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 12:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MfOshK2Wq+tZd/WnWsBagGvUWZ/g1gX8d3JpoH45X1M=;
	b=d+o1xEKGLgRm77Ti1smCKWSaRfFyQSIfBlebJg1DS3GqIjDW82OqI3ANeFPjVDDrog
	OFg9z8goui/QtNCJp/LbNA+AdkkcAOHh/ZvJAN2FsEcKIc8sFG77Z0Xu0WXn+ZkRknR8
	efc443fz7AF6Z3irR5Bvo3u7mKD2xAcD8c5kDXYPtMiegW8VlGX2g65tox7acsLNQQMz
	huCKsOD1LW+q4g7JoteuqmFPg9xN/F+tcnVYqWHQY/iZxZTyz0wWR5O2hL/vX4zWLSt9
	RzyMIn1rlyugtkgdGOMX/Yp/UUvaSG4zH4MhgFwgSy5yP3S9pVmejvXoNqq8NPRsm1YI
	TPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MfOshK2Wq+tZd/WnWsBagGvUWZ/g1gX8d3JpoH45X1M=;
	b=ZXu56e//cOgr5UF9pkJpUO1GOIaYT0oCb7l7wjxMcMUewAVMr1pIAR8Gj2tamCHLxU
	1JTZSSlsfC9CRas8zprD7pg/5V+2UoYE8foDv119ELLzYdUJ8Il3G4wpk50ybsF8NLf9
	7HD4f+KdExAheBBHwA1vK6TVwPYUnR5D9C6/0CI+lbUgvmjceUatal+n4qZXVdvS+3T/
	eJUlWza9VEliTcd+z38ur3cHDT3Y0qadmKmUkKJwl25VLAmhcM7If1emw2NeQOY+XdQI
	3J36UWi1fNMxqskF5xNPobdAZEKlPRKYee1PTrogpEEPAllFsapnDig3+q8Y/7vkklHu
	DNng==
X-Gm-Message-State: AKaTC01QgrC3g6g2k7tf4Ew/JG/0/OPUNtEfYdHBMkQYX5WqGeWWfn9Lt2obszyrepoDw4NTIGcimQe0l86JKG3k
X-Received: by 10.55.31.157 with SMTP id n29mr63290503qkh.221.1481229345380;
	Thu, 08 Dec 2016 12:35:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 8 Dec 2016 12:35:24 -0800 (PST)
In-Reply-To: <CAJ86T=We5bfDF6EpGs_sPph16O=Niz+ei5vADWbMTXzsTq-C8g@mail.gmail.com>
References: <1480610065-25697-1-git-send-email-anibal.limon@linux.intel.com>
	<CAMKF1srq2VD3En90FNXLB6p4YvLYh=fEz6mzEmC-O4bBHV1Q7A@mail.gmail.com>
	<5840A839.5070704@linux.intel.com>
	<CAMKF1srD4Nzzo=tB8PbRCOTKckqe1T0C_5XCiAK2Wn2kASekhA@mail.gmail.com>
	<584991B7.9050603@linux.intel.com>
	<CAJ86T=We5bfDF6EpGs_sPph16O=Niz+ei5vADWbMTXzsTq-C8g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Dec 2016 20:35:24 +0000
Message-ID: <CAJTo0LYUhvxCxhLAcbwFcnxJSx856DnZBLPjqUHXoW2FAvkQVg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl-native: Remove usage of -fstack-protector=strong
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
X-List-Received-Date: Thu, 08 Dec 2016 20:35:45 -0000
Content-Type: multipart/alternative; boundary=001a1147f228f6743305432b94b0

--001a1147f228f6743305432b94b0
Content-Type: text/plain; charset=UTF-8

On 8 December 2016 at 19:16, Andre McCurdy <armccurdy@gmail.com> wrote:

> Is it correct that native sstate from a host with gcc < 4.9 should be
> reused by a host with gcc >= 4.9 ?
>
> Doesn't the change in NATIVELSBSTRING prevent that from happening?
>

Yes, we recently landed a change so that uninative is versioned by host
GCC.  Presumably that solves this problem in a different way?

Ross

--001a1147f228f6743305432b94b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 December 2016 at 19:16, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3fw" class=3D"a=
3s aXjCH m158dfde767e48517">Is it correct that native sstate from a host wi=
th gcc &lt; 4.9 should be<br>
reused by a host with gcc &gt;=3D 4.9 ?<br>
<br>
Doesn&#39;t the change in NATIVELSBSTRING prevent that from happening?</div=
></blockquote><div><br></div><div>Yes, we recently landed a change so that =
uninative is versioned by host GCC.=C2=A0 Presumably that solves this probl=
em in a different way?</div><div><br></div><div>Ross=C2=A0</div></div></div=
></div>

--001a1147f228f6743305432b94b0--

Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 66D4B756C8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 20:08:53 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so30005226qko.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 13:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xVJH6O2lAsKI+oMXZ5HC0r9+pxVs4KQvGfUY80bBG5g=;
	b=VTcLYDMn03ffBX2IFsu80fNvZvQj+qc0/MJ9qfkDNNzA9hgordTLvwSTupA3n6qMMB
	rWtqZRUQT7l2e+pezS8YRVQxCyGKo51Jw4Lix6U8py3TbQtupVnbNH3xLUOpCjv5ADzR
	5CL2mD9MLynLtFq+GRUO3MfEBpDxsGFIoAM37vrokIqnqnwcj9pzoLEkNWkOVOn4Oohd
	LeAXRsnTzjdPiSaRk7hkWjUvTqNtLHuf/Or+dU7/1IqiChPhB19liMy+MFYaM2QseiIm
	yJQfYPA0Z7Y7sHDaYJabEGZ5he/7CX2AuNEaLVA03NV3WeDuXnbBnteDODP5nJDmd/+4
	C4gw==
X-Gm-Message-State: ALoCoQnYTte0A2Cw1FfW5t52a2zVbXdFg/b14reAEuiaHrhMzZL+utrK/c1ARXjQPWOOffDZQnAe
X-Received: by 10.55.40.18 with SMTP id o18mr74870560qkh.58.1433448534554;
	Thu, 04 Jun 2015 13:08:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 4 Jun 2015 13:08:34 -0700 (PDT)
In-Reply-To: <CAJTo0Laqurme0RPGf7AQ1b5P-esYmwW48nA=VfzHtcfq8i1DmQ@mail.gmail.com>
References: <cover.1433443273.git.anibal.limon@linux.intel.com>
	<814ba904a75c25027560113d0317fbc092e9d8b7.1433443273.git.anibal.limon@linux.intel.com>
	<CAJTo0Laqurme0RPGf7AQ1b5P-esYmwW48nA=VfzHtcfq8i1DmQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jun 2015 21:08:34 +0100
Message-ID: <CAJTo0LayZb_bgeiM0EQqjNb-kNPhX=4BxLj-+tJkp576=bTCww@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/4] distrodata: Use Python CSV instead of did by hand
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
X-List-Received-Date: Thu, 04 Jun 2015 20:08:55 -0000
Content-Type: multipart/alternative; boundary=001a11440fb8b4d05f0517b6bed6

--001a11440fb8b4d05f0517b6bed6
Content-Type: text/plain; charset=UTF-8

On 4 June 2015 at 21:06, Burton, Ross <ross.burton@intel.com> wrote:

> So whereas before the SRC_URI field in checkpkg.cvs generally just listed
> the first entry (the main source) it now lists the entire of SRC_URI.
> Presumably this bug fix is desired behaviour?
>

Also fields that used to say "None" are now empty.  Again, this seems like
a fix to me, although it changes behaviour.

Ross

--001a11440fb8b4d05f0517b6bed6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 June 2015 at 21:06, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">S=
o whereas before the SRC_URI field in checkpkg.cvs generally just listed th=
e first entry (the main source) it now lists the entire of SRC_URI.=C2=A0 P=
resumably this bug fix is desired behaviour?</div></blockquote><div><br></d=
iv><div>Also fields that used to say &quot;None&quot; are now empty.=C2=A0 =
Again, this seems like a fix to me, although it changes behaviour.</div><di=
v><br></div><div>Ross</div></div></div></div>

--001a11440fb8b4d05f0517b6bed6--

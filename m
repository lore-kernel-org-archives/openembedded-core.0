Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id AD97E780EC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 13:44:59 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id d14so33509781qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 06:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+l/T1yNtxT8wLxQWoklg3aY4Sqfr3T0xrCfX0WUMKeE=;
	b=FxO/OetbfPZfW5R1WKxmtKIvBfDRtCBqgbNOsPTfmScHIFCULar5ESZRrLpZlfhzGJ
	a+ED198lUybrALJ9JQsnr1Ke++biSfnh5w3rlxmTlxXAvS85lz6qyEbAhCELDGuimg9V
	W3mdUBjpC04Fjms/juAzQwn10AwV6KbvOuSMY9ykjjxmvIljEPt9fyHtE72e9Wc19c/G
	Fzuxru9iEBdiQJIy/J4hio4LsZogbXT1zZJCqZrMdPdCxWQc68TTa0UnWIZvcnMd1bVv
	T7GoXpBAgRBFo2aIJIg/heJFkvVdN+XEepMSH6PkXnPSulXXoXn2DE7rOOnN2tTDljms
	4w/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+l/T1yNtxT8wLxQWoklg3aY4Sqfr3T0xrCfX0WUMKeE=;
	b=OeggqGd3exZMo8s0qzxqhqwBs1Swpfb1BkUYyLj/22FOGp0iRUp2FEJ4AHl7kkJqGv
	MwnIVnsvyxGvoRDmrGd61hEyKF9WF6fC81jNZeH+ha9Fnsb6MW2f6R0hIQqb6sOWq175
	fTrqSmWyOQotu/2Q9LLGX2xRbRlh/B8xjCsKXU8ad1EKpbCz6ZgMwTSLPreMt6giaxlx
	O2yOCKxBdvKIZ+HVVU9EDpoxU9bJnKW+4iCsZ5mssotcuF5vuZP1qGjSidmp03NupVew
	GMYfh6NgdPZgh6aNJa74kdvXXjJ6DrBjE5QEJej3D9GF7DwQfx3Oa6ngE+2bAOVa38NM
	fvDg==
X-Gm-Message-State: AKS2vOw2tXMQpEqAaKdVPYHlhV0rdQJYaskuhlM1P3V3XzJxooLctt0b
	/fsehI4+nr6dGpUu0MPoup5jdJoiQciD
X-Received: by 10.55.214.221 with SMTP id p90mr27048153qkl.228.1497879900516; 
	Mon, 19 Jun 2017 06:45:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Mon, 19 Jun 2017 06:44:40 -0700 (PDT)
In-Reply-To: <CAHiDW_Fc_7XCjnG4Fhrd+itFygNVqY1_NjfEPCx2TT_u-W44xg@mail.gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
	<a89c0a82e00721ba4063c9197e0951d1d63c7e40.1497279306.git.raj.khem@gmail.com>
	<CAHiDW_Fc_7XCjnG4Fhrd+itFygNVqY1_NjfEPCx2TT_u-W44xg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Jun 2017 14:44:40 +0100
Message-ID: <CAJTo0LYaQfxsomw4wk0UopCPFchXxCih_-86_fCmSmnmmV2v0Q@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] ovmf: Update to latest
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
X-List-Received-Date: Mon, 19 Jun 2017 13:44:59 -0000
Content-Type: multipart/alternative; boundary="001a1147a418630f2105525057e7"

--001a1147a418630f2105525057e7
Content-Type: text/plain; charset="UTF-8"

On 19 June 2017 at 11:42, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> This seems to be in master now. I'm not sure if we have a new master build
> after that but ross/mut has some sort of linker failure in ofmv (in
> nightly-world-lsb only):
>
> | GenFw: ERROR 3000: Invalid
> |   /home/pokybuild/yocto-autobuilder/yocto-worker/
> nightly-world-lsb/build/build/tmp/work/i586-poky-linux/ovmf/
> git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/
> AcpiTables/AcpiTables/OUTPUT/./Madt.dll: Bad definition for symbol
> '<unknown>'@0 or unsupported symbol type.  For example, absolute and
> undefined symbols are not supported.
>
>
Note that this is specific to 32-bit x86 as far as I can tell.

Ross

--001a1147a418630f2105525057e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 June 2017 at 11:42, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>This seems to =
be in master now. I&#39;m not sure if we have a new master build after that=
 but ross/mut has some sort of linker failure in ofmv (in nightly-world-lsb=
 only):</div><div><br>| GenFw: ERROR 3000: Invalid<br>| =C2=A0 /home/pokybu=
ild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-world-lsb/build/build/=
<wbr>tmp/work/i586-poky-linux/ovmf/<wbr>git-r0/git/Build/OvmfIa32/<wbr>RELE=
ASE_GCC5/IA32/OvmfPkg/<wbr>AcpiTables/AcpiTables/OUTPUT/.<wbr>/Madt.dll: Ba=
d definition for symbol &#39;&lt;unknown&gt;&#39;@0 or unsupported symbol t=
ype.=C2=A0 For example, absolute and undefined symbols are not supported.<b=
r><br></div><div></div></blockquote></div><br>Note that this is specific to=
 32-bit x86 as far as I can tell.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a1147a418630f2105525057e7--

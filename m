Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2D45371A74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 22:02:11 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id o135so4639082itb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OMy3xvaS84ChxW2Hp2GQh5O/SLwOiNp29c/qYTBsGQA=;
	b=w7RlUCGpz62a1JWJdXA1ltqWqZPX6CHvrC+CEIqJ4L1dn0tZgFYKuGxeO4tb2wNpST
	Q3BXHeSLIuE3uh/RG/s+d10y0JnTxdp0ibYPmVb+/deawxzZJIlc76JM90Ekc4Mjo8+E
	bWNzajKesT+E60WPMHFLpFmht9DrAU+x7W6C3ixVi17lre373/QMFu0LQDyJuqTMSNw3
	5FgqnZksbYkDmxQCYZ56Ah/Lp+cVuq7EbC/B/6GyQYaDtnYf9GJMTAtKqb4pfVhvhSqG
	CHcbfAkcFsZJ06zfHJ0th49lDKlIaMb/TGuVhreCIKIxWIlz4aUOyrHI3xN30q9NxdFj
	/G6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OMy3xvaS84ChxW2Hp2GQh5O/SLwOiNp29c/qYTBsGQA=;
	b=uiphO3Nc2Z8CyGUWyFily26GnCEkyLh7+9x1yHvuzhxTOkqF8fT0WMuxNPmfDRARyN
	t3iqce47uXISFyK0BB2B7gLSR9pmbSEAa0elzatXoeTn1GAnVzEmPxujHw40SVUtPciw
	UMQEiHtcA59or/tct4Hz9vWscZPcMFVPEAzhe6UyNLVPv+nkA3LDfgFaUTaaF4eW0GWc
	rHwZ8CePPPjbiy2QK0fu/6rk5C/vixKX55Hx9fuCPJ7LVYo7D6CuKa95gHl+hgRjQQmG
	CQIhnBm55JIbc2RubrQ6QFAH/lsLehMjGzNUQwLb4osl3+6Er3/ok1rzN3qmNq8tyYd5
	NGHw==
X-Gm-Message-State: AMCzsaX0rqELlHjIJ/l/rtdqlLLZ1LkOjc0SS+/rtCUHtnQ+s6xQna5g
	gXjw2eeNBtxpRjQCk0Qohp1IGyF/MRvJp0pEoVWE2g==
X-Google-Smtp-Source: AOwi7QBUzy4sJKBOSQ7eM/f5ugdBnw/ze7xXw1UREwejXS5j+m8uv5O6pGY+Ni/6zoRyGfM5YfWlbR9nPtvnYiso4H4=
X-Received: by 10.36.26.87 with SMTP id 84mr613853iti.38.1507759332969; Wed,
	11 Oct 2017 15:02:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Wed, 11 Oct 2017 15:01:52 -0700 (PDT)
In-Reply-To: <1505434530-22152-1-git-send-email-megha.dey@linux.intel.com>
References: <1505434530-22152-1-git-send-email-megha.dey@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Oct 2017 23:01:52 +0100
Message-ID: <CAJTo0LbFEEyYFVtSg_YbOD6fFErMkCt8PzcGUs-yZ8hifvgE_w@mail.gmail.com>
To: Megha Dey <megha.dey@linux.intel.com>
Cc: "Dey, Megha" <megha.dey@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kexec-tools: Update to 2.0.15
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
X-List-Received-Date: Wed, 11 Oct 2017 22:02:12 -0000
Content-Type: multipart/alternative; boundary="001a1144159a72e4a2055b4c9342"

--001a1144159a72e4a2055b4c9342
Content-Type: text/plain; charset="UTF-8"

On 15 September 2017 at 01:15, Megha Dey <megha.dey@linux.intel.com> wrote:

> This patch updates to the latest version of the kexec-tools and
> removes patches which are already merged upstream.
>


> -From ea7be6d71b85880e8e8a2c8a4f49a696c5f31ae4 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 10 Jun 2017 11:18:49 -0700
> -Subject: [PATCH] Disable PIE during link
> -
> -We have explcitly disabled PIE during compile so we
> -just need to match it with linker flags
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - purgatory/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/purgatory/Makefile b/purgatory/Makefile
> -index 564bdb7..a08e41f 100644
> ---- a/purgatory/Makefile
> -+++ b/purgatory/Makefile
> -@@ -59,7 +59,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)
> \
> -                       -Iinclude \
> -                       -I$(shell $(CC) -print-file-name=include)
> - $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
> --                      -Wl,--no-undefined -nostartfiles -nostdlib \
> -+                      -Wl,--no-undefined -no-pie -nostartfiles -nostdlib
> \
> -                       -nodefaultlibs -e purgatory_start -Wl,-r \
> -                       -Wl,-Map=$(PURGATORY_MAP)
>

Was this actually merged upstream, or it caused a conflict?

I ask because I can't build this:

| i586-poky-linux-ar rs libutil.a util_lib/compute_ip_checksum.o
util_lib/sha256.o
| i586-poky-linux-ar: creating libutil.a
|
/data/poky-tmp/master/build/work/i586-poky-linux/kexec-tools/2.0.15-r1/recipe-sysroot-native/usr/bin/i586-poky-linux/../../libexec/i586-poky-linux/gcc/i586-poky-linux/7.2.0/ld:
-r and -pie may not be used together
| collect2: error: ld returned 1 exit status
| ../kexec-tools-2.0.15/purgatory/Makefile:67: recipe for target 'purgatory/
purgatory.ro' failed

Ross

--001a1144159a72e4a2055b4c9342
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 15 September 2017 at 01:15, Megha Dey <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:megha.dey@linux.intel.com" target=3D"_blank">megha.d=
ey@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-c=
olor:rgb(204,204,204);padding-left:1ex">This patch updates to the latest ve=
rsion of the kexec-tools and<br>
removes patches which are already merged upstream.<br></blockquote><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,2=
04,204);padding-left:1ex">-From ea7be6d71b85880e8e8a2c8a4f49a6<wbr>96c5f31a=
e4 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Sat, 10 Jun 2017 11:18:49 -0700<br>
-Subject: [PATCH] Disable PIE during link<br>
-<br>
-We have explcitly disabled PIE during compile so we<br>
-just need to match it with linker flags<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- purgatory/Makefile | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/purgatory/Makefile b/purgatory/Makefile<br>
-index 564bdb7..a08e41f 100644<br>
---- a/purgatory/Makefile<br>
-+++ b/purgatory/Makefile<br>
-@@ -59,7 +59,7 @@ $(PURGATORY): CPPFLAGS=3D$($(ARCH)_PURGATORY_<wbr>EXTRA_=
CFLAGS) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-Iinclude \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-I$(shell $(CC) -print-file-name=3Dinclude)<br>
- $(PURGATORY): LDFLAGS=3D$($(ARCH)_PURGATORY_<wbr>EXTRA_CFLAGS)\<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -Wl,--no-undefined -nostartfiles -nostdlib \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -Wl,--no-undefined -no-pie -nostartfiles -nostdlib \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-nodefaultlibs -e purgatory_start -Wl,-r \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-Wl,-Map=3D$(PURGATORY_MAP)<br></blockquote><div><br></div><div>W=
as this actually merged upstream, or it caused a conflict?</div><div><br></=
div><div>I ask because I can&#39;t build this:</div><div><br></div><div>| i=
586-poky-linux-ar rs libutil.a util_lib/compute_ip_checksum.o util_lib/sha2=
56.o</div><div>| i586-poky-linux-ar: creating libutil.a</div><div>| /data/p=
oky-tmp/master/build/work/i586-poky-linux/kexec-tools/2.0.15-r1/recipe-sysr=
oot-native/usr/bin/i586-poky-linux/../../libexec/i586-poky-linux/gcc/i586-p=
oky-linux/7.2.0/ld: -r and -pie may not be used together</div><div>| collec=
t2: error: ld returned 1 exit status</div><div>| ../kexec-tools-2.0.15/purg=
atory/Makefile:67: recipe for target &#39;purgatory/<a href=3D"http://purga=
tory.ro">purgatory.ro</a>&#39; failed</div><div><br></div><div>Ross=C2=A0</=
div></div></div></div>

--001a1144159a72e4a2055b4c9342--

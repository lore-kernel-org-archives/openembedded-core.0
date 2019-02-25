Return-Path: <i.efimov@inango-systems.com>
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id 2D59B7CA88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 13:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 0AC137A24EC;
	Mon, 25 Feb 2019 15:23:52 +0200 (IST)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ckYDk-UXR7h9; Mon, 25 Feb 2019 15:23:48 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id D48297A24EE;
	Mon, 25 Feb 2019 15:23:48 +0200 (IST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com D48297A24EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1551101028;
	bh=2x5sS2FALoCDENygDCNQbQOGiGOhAtdKufO7z+YqcnY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=f8zA3DlsJizmH8Y/321QOt+25dCqgd/R4+ZB/hLFwqpTZ+XrTY3oQSn9rczOUthlR
	mtmpHYnhO8rv41f3QwnWvVnAYUyMPkRaQ4JD9e0BrWPPtQDbFcOf28mIumnU8MkOk8
	rkHIePIdgVXBIhzhAtN9AXLg7RC5I4J5+zNTo6PNPZdoJoB4JHeb1+r7ySCYDSCbM/
	BbYZasmW5jiVx3fjpstVNN5atmrfOCtbUSDmhFGNh+G7XMea3GEcZtHVSaZPm5WM8k
	3ZpOrHiaMseuDNN9q3WCe1jdrPN7Ria3/Sj8Tu9jqb3cZxqjUBBvW2Vm76hziEwAAC
	/YxAhd5hxPejw==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eml0o5SvgSiE; Mon, 25 Feb 2019 15:23:48 +0200 (IST)
Received: from mail.inango-sw.com (mail.inango-sw.com [172.17.220.3])
	by mail.inango-sw.com (Postfix) with ESMTP id ABABF7A24EC;
	Mon, 25 Feb 2019 15:23:48 +0200 (IST)
Date: Mon, 25 Feb 2019 15:23:47 +0200 (IST)
From: Ivan Efimov <i.efimov@inango-systems.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <1769282208.6103.1551101027161.JavaMail.zimbra@inango-systems.com>
In-Reply-To: <CAJTo0LaagzCJ=qLdpuVkyDQqdvT1mvz3_1TThZtkQ6mDKyGUrw@mail.gmail.com>
References: <1928708604.1124302.1550860318265.JavaMail.zimbra@inango-systems.com>
	<CAJTo0LaagzCJ=qLdpuVkyDQqdvT1mvz3_1TThZtkQ6mDKyGUrw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [172.17.220.3]
X-Mailer: Zimbra 8.8.9_GA_3006 (ZimbraWebClient - FF64 (Linux)/8.8.9_GA_3006)
Thread-Topic: btrfs-tools Makefile: remove duplicated '-o $@' option from CC
	cmdline for libbtrfsutil/ subfolder
Thread-Index: ER4nro3AqdaKjyb0P7IGDUK8ODeOGA==
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] btrfs-tools Makefile: remove duplicated '-o $@' option from CC cmdline for libbtrfsutil/ subfolder
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
X-List-Received-Date: Mon, 25 Feb 2019 13:23:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Thank you for info about https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

   I mistakenly followed guide https://wiki.yoctoproject.org/wiki/Poky_Contributions.

Best regards,
Ivan

----- Original Message -----
From: "Ross Burton" <ross.burton@intel.com>
To: "Ivan Efimov" <i.efimov@inango-systems.com>
Cc: "OE-core" <openembedded-core@lists.openembedded.org>
Sent: Monday, February 25, 2019 4:24:24 PM
Subject: Re: [OE-core] [PATCH] btrfs-tools Makefile: remove duplicated '-o $@' option from CC cmdline for libbtrfsutil/ subfolder

Please don't send patches in HTML  [1].  The patch you add is also
missing a Signed-off-by and Upstream-Status [2]  For such a trivial
build issue, we encourage submitting the patch upstream too so we
don't have to carry it forever.

[1] https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
[2] https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

On Fri, 22 Feb 2019 at 18:32, Ivan Efimov <i.efimov@inango-systems.com> wrote:
>
> Command line for target "libbtrfsutil/%.o" contained
> double usage of '-o $@' option and causes compilation error:
>
>      cc1: error: too many filenames given
>
> Signed-off-by: Ivan Efimov <i.efimov@inango-systems.com>
> ---
>  ...01-Makefile-fix-double-o-compiler-option-using.patch | 17 +++++++++++++++++
>  meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb |  1 +
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-dou$
> le-o-compiler-option-using.patch
> new file mode 100644
> index 0000000000..335067bc1f
> --- /dev/null
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Makefile-fix-double-o-compiler-option-using.patch
> @@ -0,0 +1,17 @@
> +Command line for target "libbtrfsutil/%.o" contained double usage
> +  of '-o $@' option and caused error:
> +    cc1: error: too many filenames given
> +
> +Index: git/Makefile
> +===================================================================
> +--- git.orig/Makefile
> ++++ git/Makefile
> +@@ -414,7 +414,7 @@ libbtrfs.so.0 libbtrfs.so: libbtrfs.so.0
> +
> + libbtrfsutil/%.o: libbtrfsutil/%.c
> +       @echo "    [CC]     $@"
> +-      $(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) -o $@ -c $< -o $@
> ++      $(Q)$(CC) $(LIBBTRFSUTIL_CFLAGS) -c $< -o $@
> +
> + libbtrfsutil.so.$(libbtrfsutil_version): $(libbtrfsutil_objects)
> +       @echo "    [LD]     $@"
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
> index 1b4f515cb6..f1c4691313 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.20.1.bb
> @@ -19,6 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
>             file://0001-Makefile-build-mktables-using-native-gcc.patch \
>             file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
>             file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
> +           file://0001-Makefile-fix-double-o-compiler-option-using.patch \
>             "
>
>  inherit autotools-brokensep pkgconfig manpages distutils3-base
> --
> 2.14.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
-- 
[ https://inango.com/ |    ] 
Ivan Efimov 
Architect, Arch Group 
i.efimov@inango-systems.com 
T +7 343 298 0147 C +7 904 9 888 350 
[ https://inango.com/ | inango.com ] [ https://www.linkedin.com/company/inango ]


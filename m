Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id A509375773
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 07:41:08 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so136504241pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 00:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=iUIPBPqd9tsRMAUQyEA6zqtpWaWHs98Q4p3aeXXkDRE=;
	b=Sr0s0JTUpz9k+Umt8/VcyIcGtUDcxhk+wpWkrmeFKg6HkTTsDhLPdB6Pd4EXj1uJCt
	kLBFwSsa3mdXdOWmUK46jFUx444BQ1kjnG0RI6iVp5JvsRgOp3Bb5noPQhVtS4S9/6i4
	1t4nxrSTbskw7z1ZwE5VnkVDtxiPB9Rtc6tbLW4o2Bxk2itTKfV8reFEO9Ef3wZk5wIw
	Fse1A8T/PIPuUdi0o6F047DXQ7OrOQw0R9ub5jih99G0PhycwIMdyYzrkO1AgMoHVVvE
	4lzUeb4NOoUGZNKxigcKNugiKMxFU6Q7IM7Vc5I9a7HmfdODIvAF/SaCT6qt6nIo6Om1
	UuSw==
X-Received: by 10.68.250.228 with SMTP id zf4mr31911619pbc.90.1442216469092;
	Mon, 14 Sep 2015 00:41:09 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:2d2a:c874:d212:2f46?
	([2601:646:8601:4580:2d2a:c874:d212:2f46])
	by smtp.gmail.com with ESMTPSA id
	a17sm14276740pbu.55.2015.09.14.00.41.08
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Sep 2015 00:41:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1442215997-24116-1-git-send-email-rongqing.li@windriver.com>
Date: Mon, 14 Sep 2015 00:41:07 -0700
Message-Id: <E3924499-FE6D-49AD-8BF9-E3438FA9D337@gmail.com>
References: <1442215997-24116-1-git-send-email-rongqing.li@windriver.com>
To: rongqing.li@windriver.com
X-Mailer: Apple Mail (2.3094)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] quashfs-tools: make it be able to be compiled by gcc5 with "-O0"
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
X-List-Received-Date: Mon, 14 Sep 2015 07:41:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Sep 14, 2015, at 12:33 AM, <rongqing.li@windriver.com> =
<rongqing.li@windriver.com> wrote:
>=20
> From: Roy Li <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
> ...shfs.c-get-inline-functions-work-with-C99.patch | 154 =
+++++++++++++++++++++
> .../squashfs-tools/squashfs-tools_git.bb           |   1 +
> 2 files changed, 155 insertions(+)
> create mode 100644 =
meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-mksquashfs.c-get-=
inline-functions-work-with-C99.patch
>=20
> diff --git =
a/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-mksquashfs.c-ge=
t-inline-functions-work-with-C99.patch =
b/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-mksquashfs.c-ge=
t-inline-functions-work-with-C99.patch
> new file mode 100644
> index 0000000..fefe9f6
> --- /dev/null
> +++ =
b/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-mksquashfs.c-ge=
t-inline-functions-work-with-C99.patch
> @@ -0,0 +1,154 @@
> +=46rom ac6268e843c43286eebff2a1052182c2393cdb2e Mon Sep 17 00:00:00 =
2001
> +From: Roy Li <rongqing.li@windriver.com>
> +Date: Mon, 14 Sep 2015 12:31:42 +0800
> +Subject: [PATCH] mksquashfs.c:  get inline functions work with both =
gnu11 and gnu89
> +

this looks ok.

> +Upstream-status: pending
> +
> +After gcc upgraded to gcc5, and if the codes is compiled without =
optimization(-O0),
> +and the below error will happen:
> +
> +| mksquashfs.o: In function `create_inode':
> +| git/squashfs-tools/mksquashfs.c:897: undefined reference to =
`get_inode_no'
> +| git/squashfs-tools/mksquashfs.c:960: undefined reference to =
`get_parent_no'
> +| git/squashfs-tools/mksquashfs.c:983: undefined reference to =
`get_parent_no'
> +| mksquashfs.o: In function `reader_read_process':
> +| git/squashfs-tools/mksquashfs.c:2132: undefined reference to =
`is_fragment'
> +| mksquashfs.o: In function `reader_read_file':
> +| git/squashfs-tools/mksquashfs.c:2228: undefined reference to =
`is_fragment'
> +| mksquashfs.o: In function `dir_scan':
> +| git/squashfs-tools/mksquashfs.c:3101: undefined reference to =
`create_dir_entry'
> +
> +gcc5 defaults to -std=3Dgnu11 instead of -std=3Dgnu89, and it =
requires that exactly one C
> +source file has the callable copy of the inline function. Consider =
the following
> +program:
> +
> +  inline int
> +  foo (void)
> +  {
> +    return 42;
> +  }
> +
> +  int
> +  main (void)
> +  {
> +    return foo ();
> +  }
> +
> +The program above will not link with the C99 inline semantics, =
because no out-of-line
> +function foo is generated. To fix this, either mark the function foo =
as static, or
> +add the following declaration:
> +  static inline int foo (void);
> +
> +more information refer to: https://gcc.gnu.org/gcc-5/porting_to.html;
> +
> +but the use of "extern inline" will lead to the compilation issue if =
gcc is not
> +gcc5, as the commit in oe-core d0af30c92fde [alsa-lib: Change =
function type to
> +"static __inline__"]
> +    "static __inline__ function()" is the inlined version that
> +    can be used in this compilation unit, but there will be another
> +    definition of this function somewhere, so compiler will not emit
> +    any code for the function body. This causes problem in -O0,
> +    where functions are never inlined, the function call is =
preserved,
> +    but linker can't find the symbol, thus the error happens.
> +
> +so replace "inline" with "static inline" to make it work with both =
gnu11 and gnu89
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + squashfs-tools/mksquashfs.c | 20 ++++++++++----------
> + 1 file changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/squashfs-tools/mksquashfs.c =
b/squashfs-tools/mksquashfs.c
> +index d221c35..6bba1d2 100644
> +--- a/squashfs-tools/mksquashfs.c
> ++++ b/squashfs-tools/mksquashfs.c
> +@@ -828,13 +828,13 @@ char *subpathname(struct dir_ent *dir_ent)
> + }
> +=20
> +=20
> +-inline unsigned int get_inode_no(struct inode_info *inode)
> ++static inline unsigned int get_inode_no(struct inode_info *inode)
> + {
> + 	return inode->inode_number;
> + }
> +=20
> +=20
> +-inline unsigned int get_parent_no(struct dir_info *dir)
> ++static inline unsigned int get_parent_no(struct dir_info *dir)
> + {
> + 	return dir->depth ? get_inode_no(dir->dir_ent->inode) : =
inode_no;
> + }
> +@@ -2027,7 +2027,7 @@ struct file_info *duplicate(long long =
file_size, long long bytes,
> + }
> +=20
> +=20
> +-inline int is_fragment(struct inode_info *inode)
> ++static inline int is_fragment(struct inode_info *inode)
> + {
> + 	off_t file_size =3D inode->buf.st_size;
> +=20
> +@@ -2996,13 +2996,13 @@ struct inode_info *lookup_inode2(struct stat =
*buf, int pseudo, int id)
> + }
> +=20
> +=20
> +-inline struct inode_info *lookup_inode(struct stat *buf)
> ++static inline struct inode_info *lookup_inode(struct stat *buf)
> + {
> + 	return lookup_inode2(buf, 0, 0);
> + }
> +=20
> +=20
> +-inline void alloc_inode_no(struct inode_info *inode, unsigned int =
use_this)
> ++static inline void alloc_inode_no(struct inode_info *inode, unsigned =
int use_this)
> + {
> + 	if (inode->inode_number =3D=3D 0) {
> + 		inode->inode_number =3D use_this ? : inode_no ++;
> +@@ -3013,7 +3013,7 @@ inline void alloc_inode_no(struct inode_info =
*inode, unsigned int use_this)
> + }
> +=20
> +=20
> +-inline struct dir_ent *create_dir_entry(char *name, char =
*source_name,
> ++static inline struct dir_ent *create_dir_entry(char *name, char =
*source_name,
> + 	char *nonstandard_pathname, struct dir_info *dir)
> + {
> + 	struct dir_ent *dir_ent =3D malloc(sizeof(struct dir_ent));
> +@@ -3031,7 +3031,7 @@ inline struct dir_ent *create_dir_entry(char =
*name, char *source_name,
> + }
> +=20
> +=20
> +-inline void add_dir_entry(struct dir_ent *dir_ent, struct dir_info =
*sub_dir,
> ++static inline void add_dir_entry(struct dir_ent *dir_ent, struct =
dir_info *sub_dir,
> + 	struct inode_info *inode_info)
> + {
> + 	struct dir_info *dir =3D dir_ent->our_dir;
> +@@ -3047,7 +3047,7 @@ inline void add_dir_entry(struct dir_ent =
*dir_ent, struct dir_info *sub_dir,
> + }
> +=20
> +=20
> +-inline void add_dir_entry2(char *name, char *source_name,
> ++static inline void add_dir_entry2(char *name, char *source_name,
> + 	char *nonstandard_pathname, struct dir_info *sub_dir,
> + 	struct inode_info *inode_info, struct dir_info *dir)
> + {
> +@@ -3059,7 +3059,7 @@ inline void add_dir_entry2(char *name, char =
*source_name,
> + }
> +=20
> +=20
> +-inline void free_dir_entry(struct dir_ent *dir_ent)
> ++static inline void free_dir_entry(struct dir_ent *dir_ent)
> + {
> + 	if(dir_ent->name)
> + 		free(dir_ent->name);
> +@@ -3080,7 +3080,7 @@ inline void free_dir_entry(struct dir_ent =
*dir_ent)
> + }
> +=20
> +=20
> +-inline void add_excluded(struct dir_info *dir)
> ++static inline void add_excluded(struct dir_info *dir)
> + {
> + 	dir->excluded ++;
> + }
> +--=20
> +1.9.1
> +
> diff --git =
a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb =
b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> index 497b282..7aebd00 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> @@ -12,6 +12,7 @@ PV =3D "4.3+gitr${SRCPV}"
> SRCREV =3D "9c1db6d13a51a2e009f0027ef336ce03624eac0d"
> SRC_URI =3D =
"git://github.com/plougher/squashfs-tools.git;protocol=3Dhttps \
>            =
http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=3Dlzma \
> +           =
file://0001-mksquashfs.c-get-inline-functions-work-with-C99.patch;striplev=
el=3D2 \
> "
> SRC_URI[lzma.md5sum] =3D "29d5ffd03a5a3e51aef6a74e9eafb759"
> SRC_URI[lzma.sha256sum] =3D =
"c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



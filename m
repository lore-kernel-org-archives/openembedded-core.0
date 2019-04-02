Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id B64326D6C4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 08:57:42 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E51D021F5F;
	Tue,  2 Apr 2019 04:57:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Tue, 02 Apr 2019 04:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=subject:to:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=K
	aT0mb0Aomfed9maiB1wvqa/K9joOb7zlNM1hdNkLbk=; b=X6fTs/7yuSSGKn45r
	oTQnbCzw9Qt2IGvVqzEJ36byWx7QzuKxaZ2fzD3LPpEOaQJnioj4qJ2fkNdTwlvT
	hBiAFA0iJgcur8zlg3O3YZqeRT3XTnwrqMycb4+KiauSPWkzeDJz3SqW6fOuxopp
	hCyJV0ARzwk7WI1R9a0EiBme6ZutlCw3L0nBPSkIsdqXRjW6JZTosS0ko5iwLwwP
	XNQfAjCmYktDmH2EDAkrl3uuH2Bak35jjbV1HO8viY/Flh049iId2TecVxv0kd+O
	5QA7SUQsjCFttfFQ8+afut0mNspIopFvoQ6SfuUP589hB3adQOByfM94Wic7EJSS
	hIUwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=KaT0mb0Aomfed9maiB1wvqa/K9joOb7zlNM1hdNkL
	bk=; b=4TxMGuC/tkEmlF70ysyughnV+rN9vAB6VQ8rehlR0W1Tyd5f8RpuhWors
	D1uFxl/R7ejxjMxhxefkll6KJnEnf+dvfhpVuDAm1yZyL4e1fmBx8a9B46XA2tUu
	FOdNsxkZBDAwZ5AXeGFZE//QfWqkQf2LKbhMx4WcMhjxojQY8C1kXODJqVhLof0H
	M7LCdaA1hSpO+X0hPlFVlvnnaRUw5Bx4P6pX5sCqP4bMZTzvgFhjAaiIQPOroy1u
	+O45L66cxf3Qdc08GwOYqcTEIPxM+CjpOQBB+ugZi+Be8q16+1X2tIw+cqoLeG9v
	3N+tjSxk7Hxi6tsLnd7qCo3XHrICw==
X-ME-Sender: <xms:BySjXNBjbJzpfEcc4KIgc9Mw8_eVOx1ZLC-ESVBF-b7Ojsnxx7Lxyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrleeigdduudcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhohfkffgfgggjtgfgsehtje
	ertddtfeejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsegsvghtrghf
	ihhvvgdrtghordhukheqnecuffhomhgrihhnpehsohhurhgtvghfohhrghgvrdhnvghtne
	cukfhppeekuddrudekjedrfedvrddufeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
	rghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:BySjXJ5JBrPYU6rg9m0jWoTtXAlHIiDpqTMeLcAe5FWtNtJFGdTweA>
	<xmx:BySjXEkF5TzmEo2GxAb5tAlYkcg9Sgy3EGnTerH49i8ysFOpVEmcuw>
	<xmx:BySjXK5s6p0ZS5MEtJ5Q7vYLF8muxKg-lh6pEinSVPo_CneWuMj3tg>
	<xmx:BySjXDtI3pdXuW4gXJb_XxpnzQculCY00zQCXYhkTIX_VQMYgLpnpA>
Received: from [192.168.1.100] (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id D2239100E5;
	Tue,  2 Apr 2019 04:57:42 -0400 (EDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20190331161757.12888-1-open.source@oleksandr-kravchuk.com>
From: Paul Barker <paul@betafive.co.uk>
Organization: Beta Five Ltd
Message-ID: <84541ccb-b44e-768f-7ec1-233bb070aa49@betafive.co.uk>
Date: Tue, 2 Apr 2019 09:57:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190331161757.12888-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] quote: update to 4.05
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
X-List-Received-Date: Tue, 02 Apr 2019 08:57:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31/03/2019 17:17, Oleksandr Kravchuk wrote:
> License checksum from quota.c was removed since according to the
> project, copyrighted code in question has been replaced with own
> implementation (see @bcbc0d08e5cd).
> 
> Removed patch has been upstreamed.
> 
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../quota/quota/remove_non_posix_types.patch  | 198 ------------------
>   .../quota/{quota_4.04.bb => quota_4.05.bb}    |   8 +-
>   2 files changed, 3 insertions(+), 203 deletions(-)
>   delete mode 100644 meta/recipes-extended/quota/quota/remove_non_posix_types.patch
>   rename meta/recipes-extended/quota/{quota_4.04.bb => quota_4.05.bb} (80%)
> 
> diff --git a/meta/recipes-extended/quota/quota/remove_non_posix_types.patch b/meta/recipes-extended/quota/quota/remove_non_posix_types.patch
> deleted file mode 100644
> index 06ff13cb98..0000000000
> --- a/meta/recipes-extended/quota/quota/remove_non_posix_types.patch
> +++ /dev/null
> @@ -1,198 +0,0 @@
> -Use proper C99 integer types
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: quota-tools/bylabel.c
> -===================================================================
> ---- quota-tools.orig/bylabel.c
> -+++ quota-tools/bylabel.c
> -@@ -20,6 +20,7 @@
> - #include <ctype.h>
> - #include <fcntl.h>
> - #include <unistd.h>
> -+#include <stdint.h>
> -
> - #include "bylabel.h"
> - #include "common.h"
> -@@ -37,32 +38,32 @@ static struct uuidCache_s {
> -
> - #define EXT2_SUPER_MAGIC	0xEF53
> - struct ext2_super_block {
> --	u_char s_dummy1[56];
> --	u_char s_magic[2];
> --	u_char s_dummy2[46];
> --	u_char s_uuid[16];
> --	u_char s_volume_name[16];
> -+	uint8_t s_dummy1[56];
> -+	uint8_t s_magic[2];
> -+	uint8_t s_dummy2[46];
> -+	uint8_t s_uuid[16];
> -+	uint8_t s_volume_name[16];
> - };
> -
> --#define ext2magic(s)	((uint) s.s_magic[0] + (((uint) s.s_magic[1]) << 8))
> -+#define ext2magic(s)	((uint32_t) s.s_magic[0] + (((uint32_t) s.s_magic[1]) << 8))
> -
> - #define XFS_SUPER_MAGIC "XFSB"
> - #define XFS_SUPER_MAGIC2 "BSFX"
> - struct xfs_super_block {
> --	u_char s_magic[4];
> --	u_char s_dummy[28];
> --	u_char s_uuid[16];
> --	u_char s_dummy2[60];
> --	u_char s_fsname[12];
> -+	uint8_t s_magic[4];
> -+	uint8_t s_dummy[28];
> -+	uint8_t s_uuid[16];
> -+	uint8_t s_dummy2[60];
> -+	uint8_t s_fsname[12];
> - };
> -
> - #define REISER_SUPER_MAGIC	"ReIsEr2Fs"
> - struct reiserfs_super_block {
> --	u_char s_dummy1[52];
> --	u_char s_magic[10];
> --	u_char s_dummy2[22];
> --	u_char s_uuid[16];
> --	u_char s_volume_name[16];
> -+	uint8_t s_dummy1[52];
> -+	uint8_t s_magic[10];
> -+	uint8_t s_dummy2[22];
> -+	uint8_t s_uuid[16];
> -+	uint8_t s_volume_name[16];
> - };
> -
> - static inline unsigned short swapped(unsigned short a)
> -@@ -222,7 +223,7 @@ static char *get_spec_by_x(int n, const
> - 	return NULL;
> - }
> -
> --static u_char fromhex(char c)
> -+static uint8_t fromhex(char c)
> - {
> - 	if (isdigit(c))
> - 		return (c - '0');
> -@@ -234,7 +235,7 @@ static u_char fromhex(char c)
> -
> - static char *get_spec_by_uuid(const char *s)
> - {
> --	u_char uuid[16];
> -+	uint8_t uuid[16];
> - 	int i;
> -
> - 	if (strlen(s) != 36 || s[8] != '-' || s[13] != '-' || s[18] != '-' || s[23] != '-')
> -Index: quota-tools/quot.c
> -===================================================================
> ---- quota-tools.orig/quot.c
> -+++ quota-tools/quot.c
> -@@ -47,6 +47,7 @@
> - #include <utmp.h>
> - #include <pwd.h>
> - #include <grp.h>
> -+#include <stdint.h>
> -
> - #include "pot.h"
> - #include "quot.h"
> -@@ -56,8 +57,8 @@
> - #include "quotasys.h"
> -
> - #define	TSIZE	500
> --static __uint64_t sizes[TSIZE];
> --static __uint64_t overflow;
> -+static uint64_t sizes[TSIZE];
> -+static uint64_t overflow;
> -
> - static int aflag;
> - static int cflag;
> -@@ -72,7 +73,7 @@ static time_t now;
> - char *progname;
> -
> - static void mounttable(void);
> --static char *idname(__uint32_t, int);
> -+static char *idname(uint32_t, int);
> - static void report(const char *, const char *, int);
> - static void creport(const char *, const char *);
> -
> -@@ -173,7 +174,7 @@ static int qcmp(du_t * p1, du_t * p2)
> - static void creport(const char *file, const char *fsdir)
> - {
> - 	int i;
> --	__uint64_t t = 0;
> -+	uint64_t t = 0;
> -
> - 	printf(_("%s (%s):\n"), file, fsdir);
> - 	for (i = 0; i < TSIZE - 1; i++)
> -@@ -219,7 +220,7 @@ static void report(const char *file, con
> - 	}
> - }
> -
> --static idcache_t *getnextent(int type, __uint32_t id, int byid)
> -+static idcache_t *getnextent(int type, uint32_t id, int byid)
> - {
> - 	struct passwd *pw;
> - 	struct group  *gr;
> -@@ -240,7 +241,7 @@ static idcache_t *getnextent(int type, _
> - 	return &idc;
> - }
> -
> --static char *idname(__uint32_t id, int type)
> -+static char *idname(uint32_t id, int type)
> - {
> - 	idcache_t *ncp, *idp;
> - 	static idcache_t nc[2][NID];
> -@@ -286,8 +287,8 @@ static void acctXFS(xfs_bstat_t *p)
> - {
> - 	register du_t *dp;
> - 	du_t **hp;
> --	__uint64_t size;
> --	__uint32_t i, id;
> -+	uint64_t size;
> -+	uint32_t i, id;
> -
> - 	if ((p->bs_mode & S_IFMT) == 0)
> - 		return;
> -Index: quota-tools/quot.h
> -===================================================================
> ---- quota-tools.orig/quot.h
> -+++ quota-tools/quot.h
> -@@ -35,18 +35,18 @@
> - #define	SEC24HR	(60*60*24)	/* seconds per day */
> -
> - typedef struct {
> --	__uint32_t id;
> -+	uint32_t id;
> - 	char name[UT_NAMESIZE + 1];
> - } idcache_t;
> -
> - typedef struct du {
> - 	struct du *next;
> --	__uint64_t blocks;
> --	__uint64_t blocks30;
> --	__uint64_t blocks60;
> --	__uint64_t blocks90;
> --	__uint64_t nfiles;
> --	__uint32_t id;
> -+	uint64_t blocks;
> -+	uint64_t blocks30;
> -+	uint64_t blocks60;
> -+	uint64_t blocks90;
> -+	uint64_t nfiles;
> -+	uint32_t id;
> - } du_t;
> -
> - #define	NDU	60000
> -Index: quota-tools/rquota_server.c
> -===================================================================
> ---- quota-tools.orig/rquota_server.c
> -+++ quota-tools/rquota_server.c
> -@@ -60,7 +60,7 @@ extern char nfs_pseudoroot[PATH_MAX];
> -  */
> - extern struct authunix_parms *unix_cred;
> -
> --int in_group(gid_t * gids, u_int len, gid_t gid)
> -+int in_group(gid_t * gids, uint32_t len, gid_t gid)
> - {
> - 	gid_t *gidsp = gids + len;
> -
> diff --git a/meta/recipes-extended/quota/quota_4.04.bb b/meta/recipes-extended/quota/quota_4.05.bb
> similarity index 80%
> rename from meta/recipes-extended/quota/quota_4.04.bb
> rename to meta/recipes-extended/quota/quota_4.05.bb
> index 93f376286a..477d6b1a2a 100644
> --- a/meta/recipes-extended/quota/quota_4.04.bb
> +++ b/meta/recipes-extended/quota/quota_4.05.bb
> @@ -3,18 +3,16 @@ SECTION = "base"
>   HOMEPAGE = "http://sourceforge.net/projects/linuxquota/"
>   BUGTRACKER = "http://sourceforge.net/tracker/?group_id=18136&atid=118136"
>   LICENSE = "BSD & GPLv2+ & LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://quota.c;beginline=1;endline=33;md5=331c7d77744bfe0ad24027f0651028ec \
> -                    file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
> +LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
>                       file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"

You've explained why quota.c is dropped from LIC_FILES_CHKSUM, but it's 
also worth explaining why svc_socket.c is added.

>   
>   SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
>              file://fcntl.patch \
> -           file://remove_non_posix_types.patch \
>             "
>   SRC_URI_append_libc-musl = " file://replace_getrpcbynumber_r.patch"
>   
> -SRC_URI[md5sum] = "f46f3b0b5141f032f25684005dac49d3"
> -SRC_URI[sha256sum] = "735be1887e7f51f54165e778ae43fc859c04e44d88834ecb2f470e91d4ef8edf"
> +SRC_URI[md5sum] = "1c1dbd2cd3d680ccac661239b067e147"
> +SRC_URI[sha256sum] = "ef3b5b5d1014ed1344b46c1826145e20cbef8db967b522403c9a060761cf7ab9"
>   
>   CVE_PRODUCT = "linux_diskquota"
>   
> 

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd


Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 857306013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 20:25:07 +0000 (UTC)
Received: by igcxg11 with SMTP id xg11so28188204igc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=uEtnQJF3akkiVrrtwnFF5PIQYMc2SFSrRP0y3ni17pE=;
	b=BlxICnFPpatzgGT5rtmVevkP3/o8bLTC6ibu2SJELaYqXUqLISyMJ/0Gqd2B6oanZe
	h8fHb6Cph9BCQCrYARFzDxgplIAPGyyS/otDls/PBwiUhZO2KQWy9zIAs2tmxRmPf3Vh
	YF2vHxGg6Fb0LRIthq/H85YIdCK4H/JBJ5pL2QUF4nA3I81/dy8VFSV7UCnh5fYdmdAE
	R7P2WbUltwHxzT6nssY+U8FqVzyzJfJWGpYMpqRiAvm1xWgRsjbH0MRIphV3kx6cBsmF
	yUDfiEzl/a2XSCmYYMfFOCfYMZhzkLBGe2hI85Vk5Uax14q9EjrJGVcMkG5s9SP3msiE
	warw==
MIME-Version: 1.0
X-Received: by 10.50.35.195 with SMTP id k3mr7200046igj.11.1427833508143; Tue,
	31 Mar 2015 13:25:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Tue, 31 Mar 2015 13:25:07 -0700 (PDT)
In-Reply-To: <1427833273.17257.5.camel@bottazzini-ThinkPad-T430>
References: <bruno.bottazzini@intel.com>
	<1427739204-31953-1-git-send-email-bruno.bottazzini@intel.com>
	<1427833273.17257.5.camel@bottazzini-ThinkPad-T430>
Date: Tue, 31 Mar 2015 17:25:07 -0300
X-Google-Sender-Auth: C2guv3nnfz7kpfWTi6OGxVXgaKM
Message-ID: <CAP9ODKoMAmf5isSYyCprh_mrYo2-dY8jF6EwwOjZuLQ90ixFpQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: v219 with stable fixes
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
X-List-Received-Date: Tue, 31 Mar 2015 20:25:08 -0000
Content-Type: text/plain; charset=UTF-8

I am not a heavy user of systemd so I prefer other people (Khem?) to
comment on this ...

On Tue, Mar 31, 2015 at 5:21 PM, Bottazzini, Bruno
<bruno.bottazzini@intel.com> wrote:
> Ping
>
> On Seg, 2015-03-30 at 15:13 -0300, Bruno Bottazzini wrote:
>> Adding patches that fix bugs for 219 version.
>> This will get the same consistency of the stable systemd 219 version.
>>
>> More details:
>> http://cgit.freedesktop.org/systemd/systemd-stable/log/?h=v219-stable
>> ---
>>  ...remote-fix-certificate-status-memory-leak.patch |  31 +
>>  ...ournal-remote-fix-client_cert-memory-leak.patch |  35 +
>>  ...0003-tmpfiles-Fix-parse_acl-error-message.patch |  28 +
>>  ...-test-utf8-fix-utf16-tests-on-BE-machines.patch |  26 +
>>  ...iles-avoid-creating-duplicate-acl-entries.patch | 131 +++
>>  .../0006-shared-time-util-fix-gcc5-warning.patch   |  32 +
>>  ...time-test-infinity-parsing-in-nanoseconds.patch |  36 +
>>  .../0008-bootchart-fix-default-init-path.patch     |  44 +
>>  ...emctl-bump-NOFILE-only-for-systemctl_main.patch |  44 +
>>  ...0-Make-root-s-home-directory-configurable.patch |  89 +-
>>  ...-util-avoid-freeing-uninitialized-pointer.patch |  37 +
>>  ...11-bootchart-svg-fix-checking-of-list-end.patch |  28 +
>>  ...md-add-getrandom-syscall-numbers-for-MIPS.patch |  38 +
>>  ...aker-dependencies-between-mount-and-devic.patch |  33 +
>>  ...topping-due-to-BindsTo-log-which-unit-cau.patch |  43 +
>>  ...grade-message-about-sysctl-overrides-to-d.patch |  30 +
>>  ...l-add-some-hints-how-to-override-settings.patch |  39 +
>>  .../0017-core-rework-device-state-logic.patch      | 912 +++++++++++++++++++++
>>  .../0018-core-fix-return-value-on-OOM.patch        |  26 +
>>  ...e-x-machine-unix-prefix-for-the-container.patch |  33 +
>>  ...0-shared-AFS-is-also-a-network-filesystem.patch |  25 +
>>  ...downgrade-unit-type-not-supported-message.patch |  31 +
>>  ...ournal-remote-fix-saving-of-binary-fields.patch |  97 +++
>>  ...ix-Inappropriate-ioctl-for-device-on-ext4.patch |  37 +
>>  ...eplace-VLA-with-alloca-to-make-llvm-happy.patch |  53 ++
>>  ...ietly-ignore-ACLs-on-unsupported-filesyst.patch |  84 ++
>>  ...-assume-ac-when-sys-class-power_supply-is.patch |  30 +
>>  meta/recipes-core/systemd/systemd_219.bb           |  33 +-
>>  28 files changed, 2050 insertions(+), 55 deletions(-)
>>  create mode 100644 meta/recipes-core/systemd/systemd/0001-journal-remote-fix-certificate-status-memory-leak.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0002-journal-remote-fix-client_cert-memory-leak.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0003-tmpfiles-Fix-parse_acl-error-message.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0004-test-utf8-fix-utf16-tests-on-BE-machines.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0005-tmpfiles-avoid-creating-duplicate-acl-entries.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0006-shared-time-util-fix-gcc5-warning.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0007-test-time-test-infinity-parsing-in-nanoseconds.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0008-bootchart-fix-default-init-path.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0009-systemctl-bump-NOFILE-only-for-systemctl_main.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0010-acl-util-avoid-freeing-uninitialized-pointer.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0011-bootchart-svg-fix-checking-of-list-end.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0012-systemd-add-getrandom-syscall-numbers-for-MIPS.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0013-unit-use-weaker-dependencies-between-mount-and-devic.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0014-unit-When-stopping-due-to-BindsTo-log-which-unit-cau.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0015-sysctl-downgrade-message-about-sysctl-overrides-to-d.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0016-sysctl-add-some-hints-how-to-override-settings.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0017-core-rework-device-state-logic.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0018-core-fix-return-value-on-OOM.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0019-machined-use-x-machine-unix-prefix-for-the-container.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0020-shared-AFS-is-also-a-network-filesystem.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0021-core-downgrade-unit-type-not-supported-message.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0022-journal-remote-fix-saving-of-binary-fields.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0024-sd-daemon-replace-VLA-with-alloca-to-make-llvm-happy.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0025-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0026-shared-util-assume-ac-when-sys-class-power_supply-is.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd/0001-journal-remote-fix-certificate-status-memory-leak.patch b/meta/recipes-core/systemd/systemd/0001-journal-remote-fix-certificate-status-memory-leak.patch
>> new file mode 100644
>> index 0000000..172bea2
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0001-journal-remote-fix-certificate-status-memory-leak.patch
>> @@ -0,0 +1,31 @@
>> +From 7057db8b36594bb03c611cab711cd992ad4de31e Mon Sep 17 00:00:00 2001
>> +From: Michal Schmidt <mschmidt@redhat.com>
>> +Date: Tue, 17 Feb 2015 10:33:01 +0100
>> +Subject: [PATCH 01/26] journal-remote: fix certificate status memory leak
>> +
>> +The output of gnutls_certificate_verification_status_print() needs to be
>> +freed.
>> +
>> +Noticed this while staring at verify_cert_authorized() to see what could
>> +possibly confuse gcc5 on armv7hl to segfault during compilation.
>> +
>> +(cherry picked from commit 9c3cf9693ac5c0a332ba376f99e6adea28b1bb0d)
>> +---
>> + src/journal-remote/microhttpd-util.c | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/src/journal-remote/microhttpd-util.c b/src/journal-remote/microhttpd-util.c
>> +index 34d9337..de9c6ab 100644
>> +--- a/src/journal-remote/microhttpd-util.c
>> ++++ b/src/journal-remote/microhttpd-util.c
>> +@@ -179,6 +179,7 @@ static int verify_cert_authorized(gnutls_session_t session) {
>> +                 return log_error_errno(r, "gnutls_certificate_verification_status_print failed: %m");
>> +
>> +         log_info("Certificate status: %s", out.data);
>> ++        gnutls_free(out.data);
>> +
>> +         return status == 0 ? 0 : -EPERM;
>> + }
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0002-journal-remote-fix-client_cert-memory-leak.patch b/meta/recipes-core/systemd/systemd/0002-journal-remote-fix-client_cert-memory-leak.patch
>> new file mode 100644
>> index 0000000..f615876
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0002-journal-remote-fix-client_cert-memory-leak.patch
>> @@ -0,0 +1,35 @@
>> +From 5852d2efbfb888dfb0adddb25afac0814d3ebcbb Mon Sep 17 00:00:00 2001
>> +From: Michal Schmidt <mschmidt@redhat.com>
>> +Date: Tue, 17 Feb 2015 10:36:57 +0100
>> +Subject: [PATCH 02/26] journal-remote: fix client_cert memory leak
>> +
>> +Found by Valgrind while testing the previous memory leak fix.
>> +
>> +(cherry picked from commit 32c3d7144cf9a5c8c03761d7f198142ca0f5f7b8)
>> +---
>> + src/journal-remote/microhttpd-util.c | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/journal-remote/microhttpd-util.c b/src/journal-remote/microhttpd-util.c
>> +index de9c6ab..a95fff1 100644
>> +--- a/src/journal-remote/microhttpd-util.c
>> ++++ b/src/journal-remote/microhttpd-util.c
>> +@@ -239,10 +239,14 @@ static int get_auth_dn(gnutls_x509_crt_t client_cert, char **buf) {
>> +         return 0;
>> + }
>> +
>> ++static inline void gnutls_x509_crt_deinitp(gnutls_x509_crt_t *p) {
>> ++        gnutls_x509_crt_deinit(*p);
>> ++}
>> ++
>> + int check_permissions(struct MHD_Connection *connection, int *code, char **hostname) {
>> +         const union MHD_ConnectionInfo *ci;
>> +         gnutls_session_t session;
>> +-        gnutls_x509_crt_t client_cert;
>> ++        _cleanup_(gnutls_x509_crt_deinitp) gnutls_x509_crt_t client_cert = NULL;
>> +         _cleanup_free_ char *buf = NULL;
>> +         int r;
>> +
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0003-tmpfiles-Fix-parse_acl-error-message.patch b/meta/recipes-core/systemd/systemd/0003-tmpfiles-Fix-parse_acl-error-message.patch
>> new file mode 100644
>> index 0000000..15fa98c
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0003-tmpfiles-Fix-parse_acl-error-message.patch
>> @@ -0,0 +1,28 @@
>> +From ea960d3fc09c1e3745791d3433094678fd7ccd50 Mon Sep 17 00:00:00 2001
>> +From: Martin Pitt <martin.pitt@ubuntu.com>
>> +Date: Tue, 17 Feb 2015 12:47:51 +0100
>> +Subject: [PATCH 03/26] tmpfiles: Fix parse_acl error message
>> +
>> +parse_acl() returns the error instead of setting errno.
>> +
>> +(cherry picked from commit 484adfd914504cd7e95867cea20ca7af71b888f2)
>> +---
>> + src/tmpfiles/tmpfiles.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
>> +index c948d4d..88ba7e4 100644
>> +--- a/src/tmpfiles/tmpfiles.c
>> ++++ b/src/tmpfiles/tmpfiles.c
>> +@@ -689,7 +689,7 @@ static int get_acls_from_arg(Item *item) {
>> +          * afterwards, so the mask can be added now if necessary. */
>> +         r = parse_acl(item->argument, &item->acl_access, &item->acl_default, !item->force);
>> +         if (r < 0)
>> +-                log_warning_errno(errno, "Failed to parse ACL \"%s\": %m. Ignoring",
>> ++                log_warning_errno(r, "Failed to parse ACL \"%s\": %m. Ignoring",
>> +                                   item->argument);
>> + #else
>> +         log_warning_errno(ENOSYS, "ACLs are not supported. Ignoring");
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0004-test-utf8-fix-utf16-tests-on-BE-machines.patch b/meta/recipes-core/systemd/systemd/0004-test-utf8-fix-utf16-tests-on-BE-machines.patch
>> new file mode 100644
>> index 0000000..f43068d
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0004-test-utf8-fix-utf16-tests-on-BE-machines.patch
>> @@ -0,0 +1,26 @@
>> +From 8df2bb91718bf2ccc89c41f0dd19cd0bc8da1357 Mon Sep 17 00:00:00 2001
>> +From: Tom Gundersen <teg@jklm.no>
>> +Date: Wed, 18 Feb 2015 14:33:50 +0100
>> +Subject: [PATCH 04/26] test: utf8 - fix utf16 tests on BE machines
>> +
>> +(cherry picked from commit 502184de0f95d3a124d4d4c77ae7a88747a0fac2)
>> +---
>> + src/test/test-utf8.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/test/test-utf8.c b/src/test/test-utf8.c
>> +index befa385..346f852 100644
>> +--- a/src/test/test-utf8.c
>> ++++ b/src/test/test-utf8.c
>> +@@ -95,7 +95,7 @@ static void test_utf8_escaping_printable(void) {
>> +
>> + static void test_utf16_to_utf8(void) {
>> +         char *a = NULL;
>> +-        const uint16_t utf16[] = { 'a', 0xd800, 'b', 0xdc00, 'c', 0xd801, 0xdc37 };
>> ++        const uint16_t utf16[] = { htole16('a'), htole16(0xd800), htole16('b'), htole16(0xdc00), htole16('c'), htole16(0xd801), htole16(0xdc37) };
>> +         const char utf8[] = { 'a', 'b', 'c', 0xf0, 0x90, 0x90, 0xb7, 0 };
>> +
>> +         a = utf16_to_utf8(utf16, 14);
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0005-tmpfiles-avoid-creating-duplicate-acl-entries.patch b/meta/recipes-core/systemd/systemd/0005-tmpfiles-avoid-creating-duplicate-acl-entries.patch
>> new file mode 100644
>> index 0000000..35fe913
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0005-tmpfiles-avoid-creating-duplicate-acl-entries.patch
>> @@ -0,0 +1,131 @@
>> +From c429758054ee77383ca6d7323ecdd4163d3a3718 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
>> +Date: Mon, 23 Feb 2015 23:19:54 -0500
>> +Subject: [PATCH 05/26] tmpfiles: avoid creating duplicate acl entries
>> +
>> +https://bugs.freedesktop.org/show_bug.cgi?id=89202
>> +https://bugs.debian.org/778656
>> +
>> +Status quo ante can be restored with:
>> +  getfacl -p /var/log/journal/`cat /etc/machine-id`|grep -v '^#'|sort -u|sudo setfacl --set-file=- /var/log/journal/`cat /etc/machine-id`
>> +
>> +(cherry picked from commit 1c73f3bc29111a00738569c9d40a989b161a0624)
>> +---
>> + src/shared/acl-util.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++--
>> + src/shared/acl-util.h |  4 +++
>> + 2 files changed, 81 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/shared/acl-util.c b/src/shared/acl-util.c
>> +index a4ff1ab..cbe09d7 100644
>> +--- a/src/shared/acl-util.c
>> ++++ b/src/shared/acl-util.c
>> +@@ -282,6 +282,77 @@ int parse_acl(char *text, acl_t *acl_access, acl_t *acl_default, bool want_mask)
>> +         return 0;
>> + }
>> +
>> ++static int acl_entry_equal(acl_entry_t a, acl_entry_t b) {
>> ++        acl_tag_t tag_a, tag_b;
>> ++
>> ++        if (acl_get_tag_type(a, &tag_a) < 0)
>> ++                return -errno;
>> ++
>> ++        if (acl_get_tag_type(b, &tag_b) < 0)
>> ++                return -errno;
>> ++
>> ++        if (tag_a != tag_b)
>> ++                return false;
>> ++
>> ++        switch (tag_a) {
>> ++        case ACL_USER_OBJ:
>> ++        case ACL_GROUP_OBJ:
>> ++        case ACL_MASK:
>> ++        case ACL_OTHER:
>> ++                /* can have only one of those */
>> ++                return true;
>> ++        case ACL_USER: {
>> ++                _cleanup_(acl_free_uid_tpp) uid_t *uid_a, *uid_b;
>> ++
>> ++                uid_a = acl_get_qualifier(a);
>> ++                if (!uid_a)
>> ++                        return -errno;
>> ++
>> ++                uid_b = acl_get_qualifier(b);
>> ++                if (!uid_b)
>> ++                        return -errno;
>> ++
>> ++                return *uid_a == *uid_b;
>> ++        }
>> ++        case ACL_GROUP: {
>> ++                _cleanup_(acl_free_gid_tpp) gid_t *gid_a, *gid_b;
>> ++
>> ++                gid_a = acl_get_qualifier(a);
>> ++                if (!gid_a)
>> ++                        return -errno;
>> ++
>> ++                gid_b = acl_get_qualifier(b);
>> ++                if (!gid_b)
>> ++                        return -errno;
>> ++
>> ++                return *gid_a == *gid_b;
>> ++        }
>> ++        default:
>> ++                assert_not_reached("Unknown acl tag type");
>> ++        }
>> ++}
>> ++
>> ++static int find_acl_entry(acl_t acl, acl_entry_t entry, acl_entry_t *out) {
>> ++        acl_entry_t i;
>> ++        int r;
>> ++
>> ++        for (r = acl_get_entry(acl, ACL_FIRST_ENTRY, &i);
>> ++             r > 0;
>> ++             r = acl_get_entry(acl, ACL_NEXT_ENTRY, &i)) {
>> ++
>> ++                r = acl_entry_equal(i, entry);
>> ++                if (r < 0)
>> ++                        return r;
>> ++                if (r > 0) {
>> ++                        *out = i;
>> ++                        return 1;
>> ++                }
>> ++        }
>> ++        if (r < 0)
>> ++                return -errno;
>> ++        return 0;
>> ++}
>> ++
>> + int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl) {
>> +         _cleanup_(acl_freep) acl_t old;
>> +         acl_entry_t i;
>> +@@ -297,8 +368,12 @@ int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl) {
>> +
>> +                 acl_entry_t j;
>> +
>> +-                if (acl_create_entry(&old, &j) < 0)
>> +-                        return -errno;
>> ++                r = find_acl_entry(old, i, &j);
>> ++                if (r < 0)
>> ++                        return r;
>> ++                if (r == 0)
>> ++                        if (acl_create_entry(&old, &j) < 0)
>> ++                                return -errno;
>> +
>> +                 if (acl_copy_entry(j, i) < 0)
>> +                         return -errno;
>> +diff --git a/src/shared/acl-util.h b/src/shared/acl-util.h
>> +index 90e88ff..fdb9006 100644
>> +--- a/src/shared/acl-util.h
>> ++++ b/src/shared/acl-util.h
>> +@@ -41,5 +41,9 @@ int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl);
>> + DEFINE_TRIVIAL_CLEANUP_FUNC(acl_t, acl_free);
>> + #define acl_free_charp acl_free
>> + DEFINE_TRIVIAL_CLEANUP_FUNC(char*, acl_free_charp);
>> ++#define acl_free_uid_tp acl_free
>> ++DEFINE_TRIVIAL_CLEANUP_FUNC(uid_t*, acl_free_uid_tp);
>> ++#define acl_free_gid_tp acl_free
>> ++DEFINE_TRIVIAL_CLEANUP_FUNC(gid_t*, acl_free_gid_tp);
>> +
>> + #endif
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0006-shared-time-util-fix-gcc5-warning.patch b/meta/recipes-core/systemd/systemd/0006-shared-time-util-fix-gcc5-warning.patch
>> new file mode 100644
>> index 0000000..fc707bb
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0006-shared-time-util-fix-gcc5-warning.patch
>> @@ -0,0 +1,32 @@
>> +From 57da343cebcd77d168d5648825698e4edbb56d2c Mon Sep 17 00:00:00 2001
>> +From: Daniel Mack <daniel@zonque.org>
>> +Date: Tue, 24 Feb 2015 13:26:09 +0100
>> +Subject: [PATCH 06/26] shared/time-util: fix gcc5 warning
>> +
>> +  CC       src/shared/libsystemd_shared_la-time-util.lo
>> +src/shared/time-util.c: In function 'parse_nsec':
>> +src/shared/time-util.c:789:25: warning: logical not is only applied to the left hand side of comparison [-Wlogical-not-parentheses]
>> +                 if (!*s != 0)
>> +                         ^
>> +
>> +(cherry picked from commit 8e8933ca0f06bae19cb6db601e83b33f8ac80f2a)
>> +---
>> + src/shared/time-util.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/shared/time-util.c b/src/shared/time-util.c
>> +index 947ac1f..1c36c57 100644
>> +--- a/src/shared/time-util.c
>> ++++ b/src/shared/time-util.c
>> +@@ -786,7 +786,7 @@ int parse_nsec(const char *t, nsec_t *nsec) {
>> +         s = startswith(p, "infinity");
>> +         if (s) {
>> +                 s += strspn(s, WHITESPACE);
>> +-                if (!*s != 0)
>> ++                if (*s != 0)
>> +                         return -EINVAL;
>> +
>> +                 *nsec = NSEC_INFINITY;
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0007-test-time-test-infinity-parsing-in-nanoseconds.patch b/meta/recipes-core/systemd/systemd/0007-test-time-test-infinity-parsing-in-nanoseconds.patch
>> new file mode 100644
>> index 0000000..161b7b5
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0007-test-time-test-infinity-parsing-in-nanoseconds.patch
>> @@ -0,0 +1,36 @@
>> +From 5248b6bbaf09c74cd152257132cba9358549446a Mon Sep 17 00:00:00 2001
>> +From: Daniel Mack <daniel@zonque.org>
>> +Date: Tue, 24 Feb 2015 13:27:10 +0100
>> +Subject: [PATCH 07/26] test-time: test "infinity" parsing in nanoseconds
>> +
>> +(cherry picked from commit fdd30a1530810b659345c565e97beef06b7af2fd)
>> +---
>> + src/test/test-time.c | 6 ++++++
>> + 1 file changed, 6 insertions(+)
>> +
>> +diff --git a/src/test/test-time.c b/src/test/test-time.c
>> +index 8cfc4cc..3840fff 100644
>> +--- a/src/test/test-time.c
>> ++++ b/src/test/test-time.c
>> +@@ -78,12 +78,18 @@ static void test_parse_nsec(void) {
>> +         assert_se(u == 2);
>> +         assert_se(parse_nsec(".7", &u) >= 0);
>> +         assert_se(u == 0);
>> ++        assert_se(parse_nsec("infinity", &u) >= 0);
>> ++        assert_se(u == NSEC_INFINITY);
>> ++        assert_se(parse_nsec(" infinity ", &u) >= 0);
>> ++        assert_se(u == NSEC_INFINITY);
>> +
>> +         assert_se(parse_nsec(" xyz ", &u) < 0);
>> +         assert_se(parse_nsec("", &u) < 0);
>> +         assert_se(parse_nsec(" . ", &u) < 0);
>> +         assert_se(parse_nsec(" 5. ", &u) < 0);
>> +         assert_se(parse_nsec(".s ", &u) < 0);
>> ++        assert_se(parse_nsec(" infinity .7", &u) < 0);
>> ++        assert_se(parse_nsec(".3 infinity", &u) < 0);
>> + }
>> +
>> + static void test_format_timespan_one(usec_t x, usec_t accuracy) {
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0008-bootchart-fix-default-init-path.patch b/meta/recipes-core/systemd/systemd/0008-bootchart-fix-default-init-path.patch
>> new file mode 100644
>> index 0000000..7eaad1e
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0008-bootchart-fix-default-init-path.patch
>> @@ -0,0 +1,44 @@
>> +From 588e3fe64330854d44f09b376a132c6384ac2499 Mon Sep 17 00:00:00 2001
>> +From: Martin Pitt <martin.pitt@ubuntu.com>
>> +Date: Tue, 24 Feb 2015 14:30:10 +0100
>> +Subject: [PATCH 08/26] bootchart: fix default init path
>> +
>> +Commit 6e1bf7ab99 used the wrong directory; we need rootlibexecdir, not
>> +rootlibdir, as the latter is something like /lib/x86_64-linux-gnu/ on
>> +multi-arch systems.
>> +
>> +https://launchpad.net/bugs/1423867
>> +(cherry picked from commit a804d849b3c2199bc25d1d4e65fc119fa4d7d0e2)
>> +---
>> + Makefile.am               | 1 +
>> + src/bootchart/bootchart.c | 2 +-
>> + 2 files changed, 2 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/Makefile.am b/Makefile.am
>> +index bf04d31..cc577ce 100644
>> +--- a/Makefile.am
>> ++++ b/Makefile.am
>> +@@ -198,6 +198,7 @@ AM_CPPFLAGS = \
>> +     -DKEXEC=\"$(KEXEC)\" \
>> +     -DLIBDIR=\"$(libdir)\" \
>> +     -DROOTLIBDIR=\"$(rootlibdir)\" \
>> ++    -DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
>> +     -DTEST_DIR=\"$(abs_top_srcdir)/test\" \
>> +     -I $(top_srcdir)/src \
>> +     -I $(top_builddir)/src/shared \
>> +diff --git a/src/bootchart/bootchart.c b/src/bootchart/bootchart.c
>> +index 64a384b..175be68 100644
>> +--- a/src/bootchart/bootchart.c
>> ++++ b/src/bootchart/bootchart.c
>> +@@ -76,7 +76,7 @@ int sysfd=-1;
>> + #define DEFAULT_HZ 25.0
>> + #define DEFAULT_SCALE_X 100.0 /* 100px = 1sec */
>> + #define DEFAULT_SCALE_Y 20.0  /* 16px = 1 process bar */
>> +-#define DEFAULT_INIT ROOTLIBDIR "/systemd/systemd"
>> ++#define DEFAULT_INIT ROOTLIBEXECDIR "/systemd"
>> + #define DEFAULT_OUTPUT "/run/log"
>> +
>> + /* graph defaults */
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0009-systemctl-bump-NOFILE-only-for-systemctl_main.patch b/meta/recipes-core/systemd/systemd/0009-systemctl-bump-NOFILE-only-for-systemctl_main.patch
>> new file mode 100644
>> index 0000000..dbffa5b
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0009-systemctl-bump-NOFILE-only-for-systemctl_main.patch
>> @@ -0,0 +1,44 @@
>> +From 1df0ddca3ae405537ceb87eccdb76324f276706f Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
>> +Date: Tue, 24 Feb 2015 10:10:04 -0500
>> +Subject: [PATCH 09/26] systemctl: bump NOFILE only for systemctl_main
>> +
>> +It is not necessary when running as telinit, etc.
>> +
>> +https://bugzilla.redhat.com/show_bug.cgi?id=1184712
>> +(cherry picked from commit 95d383ee47db488f182048cfd6846f2e6b859f2b)
>> +---
>> + src/systemctl/systemctl.c | 10 +++++-----
>> + 1 file changed, 5 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/src/systemctl/systemctl.c b/src/systemctl/systemctl.c
>> +index 21cb898..6b93ec8 100644
>> +--- a/src/systemctl/systemctl.c
>> ++++ b/src/systemctl/systemctl.c
>> +@@ -7204,6 +7204,11 @@ found:
>> +                 }
>> +         }
>> +
>> ++        /* Increase max number of open files to 16K if we can, we
>> ++         * might needs this when browsing journal files, which might
>> ++         * be split up into many files. */
>> ++        setrlimit_closest(RLIMIT_NOFILE, &RLIMIT_MAKE_CONST(16384));
>> ++
>> +         return verb->dispatch(bus, argv + optind);
>> + }
>> +
>> +@@ -7453,11 +7458,6 @@ int main(int argc, char*argv[]) {
>> +                 goto finish;
>> +         }
>> +
>> +-        /* Increase max number of open files to 16K if we can, we
>> +-         * might needs this when browsing journal files, which might
>> +-         * be split up into many files. */
>> +-        setrlimit_closest(RLIMIT_NOFILE, &RLIMIT_MAKE_CONST(16384));
>> +-
>> +         if (!avoid_bus())
>> +                 r = bus_open_transport_systemd(arg_transport, arg_host, arg_scope != UNIT_FILE_SYSTEM, &bus);
>> +
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
>> index 41b9039..ff2871b 100644
>> --- a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
>> +++ b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
>> @@ -1,7 +1,7 @@
>> -From 3dc731c1d270e2e143de621db9bd898299fd849d Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Fri, 20 Feb 2015 05:24:49 +0000
>> -Subject: [PATCH 10/11] Make root's home directory configurable
>> +From dd843247b6c769a3983462f7e616dc43226974a0 Mon Sep 17 00:00:00 2001
>> +From: Bruno Bottazzini <bruno.bottazzini@intel.com>
>> +Date: Thu, 5 Mar 2015 17:38:12 -0300
>> +Subject: [PATCH] Make root's home directory configurable
>>
>>  OpenEmbedded has a configurable home directory for root. Allow
>>  systemd to be built using its idea of what root's home directory
>> @@ -9,32 +9,31 @@ should be.
>>
>>  Upstream-Status: Pending
>>
>> -Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Patch made by Khem Raj <raj.khem@gmail.com> updated to be
>> +compatbile with systemd 219-stable
>>  ---
>> - Makefile.am                       | 2 ++
>> - configure.ac                      | 7 +++++++
>> - src/core/unit-printf.c            | 2 +-
>> - src/nspawn/nspawn.c               | 4 ++--
>> - src/shared/util.c                 | 4 ++--
>> - units/console-shell.service.m4.in | 4 ++--
>> - units/emergency.service.in        | 4 ++--
>> - units/rescue.service.in           | 4 ++--
>> - 8 files changed, 20 insertions(+), 11 deletions(-)
>> + Makefile.am                | 2 ++
>> + configure.ac               | 7 +++++++
>> + src/core/unit-printf.c     | 2 +-
>> + src/nspawn/nspawn.c        | 5 ++---
>> + src/shared/util.c          | 4 ++--
>> + units/emergency.service.in | 4 ++--
>> + units/rescue.service.in    | 4 ++--
>> + 7 files changed, 18 insertions(+), 10 deletions(-)
>>
>>  diff --git a/Makefile.am b/Makefile.am
>> -index 0fb3f9f..4623963 100644
>> +index 93c0509..31ea94d 100644
>>  --- a/Makefile.am
>>  +++ b/Makefile.am
>> -@@ -199,6 +199,7 @@ AM_CPPFLAGS = \
>> -     -DKEXEC=\"$(KEXEC)\" \
>> -     -DLIBDIR=\"$(libdir)\" \
>> +@@ -201,6 +201,7 @@ AM_CPPFLAGS = \
>>       -DROOTLIBDIR=\"$(rootlibdir)\" \
>> -+    -DROOTHOMEDIR=\"$(roothomedir)\" \
>> +     -DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
>>       -DTEST_DIR=\"$(abs_top_srcdir)/test\" \
>> ++    -DROOTHOMEDIR=\"$(roothomedir)\" \
>>       -I $(top_srcdir)/src \
>>       -I $(top_builddir)/src/shared \
>> -@@ -6342,6 +6343,7 @@ EXTRA_DIST += \
>> +     -I $(top_srcdir)/src/shared \
>> +@@ -6350,6 +6351,7 @@ EXTRA_DIST += \
>>   substitutions = \
>>          '|rootlibexecdir=$(rootlibexecdir)|' \
>>          '|rootbindir=$(rootbindir)|' \
>> @@ -43,10 +42,10 @@ index 0fb3f9f..4623963 100644
>>          '|SYSTEMCTL=$(rootbindir)/systemctl|' \
>>          '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
>>  diff --git a/configure.ac b/configure.ac
>> -index a5b2e6e..55bb7d8 100644
>> +index 01ee8dc..800a587 100644
>>  --- a/configure.ac
>>  +++ b/configure.ac
>> -@@ -1428,6 +1428,11 @@ AC_ARG_WITH([rootlibdir],
>> +@@ -1410,6 +1410,11 @@ AC_ARG_WITH([rootlibdir],
>>           [],
>>           [with_rootlibdir=${libdir}])
>>
>> @@ -58,7 +57,7 @@ index a5b2e6e..55bb7d8 100644
>>   AC_ARG_WITH([pamlibdir],
>>           AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
>>           [],
>> -@@ -1518,6 +1523,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
>> +@@ -1500,6 +1505,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
>>   AC_SUBST([pamconfdir], [$with_pamconfdir])
>>   AC_SUBST([rootprefix], [$with_rootprefix])
>>   AC_SUBST([rootlibdir], [$with_rootlibdir])
>> @@ -66,7 +65,7 @@ index a5b2e6e..55bb7d8 100644
>>
>>   AC_CONFIG_FILES([
>>           Makefile po/Makefile.in
>> -@@ -1617,6 +1623,7 @@ AC_MSG_RESULT([
>> +@@ -1599,6 +1605,7 @@ AC_MSG_RESULT([
>>           include_prefix:          ${INCLUDE_PREFIX}
>>           lib dir:                 ${libdir}
>>           rootlib dir:             ${with_rootlibdir}
>> @@ -75,10 +74,10 @@ index a5b2e6e..55bb7d8 100644
>>           SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
>>           Build Python:            ${PYTHON}
>>  diff --git a/src/core/unit-printf.c b/src/core/unit-printf.c
>> -index 97135db..14d12f1 100644
>> +index 7736899..ac5f008 100644
>>  --- a/src/core/unit-printf.c
>>  +++ b/src/core/unit-printf.c
>> -@@ -259,7 +259,7 @@ static int specifier_user_home(char specifier, void *data, void *userdata, char
>> +@@ -256,7 +256,7 @@ static int specifier_user_home(char specifier, void *data, void *userdata, char
>>                    * best of it if we can, but fail if we can't */
>>
>>                   if (!c->user || streq(c->user, "root") || streq(c->user, "0"))
>> @@ -88,21 +87,22 @@ index 97135db..14d12f1 100644
>>                           return -ENOTSUP;
>>
>>  diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
>> -index b597edb..0b32673 100644
>> +index 08bfdcf..b44b4cd 100644
>>  --- a/src/nspawn/nspawn.c
>>  +++ b/src/nspawn/nspawn.c
>> -@@ -4192,7 +4192,7 @@ int main(int argc, char *argv[]) {
>> +@@ -4180,8 +4180,7 @@ int main(int argc, char *argv[]) {
>> +                         r = change_uid_gid(&home);
>>                           if (r < 0)
>>                                   _exit(EXIT_FAILURE);
>> -
>> +-
>>  -                        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: "/root") < 0) ||
>>  +                        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: ROOTHOMEDIR) < 0) ||
>>                               (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
>>                               (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0)) {
>>                                   log_oom();
>> -@@ -4266,7 +4266,7 @@ int main(int argc, char *argv[]) {
>> -                                 execvp(argv[optind], argv + optind);
>> - #endif /* HAVE_EXECVPE */
>> +@@ -4250,7 +4249,7 @@ int main(int argc, char *argv[]) {
>> +                         } else if (argc > optind)
>> +                                 execvpe(argv[optind], argv + optind, env_use);
>>                           else {
>>  -                                chdir(home ? home : "/root");
>>  +                                chdir(home ? home : ROOTHOMEDIR);
>> @@ -110,10 +110,10 @@ index b597edb..0b32673 100644
>>                                   execle("/bin/sh", "-sh", NULL, env_use);
>>                           }
>>  diff --git a/src/shared/util.c b/src/shared/util.c
>> -index cbbe3b1..a0e3cc5 100644
>> +index 241e752..00adab6 100644
>>  --- a/src/shared/util.c
>>  +++ b/src/shared/util.c
>> -@@ -4609,7 +4609,7 @@ int get_user_creds(
>> +@@ -4604,7 +4604,7 @@ int get_user_creds(
>>                           *gid = 0;
>>
>>                   if (home)
>> @@ -122,7 +122,7 @@ index cbbe3b1..a0e3cc5 100644
>>
>>                   if (shell)
>>                           *shell = "/bin/sh";
>> -@@ -5611,7 +5611,7 @@ int get_home_dir(char **_h) {
>> +@@ -5606,7 +5606,7 @@ int get_home_dir(char **_h) {
>>           /* Hardcode home directory for root to avoid NSS */
>>           u = getuid();
>>           if (u == 0) {
>> @@ -131,21 +131,6 @@ index cbbe3b1..a0e3cc5 100644
>>                   if (!h)
>>                           return -ENOMEM;
>>
>> -diff --git a/units/console-shell.service.m4.in b/units/console-shell.service.m4.in
>> -index 5c80722..efde5f0 100644
>> ---- a/units/console-shell.service.m4.in
>> -+++ b/units/console-shell.service.m4.in
>> -@@ -15,8 +15,8 @@ After=rc-local.service
>> - Before=getty.target
>> -
>> - [Service]
>> --Environment=HOME=/root
>> --WorkingDirectory=/root
>> -+Environment=HOME=@roothomedir@
>> -+WorkingDirectory=@roothomedir@
>> - ExecStart=-@SULOGIN@
>> - ExecStopPost=-@SYSTEMCTL@ poweroff
>> - Type=idle
>>  diff --git a/units/emergency.service.in b/units/emergency.service.in
>>  index 2695d7b..7f47b73 100644
>>  --- a/units/emergency.service.in
>> @@ -177,5 +162,5 @@ index de73fee..47f3593 100644
>>   ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
>>   ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --fail --no-block default"
>>  --
>> -2.1.4
>> +1.9.1
>>
>> diff --git a/meta/recipes-core/systemd/systemd/0010-acl-util-avoid-freeing-uninitialized-pointer.patch b/meta/recipes-core/systemd/systemd/0010-acl-util-avoid-freeing-uninitialized-pointer.patch
>> new file mode 100644
>> index 0000000..1e4a69d
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0010-acl-util-avoid-freeing-uninitialized-pointer.patch
>> @@ -0,0 +1,37 @@
>> +From f17b6474aaca077482a68aedc1de9d654ab21bad Mon Sep 17 00:00:00 2001
>> +From: Thomas Hindoe Paaboel Andersen <phomes@gmail.com>
>> +Date: Tue, 24 Feb 2015 20:40:07 +0100
>> +Subject: [PATCH 10/26] acl-util: avoid freeing uninitialized pointer
>> +
>> +CID#1271344/1271345
>> +
>> +(cherry picked from commit 76dcbc4992e895a377aad26f8c4a0dcd71002396)
>> +---
>> + src/shared/acl-util.c | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/shared/acl-util.c b/src/shared/acl-util.c
>> +index cbe09d7..e67e9ac 100644
>> +--- a/src/shared/acl-util.c
>> ++++ b/src/shared/acl-util.c
>> +@@ -302,7 +302,7 @@ static int acl_entry_equal(acl_entry_t a, acl_entry_t b) {
>> +                 /* can have only one of those */
>> +                 return true;
>> +         case ACL_USER: {
>> +-                _cleanup_(acl_free_uid_tpp) uid_t *uid_a, *uid_b;
>> ++                _cleanup_(acl_free_uid_tpp) uid_t *uid_a = NULL, *uid_b = NULL;
>> +
>> +                 uid_a = acl_get_qualifier(a);
>> +                 if (!uid_a)
>> +@@ -315,7 +315,7 @@ static int acl_entry_equal(acl_entry_t a, acl_entry_t b) {
>> +                 return *uid_a == *uid_b;
>> +         }
>> +         case ACL_GROUP: {
>> +-                _cleanup_(acl_free_gid_tpp) gid_t *gid_a, *gid_b;
>> ++                _cleanup_(acl_free_gid_tpp) gid_t *gid_a = NULL, *gid_b = NULL;
>> +
>> +                 gid_a = acl_get_qualifier(a);
>> +                 if (!gid_a)
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0011-bootchart-svg-fix-checking-of-list-end.patch b/meta/recipes-core/systemd/systemd/0011-bootchart-svg-fix-checking-of-list-end.patch
>> new file mode 100644
>> index 0000000..dca5e20
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0011-bootchart-svg-fix-checking-of-list-end.patch
>> @@ -0,0 +1,28 @@
>> +From 668529dde3ecf35e24f39eaf3a3044099e4d5273 Mon Sep 17 00:00:00 2001
>> +From: Aaro Koskinen <aaro.koskinen@nokia.com>
>> +Date: Tue, 24 Feb 2015 18:32:31 +0200
>> +Subject: [PATCH 11/26] bootchart: svg: fix checking of list end
>> +
>> +If we have less samples than expected, systemd-bootchart will crash.
>> +
>> +(cherry picked from commit c1682f17a0c966988e865c649e565dae41abf32d)
>> +---
>> + src/bootchart/svg.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/bootchart/svg.c b/src/bootchart/svg.c
>> +index e111fa9..144177c 100644
>> +--- a/src/bootchart/svg.c
>> ++++ b/src/bootchart/svg.c
>> +@@ -1170,7 +1170,7 @@ static void svg_ps_bars(void) {
>> +
>> +                 ps->sample = ps->sample->next;
>> +                 sample_hz = ps->sample;
>> +-                for (ii=0;((ii<(int)arg_hz/2)&&(ps->sample->next));ii++)
>> ++                for (ii=0;((ii<(int)arg_hz/2)&&(sample_hz->next));ii++)
>> +                         sample_hz = sample_hz->next;
>> +
>> +                 /* subtract bootchart cpu utilization from total */
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0012-systemd-add-getrandom-syscall-numbers-for-MIPS.patch b/meta/recipes-core/systemd/systemd/0012-systemd-add-getrandom-syscall-numbers-for-MIPS.patch
>> new file mode 100644
>> index 0000000..e0cb193
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0012-systemd-add-getrandom-syscall-numbers-for-MIPS.patch
>> @@ -0,0 +1,38 @@
>> +From 5b49f6072e901336680708267c3d48a54c5410ae Mon Sep 17 00:00:00 2001
>> +From: Aaro Koskinen <aaro.koskinen@nokia.com>
>> +Date: Mon, 23 Feb 2015 16:01:31 +0200
>> +Subject: [PATCH 12/26] systemd: add getrandom syscall numbers for MIPS
>> +
>> +Add getrandom syscall numbers for MIPS. Based on Linux 3.17 kernel
>> +(commit 42944521af97a3b25516f15f3149aec3779656dc, "MIPS: Wire up new
>> +syscalls getrandom and memfd_create").
>> +
>> +(cherry picked from commit 3bec6d4690d2a7f08dc27b8221299c1db94978c4)
>> +---
>> + src/shared/missing.h | 10 ++++++++++
>> + 1 file changed, 10 insertions(+)
>> +
>> +diff --git a/src/shared/missing.h b/src/shared/missing.h
>> +index b33a70c..e72631e 100644
>> +--- a/src/shared/missing.h
>> ++++ b/src/shared/missing.h
>> +@@ -179,6 +179,16 @@ static inline int memfd_create(const char *name, unsigned int flags) {
>> + #    define __NR_getrandom 349
>> + #  elif defined(__powerpc__)
>> + #    define __NR_getrandom 359
>> ++#  elif defined _MIPS_SIM
>> ++#    if _MIPS_SIM == _MIPS_SIM_ABI32
>> ++#      define __NR_getrandom 4353
>> ++#    endif
>> ++#    if _MIPS_SIM == _MIPS_SIM_NABI32
>> ++#      define __NR_getrandom 6317
>> ++#    endif
>> ++#    if _MIPS_SIM == _MIPS_SIM_ABI64
>> ++#      define __NR_getrandom 5313
>> ++#    endif
>> + #  else
>> + #    warning "__NR_getrandom unknown for your architecture"
>> + #    define __NR_getrandom 0xffffffff
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0013-unit-use-weaker-dependencies-between-mount-and-devic.patch b/meta/recipes-core/systemd/systemd/0013-unit-use-weaker-dependencies-between-mount-and-devic.patch
>> new file mode 100644
>> index 0000000..1b842a2
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0013-unit-use-weaker-dependencies-between-mount-and-devic.patch
>> @@ -0,0 +1,33 @@
>> +From fc9805756d5c0088a3a67705bbf6bea30d0d35e5 Mon Sep 17 00:00:00 2001
>> +From: Lennart Poettering <lennart@poettering.net>
>> +Date: Wed, 25 Feb 2015 22:05:14 +0100
>> +Subject: [PATCH 13/26] unit: use weaker dependencies between mount and device
>> + units in --user mode
>> +
>> +When running in user mode unmounting of mount units when a device
>> +vanishes is unlikely to work, and even if it would work is already done
>> +by PID 1 anyway. HEnce, when creating implicit dependencies between
>> +mount units and their backing devices, created a Wants= type dependency
>> +in --user mode, but leave a BindsTo= dependency in --system mode.
>> +
>> +(cherry picked from commit 5bd4b173605142c7be493aa4d958ebaef21f421d)
>> +---
>> + src/core/unit.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/core/unit.c b/src/core/unit.c
>> +index ee8e607..9f1e55e 100644
>> +--- a/src/core/unit.c
>> ++++ b/src/core/unit.c
>> +@@ -2845,7 +2845,7 @@ int unit_add_node_link(Unit *u, const char *what, bool wants) {
>> +         if (r < 0)
>> +                 return r;
>> +
>> +-        r = unit_add_two_dependencies(u, UNIT_AFTER, UNIT_BINDS_TO, device, true);
>> ++        r = unit_add_two_dependencies(u, UNIT_AFTER, u->manager->running_as == SYSTEMD_SYSTEM ? UNIT_BINDS_TO : UNIT_WANTS, device, true);
>> +         if (r < 0)
>> +                 return r;
>> +
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0014-unit-When-stopping-due-to-BindsTo-log-which-unit-cau.patch b/meta/recipes-core/systemd/systemd/0014-unit-When-stopping-due-to-BindsTo-log-which-unit-cau.patch
>> new file mode 100644
>> index 0000000..92c4b8f
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0014-unit-When-stopping-due-to-BindsTo-log-which-unit-cau.patch
>> @@ -0,0 +1,43 @@
>> +From ca0cf2741ef9db81141f4444ab58dd3552c8fb1f Mon Sep 17 00:00:00 2001
>> +From: Colin Walters <walters@verbum.org>
>> +Date: Tue, 17 Feb 2015 13:47:34 -0500
>> +Subject: [PATCH 14/26] unit: When stopping due to BindsTo=, log which unit
>> + caused it
>> +
>> +I'm trying to track down a relatively recent change in systemd
>> +which broke OSTree; see https://bugzilla.gnome.org/show_bug.cgi?id=743891
>> +
>> +Systemd started to stop sysroot.mount, and this patch should help
>> +me debug why at least.
>> +
>> +While we're here, "break" on the first unit we find that will
>> +deactivate, as there's no point in further iteration.
>> +
>> +(cherry picked from commit 98f738b62047229af4a929d7996e2ab04253b02c)
>> +---
>> + src/core/unit.c | 4 +++-
>> + 1 file changed, 3 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/core/unit.c b/src/core/unit.c
>> +index 9f1e55e..563f6fe 100644
>> +--- a/src/core/unit.c
>> ++++ b/src/core/unit.c
>> +@@ -1648,12 +1648,14 @@ static void unit_check_binds_to(Unit *u) {
>> +                         continue;
>> +
>> +                 stop = true;
>> ++                break;
>> +         }
>> +
>> +         if (!stop)
>> +                 return;
>> +
>> +-        log_unit_info(u->id, "Unit %s is bound to inactive unit. Stopping, too.", u->id);
>> ++        assert(other);
>> ++        log_unit_info(u->id, "Unit %s is bound to inactive unit %s. Stopping, too.", u->id, other->id);
>> +
>> +         /* A unit we need to run is gone. Sniff. Let's stop this. */
>> +         manager_add_job(u->manager, JOB_STOP, u, JOB_FAIL, true, NULL, NULL);
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0015-sysctl-downgrade-message-about-sysctl-overrides-to-d.patch b/meta/recipes-core/systemd/systemd/0015-sysctl-downgrade-message-about-sysctl-overrides-to-d.patch
>> new file mode 100644
>> index 0000000..46c25bd
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0015-sysctl-downgrade-message-about-sysctl-overrides-to-d.patch
>> @@ -0,0 +1,30 @@
>> +From 2439dc6083d27271ee942559f0f73c99fa9e2b4e Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
>> +Date: Thu, 26 Feb 2015 19:00:11 -0500
>> +Subject: [PATCH 15/26] sysctl: downgrade message about sysctl overrides to
>> + debug
>> +
>> +Printing it at info level was tedious. We don't do that for any other
>> +overrides.
>> +
>> +(cherry picked from commit 7933e4266f8124e3fca71f67757abd44155fa1cb)
>> +---
>> + src/sysctl/sysctl.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/sysctl/sysctl.c b/src/sysctl/sysctl.c
>> +index 275a5b7..2415d84 100644
>> +--- a/src/sysctl/sysctl.c
>> ++++ b/src/sysctl/sysctl.c
>> +@@ -176,7 +176,7 @@ found:
>> +                         if (streq(value, existing))
>> +                                 continue;
>> +
>> +-                        log_info("Overwriting earlier assignment of %s in file '%s'.", p, path);
>> ++                        log_debug("Overwriting earlier assignment of %s in file '%s'.", p, path);
>> +                         free(hashmap_remove(sysctl_options, p));
>> +                         free(v);
>> +                 }
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0016-sysctl-add-some-hints-how-to-override-settings.patch b/meta/recipes-core/systemd/systemd/0016-sysctl-add-some-hints-how-to-override-settings.patch
>> new file mode 100644
>> index 0000000..87dce1f
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0016-sysctl-add-some-hints-how-to-override-settings.patch
>> @@ -0,0 +1,39 @@
>> +From af6a96a36415400482ad504392ea93c6a0e2ed43 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
>> +Date: Thu, 26 Feb 2015 19:05:51 -0500
>> +Subject: [PATCH 16/26] sysctl: add some hints how to override settings
>> +
>> +Also a link to decent documentation for sysrq keys. It is surprising
>> +hard to find.
>> +
>> +https://lists.fedoraproject.org/pipermail/devel/2015-February/208412.html
>> +(cherry picked from commit 16b65d7f463e91f6299dfa7b83d4b5fbeb109d1c)
>> +---
>> + sysctl.d/50-default.conf | 9 ++++++++-
>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/sysctl.d/50-default.conf b/sysctl.d/50-default.conf
>> +index f189233..def151b 100644
>> +--- a/sysctl.d/50-default.conf
>> ++++ b/sysctl.d/50-default.conf
>> +@@ -5,9 +5,16 @@
>> + #  the Free Software Foundation; either version 2.1 of the License, or
>> + #  (at your option) any later version.
>> +
>> +-# See sysctl.d(5) and core(5) for for details.
>> ++# See sysctl.d(5) and core(5) for for documentation.
>> ++
>> ++# To override settings in this file, create a local file in /etc
>> ++# (e.g. /etc/sysctl.d/90-override.conf), and put any assignments
>> ++# there.
>> +
>> + # System Request functionality of the kernel (SYNC)
>> ++#
>> ++# Use kernel.sysrq = 1 to allow all keys.
>> ++# See http://fedoraproject.org/wiki/QA/Sysrq for a list of values and keys.
>> + kernel.sysrq = 16
>> +
>> + # Append the PID to the core filename
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0017-core-rework-device-state-logic.patch b/meta/recipes-core/systemd/systemd/0017-core-rework-device-state-logic.patch
>> new file mode 100644
>> index 0000000..a3ab3e4
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0017-core-rework-device-state-logic.patch
>> @@ -0,0 +1,912 @@
>> +From 5b788e932fe918fb022bc20c3a15eb59e0fad53a Mon Sep 17 00:00:00 2001
>> +From: Lennart Poettering <lennart@poettering.net>
>> +Date: Fri, 27 Feb 2015 21:55:08 +0100
>> +Subject: [PATCH 17/26] core: rework device state logic
>> +
>> +This change introduces a new state "tentative" for device units. Device
>> +units are considered "plugged" when udev announced them, "dead" when
>> +they are not available in the kernel, and "tentative" when they are
>> +referenced in /proc/self/mountinfo or /proc/swaps but not (yet)
>> +announced via udev.
>> +
>> +This should fix a race when device nodes (like loop devices) are created
>> +and immediately mounted. Previously, systemd might end up seeing the
>> +mount unit before the device, and would thus pull down the mount because
>> +its BindTo dependency on the device would not be fulfilled.
>> +
>> +(cherry picked from commit 628c89cc68ab96fce2de7ebba5933725d147aecc)
>> +---
>> + src/core/device.c | 368 +++++++++++++++++++++++++++++++++---------------------
>> + src/core/device.h |  14 ++-
>> + src/core/mount.c  |  46 ++++---
>> + src/core/swap.c   |  32 +++--
>> + src/core/swap.h   |   4 +-
>> + src/core/unit.c   |   1 -
>> + 6 files changed, 285 insertions(+), 180 deletions(-)
>> +
>> +diff --git a/src/core/device.c b/src/core/device.c
>> +index d3deac3..75b9a46 100644
>> +--- a/src/core/device.c
>> ++++ b/src/core/device.c
>> +@@ -36,7 +36,8 @@
>> +
>> + static const UnitActiveState state_translation_table[_DEVICE_STATE_MAX] = {
>> +         [DEVICE_DEAD] = UNIT_INACTIVE,
>> +-        [DEVICE_PLUGGED] = UNIT_ACTIVE
>> ++        [DEVICE_TENTATIVE] = UNIT_ACTIVATING,
>> ++        [DEVICE_PLUGGED] = UNIT_ACTIVE,
>> + };
>> +
>> + static int device_dispatch_io(sd_event_source *source, int fd, uint32_t revents, void *userdata);
>> +@@ -65,6 +66,41 @@ static void device_unset_sysfs(Device *d) {
>> +         d->sysfs = NULL;
>> + }
>> +
>> ++static int device_set_sysfs(Device *d, const char *sysfs) {
>> ++        Device *first;
>> ++        char *copy;
>> ++        int r;
>> ++
>> ++        assert(d);
>> ++
>> ++        if (streq_ptr(d->sysfs, sysfs))
>> ++                return 0;
>> ++
>> ++        r = hashmap_ensure_allocated(&UNIT(d)->manager->devices_by_sysfs, &string_hash_ops);
>> ++        if (r < 0)
>> ++                return r;
>> ++
>> ++        copy = strdup(sysfs);
>> ++        if (!copy)
>> ++                return -ENOMEM;
>> ++
>> ++        device_unset_sysfs(d);
>> ++
>> ++        first = hashmap_get(UNIT(d)->manager->devices_by_sysfs, sysfs);
>> ++        LIST_PREPEND(same_sysfs, first, d);
>> ++
>> ++        r = hashmap_replace(UNIT(d)->manager->devices_by_sysfs, copy, first);
>> ++        if (r < 0) {
>> ++                LIST_REMOVE(same_sysfs, first, d);
>> ++                free(copy);
>> ++                return r;
>> ++        }
>> ++
>> ++        d->sysfs = copy;
>> ++
>> ++        return 0;
>> ++}
>> ++
>> + static void device_init(Unit *u) {
>> +         Device *d = DEVICE(u);
>> +
>> +@@ -112,8 +148,13 @@ static int device_coldplug(Unit *u) {
>> +         assert(d);
>> +         assert(d->state == DEVICE_DEAD);
>> +
>> +-        if (d->sysfs)
>> ++        if (d->found & DEVICE_FOUND_UDEV)
>> ++                /* If udev says the device is around, it's around */
>> +                 device_set_state(d, DEVICE_PLUGGED);
>> ++        else if (d->found != DEVICE_NOT_FOUND)
>> ++                /* If a device is found in /proc/self/mountinfo or
>> ++                 * /proc/swaps, it's "tentatively" around. */
>> ++                device_set_state(d, DEVICE_TENTATIVE);
>> +
>> +         return 0;
>> + }
>> +@@ -142,49 +183,9 @@ _pure_ static const char *device_sub_state_to_string(Unit *u) {
>> +         return device_state_to_string(DEVICE(u)->state);
>> + }
>> +
>> +-static int device_add_escaped_name(Unit *u, const char *dn) {
>> +-        _cleanup_free_ char *e = NULL;
>> +-        int r;
>> +-
>> +-        assert(u);
>> +-        assert(dn);
>> +-        assert(dn[0] == '/');
>> +-
>> +-        e = unit_name_from_path(dn, ".device");
>> +-        if (!e)
>> +-                return -ENOMEM;
>> +-
>> +-        r = unit_add_name(u, e);
>> +-        if (r < 0 && r != -EEXIST)
>> +-                return r;
>> +-
>> +-        return 0;
>> +-}
>> +-
>> +-static int device_find_escape_name(Manager *m, const char *dn, Unit **_u) {
>> +-        _cleanup_free_ char *e = NULL;
>> +-        Unit *u;
>> +-
>> +-        assert(m);
>> +-        assert(dn);
>> +-        assert(dn[0] == '/');
>> +-        assert(_u);
>> +-
>> +-        e = unit_name_from_path(dn, ".device");
>> +-        if (!e)
>> +-                return -ENOMEM;
>> +-
>> +-        u = manager_get_unit(m, e);
>> +-        if (u) {
>> +-                *_u = u;
>> +-                return 1;
>> +-        }
>> +-
>> +-        return 0;
>> +-}
>> +-
>> +-static int device_make_description(Unit *u, struct udev_device *dev, const char *path) {
>> ++static int device_update_description(Unit *u, struct udev_device *dev, const char *path) {
>> +         const char *model;
>> ++        int r;
>> +
>> +         assert(u);
>> +         assert(dev);
>> +@@ -209,13 +210,16 @@ static int device_make_description(Unit *u, struct udev_device *dev, const char
>> +
>> +                         j = strjoin(model, " ", label, NULL);
>> +                         if (j)
>> +-                                return unit_set_description(u, j);
>> +-                }
>> ++                                r = unit_set_description(u, j);
>> ++                } else
>> ++                        r = unit_set_description(u, model);
>> ++        } else
>> ++                r = unit_set_description(u, path);
>> +
>> +-                return unit_set_description(u, model);
>> +-        }
>> ++        if (r < 0)
>> ++                log_unit_error_errno(u->id, r, "Failed to set device description: %m");
>> +
>> +-        return unit_set_description(u, path);
>> ++        return r;
>> + }
>> +
>> + static int device_add_udev_wants(Unit *u, struct udev_device *dev) {
>> +@@ -242,20 +246,20 @@ static int device_add_udev_wants(Unit *u, struct udev_device *dev) {
>> +
>> +                 n = unit_name_mangle(e, MANGLE_NOGLOB);
>> +                 if (!n)
>> +-                        return -ENOMEM;
>> ++                        return log_oom();
>> +
>> +                 r = unit_add_dependency_by_name(u, UNIT_WANTS, n, NULL, true);
>> +                 if (r < 0)
>> +-                        return r;
>> ++                        return log_unit_error_errno(u->id, r, "Failed to add wants dependency: %m");
>> +         }
>> +         if (!isempty(state))
>> +-                log_unit_warning(u->id, "Property %s on %s has trailing garbage, ignoring.",
>> +-                                 property, strna(udev_device_get_syspath(dev)));
>> ++                log_unit_warning(u->id, "Property %s on %s has trailing garbage, ignoring.", property, strna(udev_device_get_syspath(dev)));
>> +
>> +         return 0;
>> + }
>> +
>> +-static int device_update_unit(Manager *m, struct udev_device *dev, const char *path, bool main) {
>> ++static int device_setup_unit(Manager *m, struct udev_device *dev, const char *path, bool main) {
>> ++        _cleanup_free_ char *e = NULL;
>> +         const char *sysfs;
>> +         Unit *u = NULL;
>> +         bool delete;
>> +@@ -269,12 +273,18 @@ static int device_update_unit(Manager *m, struct udev_device *dev, const char *p
>> +         if (!sysfs)
>> +                 return 0;
>> +
>> +-        r = device_find_escape_name(m, path, &u);
>> +-        if (r < 0)
>> +-                return r;
>> ++        e = unit_name_from_path(path, ".device");
>> ++        if (!e)
>> ++                return log_oom();
>> ++
>> ++        u = manager_get_unit(m, e);
>> +
>> +-        if (u && DEVICE(u)->sysfs && !path_equal(DEVICE(u)->sysfs, sysfs))
>> ++        if (u &&
>> ++            DEVICE(u)->sysfs &&
>> ++            !path_equal(DEVICE(u)->sysfs, sysfs)) {
>> ++                log_unit_error(u->id, "Device %s appeared twice with different sysfs paths %s and %s", e, DEVICE(u)->sysfs, sysfs);
>> +                 return -EEXIST;
>> ++        }
>> +
>> +         if (!u) {
>> +                 delete = true;
>> +@@ -283,7 +293,7 @@ static int device_update_unit(Manager *m, struct udev_device *dev, const char *p
>> +                 if (!u)
>> +                         return log_oom();
>> +
>> +-                r = device_add_escaped_name(u, path);
>> ++                r = unit_add_name(u, e);
>> +                 if (r < 0)
>> +                         goto fail;
>> +
>> +@@ -295,37 +305,16 @@ static int device_update_unit(Manager *m, struct udev_device *dev, const char *p
>> +          * actually been seen yet ->sysfs will not be
>> +          * initialized. Hence initialize it if necessary. */
>> +
>> +-        if (!DEVICE(u)->sysfs) {
>> +-                Device *first;
>> +-
>> +-                DEVICE(u)->sysfs = strdup(sysfs);
>> +-                if (!DEVICE(u)->sysfs) {
>> +-                        r = -ENOMEM;
>> +-                        goto fail;
>> +-                }
>> +-
>> +-                r = hashmap_ensure_allocated(&m->devices_by_sysfs, &string_hash_ops);
>> +-                if (r < 0)
>> +-                        goto fail;
>> +-
>> +-                first = hashmap_get(m->devices_by_sysfs, sysfs);
>> +-                LIST_PREPEND(same_sysfs, first, DEVICE(u));
>> +-
>> +-                r = hashmap_replace(m->devices_by_sysfs, DEVICE(u)->sysfs, first);
>> +-                if (r < 0)
>> +-                        goto fail;
>> +-        }
>> +-
>> +-        device_make_description(u, dev, path);
>> ++        r = device_set_sysfs(DEVICE(u), sysfs);
>> ++        if (r < 0)
>> ++                goto fail;
>> +
>> +-        if (main) {
>> +-                /* The additional systemd udev properties we only
>> +-                 * interpret for the main object */
>> ++        (void) device_update_description(u, dev, path);
>> +
>> +-                r = device_add_udev_wants(u, dev);
>> +-                if (r < 0)
>> +-                        goto fail;
>> +-        }
>> ++        /* The additional systemd udev properties we only interpret
>> ++         * for the main object */
>> ++        if (main)
>> ++                (void) device_add_udev_wants(u, dev);
>> +
>> +         /* Note that this won't dispatch the load queue, the caller
>> +          * has to do that if needed and appropriate */
>> +@@ -334,7 +323,7 @@ static int device_update_unit(Manager *m, struct udev_device *dev, const char *p
>> +         return 0;
>> +
>> + fail:
>> +-        log_warning_errno(r, "Failed to load device unit: %m");
>> ++        log_unit_warning_errno(u->id, r, "Failed to set up device unit: %m");
>> +
>> +         if (delete && u)
>> +                 unit_free(u);
>> +@@ -342,7 +331,7 @@ fail:
>> +         return r;
>> + }
>> +
>> +-static int device_process_new_device(Manager *m, struct udev_device *dev) {
>> ++static int device_process_new(Manager *m, struct udev_device *dev) {
>> +         const char *sysfs, *dn, *alias;
>> +         struct udev_list_entry *item = NULL, *first = NULL;
>> +         int r;
>> +@@ -354,14 +343,14 @@ static int device_process_new_device(Manager *m, struct udev_device *dev) {
>> +                 return 0;
>> +
>> +         /* Add the main unit named after the sysfs path */
>> +-        r = device_update_unit(m, dev, sysfs, true);
>> ++        r = device_setup_unit(m, dev, sysfs, true);
>> +         if (r < 0)
>> +                 return r;
>> +
>> +         /* Add an additional unit for the device node */
>> +         dn = udev_device_get_devnode(dev);
>> +         if (dn)
>> +-                device_update_unit(m, dev, dn, false);
>> ++                (void) device_setup_unit(m, dev, dn, false);
>> +
>> +         /* Add additional units for all symlinks */
>> +         first = udev_device_get_devlinks_list_entry(dev);
>> +@@ -388,7 +377,7 @@ static int device_process_new_device(Manager *m, struct udev_device *dev) {
>> +                             st.st_rdev != udev_device_get_devnum(dev))
>> +                                 continue;
>> +
>> +-                device_update_unit(m, dev, p, false);
>> ++                (void) device_setup_unit(m, dev, p, false);
>> +         }
>> +
>> +         /* Add additional units for all explicitly configured
>> +@@ -405,7 +394,7 @@ static int device_process_new_device(Manager *m, struct udev_device *dev) {
>> +                         e[l] = 0;
>> +
>> +                         if (path_is_absolute(e))
>> +-                                device_update_unit(m, dev, e, false);
>> ++                                (void) device_setup_unit(m, dev, e, false);
>> +                         else
>> +                                 log_warning("SYSTEMD_ALIAS for %s is not an absolute path, ignoring: %s", sysfs, e);
>> +                 }
>> +@@ -416,39 +405,62 @@ static int device_process_new_device(Manager *m, struct udev_device *dev) {
>> +         return 0;
>> + }
>> +
>> +-static void device_set_path_plugged(Manager *m, struct udev_device *dev) {
>> +-        const char *sysfs;
>> ++static void device_update_found_one(Device *d, bool add, DeviceFound found, bool now) {
>> ++        DeviceFound n;
>> ++
>> ++        assert(d);
>> ++
>> ++        n = add ? (d->found | found) : (d->found & ~found);
>> ++        if (n == d->found)
>> ++                return;
>> ++
>> ++        d->found = n;
>> ++
>> ++        if (now) {
>> ++                if (d->found & DEVICE_FOUND_UDEV)
>> ++                        device_set_state(d, DEVICE_PLUGGED);
>> ++                else if (d->found != DEVICE_NOT_FOUND)
>> ++                        device_set_state(d, DEVICE_TENTATIVE);
>> ++                else
>> ++                        device_set_state(d, DEVICE_DEAD);
>> ++        }
>> ++}
>> ++
>> ++static int device_update_found_by_sysfs(Manager *m, const char *sysfs, bool add, DeviceFound found, bool now) {
>> +         Device *d, *l;
>> +
>> +         assert(m);
>> +-        assert(dev);
>> ++        assert(sysfs);
>> +
>> +-        sysfs = udev_device_get_syspath(dev);
>> +-        if (!sysfs)
>> +-                return;
>> ++        if (found == DEVICE_NOT_FOUND)
>> ++                return 0;
>> +
>> +         l = hashmap_get(m->devices_by_sysfs, sysfs);
>> +         LIST_FOREACH(same_sysfs, d, l)
>> +-                device_set_state(d, DEVICE_PLUGGED);
>> ++                device_update_found_one(d, add, found, now);
>> ++
>> ++        return 0;
>> + }
>> +
>> +-static int device_process_removed_device(Manager *m, struct udev_device *dev) {
>> +-        const char *sysfs;
>> +-        Device *d;
>> ++static int device_update_found_by_name(Manager *m, const char *path, bool add, DeviceFound found, bool now) {
>> ++        _cleanup_free_ char *e = NULL;
>> ++        Unit *u;
>> +
>> +         assert(m);
>> +-        assert(dev);
>> ++        assert(path);
>> +
>> +-        sysfs = udev_device_get_syspath(dev);
>> +-        if (!sysfs)
>> +-                return -ENOMEM;
>> ++        if (found == DEVICE_NOT_FOUND)
>> ++                return 0;
>> +
>> +-        /* Remove all units of this sysfs path */
>> +-        while ((d = hashmap_get(m->devices_by_sysfs, sysfs))) {
>> +-                device_unset_sysfs(d);
>> +-                device_set_state(d, DEVICE_DEAD);
>> +-        }
>> ++        e = unit_name_from_path(path, ".device");
>> ++        if (!e)
>> ++                return log_oom();
>> +
>> ++        u = manager_get_unit(m, e);
>> ++        if (!u)
>> ++                return 0;
>> ++
>> ++        device_update_found_one(DEVICE(u), add, found, now);
>> +         return 0;
>> + }
>> +
>> +@@ -464,22 +476,6 @@ static bool device_is_ready(struct udev_device *dev) {
>> +         return parse_boolean(ready) != 0;
>> + }
>> +
>> +-static int device_process_new_path(Manager *m, const char *path) {
>> +-        _cleanup_udev_device_unref_ struct udev_device *dev = NULL;
>> +-
>> +-        assert(m);
>> +-        assert(path);
>> +-
>> +-        dev = udev_device_new_from_syspath(m->udev, path);
>> +-        if (!dev)
>> +-                return log_oom();
>> +-
>> +-        if (!device_is_ready(dev))
>> +-                return 0;
>> +-
>> +-        return device_process_new_device(m, dev);
>> +-}
>> +-
>> + static Unit *device_following(Unit *u) {
>> +         Device *d = DEVICE(u);
>> +         Device *other, *first = NULL;
>> +@@ -606,12 +602,31 @@ static int device_enumerate(Manager *m) {
>> +                 goto fail;
>> +
>> +         first = udev_enumerate_get_list_entry(e);
>> +-        udev_list_entry_foreach(item, first)
>> +-                device_process_new_path(m, udev_list_entry_get_name(item));
>> ++        udev_list_entry_foreach(item, first) {
>> ++                _cleanup_udev_device_unref_ struct udev_device *dev = NULL;
>> ++                const char *sysfs;
>> ++
>> ++                sysfs = udev_list_entry_get_name(item);
>> ++
>> ++                dev = udev_device_new_from_syspath(m->udev, sysfs);
>> ++                if (!dev) {
>> ++                        log_oom();
>> ++                        continue;
>> ++                }
>> ++
>> ++                if (!device_is_ready(dev))
>> ++                        continue;
>> ++
>> ++                (void) device_process_new(m, dev);
>> ++
>> ++                device_update_found_by_sysfs(m, sysfs, true, DEVICE_FOUND_UDEV, false);
>> ++        }
>> +
>> +         return 0;
>> +
>> + fail:
>> ++        log_error_errno(r, "Failed to enumerate devices: %m");
>> ++
>> +         device_shutdown(m);
>> +         return r;
>> + }
>> +@@ -619,7 +634,7 @@ fail:
>> + static int device_dispatch_io(sd_event_source *source, int fd, uint32_t revents, void *userdata) {
>> +         _cleanup_udev_device_unref_ struct udev_device *dev = NULL;
>> +         Manager *m = userdata;
>> +-        const char *action;
>> ++        const char *action, *sysfs;
>> +         int r;
>> +
>> +         assert(m);
>> +@@ -641,33 +656,47 @@ static int device_dispatch_io(sd_event_source *source, int fd, uint32_t revents,
>> +         if (!dev)
>> +                 return 0;
>> +
>> ++        sysfs = udev_device_get_syspath(dev);
>> ++        if (!sysfs) {
>> ++                log_error("Failed to get udev sys path.");
>> ++                return 0;
>> ++        }
>> ++
>> +         action = udev_device_get_action(dev);
>> +         if (!action) {
>> +                 log_error("Failed to get udev action string.");
>> +                 return 0;
>> +         }
>> +
>> +-        if (streq(action, "remove") || !device_is_ready(dev))  {
>> +-                r = device_process_removed_device(m, dev);
>> +-                if (r < 0)
>> +-                        log_error_errno(r, "Failed to process device remove event: %m");
>> +-
>> +-                r = swap_process_removed_device(m, dev);
>> ++        if (streq(action, "remove"))  {
>> ++                r = swap_process_device_remove(m, dev);
>> +                 if (r < 0)
>> +                         log_error_errno(r, "Failed to process swap device remove event: %m");
>> +
>> +-        } else {
>> +-                r = device_process_new_device(m, dev);
>> +-                if (r < 0)
>> +-                        log_error_errno(r, "Failed to process device new event: %m");
>> ++                /* If we get notified that a device was removed by
>> ++                 * udev, then it's completely gone, hence unset all
>> ++                 * found bits */
>> ++                device_update_found_by_sysfs(m, sysfs, false, DEVICE_FOUND_UDEV|DEVICE_FOUND_MOUNT|DEVICE_FOUND_SWAP, true);
>> +
>> +-                r = swap_process_new_device(m, dev);
>> ++        } else if (device_is_ready(dev)) {
>> ++
>> ++                (void) device_process_new(m, dev);
>> ++
>> ++                r = swap_process_device_new(m, dev);
>> +                 if (r < 0)
>> +                         log_error_errno(r, "Failed to process swap device new event: %m");
>> +
>> +                 manager_dispatch_load_queue(m);
>> +
>> +-                device_set_path_plugged(m, dev);
>> ++                /* The device is found now, set the udev found bit */
>> ++                device_update_found_by_sysfs(m, sysfs, true, DEVICE_FOUND_UDEV, true);
>> ++
>> ++        } else {
>> ++                /* The device is nominally around, but not ready for
>> ++                 * us. Hence unset the udev bit, but leave the rest
>> ++                 * around. */
>> ++
>> ++                device_update_found_by_sysfs(m, sysfs, false, DEVICE_FOUND_UDEV, true);
>> +         }
>> +
>> +         return 0;
>> +@@ -686,9 +715,58 @@ static bool device_supported(Manager *m) {
>> +         return read_only <= 0;
>> + }
>> +
>> ++int device_found_node(Manager *m, const char *node, bool add, DeviceFound found, bool now) {
>> ++        _cleanup_udev_device_unref_ struct udev_device *dev = NULL;
>> ++        struct stat st;
>> ++
>> ++        assert(m);
>> ++        assert(node);
>> ++
>> ++        /* This is called whenever we find a device referenced in
>> ++         * /proc/swaps or /proc/self/mounts. Such a device might be
>> ++         * mounted/enabled at a time where udev has not finished
>> ++         * probing it yet, and we thus haven't learned about it
>> ++         * yet. In this case we will set the device unit to
>> ++         * "tentative" state. */
>> ++
>> ++        if (add) {
>> ++                if (!path_startswith(node, "/dev"))
>> ++                        return 0;
>> ++
>> ++                if (stat(node, &st) < 0) {
>> ++                        if (errno == ENOENT)
>> ++                                return 0;
>> ++
>> ++                        return log_error_errno(errno, "Failed to stat device node file %s: %m", node);
>> ++                }
>> ++
>> ++                if (!S_ISBLK(st.st_mode) && !S_ISCHR(st.st_mode))
>> ++                        return 0;
>> ++
>> ++                dev = udev_device_new_from_devnum(m->udev, S_ISBLK(st.st_mode) ? 'b' : 'c', st.st_rdev);
>> ++                if (!dev) {
>> ++                        if (errno == ENOENT)
>> ++                                return 0;
>> ++
>> ++                        return log_oom();
>> ++                }
>> ++
>> ++                /* If the device is known in the kernel and newly
>> ++                 * appeared, then we'll create a device unit for it,
>> ++                 * under the name referenced in /proc/swaps or
>> ++                 * /proc/self/mountinfo. */
>> ++
>> ++                (void) device_setup_unit(m, dev, node, false);
>> ++        }
>> ++
>> ++        /* Update the device unit's state, should it exist */
>> ++        return device_update_found_by_name(m, node, add, found, now);
>> ++}
>> ++
>> + static const char* const device_state_table[_DEVICE_STATE_MAX] = {
>> +         [DEVICE_DEAD] = "dead",
>> +-        [DEVICE_PLUGGED] = "plugged"
>> ++        [DEVICE_TENTATIVE] = "tentative",
>> ++        [DEVICE_PLUGGED] = "plugged",
>> + };
>> +
>> + DEFINE_STRING_TABLE_LOOKUP(device_state, DeviceState);
>> +diff --git a/src/core/device.h b/src/core/device.h
>> +index bb7ae07..0609b20 100644
>> +--- a/src/core/device.h
>> ++++ b/src/core/device.h
>> +@@ -29,20 +29,28 @@ typedef struct Device Device;
>> +  * simplifies the state engine greatly */
>> + typedef enum DeviceState {
>> +         DEVICE_DEAD,
>> +-        DEVICE_PLUGGED,
>> ++        DEVICE_TENTATIVE, /* mounted or swapped, but not (yet) announced by udev */
>> ++        DEVICE_PLUGGED,   /* announced by udev */
>> +         _DEVICE_STATE_MAX,
>> +         _DEVICE_STATE_INVALID = -1
>> + } DeviceState;
>> +
>> ++typedef enum DeviceFound {
>> ++        DEVICE_NOT_FOUND = 0,
>> ++        DEVICE_FOUND_UDEV = 1,
>> ++        DEVICE_FOUND_MOUNT = 2,
>> ++        DEVICE_FOUND_SWAP = 4,
>> ++} DeviceFound;
>> ++
>> + struct Device {
>> +         Unit meta;
>> +
>> +         char *sysfs;
>> ++        DeviceFound found;
>> +
>> +         /* In order to be able to distinguish dependencies on
>> +         different device nodes we might end up creating multiple
>> +         devices for the same sysfs path. We chain them up here. */
>> +-
>> +         LIST_FIELDS(struct Device, same_sysfs);
>> +
>> +         DeviceState state;
>> +@@ -52,3 +60,5 @@ extern const UnitVTable device_vtable;
>> +
>> + const char* device_state_to_string(DeviceState i) _const_;
>> + DeviceState device_state_from_string(const char *s) _pure_;
>> ++
>> ++int device_found_node(Manager *m, const char *node, bool add, DeviceFound found, bool now);
>> +diff --git a/src/core/mount.c b/src/core/mount.c
>> +index f3977e6..c971330 100644
>> +--- a/src/core/mount.c
>> ++++ b/src/core/mount.c
>> +@@ -1391,7 +1391,7 @@ static int mount_dispatch_timer(sd_event_source *source, usec_t usec, void *user
>> +         return 0;
>> + }
>> +
>> +-static int mount_add_one(
>> ++static int mount_setup_unit(
>> +                 Manager *m,
>> +                 const char *what,
>> +                 const char *where,
>> +@@ -1434,7 +1434,7 @@ static int mount_add_one(
>> +
>> +                 u = unit_new(m, sizeof(Mount));
>> +                 if (!u)
>> +-                        return -ENOMEM;
>> ++                        return log_oom();
>> +
>> +                 r = unit_add_name(u, e);
>> +                 if (r < 0)
>> +@@ -1547,6 +1547,8 @@ static int mount_add_one(
>> +         return 0;
>> +
>> + fail:
>> ++        log_warning_errno(r, "Failed to set up mount unit: %m");
>> ++
>> +         if (delete && u)
>> +                 unit_free(u);
>> +
>> +@@ -1554,33 +1556,36 @@ fail:
>> + }
>> +
>> + static int mount_load_proc_self_mountinfo(Manager *m, bool set_flags) {
>> +-        _cleanup_(mnt_free_tablep) struct libmnt_table *tb = NULL;
>> +-        _cleanup_(mnt_free_iterp) struct libmnt_iter *itr = NULL;
>> +-        struct libmnt_fs *fs;
>> ++        _cleanup_(mnt_free_tablep) struct libmnt_table *t = NULL;
>> ++        _cleanup_(mnt_free_iterp) struct libmnt_iter *i = NULL;
>> +         int r = 0;
>> +
>> +         assert(m);
>> +
>> +-        tb = mnt_new_table();
>> +-        itr = mnt_new_iter(MNT_ITER_FORWARD);
>> +-        if (!tb || !itr)
>> ++        t = mnt_new_table();
>> ++        if (!t)
>> +                 return log_oom();
>> +
>> +-        r = mnt_table_parse_mtab(tb, NULL);
>> ++        i = mnt_new_iter(MNT_ITER_FORWARD);
>> ++        if (!i)
>> ++                return log_oom();
>> ++
>> ++        r = mnt_table_parse_mtab(t, NULL);
>> +         if (r < 0)
>> +-                return r;
>> ++                return log_error_errno(r, "Failed to parse /proc/self/mountinfo: %m");
>> +
>> +         r = 0;
>> +         for (;;) {
>> +                 const char *device, *path, *options, *fstype;
>> +                 _cleanup_free_ const char *d = NULL, *p = NULL;
>> ++                struct libmnt_fs *fs;
>> +                 int k;
>> +
>> +-                k = mnt_table_next_fs(tb, itr, &fs);
>> ++                k = mnt_table_next_fs(t, i, &fs);
>> +                 if (k == 1)
>> +                         break;
>> +-                else if (k < 0)
>> +-                        return log_error_errno(k, "Failed to get next entry from /etc/fstab: %m");
>> ++                if (k < 0)
>> ++                        return log_error_errno(k, "Failed to get next entry from /proc/self/mountinfo: %m");
>> +
>> +                 device = mnt_fs_get_source(fs);
>> +                 path = mnt_fs_get_target(fs);
>> +@@ -1588,11 +1593,16 @@ static int mount_load_proc_self_mountinfo(Manager *m, bool set_flags) {
>> +                 fstype = mnt_fs_get_fstype(fs);
>> +
>> +                 d = cunescape(device);
>> ++                if (!d)
>> ++                        return log_oom();
>> ++
>> +                 p = cunescape(path);
>> +-                if (!d || !p)
>> ++                if (!p)
>> +                         return log_oom();
>> +
>> +-                k = mount_add_one(m, d, p, options, fstype, set_flags);
>> ++                (void) device_found_node(m, d, true, DEVICE_FOUND_MOUNT, set_flags);
>> ++
>> ++                k = mount_setup_unit(m, d, p, options, fstype, set_flags);
>> +                 if (r == 0 && k < 0)
>> +                         r = k;
>> +         }
>> +@@ -1736,8 +1746,6 @@ static int mount_dispatch_io(sd_event_source *source, int fd, uint32_t revents,
>> +
>> +         r = mount_load_proc_self_mountinfo(m, true);
>> +         if (r < 0) {
>> +-                log_error_errno(r, "Failed to reread /proc/self/mountinfo: %m");
>> +-
>> +                 /* Reset flags, just in case, for later calls */
>> +                 LIST_FOREACH(units_by_type, u, m->units_by_type[UNIT_MOUNT]) {
>> +                         Mount *mount = MOUNT(u);
>> +@@ -1770,6 +1778,10 @@ static int mount_dispatch_io(sd_event_source *source, int fd, uint32_t revents,
>> +                                 break;
>> +                         }
>> +
>> ++                        if (mount->parameters_proc_self_mountinfo.what)
>> ++                                (void) device_found_node(m, mount->parameters_proc_self_mountinfo.what, false, DEVICE_FOUND_MOUNT, true);
>> ++
>> ++
>> +                 } else if (mount->just_mounted || mount->just_changed) {
>> +
>> +                         /* New or changed mount entry */
>> +diff --git a/src/core/swap.c b/src/core/swap.c
>> +index 6997921..5c19af5 100644
>> +--- a/src/core/swap.c
>> ++++ b/src/core/swap.c
>> +@@ -338,7 +338,7 @@ static int swap_load(Unit *u) {
>> +         return swap_verify(s);
>> + }
>> +
>> +-static int swap_add_one(
>> ++static int swap_setup_unit(
>> +                 Manager *m,
>> +                 const char *what,
>> +                 const char *what_proc_swaps,
>> +@@ -363,8 +363,10 @@ static int swap_add_one(
>> +
>> +         if (u &&
>> +             SWAP(u)->from_proc_swaps &&
>> +-            !path_equal(SWAP(u)->parameters_proc_swaps.what, what_proc_swaps))
>> ++            !path_equal(SWAP(u)->parameters_proc_swaps.what, what_proc_swaps)) {
>> ++                log_error("Swap %s appeared twice with different device paths %s and %s", e, SWAP(u)->parameters_proc_swaps.what, what_proc_swaps);
>> +                 return -EEXIST;
>> ++        }
>> +
>> +         if (!u) {
>> +                 delete = true;
>> +@@ -379,7 +381,7 @@ static int swap_add_one(
>> +
>> +                 SWAP(u)->what = strdup(what);
>> +                 if (!SWAP(u)->what) {
>> +-                        r = log_oom();
>> ++                        r = -ENOMEM;
>> +                         goto fail;
>> +                 }
>> +
>> +@@ -407,7 +409,6 @@ static int swap_add_one(
>> +         p->priority = priority;
>> +
>> +         unit_add_to_dbus_queue(u);
>> +-
>> +         return 0;
>> +
>> + fail:
>> +@@ -419,7 +420,7 @@ fail:
>> +         return r;
>> + }
>> +
>> +-static int swap_process_new_swap(Manager *m, const char *device, int prio, bool set_flags) {
>> ++static int swap_process_new(Manager *m, const char *device, int prio, bool set_flags) {
>> +         _cleanup_udev_device_unref_ struct udev_device *d = NULL;
>> +         struct udev_list_entry *item = NULL, *first = NULL;
>> +         const char *dn;
>> +@@ -428,7 +429,7 @@ static int swap_process_new_swap(Manager *m, const char *device, int prio, bool
>> +
>> +         assert(m);
>> +
>> +-        r = swap_add_one(m, device, device, prio, set_flags);
>> ++        r = swap_setup_unit(m, device, device, prio, set_flags);
>> +         if (r < 0)
>> +                 return r;
>> +
>> +@@ -444,7 +445,7 @@ static int swap_process_new_swap(Manager *m, const char *device, int prio, bool
>> +         /* Add the main device node */
>> +         dn = udev_device_get_devnode(d);
>> +         if (dn && !streq(dn, device))
>> +-                swap_add_one(m, dn, device, prio, set_flags);
>> ++                swap_setup_unit(m, dn, device, prio, set_flags);
>> +
>> +         /* Add additional units for all symlinks */
>> +         first = udev_device_get_devlinks_list_entry(d);
>> +@@ -465,7 +466,7 @@ static int swap_process_new_swap(Manager *m, const char *device, int prio, bool
>> +                             st.st_rdev != udev_device_get_devnum(d))
>> +                                 continue;
>> +
>> +-                swap_add_one(m, p, device, prio, set_flags);
>> ++                swap_setup_unit(m, p, device, prio, set_flags);
>> +         }
>> +
>> +         return r;
>> +@@ -1091,15 +1092,17 @@ static int swap_load_proc_swaps(Manager *m, bool set_flags) {
>> +                         if (k == EOF)
>> +                                 break;
>> +
>> +-                        log_warning("Failed to parse /proc/swaps:%u", i);
>> ++                        log_warning("Failed to parse /proc/swaps:%u.", i);
>> +                         continue;
>> +                 }
>> +
>> +                 d = cunescape(dev);
>> +                 if (!d)
>> +-                        return -ENOMEM;
>> ++                        return log_oom();
>> ++
>> ++                device_found_node(m, d, true, DEVICE_FOUND_SWAP, set_flags);
>> +
>> +-                k = swap_process_new_swap(m, d, prio, set_flags);
>> ++                k = swap_process_new(m, d, prio, set_flags);
>> +                 if (k < 0)
>> +                         r = k;
>> +         }
>> +@@ -1151,6 +1154,9 @@ static int swap_dispatch_io(sd_event_source *source, int fd, uint32_t revents, v
>> +                                 break;
>> +                         }
>> +
>> ++                        if (swap->what)
>> ++                                device_found_node(m, swap->what, false, DEVICE_FOUND_SWAP, true);
>> ++
>> +                 } else if (swap->just_activated) {
>> +
>> +                         /* New swap entry */
>> +@@ -1298,7 +1304,7 @@ fail:
>> +         return r;
>> + }
>> +
>> +-int swap_process_new_device(Manager *m, struct udev_device *dev) {
>> ++int swap_process_device_new(Manager *m, struct udev_device *dev) {
>> +         struct udev_list_entry *item = NULL, *first = NULL;
>> +         _cleanup_free_ char *e = NULL;
>> +         const char *dn;
>> +@@ -1341,7 +1347,7 @@ int swap_process_new_device(Manager *m, struct udev_device *dev) {
>> +         return r;
>> + }
>> +
>> +-int swap_process_removed_device(Manager *m, struct udev_device *dev) {
>> ++int swap_process_device_remove(Manager *m, struct udev_device *dev) {
>> +         const char *dn;
>> +         int r = 0;
>> +         Swap *s;
>> +diff --git a/src/core/swap.h b/src/core/swap.h
>> +index 73e64d8..914a2db 100644
>> +--- a/src/core/swap.h
>> ++++ b/src/core/swap.h
>> +@@ -116,8 +116,8 @@ struct Swap {
>> +
>> + extern const UnitVTable swap_vtable;
>> +
>> +-int swap_process_new_device(Manager *m, struct udev_device *dev);
>> +-int swap_process_removed_device(Manager *m, struct udev_device *dev);
>> ++int swap_process_device_new(Manager *m, struct udev_device *dev);
>> ++int swap_process_device_remove(Manager *m, struct udev_device *dev);
>> +
>> + const char* swap_state_to_string(SwapState i) _const_;
>> + SwapState swap_state_from_string(const char *s) _pure_;
>> +diff --git a/src/core/unit.c b/src/core/unit.c
>> +index 563f6fe..a6558ee 100644
>> +--- a/src/core/unit.c
>> ++++ b/src/core/unit.c
>> +@@ -2843,7 +2843,6 @@ int unit_add_node_link(Unit *u, const char *what, bool wants) {
>> +                 return -ENOMEM;
>> +
>> +         r = manager_load_unit(u->manager, e, NULL, NULL, &device);
>> +-
>> +         if (r < 0)
>> +                 return r;
>> +
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0018-core-fix-return-value-on-OOM.patch b/meta/recipes-core/systemd/systemd/0018-core-fix-return-value-on-OOM.patch
>> new file mode 100644
>> index 0000000..d614085
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0018-core-fix-return-value-on-OOM.patch
>> @@ -0,0 +1,26 @@
>> +From 3d3a67138c63b47f2a5723577f886bc3c7995748 Mon Sep 17 00:00:00 2001
>> +From: Thomas Hindoe Paaboel Andersen <phomes@gmail.com>
>> +Date: Sat, 28 Feb 2015 23:39:55 +0100
>> +Subject: [PATCH 18/26] core: fix return value on OOM
>> +
>> +(cherry picked from commit c43b2132f37264600cc26e07c8d85dfdd6c969f0)
>> +---
>> + src/core/device.c | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/src/core/device.c b/src/core/device.c
>> +index 75b9a46..1cc103c 100644
>> +--- a/src/core/device.c
>> ++++ b/src/core/device.c
>> +@@ -211,6 +211,8 @@ static int device_update_description(Unit *u, struct udev_device *dev, const cha
>> +                         j = strjoin(model, " ", label, NULL);
>> +                         if (j)
>> +                                 r = unit_set_description(u, j);
>> ++                        else
>> ++                                r = -ENOMEM;
>> +                 } else
>> +                         r = unit_set_description(u, model);
>> +         } else
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0019-machined-use-x-machine-unix-prefix-for-the-container.patch b/meta/recipes-core/systemd/systemd/0019-machined-use-x-machine-unix-prefix-for-the-container.patch
>> new file mode 100644
>> index 0000000..d94da60
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0019-machined-use-x-machine-unix-prefix-for-the-container.patch
>> @@ -0,0 +1,33 @@
>> +From 9a46fe3127eea552cd76d4b549f8d8ba70ea01b3 Mon Sep 17 00:00:00 2001
>> +From: Benjamin Franzke <benjaminfranzke@googlemail.com>
>> +Date: Thu, 19 Feb 2015 20:47:28 +0100
>> +Subject: [PATCH 19/26] machined: use x-machine-unix prefix for the container
>> + bus on dbus1
>> +
>> +This fixes "machinectl login" on systems configured with --disable-kdbus.
>> +
>> +The error was:
>> +machinectl login foo
>> +Failed to get machine PTY: Input/output error
>> +
>> +(cherry picked from commit f2273101c21bc59a390379e182e53cd4f07a7e71)
>> +---
>> + src/machine/machine-dbus.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
>> +index b46f0a8..b0f0f66 100644
>> +--- a/src/machine/machine-dbus.c
>> ++++ b/src/machine/machine-dbus.c
>> +@@ -477,7 +477,7 @@ int bus_machine_method_open_login(sd_bus *bus, sd_bus_message *message, void *us
>> + #ifdef ENABLE_KDBUS
>> +         asprintf(&container_bus->address, "x-machine-kernel:pid=" PID_FMT ";x-machine-unix:pid=" PID_FMT, m->leader, m->leader);
>> + #else
>> +-        asprintf(&container_bus->address, "x-machine-kernel:pid=" PID_FMT, m->leader);
>> ++        asprintf(&container_bus->address, "x-machine-unix:pid=" PID_FMT, m->leader);
>> + #endif
>> +         if (!container_bus->address)
>> +                 return -ENOMEM;
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0020-shared-AFS-is-also-a-network-filesystem.patch b/meta/recipes-core/systemd/systemd/0020-shared-AFS-is-also-a-network-filesystem.patch
>> new file mode 100644
>> index 0000000..fcc2adf
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0020-shared-AFS-is-also-a-network-filesystem.patch
>> @@ -0,0 +1,25 @@
>> +From 3c350019fe9e4be16bf110988c324cfa3a21c61b Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Cristian=20Rodr=C3=ADguez?= <crrodriguez@opensuse.org>
>> +Date: Fri, 20 Feb 2015 15:35:11 -0300
>> +Subject: [PATCH 20/26] shared: AFS is also a network filesystem
>> +
>> +(cherry picked from commit ba89821c104d959082aad6f3f0e05a8afd575023)
>> +---
>> + src/shared/util.c | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/src/shared/util.c b/src/shared/util.c
>> +index ba035ca..f24b5b4 100644
>> +--- a/src/shared/util.c
>> ++++ b/src/shared/util.c
>> +@@ -1689,6 +1689,7 @@ bool chars_intersect(const char *a, const char *b) {
>> +
>> + bool fstype_is_network(const char *fstype) {
>> +         static const char table[] =
>> ++                "afs\0"
>> +                 "cifs\0"
>> +                 "smbfs\0"
>> +                 "sshfs\0"
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0021-core-downgrade-unit-type-not-supported-message.patch b/meta/recipes-core/systemd/systemd/0021-core-downgrade-unit-type-not-supported-message.patch
>> new file mode 100644
>> index 0000000..02e279d
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0021-core-downgrade-unit-type-not-supported-message.patch
>> @@ -0,0 +1,31 @@
>> +From 4e2d4dd757c6faa4d5a471c10cf6f45978524845 Mon Sep 17 00:00:00 2001
>> +From: Umut Tezduyar Lindskog <umut.tezduyar@axis.com>
>> +Date: Fri, 20 Feb 2015 10:53:28 +0100
>> +Subject: [PATCH 21/26] core: downgrade unit type not supported message
>> +
>> +Otherwise every daemon reload prints out warnings like:
>> +
>> +systemd[1]: Unit type .busname is not supported on this system.
>> +systemd[1]: Unit type .swap is not supported on this system.
>> +
>> +(cherry picked from commit 03afec3c9aa849ba13161c253b129b834298fd40)
>> +---
>> + src/core/manager.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/core/manager.c b/src/core/manager.c
>> +index 4775219..bc9b7ec 100644
>> +--- a/src/core/manager.c
>> ++++ b/src/core/manager.c
>> +@@ -961,7 +961,7 @@ int manager_enumerate(Manager *m) {
>> +                 int q;
>> +
>> +                 if (unit_vtable[c]->supported && !unit_vtable[c]->supported(m)) {
>> +-                        log_info("Unit type .%s is not supported on this system.", unit_type_to_string(c));
>> ++                        log_debug("Unit type .%s is not supported on this system.", unit_type_to_string(c));
>> +                         continue;
>> +                 }
>> +
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0022-journal-remote-fix-saving-of-binary-fields.patch b/meta/recipes-core/systemd/systemd/0022-journal-remote-fix-saving-of-binary-fields.patch
>> new file mode 100644
>> index 0000000..f5afd09
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0022-journal-remote-fix-saving-of-binary-fields.patch
>> @@ -0,0 +1,97 @@
>> +From 91a3ba906422127bb12095d1c7d0c7f0cb385588 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
>> +Date: Mon, 2 Mar 2015 10:34:51 -0500
>> +Subject: [PATCH 22/26] journal-remote: fix saving of binary fields
>> +
>> +Binary fields were not processed properly, and resulting journal files
>> +were non-conforming, resulting in an error ("Invalid field.") when reading.
>> +
>> +https://bugs.freedesktop.org/show_bug.cgi?id=89391
>> +(cherry picked from commit 09d801a82a46df518dd752e40bf13ac404daa2ce)
>> +---
>> + src/journal-remote/journal-remote-parse.c | 31 ++++++++++++++++++-------------
>> + src/journal-remote/journal-remote-parse.h |  4 +++-
>> + 2 files changed, 21 insertions(+), 14 deletions(-)
>> +
>> +diff --git a/src/journal-remote/journal-remote-parse.c b/src/journal-remote/journal-remote-parse.c
>> +index d9dea8d..afded7e 100644
>> +--- a/src/journal-remote/journal-remote-parse.c
>> ++++ b/src/journal-remote/journal-remote-parse.c
>> +@@ -344,22 +344,25 @@ int process_data(RemoteSource *source) {
>> +                    LLLLLLLL0011223344...\n
>> +                 */
>> +                 sep = memchr(line, '=', n);
>> +-                if (sep)
>> ++                if (sep) {
>> +                         /* chomp newline */
>> +                         n--;
>> +-                else
>> ++
>> ++                        r = iovw_put(&source->iovw, line, n);
>> ++                        if (r < 0)
>> ++                                return r;
>> ++                } else {
>> +                         /* replace \n with = */
>> +                         line[n-1] = '=';
>> +-                log_trace("Received: %.*s", (int) n, line);
>> +
>> +-                r = iovw_put(&source->iovw, line, n);
>> +-                if (r < 0) {
>> +-                        log_error("Failed to put line in iovect");
>> +-                        return r;
>> ++                        source->field_len = n;
>> ++                        source->state = STATE_DATA_START;
>> ++
>> ++                        /* we cannot put the field in iovec until we have all data */
>> +                 }
>> +
>> +-                if (!sep)
>> +-                        source->state = STATE_DATA_START;
>> ++                log_trace("Received: %.*s (%s)", (int) n, line, sep ? "text" : "binary");
>> ++
>> +                 return 0; /* continue */
>> +         }
>> +
>> +@@ -382,6 +385,7 @@ int process_data(RemoteSource *source) {
>> +
>> +         case STATE_DATA: {
>> +                 void *data;
>> ++                char *field;
>> +
>> +                 assert(source->data_size > 0);
>> +
>> +@@ -396,11 +400,12 @@ int process_data(RemoteSource *source) {
>> +
>> +                 assert(data);
>> +
>> +-                r = iovw_put(&source->iovw, data, source->data_size);
>> +-                if (r < 0) {
>> +-                        log_error("failed to put binary buffer in iovect");
>> ++                field = (char*) data - sizeof(uint64_t) - source->field_len;
>> ++                memmove(field + sizeof(uint64_t), field, source->field_len);
>> ++
>> ++                r = iovw_put(&source->iovw, field + sizeof(uint64_t), source->field_len + source->data_size);
>> ++                if (r < 0)
>> +                         return r;
>> +-                }
>> +
>> +                 source->state = STATE_DATA_FINISH;
>> +
>> +diff --git a/src/journal-remote/journal-remote-parse.h b/src/journal-remote/journal-remote-parse.h
>> +index 8499f4e..22db550 100644
>> +--- a/src/journal-remote/journal-remote-parse.h
>> ++++ b/src/journal-remote/journal-remote-parse.h
>> +@@ -42,7 +42,9 @@ typedef struct RemoteSource {
>> +         size_t offset;     /* offset to the beginning of live data in the buffer */
>> +         size_t scanned;    /* number of bytes since the beginning of data without a newline */
>> +         size_t filled;     /* total number of bytes in the buffer */
>> +-        size_t data_size;  /* size of the binary data chunk being processed */
>> ++
>> ++        size_t field_len;  /* used for binary fields: the field name length */
>> ++        size_t data_size;  /* and the size of the binary data chunk being processed */
>> +
>> +         struct iovec_wrapper iovw;
>> +
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0023-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch b/meta/recipes-core/systemd/systemd/0023-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch
>> new file mode 100644
>> index 0000000..79e565b
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0023-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch
>> @@ -0,0 +1,37 @@
>> +From 983c520982b548c9bb8f2689a93f2fb35c54c392 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Cristian=20Rodr=C3=ADguez?= <crrodriguez@opensuse.org>
>> +Date: Sun, 1 Mar 2015 21:13:10 -0300
>> +Subject: [PATCH 23/26] journal: fix Inappropriate ioctl for device on ext4
>> +
>> +Logs constantly show
>> +
>> +systemd-journald[395]: Failed to set file attributes: Inappropriate ioctl for device
>> +
>> +This is because ext4 does not support FS_NOCOW_FL.
>> +
>> +[zj: fold into one conditional as suggested on the ML and
>> +     fix (preexisting) r/errno confusion in error message.]
>> +
>> +(cherry picked from commit 65eae3b76243d2dfd869f8c43b787575f7b4b994)
>> +---
>> + src/journal/journal-file.c | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
>> +index 2845e05..0f28718 100644
>> +--- a/src/journal/journal-file.c
>> ++++ b/src/journal/journal-file.c
>> +@@ -2611,8 +2611,8 @@ int journal_file_open(
>> +                  * shouldn't be too bad, given that we do our own
>> +                  * checksumming). */
>> +                 r = chattr_fd(f->fd, true, FS_NOCOW_FL);
>> +-                if (r < 0)
>> +-                        log_warning_errno(errno, "Failed to set file attributes: %m");
>> ++                if (r < 0 && r != -ENOTTY)
>> ++                        log_warning_errno(r, "Failed to set file attributes: %m");
>> +
>> +                 /* Let's attach the creation time to the journal file,
>> +                  * so that the vacuuming code knows the age of this
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0024-sd-daemon-replace-VLA-with-alloca-to-make-llvm-happy.patch b/meta/recipes-core/systemd/systemd/0024-sd-daemon-replace-VLA-with-alloca-to-make-llvm-happy.patch
>> new file mode 100644
>> index 0000000..0cf9a0a
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0024-sd-daemon-replace-VLA-with-alloca-to-make-llvm-happy.patch
>> @@ -0,0 +1,53 @@
>> +From 3f0c8096f3d5e3b37d6e0e26f0562c1a8669f0d8 Mon Sep 17 00:00:00 2001
>> +From: Lennart Poettering <lennart@poettering.net>
>> +Date: Mon, 2 Mar 2015 20:55:38 +0100
>> +Subject: [PATCH 24/26] sd-daemon: replace VLA with alloca(), to make llvm
>> + happy
>> +
>> +https://bugs.freedesktop.org/show_bug.cgi?id=89379
>> +(cherry picked from commit d4a144fadf89bca681724c6c9a65b4a165fa0f90)
>> +---
>> + src/libsystemd/sd-daemon/sd-daemon.c | 12 +++++-------
>> + 1 file changed, 5 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/src/libsystemd/sd-daemon/sd-daemon.c b/src/libsystemd/sd-daemon/sd-daemon.c
>> +index 028c2a7..22a3a53 100644
>> +--- a/src/libsystemd/sd-daemon/sd-daemon.c
>> ++++ b/src/libsystemd/sd-daemon/sd-daemon.c
>> +@@ -352,11 +352,7 @@ _public_ int sd_pid_notify_with_fds(pid_t pid, int unset_environment, const char
>> +                 .msg_iovlen = 1,
>> +                 .msg_name = &sockaddr,
>> +         };
>> +-        union {
>> +-                struct cmsghdr cmsghdr;
>> +-                uint8_t buf[CMSG_SPACE(sizeof(struct ucred)) +
>> +-                            CMSG_SPACE(sizeof(int) * n_fds)];
>> +-        } control;
>> ++        struct cmsghdr *control;
>> +         _cleanup_close_ int fd = -1;
>> +         struct cmsghdr *cmsg = NULL;
>> +         const char *e;
>> +@@ -400,8 +396,10 @@ _public_ int sd_pid_notify_with_fds(pid_t pid, int unset_environment, const char
>> +         if (msghdr.msg_namelen > sizeof(struct sockaddr_un))
>> +                 msghdr.msg_namelen = sizeof(struct sockaddr_un);
>> +
>> ++        control = alloca(CMSG_SPACE(sizeof(struct ucred)) + CMSG_SPACE(sizeof(int) * n_fds));
>> ++
>> +         if (n_fds > 0) {
>> +-                msghdr.msg_control = &control;
>> ++                msghdr.msg_control = control;
>> +                 msghdr.msg_controllen = CMSG_LEN(sizeof(int) * n_fds);
>> +
>> +                 cmsg = CMSG_FIRSTHDR(&msghdr);
>> +@@ -418,7 +416,7 @@ _public_ int sd_pid_notify_with_fds(pid_t pid, int unset_environment, const char
>> +                 try_without_ucred = true;
>> +                 controllen_without_ucred = msghdr.msg_controllen;
>> +
>> +-                msghdr.msg_control = &control;
>> ++                msghdr.msg_control = control;
>> +                 msghdr.msg_controllen += CMSG_LEN(sizeof(struct ucred));
>> +
>> +                 if (cmsg)
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0025-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch b/meta/recipes-core/systemd/systemd/0025-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch
>> new file mode 100644
>> index 0000000..6912489
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0025-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch
>> @@ -0,0 +1,84 @@
>> +From 5fb87c4b6582ddb0a0ab1f31300eae69ab963afb Mon Sep 17 00:00:00 2001
>> +From: Hans-Peter Deifel <hpd@hpdeifel.de>
>> +Date: Tue, 3 Mar 2015 00:35:08 +0100
>> +Subject: [PATCH 25/26] tmpfiles: quietly ignore ACLs on unsupported
>> + filesystems
>> +
>> +A warning is printed if ACLs cannot be retrieved for any reason other
>> +than -ENOSYS. For -ENOSYS, debug log is printed.
>> +
>> +(cherry picked from commit d873e8778c92014c02a9122852758b436fa95c0e)
>> +---
>> + src/tmpfiles/tmpfiles.c | 36 ++++++++++++++++++++----------------
>> + 1 file changed, 20 insertions(+), 16 deletions(-)
>> +
>> +diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
>> +index 88ba7e4..187997e 100644
>> +--- a/src/tmpfiles/tmpfiles.c
>> ++++ b/src/tmpfiles/tmpfiles.c
>> +@@ -704,6 +704,9 @@ static int path_set_acl(const char *path, acl_type_t type, acl_t acl, bool modif
>> +         int r;
>> +         _cleanup_(acl_free_charpp) char *t = NULL;
>> +
>> ++        /* Returns 0 for success, positive error if already warned,
>> ++         * negative error otherwise. */
>> ++
>> +         if (modify) {
>> +                 r = acls_for_file(path, type, acl, &dup);
>> +                 if (r < 0)
>> +@@ -731,35 +734,36 @@ static int path_set_acl(const char *path, acl_type_t type, acl_t acl, bool modif
>> +
>> +         r = acl_set_file(path, type, dup);
>> +         if (r < 0)
>> +-                return log_error_errno(-errno,
>> +-                                       "Setting %s ACL \"%s\" on %s failed: %m",
>> +-                                       type == ACL_TYPE_ACCESS ? "access" : "default",
>> +-                                       strna(t), path);
>> ++                return -log_error_errno(errno,
>> ++                                        "Setting %s ACL \"%s\" on %s failed: %m",
>> ++                                        type == ACL_TYPE_ACCESS ? "access" : "default",
>> ++                                        strna(t), path);
>> ++
>> +         return 0;
>> + }
>> + #endif
>> +
>> + static int path_set_acls(Item *item, const char *path) {
>> ++        int r = 0;
>> + #ifdef HAVE_ACL
>> +-        int r;
>> +-
>> +         assert(item);
>> +         assert(path);
>> +
>> +-        if (item->acl_access) {
>> ++        if (item->acl_access)
>> +                 r = path_set_acl(path, ACL_TYPE_ACCESS, item->acl_access, item->force);
>> +-                if (r < 0)
>> +-                        return r;
>> +-        }
>> +
>> +-        if (item->acl_default) {
>> ++        if (r == 0 && item->acl_default)
>> +                 r = path_set_acl(path, ACL_TYPE_DEFAULT, item->acl_default, item->force);
>> +-                if (r < 0)
>> +-                        return r;
>> +-        }
>> +-#endif
>> +
>> +-        return 0;
>> ++        if (r > 0)
>> ++                return -r; /* already warned */
>> ++        else if (r == -ENOTSUP) {
>> ++                log_debug_errno(r, "ACLs not supported by file system at %s", path);
>> ++                return 0;
>> ++        } else if (r < 0)
>> ++                log_error_errno(r, "ACL operation on \"%s\" failed: %m", path);
>> ++#endif
>> ++        return r;
>> + }
>> +
>> + static int write_one_file(Item *i, const char *path) {
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0026-shared-util-assume-ac-when-sys-class-power_supply-is.patch b/meta/recipes-core/systemd/systemd/0026-shared-util-assume-ac-when-sys-class-power_supply-is.patch
>> new file mode 100644
>> index 0000000..a49a369
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0026-shared-util-assume-ac-when-sys-class-power_supply-is.patch
>> @@ -0,0 +1,30 @@
>> +From 0436d5c5f4b39ba8177437fa92f082f8ef1830fb Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
>> +Date: Tue, 3 Mar 2015 19:07:28 -0500
>> +Subject: [PATCH 26/26] shared/util: assume ac when /sys/class/power_supply is
>> + missing
>> +
>> +On s390 (at least) /sys/class/power_supply is not present. We should
>> +treat this like if this directory was empty, and not an error.
>> +
>> +(cherry picked from commit 6d89003462484c8656b698e07b9cf0a337e3818e)
>> +---
>> + src/shared/util.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/shared/util.c b/src/shared/util.c
>> +index f24b5b4..8548723 100644
>> +--- a/src/shared/util.c
>> ++++ b/src/shared/util.c
>> +@@ -5994,7 +5994,7 @@ int on_ac_power(void) {
>> +
>> +         d = opendir("/sys/class/power_supply");
>> +         if (!d)
>> +-                return -errno;
>> ++                return errno == ENOENT ? true : -errno;
>> +
>> +         for (;;) {
>> +                 struct dirent *de;
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
>> index 73b930e..9c20b11 100644
>> --- a/meta/recipes-core/systemd/systemd_219.bb
>> +++ b/meta/recipes-core/systemd/systemd_219.bb
>> @@ -40,10 +40,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master \
>>             file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
>>             file://0010-Make-root-s-home-directory-configurable.patch \
>>             file://0011-systemd-user-avoid-using-system-auth.patch \
>> -           file://0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch \
>> -           file://0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch \
>>             file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch \
>> -           file://0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch \
>>             file://0014-Revert-rules-remove-firmware-loading-rules.patch \
>>             file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
>>             file://tmpfiles-pam.patch \
>> @@ -55,6 +52,36 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master \
>>
>>  S = "${WORKDIR}/git"
>>
>> +# Appending backport fixes released for version 219-stable
>> +SRC_URI_append = "\
>> +           file://0001-journal-remote-fix-certificate-status-memory-leak.patch \
>> +           file://0002-journal-remote-fix-client_cert-memory-leak.patch \
>> +           file://0003-tmpfiles-Fix-parse_acl-error-message.patch \
>> +           file://0004-test-utf8-fix-utf16-tests-on-BE-machines.patch \
>> +           file://0005-tmpfiles-avoid-creating-duplicate-acl-entries.patch \
>> +           file://0006-shared-time-util-fix-gcc5-warning.patch \
>> +           file://0007-test-time-test-infinity-parsing-in-nanoseconds.patch \
>> +           file://0008-bootchart-fix-default-init-path.patch \
>> +           file://0009-systemctl-bump-NOFILE-only-for-systemctl_main.patch \
>> +           file://0010-acl-util-avoid-freeing-uninitialized-pointer.patch \
>> +           file://0011-bootchart-svg-fix-checking-of-list-end.patch \
>> +           file://0012-systemd-add-getrandom-syscall-numbers-for-MIPS.patch \
>> +           file://0013-unit-use-weaker-dependencies-between-mount-and-devic.patch \
>> +           file://0014-unit-When-stopping-due-to-BindsTo-log-which-unit-cau.patch \
>> +           file://0015-sysctl-downgrade-message-about-sysctl-overrides-to-d.patch \
>> +           file://0016-sysctl-add-some-hints-how-to-override-settings.patch \
>> +           file://0017-core-rework-device-state-logic.patch \
>> +           file://0018-core-fix-return-value-on-OOM.patch \
>> +           file://0019-machined-use-x-machine-unix-prefix-for-the-container.patch \
>> +           file://0020-shared-AFS-is-also-a-network-filesystem.patch \
>> +           file://0021-core-downgrade-unit-type-not-supported-message.patch \
>> +           file://0022-journal-remote-fix-saving-of-binary-fields.patch \
>> +           file://0023-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch \
>> +           file://0024-sd-daemon-replace-VLA-with-alloca-to-make-llvm-happy.patch \
>> +           file://0025-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch \
>> +           file://0026-shared-util-assume-ac-when-sys-class-power_supply-is.patch \
>> +           "
>> +
>>  SRC_URI_append_libc-uclibc = "\
>>              file://0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
>>             "
>> --
>> 1.9.1
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


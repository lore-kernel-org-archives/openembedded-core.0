Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web10.61.1590615786114728524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 14:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g17Mjnxw;
 spf=pass (domain: gmail.com, ip: 209.85.167.196, mailfrom: george.mccollister@gmail.com)
Received: by mail-oi1-f196.google.com with SMTP id v128so23118246oia.7
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 14:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yPexHTW5i33SHLakbiU71LObqSrA/HKYKKyb8TSGeCc=;
        b=g17Mjnxwt32hOnv3WgWfdcPf+FtQ6s+MX9sdov9xlj7cuDX+JLyjLXVNBiOsNwkUV4
         /TSi6G0ReHzWXF53BHF4GMOorMfHmwTjoY8EbTH19WVwp/PcKOOEHGNDVW+d2kr4dTK4
         bDysUUshqNqxM2I0GyhEPS+QV2NuSC/OVXroBEJnVtgQBnvz5u8J2JhIUbrPc9lzbE8K
         J3sz/TqCKCrJ7yXBwjjLASD5imZum723Tnjyjn85UuTslSBITexB6l631HAegMeONJeU
         1DlbGzlcNXOU7M0Hj1JhzMRBEJbAFlD1odXU070fsyQmrR8hUWKwGbPFt+AS05kHze2n
         PRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yPexHTW5i33SHLakbiU71LObqSrA/HKYKKyb8TSGeCc=;
        b=iR2A5R3ws53vuzjWkJ+UsPkcq+H5+5fDEyCAesTyrC6BJ1icUsp6I+TsNoDD3JDRs5
         NhAi6lfjb6HOgshvjA0I/s20w083KP2vfGfvNkbvAn6mS9BZUQ++oXSgVIDpIqhx/hqH
         o4Vsv/UhkryuluPHFLr5VX0UmkUq62CO6mH34NYtRQaqcvdijeo/kzJWSxH1p/7fGMw0
         OtcFpodVIBOwaHc0Cg/7Y987TJJcxFUa5+SDVzhb2z3e3Kwk+HVvJZNQiDVmvoSaleRh
         zbI+K1eJke/D6u6kzUuAoLEvknLIvzFDpXzcDgz9FPJq0FTQp6Q37S9cJh9JQlauAerF
         wvVA==
X-Gm-Message-State: AOAM530pxttV6TWSmBNDKGm7KT4gLsw9WrZBPFXUru8lDwc59eNGHX20
	l8BtP8qKKEpSHyZS30cIdieYXO7SstLSjONADw==
X-Google-Smtp-Source: ABdhPJzcdPqq76iykpk12fobzf5umBYZXt4OVpvx16O4HmydI/JqUcFxffLM99HS1JtoiJ/UTpLKu4MQ0Np7tRLntsI=
X-Received: by 2002:aca:3e46:: with SMTP id l67mr198775oia.92.1590615785265;
 Wed, 27 May 2020 14:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200526211257.37713-1-trevor.gamblin@windriver.com>
 <CANNYZj9v6gxW+jz4b6ejo838tTRNkSUB3DYULy4yEADz+gZdKw@mail.gmail.com> <e0cca8c4-a153-736b-17e8-f9a224e392d5@windriver.com>
In-Reply-To: <e0cca8c4-a153-736b-17e8-f9a224e392d5@windriver.com>
From: "George McCollister" <george.mccollister@gmail.com>
Date: Wed, 27 May 2020 16:42:53 -0500
Message-ID: <CAFSKS=P7Xt9ttvyHXHYN_ZsaPKYsh19cqLrBD5gUjTQAnAkxkg@mail.gmail.com>
Subject: Re: [oe-core][PATCH] libexif: upgrade to 0.6.22, change source to GitHub
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

What are thoughts on applying this version bump to older supported
releases? https://libexif.github.io/ states:
stability / bugfix / security release fixes CVE-2018-20030,
CVE-2020-13114, CVE-2020-13113, CVE-2020-13112, CVE-2020-0093,
CVE-2019-9278, CVE-2020-12767, CVE-2016-6328, CVE-2017-7544,

I say go for it.

-George

On Wed, May 27, 2020 at 8:05 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
>
> On 5/27/20 3:59 AM, Alexander Kanavin wrote:
>
> Hardcoding the split version components isn't great (and breaks automated updates), I have a patch queued that does this better:
>
> Works for me.
>
> Thanks!
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=314af89080317673cf91e24537b2e0d9b36747c2
>
> Specifically:
> def version_underscore(v):
>  return "_".join(v.split("."))
>
> SRC_URI = "https://github.com/libexif/libexif/releases/download/libexif-${@version_underscore("${PV}")}-release/libexif-${PV}.tar.xz \
>  "
>
> Alex
>
> On Tue, 26 May 2020 at 23:13, Trevor Gamblin <trevor.gamblin@windriver.com> wrote:
>>
>> Updated libexif to 0.6.22, but needed to change to GitHub as a source,
>> since SourceForge does not yet have 0.6.22 version. The new version
>> includes the fixes for the three patch files that have been removed,
>> as well as other severe CVEs.
>>
>> CVE: CVE-2018-20030
>> CVE: CVE-2020-13114
>> CVE: CVE-2020-13113
>> CVE: CVE-2020-13112
>> CVE: CVE-2020-0093
>> CVE: CVE-2019-9278
>> CVE: CVE-2020-12767
>> CVE: CVE-2016-6328
>> CVE: CVE-2017-7544
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>  .../libexif/libexif/CVE-2016-6328.patch       |  64 ----------
>>  .../libexif/libexif/CVE-2017-7544.patch       |  40 ------
>>  .../libexif/libexif/CVE-2018-20030.patch      | 115 ------------------
>>  .../recipes-support/libexif/libexif_0.6.21.bb |  17 ---
>>  .../recipes-support/libexif/libexif_0.6.22.bb |  21 ++++
>>  5 files changed, 21 insertions(+), 236 deletions(-)
>>  delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
>>  delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
>>  delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
>>  delete mode 100644 meta/recipes-support/libexif/libexif_0.6.21.bb
>>  create mode 100644 meta/recipes-support/libexif/libexif_0.6.22.bb
>>
>> diff --git a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch b/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
>> deleted file mode 100644
>> index a6f307439b..0000000000
>> --- a/meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
>> +++ /dev/null
>> @@ -1,64 +0,0 @@
>> -CVE: CVE-2016-6328
>> -Upstream-Status: Backport
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> -
>> -From 41bd04234b104312f54d25822f68738ba8d7133d Mon Sep 17 00:00:00 2001
>> -From: Marcus Meissner <marcus@jet.franken.de>
>> -Date: Tue, 25 Jul 2017 23:44:44 +0200
>> -Subject: [PATCH] fixes some (not all) buffer overreads during decoding pentax
>> - makernote entries.
>> -
>> -This should fix:
>> -https://sourceforge.net/p/libexif/bugs/125/ CVE-2016-6328
>> ----
>> - libexif/pentax/mnote-pentax-entry.c | 16 +++++++++++++---
>> - 1 file changed, 13 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/libexif/pentax/mnote-pentax-entry.c b/libexif/pentax/mnote-pentax-entry.c
>> -index d03d159..ea0429a 100644
>> ---- a/libexif/pentax/mnote-pentax-entry.c
>> -+++ b/libexif/pentax/mnote-pentax-entry.c
>> -@@ -425,24 +425,34 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
>> -               case EXIF_FORMAT_SHORT:
>> -                 {
>> -                       const unsigned char *data = entry->data;
>> --                      size_t k, len = strlen(val);
>> -+                      size_t k, len = strlen(val), sizeleft;
>> -+
>> -+                      sizeleft = entry->size;
>> -                       for(k=0; k<entry->components; k++) {
>> -+                              if (sizeleft < 2)
>> -+                                      break;
>> -                               vs = exif_get_short (data, entry->order);
>> -                               snprintf (val+len, maxlen-len, "%i ", vs);
>> -                               len = strlen(val);
>> -                               data += 2;
>> -+                              sizeleft -= 2;
>> -                       }
>> -                 }
>> -                 break;
>> -               case EXIF_FORMAT_LONG:
>> -                 {
>> -                       const unsigned char *data = entry->data;
>> --                      size_t k, len = strlen(val);
>> -+                      size_t k, len = strlen(val), sizeleft;
>> -+
>> -+                      sizeleft = entry->size;
>> -                       for(k=0; k<entry->components; k++) {
>> -+                              if (sizeleft < 4)
>> -+                                      break;
>> -                               vl = exif_get_long (data, entry->order);
>> -                               snprintf (val+len, maxlen-len, "%li", (long int) vl);
>> -                               len = strlen(val);
>> -                               data += 4;
>> -+                              sizeleft -= 4;
>> -                       }
>> -                 }
>> -                 break;
>> -@@ -455,5 +465,5 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
>> -               break;
>> -       }
>> -
>> --      return (val);
>> -+      return val;
>> - }
>> diff --git a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch b/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
>> deleted file mode 100644
>> index e49481ff84..0000000000
>> --- a/meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
>> +++ /dev/null
>> @@ -1,40 +0,0 @@
>> -From 8a92f964a66d476ca8907234359e92a70fc1325b Mon Sep 17 00:00:00 2001
>> -From: Changqing Li <changqing.li@windriver.com>
>> -Date: Tue, 28 Aug 2018 15:12:10 +0800
>> -Subject: [PATCH] On saving makernotes, make sure the makernote container tags
>> - has a type with 1 byte components.
>> -
>> -Fixes (at least):
>> -       https://sourceforge.net/p/libexif/bugs/130
>> -       https://sourceforge.net/p/libexif/bugs/129
>> -
>> -Upstream-Status: Backport[https://github.com/libexif/libexif/commit/
>> -c39acd1692023b26290778a02a9232c873f9d71a#diff-830e348923810f00726700b083ec00cd]
>> -
>> -CVE: CVE-2017-7544
>> -
>> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ----
>> - libexif/exif-data.c | 6 ++++++
>> - 1 file changed, 6 insertions(+)
>> -
>> -diff --git a/libexif/exif-data.c b/libexif/exif-data.c
>> -index 67df4db..6bf89eb 100644
>> ---- a/libexif/exif-data.c
>> -+++ b/libexif/exif-data.c
>> -@@ -255,6 +255,12 @@ exif_data_save_data_entry (ExifData *data, ExifEntry *e,
>> -                       exif_mnote_data_set_offset (data->priv->md, *ds - 6);
>> -                       exif_mnote_data_save (data->priv->md, &e->data, &e->size);
>> -                       e->components = e->size;
>> -+                        if (exif_format_get_size (e->format) != 1) {
>> -+                              /* e->format is taken from input code,
>> -+                               * but we need to make sure it is a 1 byte
>> -+                               * entity due to the multiplication below. */
>> -+                              e->format = EXIF_FORMAT_UNDEFINED;
>> -+                      }
>> -               }
>> -       }
>> -
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch b/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
>> deleted file mode 100644
>> index 76233e6dc9..0000000000
>> --- a/meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
>> +++ /dev/null
>> @@ -1,115 +0,0 @@
>> -CVE: CVE-2018-20030
>> -Upstream-Status: Backport
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> -
>> -From 6aa11df549114ebda520dde4cdaea2f9357b2c89 Mon Sep 17 00:00:00 2001
>> -From: Dan Fandrich <dan@coneharvesters.com>
>> -Date: Fri, 12 Oct 2018 16:01:45 +0200
>> -Subject: [PATCH] Improve deep recursion detection in
>> - exif_data_load_data_content.
>> -
>> -The existing detection was still vulnerable to pathological cases
>> -causing DoS by wasting CPU. The new algorithm takes the number of tags
>> -into account to make it harder to abuse by cases using shallow recursion
>> -but with a very large number of tags.  This improves on commit 5d28011c
>> -which wasn't sufficient to counter this kind of case.
>> -
>> -The limitation in the previous fix was discovered by Laurent Delosieres,
>> -Secunia Research at Flexera (Secunia Advisory SA84652) and is assigned
>> -the identifier CVE-2018-20030.
>> -
>> -diff --git a/libexif/exif-data.c b/libexif/exif-data.c
>> -index 67df4db..8d9897e 100644
>> ---- a/libexif/exif-data.c
>> -+++ b/libexif/exif-data.c
>> -@@ -35,6 +35,7 @@
>> - #include <libexif/olympus/exif-mnote-data-olympus.h>
>> - #include <libexif/pentax/exif-mnote-data-pentax.h>
>> -
>> -+#include <math.h>
>> - #include <stdlib.h>
>> - #include <stdio.h>
>> - #include <string.h>
>> -@@ -344,6 +345,20 @@ if (data->ifd[(i)]->count) {                              \
>> -       break;                                          \
>> - }
>> -
>> -+/*! Calculate the recursion cost added by one level of IFD loading.
>> -+ *
>> -+ * The work performed is related to the cost in the exponential relation
>> -+ *   work=1.1**cost
>> -+ */
>> -+static unsigned int
>> -+level_cost(unsigned int n)
>> -+{
>> -+    static const double log_1_1 = 0.09531017980432493;
>> -+
>> -+      /* Adding 0.1 protects against the case where n==1 */
>> -+      return ceil(log(n + 0.1)/log_1_1);
>> -+}
>> -+
>> - /*! Load data for an IFD.
>> -  *
>> -  * \param[in,out] data #ExifData
>> -@@ -351,13 +366,13 @@ if (data->ifd[(i)]->count) {                             \
>> -  * \param[in] d pointer to buffer containing raw IFD data
>> -  * \param[in] ds size of raw data in buffer at \c d
>> -  * \param[in] offset offset into buffer at \c d at which IFD starts
>> -- * \param[in] recursion_depth number of times this function has been
>> -- * recursively called without returning
>> -+ * \param[in] recursion_cost factor indicating how expensive this recursive
>> -+ * call could be
>> -  */
>> - static void
>> - exif_data_load_data_content (ExifData *data, ExifIfd ifd,
>> -                            const unsigned char *d,
>> --                           unsigned int ds, unsigned int offset, unsigned int recursion_depth)
>> -+                           unsigned int ds, unsigned int offset, unsigned int recursion_cost)
>> - {
>> -       ExifLong o, thumbnail_offset = 0, thumbnail_length = 0;
>> -       ExifShort n;
>> -@@ -372,9 +387,20 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
>> -       if ((((int)ifd) < 0) || ( ((int)ifd) >= EXIF_IFD_COUNT))
>> -         return;
>> -
>> --      if (recursion_depth > 30) {
>> -+      if (recursion_cost > 170) {
>> -+              /*
>> -+               * recursion_cost is a logarithmic-scale indicator of how expensive this
>> -+               * recursive call might end up being. It is an indicator of the depth of
>> -+               * recursion as well as the potential for worst-case future recursive
>> -+               * calls. Since it's difficult to tell ahead of time how often recursion
>> -+               * will occur, this assumes the worst by assuming every tag could end up
>> -+               * causing recursion.
>> -+               * The value of 170 was chosen to limit typical EXIF structures to a
>> -+               * recursive depth of about 6, but pathological ones (those with very
>> -+               * many tags) to only 2.
>> -+               */
>> -               exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA, "ExifData",
>> --                        "Deep recursion detected!");
>> -+                        "Deep/expensive recursion detected!");
>> -               return;
>> -       }
>> -
>> -@@ -416,15 +442,18 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
>> -                       switch (tag) {
>> -                       case EXIF_TAG_EXIF_IFD_POINTER:
>> -                               CHECK_REC (EXIF_IFD_EXIF);
>> --                              exif_data_load_data_content (data, EXIF_IFD_EXIF, d, ds, o, recursion_depth + 1);
>> -+                              exif_data_load_data_content (data, EXIF_IFD_EXIF, d, ds, o,
>> -+                                      recursion_cost + level_cost(n));
>> -                               break;
>> -                       case EXIF_TAG_GPS_INFO_IFD_POINTER:
>> -                               CHECK_REC (EXIF_IFD_GPS);
>> --                              exif_data_load_data_content (data, EXIF_IFD_GPS, d, ds, o, recursion_depth + 1);
>> -+                              exif_data_load_data_content (data, EXIF_IFD_GPS, d, ds, o,
>> -+                                      recursion_cost + level_cost(n));
>> -                               break;
>> -                       case EXIF_TAG_INTEROPERABILITY_IFD_POINTER:
>> -                               CHECK_REC (EXIF_IFD_INTEROPERABILITY);
>> --                              exif_data_load_data_content (data, EXIF_IFD_INTEROPERABILITY, d, ds, o, recursion_depth + 1);
>> -+                              exif_data_load_data_content (data, EXIF_IFD_INTEROPERABILITY, d, ds, o,
>> -+                                      recursion_cost + level_cost(n));
>> -                               break;
>> -                       case EXIF_TAG_JPEG_INTERCHANGE_FORMAT:
>> -                               thumbnail_offset = o;
>> diff --git a/meta/recipes-support/libexif/libexif_0.6.21.bb b/meta/recipes-support/libexif/libexif_0.6.21.bb
>> deleted file mode 100644
>> index d847beab18..0000000000
>> --- a/meta/recipes-support/libexif/libexif_0.6.21.bb
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -SUMMARY = "Library for reading extended image information (EXIF) from JPEG files"
>> -HOMEPAGE = "http://sourceforge.net/projects/libexif"
>> -SECTION = "libs"
>> -LICENSE = "LGPLv2.1"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
>> -
>> -SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
>> -           file://CVE-2017-7544.patch \
>> -           file://CVE-2016-6328.patch \
>> -           file://CVE-2018-20030.patch"
>> -
>> -SRC_URI[md5sum] = "27339b89850f28c8f1c237f233e05b27"
>> -SRC_URI[sha256sum] = "16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a"
>> -
>> -inherit autotools gettext
>> -
>> -EXTRA_OECONF += "--disable-docs"
>> diff --git a/meta/recipes-support/libexif/libexif_0.6.22.bb b/meta/recipes-support/libexif/libexif_0.6.22.bb
>> new file mode 100644
>> index 0000000000..b24135db0f
>> --- /dev/null
>> +++ b/meta/recipes-support/libexif/libexif_0.6.22.bb
>> @@ -0,0 +1,21 @@
>> +SUMMARY = "Library for reading extended image information (EXIF) from JPEG files"
>> +HOMEPAGE = "http://sourceforge.net/projects/libexif"
>> +SECTION = "libs"
>> +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
>> +
>> +MAJOR_VERSION = "0"
>> +MINOR_VERSION = "6"
>> +PATCH_VERSION = "22"
>> +
>> +PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
>> +PATH_PV = "${MAJOR_VERSION}_${MINOR_VERSION}_${PATCH_VERSION}"
>> +
>> +SRC_URI = "https://github.com/libexif/libexif/releases/download/libexif-${PATH_PV}-release/libexif-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "dd67f593b046ad93d01437081329af02"
>> +SRC_URI[sha256sum] = "75dc5c135c61b5e0b15f3911b4de4b3070dd1a1683b9fc08d9ce3518d54d758d"
>> +
>> +inherit autotools gettext
>> +
>> +EXTRA_OECONF += "--disable-docs"
>> --
>> 2.26.2
>>
>>
> 

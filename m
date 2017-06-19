Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 76E6978227
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 19:20:37 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id 83so58146419pfr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 12:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=RoRlaRRgzEP5/X1OtJ5Xf6koow8SHWG6QOrFFfRToFU=;
	b=WnH8YQgntvZ00ozfyCXwinKwbZUJYWvPvNTPj/r9/F1g7JCo2EA+sYEdJM7S43tgHF
	yGtTLKojyBQg5AFhyfyfUY1YLSawrA8b2CSWTC0bh+u0U2er5vxYThK/JFgzVlCPcd4H
	SEWnPCsK0FuyqnKbp2cyfZfE1IBUplwl0S0ysSICmo4XoWR5LU9EX7loi5Bvq5yWuncJ
	f+O4c33Y4Rk9tvYikvgcAUl7LkQ5aRERXfvcZWMgCKDUrpR5BlpRJomCvX4nA+hiRGDh
	dTlJm/lLH+s7Y699E3Mm8qrMqThj0SJGaSC5v72nuKOAHyzFQT/N6OSaXNu4Svqr6iM3
	l51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=RoRlaRRgzEP5/X1OtJ5Xf6koow8SHWG6QOrFFfRToFU=;
	b=MWTYywFvhlGFxH86mVOFl2JdoduXA1d23ttbxrEMjfDhAjUFnS9KBvqJvw5CW+Fwd9
	ZmKhOouk5ZdrQOHLHv6NDXH9YC2TDU7sv/aUsZjSPIK+4o1tvPxL6RrzLWEy5evemQ/C
	zuQk38bSND3JHZf6sB6DFeEoFXlNAQ72lwWVgkp0fXSREuHMvKJmPKjlBAkatMzYWbop
	fri3PDQfL3ciF+rYOiQuYvqgYtzYQK9KaCIuKT48teRKFspHCfeMVA51cKcbWfjkTWcR
	gc9cN2ZUPRd+dJhm1OiKpvjqaN1uRex/jx+Hqb/YfZurvTDe0cnzw5nBVUIXjFiVmNi8
	MK6w==
X-Gm-Message-State: AKS2vOxuCeaaEjEk45gwZhR7rw4EKxc6hzoMcrtPRPZUvKPvrAPywJdS
	wiBYwe1v5vwpyJ+suas=
X-Received: by 10.84.213.129 with SMTP id g1mr31450943pli.202.1497900038258;
	Mon, 19 Jun 2017 12:20:38 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:554e:c6a6:9e0a:cc57?
	([2601:202:4001:9ea0:554e:c6a6:9e0a:cc57])
	by smtp.gmail.com with ESMTPSA id
	66sm22427027pfm.82.2017.06.19.12.20.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 12:20:37 -0700 (PDT)
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1494238617-8419-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF732452335A@G08CNEXMBPEKD01.g08.fujitsu.local>
From: akuster808 <akuster808@gmail.com>
Message-ID: <bab1081f-c792-428d-8423-8513145de9c6@gmail.com>
Date: Mon, 19 Jun 2017 12:20:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF732452335A@G08CNEXMBPEKD01.g08.fujitsu.local>
Subject: Re: [morty] [PATCH] rpm: Fix the Bug of SRPM String error
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
X-List-Received-Date: Mon, 19 Jun 2017 19:20:37 -0000
Content-Type: multipart/alternative;
	boundary="------------7303746F83BFEB7F8D9B406E"
Content-Language: en-US

--------------7303746F83BFEB7F8D9B406E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/16/2017 10:18 PM, Zheng, Ruoqin wrote:
> Ping
Apologies for the delay. It appears this change has introduced new 
warnings so at this time I will not be taking this patch.

NOTE: core-image-sato-sdk-1.0-r0 do_testimage: Previous repo file 
missing: 
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/build/build/tmp/work/qemuarm64-poky-linux/core-image-sato-sdk/1.0-r0/rpm/all/repodata/primary.xml.gz 
warning: tag Name(1000) type(0x4) != expected type(0x10006) warning: tag 
Name(1000) type(0x4) != expected type(0x10006) warning: tag Name(1000) 
type(0x4) != expected type(0x10006) warning: tag Name(1000) type(0x4) != 
expected type(0x10006) warning: tag Name(1000) type(0x4) != expected 
type(0x10006) warning: tag Name(1000) type(0x4) != expected 
type(0x10006) warning: tag Name(1000) type(0x4) != expected 
type(0x10006) please investigate. - armin

>
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>         Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
> -----Original Message-----
> From: Zheng, Ruoqin/郑 若钦
> Sent: Monday, May 08, 2017 6:17 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Zheng, Ruoqin/郑 若钦 <zhengrq.fnst@cn.fujitsu.com>
> Subject: [OE-core] [morty] [PATCH] rpm: Fix the Bug of SRPM String error
>
> Add a patch 0001-Fix-the-Bug-of-SRPM-String-error.patch to fix SRPM bug
>
> When use bitbake to build a SRPM package, some sections of SRPM can't be displayed normally.
> For example:
> $ rpm -qpi zlib-1.2.8-r0.src.rpm
> warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e64962a6: NOKEY
> Name        : zlib
> Version     : 1.2.8
> Release     : r0
> Architecture: i586
> Install Date: (not installed)
> Group       : ïº©
> Size        : 633007
> License     : Zlib
> Signature   : DSA/SHA1, 2017å¹´04æœˆ22æ—¥ 00æ™‚38åˆ†03ç§’, Key ID bc5e0520e64962a6
> Source RPM  : (none)
> Build Date  : 2017å¹´04æœˆ22æ—¥ 00æ™‚38åˆ†03ç§’
> Build Host  : force
> Relocations : (not relocatable)
> Packager    : Poky <poky@yoctoproject.org>
> URL         : http://zlib.net/
> Summary     : Â¨Â¯
> Description :
> ïº©
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>   .../0001-Fix-the-Bug-of-SRPM-String-error.patch    | 162 +++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.16.bb            |   1 +
>   2 files changed, 163 insertions(+)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch
> new file mode 100644
> index 0000000..85c48ac
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-erro
> +++ r.patch
> @@ -0,0 +1,162 @@
> +Subject: [PATCH] Fix the Bug of SRPM String error
> +
> +Upstream-Status: Backport from rpm 5.4.16 $ rpm -qpi
> +zlib-1.2.8-r0.src.rpm
> +warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e64962a6: NOKEY
> +Name        : zlib
> +Version     : 1.2.8
> +Release     : r0
> +Architecture: i586
> +Install Date: (not installed)
> +Group       : ïº©
> +Size        : 633007
> +License     : Zlib
> +Signature   : DSA/SHA1, 2017å¹´04æœˆ22æ—¥ 00æ™‚38åˆ†03ç§’, Key ID bc5e0520e64962a6
> +Source RPM  : (none)
> +Build Date  : 2017å¹´04æœˆ22æ—¥ 00æ™‚38åˆ†03ç§’
> +Build Host  : force
> +Relocations : (not relocatable)
> +Packager    : Poky <poky@yoctoproject.org>
> +URL         : http://zlib.net/
> +Summary     : Â¨Â¯
> +Description :
> +ïº©
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + rpmdb/header.c  |  8 ++++----
> + rpmdb/rpmtag.h  |  1 +
> + rpmdb/tagname.c | 61
> +++++++++++++++++++++++++++++++++++++++++-----------------
> + 3 files changed, 48 insertions(+), 22 deletions(-)
> +
> +diff --git a/rpmdb/header.c b/rpmdb/header.c index 5d6c6cf..5a80df0
> +100644
> +--- a/rpmdb/header.c
> ++++ b/rpmdb/header.c
> +@@ -32,7 +32,7 @@ GENfree(HeaderIterator)
> + #endif	/* __cplusplus */
> +
> + #if defined(SUPPORT_IMPLICIT_TAG_DATA_TYPES)
> +-extern void tagTypeValidate(HE_t he)
> ++extern void tagTypeValidate(HE_t he, unsigned int flags)
> + 	/*@*/;
> + #endif
> +
> +@@ -2281,7 +2281,7 @@ int headerGet(Header h, HE_t he, unsigned int
> +flags)  /*@-modfilesys@*/
> +     /* XXX verify that explicit and implicit types are identical. */
> +     if (rc)
> +-	tagTypeValidate(he);
> ++        tagTypeValidate(he, flags);
> + /*@=modfilesys@*/
> + #endif
> +
> +@@ -2304,7 +2304,7 @@ int headerPut(Header h, HE_t he, /*@unused@*/
> +unsigned int flags)  #if defined(SUPPORT_IMPLICIT_TAG_DATA_TYPES)
> + /*@-modfilesys@*/
> +     /* XXX verify that explicit and implicit types are identical. */
> +-    tagTypeValidate(he);
> ++    tagTypeValidate(he, flags);
> + /*@=modfilesys@*/
> + #endif
> +
> +@@ -2329,7 +2329,7 @@ int headerMod(Header h, HE_t he, /*@unused@*/
> +unsigned int flags)  #if defined(SUPPORT_IMPLICIT_TAG_DATA_TYPES)
> + /*@-modfilesys@*/
> +     /* XXX verify that explicit and implicit types are identical. */
> +-    tagTypeValidate(he);
> ++    tagTypeValidate(he, flags);
> + /*@=modfilesys@*/
> + #endif
> +
> +diff --git a/rpmdb/rpmtag.h b/rpmdb/rpmtag.h index ffce678..8f6a2bf
> +100644
> +--- a/rpmdb/rpmtag.h
> ++++ b/rpmdb/rpmtag.h
> +@@ -868,6 +868,7 @@ int headerGet(Header h, HE_t he, unsigned int flags)
> + 	/*@modifies he, internalState @*/;
> + #define	HEADERGET_NOEXTENSION	(1 << 0) /*!< Extension search disabler. */
> + #define	HEADERGET_NOI18NSTRING	(1 << 1) /*!< Return i18n strings as argv. */
> ++#define HEADERGET_SIGHEADER     (1 << 2) /*!< Override signature tag data. */
> +
> + /** \ingroup header
> +  * Add or append tag container to header.
> +diff --git a/rpmdb/tagname.c b/rpmdb/tagname.c index cfd1459..374ad77
> +100644
> +--- a/rpmdb/tagname.c
> ++++ b/rpmdb/tagname.c
> +@@ -515,28 +515,53 @@ tagStore_t tagStoreFree(tagStore_t dbiTags,
> +size_t dbiNTags)
> +  * Validate that implicit and explicit types are identical.
> +  * @param he		tag container
> +  */
> +-void tagTypeValidate(HE_t he);
> +-void tagTypeValidate(HE_t he)
> ++void tagTypeValidate(HE_t he, unsigned int flags); void
> ++tagTypeValidate(HE_t he, unsigned int flags)
> + {
> +-    /* XXX Re-map RPM_I18NSTRING_TYPE -> RPM_STRING_TYPE */
> +-    if (he->t == RPM_I18NSTRING_TYPE)
> +-	he->t = RPM_STRING_TYPE;
> +-
> +-    /* XXX Arbitrary tags are always strings. */
> +-    if ((he->tag & 0x40000000)
> +-     && (he->t == RPM_STRING_TYPE || he->t == RPM_STRING_ARRAY_TYPE))
> ++    /* XXX Skip RPMSIGTAG_* validation. */
> ++    if (flags & HEADERGET_SIGHEADER)
> + 	return;
> +
> +-    /* XXX Make 0x3fffffff disappear for now. Signature? */
> +-    if (he->tag == 0x3fffffff && he->t == RPM_BIN_TYPE)
> ++    /* XXX Arbitrary tags are always STRING or STRING_ARRAY. */
> ++    if (he->tag & 0x40000000) {
> ++	if (!(he->t == RPM_STRING_TYPE || he->t == RPM_STRING_ARRAY_TYPE)) {
> ++	    rpmTagType tagtype = RPM_STRING_TYPE;
> ++	    rpmlog(RPMLOG_WARNING,
> ++		_("tag %s(%u) type(0x%x) != expected type(0x%x)\n"),
> ++		tagName(he->tag), (unsigned) he->tag, he->t, tagtype);
> ++	}
> + 	return;
> ++    }
> +
> +-/* XXX hack around known borkage for now. */ -if (!(he->tag == 62))
> +-if (!(he->tag == 261 || he->tag == 269)) -if (!(he->tag == 1000 ||
> +he->tag == 1004 || he->tag == 1007)) -if (!(he->tag == 1029 || he->tag
> +== 1086 || he->tag == 1087)) -if (he->t != (tagType(he->tag) & 0xffff))
> +-fprintf(stderr, "==> warning: tag %u type(0x%x) != implicit
> +type(0x%x)\n", (unsigned) he->tag, he->t, tagType(he->tag));
> ++    switch (he->tag) {
> ++#if defined(SUPPORT_I18NSTRING_TYPE)
> ++    case RPMTAG_SUMMARY:
> ++    case RPMTAG_DESCRIPTION:
> ++    case RPMTAG_GROUP:
> ++#endif
> ++    case RPMTAG_FILESTATES:	/* XXX either CHAR or UINT8 */
> ++	break;
> ++    case RPMTAG_PREINPROG:	/* XXX either STRING or STRING_ARRAY */
> ++    case RPMTAG_POSTINPROG:	/* XXX either STRING or STRING_ARRAY */
> ++    case RPMTAG_PREUNPROG:	/* XXX either STRING or STRING_ARRAY */
> ++    case RPMTAG_POSTUNPROG:	/* XXX either STRING or STRING_ARRAY */
> ++    case RPMTAG_VERIFYSCRIPTPROG:/* XXX either STRING or STRING_ARRAY */
> ++	if (!(he->t == RPM_STRING_TYPE || he->t == RPM_STRING_ARRAY_TYPE)) {
> ++	    rpmTagType tagtype = RPM_STRING_TYPE;
> ++	    rpmlog(RPMLOG_WARNING,
> ++		_("tag %s(%u) type(0x%x) != expected type(0x%x)\n"),
> ++		tagName(he->tag), (unsigned) he->tag, he->t, tagtype);
> ++	}
> ++	break;
> ++    default:
> ++      {	rpmTagType tagtype = tagType(he->tag);
> ++	rpmTagType type = (tagtype & 0xffff);
> ++	if (type && he->t != type) {
> ++	    rpmlog(RPMLOG_WARNING,
> ++		_("tag %s(%u) type(0x%x) != expected type(0x%x)\n"),
> ++		tagName(he->tag), (unsigned) he->tag, he->t, tagtype);
> ++	}
> ++      }	break;
> ++    }
> + }
> + #endif
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> index 497af8e..2bfe455 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> @@ -120,6 +120,7 @@ SRC_URI += " \
>   	   file://0001-system.h-query.c-support-nosignature.patch \
>   	   file://rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch \
>   	   file://0001-macros-add-_gpg_sign_cmd_extra_args.patch \
> +           file://0001-Fix-the-Bug-of-SRPM-String-error.patch \
>   "
>   
>   # OE specific changes
> --
> 2.7.4
>
>
>


--------------7303746F83BFEB7F8D9B406E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 05/16/2017 10:18 PM, Zheng, Ruoqin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:33D4DBCAC5F2D74E96B07F6E7632BF732452335A@G08CNEXMBPEKD01.g08.fujitsu.local">
      <pre wrap="">Ping</pre>
    </blockquote>
    Apologies for the delay. It appears this change has introduced new
    warnings so at this time I will not be taking this patch.<br>
    <br>
    <pre><span class="stdout">NOTE: core-image-sato-sdk-1.0-r0 do_testimage: Previous repo file missing: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/build/build/tmp/work/qemuarm64-poky-linux/core-image-sato-sdk/1.0-r0/rpm/all/repodata/primary.xml.gz
warning: tag Name(1000) type(0x4) != expected type(0x10006)
warning: tag Name(1000) type(0x4) != expected type(0x10006)
warning: tag Name(1000) type(0x4) != expected type(0x10006)
warning: tag Name(1000) type(0x4) != expected type(0x10006)
warning: tag Name(1000) type(0x4) != expected type(0x10006)
warning: tag Name(1000) type(0x4) != expected type(0x10006)
warning: tag Name(1000) type(0x4) != expected type(0x10006)

please investigate.

- armin
</span></pre>
    <blockquote type="cite"
cite="mid:33D4DBCAC5F2D74E96B07F6E7632BF732452335A@G08CNEXMBPEKD01.g08.fujitsu.local">
      <pre wrap="">

Zheng Ruoqin
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
ADDR.: No.6 Wenzhu Road, Software Avenue,
       Nanjing, 210012, China
MAIL : <a class="moz-txt-link-abbreviated" href="mailto:zhengrq.fnst@cn.fujistu.com">zhengrq.fnst@cn.fujistu.com</a>

-----Original Message-----
From: Zheng, Ruoqin/郑 若钦 
Sent: Monday, May 08, 2017 6:17 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Cc: Zheng, Ruoqin/郑 若钦 <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a>
Subject: [OE-core] [morty] [PATCH] rpm: Fix the Bug of SRPM String error

Add a patch 0001-Fix-the-Bug-of-SRPM-String-error.patch to fix SRPM bug

When use bitbake to build a SRPM package, some sections of SRPM can't be displayed normally.
For example:
$ rpm -qpi zlib-1.2.8-r0.src.rpm
warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e64962a6: NOKEY
Name        : zlib
Version     : 1.2.8
Release     : r0
Architecture: i586
Install Date: (not installed)
Group       : ïº©
Size        : 633007
License     : Zlib
Signature   : DSA/SHA1, 2017å¹´04æœˆ22æ—¥ 00æ™‚38åˆ†03ç§’, Key ID bc5e0520e64962a6
Source RPM  : (none)
Build Date  : 2017å¹´04æœˆ22æ—¥ 00æ™‚38åˆ†03ç§’
Build Host  : force
Relocations : (not relocatable)
Packager    : Poky <a class="moz-txt-link-rfc2396E" href="mailto:poky@yoctoproject.org">&lt;poky@yoctoproject.org&gt;</a>
URL         : <a class="moz-txt-link-freetext" href="http://zlib.net/">http://zlib.net/</a>
Summary     : Â¨Â¯
Description :
ïº©

Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a>
---
 .../0001-Fix-the-Bug-of-SRPM-String-error.patch    | 162 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch

diff --git a/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch
new file mode 100644
index 0000000..85c48ac
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-erro
+++ r.patch
@@ -0,0 +1,162 @@
+Subject: [PATCH] Fix the Bug of SRPM String error
+
+Upstream-Status: Backport from rpm 5.4.16 $ rpm -qpi 
+zlib-1.2.8-r0.src.rpm
+warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e64962a6: NOKEY
+Name        : zlib
+Version     : 1.2.8
+Release     : r0
+Architecture: i586
+Install Date: (not installed)
+Group       : ïº©
+Size        : 633007
+License     : Zlib
+Signature   : DSA/SHA1, 2017å¹´04æœˆ22æ—¥ 00æ™‚38åˆ†03ç§’, Key ID bc5e0520e64962a6
+Source RPM  : (none)
+Build Date  : 2017å¹´04æœˆ22æ—¥ 00æ™‚38åˆ†03ç§’
+Build Host  : force
+Relocations : (not relocatable)
+Packager    : Poky <a class="moz-txt-link-rfc2396E" href="mailto:poky@yoctoproject.org">&lt;poky@yoctoproject.org&gt;</a>
+URL         : <a class="moz-txt-link-freetext" href="http://zlib.net/">http://zlib.net/</a>
+Summary     : Â¨Â¯
+Description :
+ïº©
+
+Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a>
+---
+ rpmdb/header.c  |  8 ++++----
+ rpmdb/rpmtag.h  |  1 +
+ rpmdb/tagname.c | 61 
+++++++++++++++++++++++++++++++++++++++++-----------------
+ 3 files changed, 48 insertions(+), 22 deletions(-)
+
+diff --git a/rpmdb/header.c b/rpmdb/header.c index 5d6c6cf..5a80df0 
+100644
+--- a/rpmdb/header.c
++++ b/rpmdb/header.c
+@@ -32,7 +32,7 @@ GENfree(HeaderIterator)
+ #endif	/* __cplusplus */
+ 
+ #if defined(SUPPORT_IMPLICIT_TAG_DATA_TYPES)
+-extern void tagTypeValidate(HE_t he)
++extern void tagTypeValidate(HE_t he, unsigned int flags)
+ 	/*@*/;
+ #endif
+ 
+@@ -2281,7 +2281,7 @@ int headerGet(Header h, HE_t he, unsigned int 
+flags)  /*@-modfilesys@*/
+     /* XXX verify that explicit and implicit types are identical. */
+     if (rc)
+-	tagTypeValidate(he);
++        tagTypeValidate(he, flags);
+ /*@=modfilesys@*/
+ #endif
+ 
+@@ -2304,7 +2304,7 @@ int headerPut(Header h, HE_t he, /*@unused@*/ 
+unsigned int flags)  #if defined(SUPPORT_IMPLICIT_TAG_DATA_TYPES)
+ /*@-modfilesys@*/
+     /* XXX verify that explicit and implicit types are identical. */
+-    tagTypeValidate(he);
++    tagTypeValidate(he, flags);
+ /*@=modfilesys@*/
+ #endif
+ 
+@@ -2329,7 +2329,7 @@ int headerMod(Header h, HE_t he, /*@unused@*/ 
+unsigned int flags)  #if defined(SUPPORT_IMPLICIT_TAG_DATA_TYPES)
+ /*@-modfilesys@*/
+     /* XXX verify that explicit and implicit types are identical. */
+-    tagTypeValidate(he);
++    tagTypeValidate(he, flags);
+ /*@=modfilesys@*/
+ #endif
+ 
+diff --git a/rpmdb/rpmtag.h b/rpmdb/rpmtag.h index ffce678..8f6a2bf 
+100644
+--- a/rpmdb/rpmtag.h
++++ b/rpmdb/rpmtag.h
+@@ -868,6 +868,7 @@ int headerGet(Header h, HE_t he, unsigned int flags)
+ 	/*@modifies he, internalState @*/;
+ #define	HEADERGET_NOEXTENSION	(1 &lt;&lt; 0) /*!&lt; Extension search disabler. */
+ #define	HEADERGET_NOI18NSTRING	(1 &lt;&lt; 1) /*!&lt; Return i18n strings as argv. */
++#define HEADERGET_SIGHEADER     (1 &lt;&lt; 2) /*!&lt; Override signature tag data. */
+ 
+ /** \ingroup header
+  * Add or append tag container to header.
+diff --git a/rpmdb/tagname.c b/rpmdb/tagname.c index cfd1459..374ad77 
+100644
+--- a/rpmdb/tagname.c
++++ b/rpmdb/tagname.c
+@@ -515,28 +515,53 @@ tagStore_t tagStoreFree(tagStore_t dbiTags, 
+size_t dbiNTags)
+  * Validate that implicit and explicit types are identical.
+  * @param he		tag container
+  */
+-void tagTypeValidate(HE_t he);
+-void tagTypeValidate(HE_t he)
++void tagTypeValidate(HE_t he, unsigned int flags); void 
++tagTypeValidate(HE_t he, unsigned int flags)
+ {
+-    /* XXX Re-map RPM_I18NSTRING_TYPE -&gt; RPM_STRING_TYPE */
+-    if (he-&gt;t == RPM_I18NSTRING_TYPE)
+-	he-&gt;t = RPM_STRING_TYPE;
+-
+-    /* XXX Arbitrary tags are always strings. */
+-    if ((he-&gt;tag &amp; 0x40000000)
+-     &amp;&amp; (he-&gt;t == RPM_STRING_TYPE || he-&gt;t == RPM_STRING_ARRAY_TYPE))
++    /* XXX Skip RPMSIGTAG_* validation. */
++    if (flags &amp; HEADERGET_SIGHEADER)
+ 	return;
+ 
+-    /* XXX Make 0x3fffffff disappear for now. Signature? */
+-    if (he-&gt;tag == 0x3fffffff &amp;&amp; he-&gt;t == RPM_BIN_TYPE)
++    /* XXX Arbitrary tags are always STRING or STRING_ARRAY. */
++    if (he-&gt;tag &amp; 0x40000000) {
++	if (!(he-&gt;t == RPM_STRING_TYPE || he-&gt;t == RPM_STRING_ARRAY_TYPE)) {
++	    rpmTagType tagtype = RPM_STRING_TYPE;
++	    rpmlog(RPMLOG_WARNING,
++		_("tag %s(%u) type(0x%x) != expected type(0x%x)\n"),
++		tagName(he-&gt;tag), (unsigned) he-&gt;tag, he-&gt;t, tagtype);
++	}
+ 	return;
++    }
+ 
+-/* XXX hack around known borkage for now. */ -if (!(he-&gt;tag == 62)) 
+-if (!(he-&gt;tag == 261 || he-&gt;tag == 269)) -if (!(he-&gt;tag == 1000 || 
+he-&gt;tag == 1004 || he-&gt;tag == 1007)) -if (!(he-&gt;tag == 1029 || he-&gt;tag 
+== 1086 || he-&gt;tag == 1087)) -if (he-&gt;t != (tagType(he-&gt;tag) &amp; 0xffff)) 
+-fprintf(stderr, "==&gt; warning: tag %u type(0x%x) != implicit 
+type(0x%x)\n", (unsigned) he-&gt;tag, he-&gt;t, tagType(he-&gt;tag));
++    switch (he-&gt;tag) {
++#if defined(SUPPORT_I18NSTRING_TYPE)
++    case RPMTAG_SUMMARY:
++    case RPMTAG_DESCRIPTION:
++    case RPMTAG_GROUP:
++#endif
++    case RPMTAG_FILESTATES:	/* XXX either CHAR or UINT8 */
++	break;
++    case RPMTAG_PREINPROG:	/* XXX either STRING or STRING_ARRAY */
++    case RPMTAG_POSTINPROG:	/* XXX either STRING or STRING_ARRAY */
++    case RPMTAG_PREUNPROG:	/* XXX either STRING or STRING_ARRAY */
++    case RPMTAG_POSTUNPROG:	/* XXX either STRING or STRING_ARRAY */
++    case RPMTAG_VERIFYSCRIPTPROG:/* XXX either STRING or STRING_ARRAY */
++	if (!(he-&gt;t == RPM_STRING_TYPE || he-&gt;t == RPM_STRING_ARRAY_TYPE)) {
++	    rpmTagType tagtype = RPM_STRING_TYPE;
++	    rpmlog(RPMLOG_WARNING,
++		_("tag %s(%u) type(0x%x) != expected type(0x%x)\n"),
++		tagName(he-&gt;tag), (unsigned) he-&gt;tag, he-&gt;t, tagtype);
++	}
++	break;
++    default:
++      {	rpmTagType tagtype = tagType(he-&gt;tag);
++	rpmTagType type = (tagtype &amp; 0xffff);
++	if (type &amp;&amp; he-&gt;t != type) {
++	    rpmlog(RPMLOG_WARNING,
++		_("tag %s(%u) type(0x%x) != expected type(0x%x)\n"),
++		tagName(he-&gt;tag), (unsigned) he-&gt;tag, he-&gt;t, tagtype);
++	}
++      }	break;
++    }
+ }
+ #endif
+--
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 497af8e..2bfe455 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -120,6 +120,7 @@ SRC_URI += " \
 	   <a class="moz-txt-link-freetext" href="file://0001-system.h-query.c-support-nosignature.patch">file://0001-system.h-query.c-support-nosignature.patch</a> \
 	   <a class="moz-txt-link-freetext" href="file://rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch">file://rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch</a> \
 	   <a class="moz-txt-link-freetext" href="file://0001-macros-add-_gpg_sign_cmd_extra_args.patch">file://0001-macros-add-_gpg_sign_cmd_extra_args.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-Fix-the-Bug-of-SRPM-String-error.patch">file://0001-Fix-the-Bug-of-SRPM-String-error.patch</a> \
 "
 
 # OE specific changes
--
2.7.4



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------7303746F83BFEB7F8D9B406E--

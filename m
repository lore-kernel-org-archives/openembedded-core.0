Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id BC11971AB5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 23:57:04 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id x19so3670941plr.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 15:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BkyH393cOZqbxyr4VvRqBEPC6ldrojPlbavRo2s4twE=;
	b=hvfaQS9QnfuckBUwCk0MJkqDVbOTMO6En0nExLfowNmqN32TQ3lMlrgHJQLSvWZn2i
	/JcgS0PRM6XiguhjcxUcimHWXfoIQN98l8EMip5qfbdWwGpYfbODetsIht/OksIU2l8p
	Lx7ar2FWvUuWHTfKHuLE5y5RCjhWFQLyPEBr64OIFiYN2IPWEap3s8jLiUFbo1n3FAXT
	tIkyhVbjjdXdxBkx2t9TW5uYsOL6p2RoBuCumPbrVzmSpL4klGyDRTSDiKKEq96J4pYd
	yosOsMlP69ZIZNThupW2Z/KRBTyJ3kCxmLZbEljd5Lh1u4G8BzTo3k4h6jSakVDnk4iG
	LG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=BkyH393cOZqbxyr4VvRqBEPC6ldrojPlbavRo2s4twE=;
	b=nXcWcV3Rc7grcOrhhOFDq0rUKcvxbxleM9I5vs3PXk2jAmbrS0LNB38Oj1NEQjTexv
	IIV8YnlvsP8enzOA9vkzh7E3GUU96I4DDlGgAntp+sIWoe853dAf/2KlhKfqyr9Ikyp8
	8n8WTgWmrrhlvDEa4a/4VkD/MyhRxRgN4ott4OPYou45iOo+Oq1bMhZWrGfvJuaTEYZ+
	6p6Y0y8kP/s9L/duJM+vborxZAUDYMg7vWaVSXLdEPwlVXMMmHaUaiTn4N6D6niD0vz7
	+Do6sZ448e+9DCKFgEfYjjd01qHl0GtsfqH0lYLZ2QHLC5V3CJdhF99vNRjnu0TG1ov4
	mbKg==
X-Gm-Message-State: APf1xPCOwqttcZd6QfajLP1WkkuC5t9YodAxlxnek1RPYcX5vKYpsSxY
	nT2AAYGnh+e2+kxMdx6mEn6FxmJU
X-Google-Smtp-Source: AH8x2278MYmh2Dk7Ki91Nl13ObTPNAednrxU/g4yHjixCB3SHQyOfUAa3yIqRnr7MzGDsE1lBBImFg==
X-Received: by 2002:a17:902:d882:: with SMTP id
	b2-v6mr4591970plz.292.1518911825484; 
	Sat, 17 Feb 2018 15:57:05 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:e8bf:1f74:db55:9fe5])
	by smtp.gmail.com with ESMTPSA id
	e81sm39658088pfb.58.2018.02.17.15.57.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Feb 2018 15:57:04 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20180212193958.19804-1-JPEWhacker@gmail.com>
	<CA+chaQfqemdC3a70o9sjGRb+RWfb-Uoaea6a2apYkTaz2uomyA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9db4e509-5581-aebe-5d6c-292dce4b5498@gmail.com>
Date: Sat, 17 Feb 2018 15:57:03 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfqemdC3a70o9sjGRb+RWfb-Uoaea6a2apYkTaz2uomyA@mail.gmail.com>
Subject: Re: [PATCH] utils.py: add parallel make helpers
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
X-List-Received-Date: Sat, 17 Feb 2018 23:57:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2/16/18 12:14 PM, Martin Jansa wrote:
> +            v = max(limit, v)
> 
> this seems to be doing the opposite of what the limit was used for before:
> 
> -                v = min(64, int(v))
> 

moreover, I think the limit should be based on ncpu() instead of hard 
coding it.

> On Mon, Feb 12, 2018 at 8:39 PM, Joshua Watt <jpewhacker@gmail.com 
> <mailto:jpewhacker@gmail.com>> wrote:
> 
>     The code to extract the integer number of parallel build threads and
>     construct a new argument from them has started to be copied in multiple
>     locations, so create two new helper utilities to aid recipes.
> 
>     The first helper (parallel_make()) extracts the integer number of
>     parallel build threads from PARALLEL_MAKE. The second
>     (parallel_make_argument()) does the same and then puts the result back
>     into a format string, optionally clamping it to some maximum value.
> 
>     Additionally, rework the oe-core recipes that were manually doing this
>     to use the new helper utilities.
> 
>     Signed-off-by: Joshua Watt <JPEWhacker@gmail.com
>     <mailto:JPEWhacker@gmail.com>>
>     ---
>       meta/classes/go.bbclass              | 19 +---------------
>       meta/classes/waf.bbclass             | 24 +-------------------
>       meta/lib/oe/utils.py                 | 43
>     ++++++++++++++++++++++++++++++++++++
>       meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>   |  2 +-
>       meta/recipes-support/boost/boost.inc | 24 +-------------------
>       5 files changed, 47 insertions(+), 65 deletions(-)
> 
>     diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
>     index 09b01a84c37..7ecd8c92541 100644
>     --- a/meta/classes/go.bbclass
>     +++ b/meta/classes/go.bbclass
>     @@ -1,23 +1,6 @@
>       inherit goarch ptest
> 
>     -def get_go_parallel_make(d):
>     -    pm = (d.getVar('PARALLEL_MAKE') or '').split()
>     -    # look for '-j' and throw other options (e.g. '-l') away
>     -    # because they might have a different meaning in golang
>     -    while pm:
>     -        opt = pm.pop(0)
>     -        if opt == '-j':
>     -            v = pm.pop(0)
>     -        elif opt.startswith('-j'):
>     -            v = opt[2:].strip()
>     -        else:
>     -            continue
>     -
>     -        return '-p %d' % int(v)
>     -
>     -    return ""
>     -
>     -GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
>     +GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"
> 
>       GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
>       GOROOT_class-nativesdk = "${STAGING_DIR_TARGET}${libdir}/go"
>     diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>     index bdbdc56767c..f9a851d0759 100644
>     --- a/meta/classes/waf.bbclass
>     +++ b/meta/classes/waf.bbclass
>     @@ -3,28 +3,6 @@ DISABLE_STATIC = ""
> 
>       EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
> 
>     -def get_waf_parallel_make(d):
>     -    pm = d.getVar('PARALLEL_MAKE')
>     -    if pm:
>     -        # look for '-j' and throw other options (e.g. '-l') away
>     -        # because they might have different meaning in bjam
>     -        pm = pm.split()
>     -        while pm:
>     -            v = None
>     -            opt = pm.pop(0)
>     -            if opt == '-j':
>     -                v = pm.pop(0)
>     -            elif opt.startswith('-j'):
>     -                v = opt[2:].strip()
>     -            else:
>     -                v = None
>     -
>     -            if v:
>     -                v = min(64, int(v))
>     -                return '-j' + str(v)
>     -
>     -    return ""
>     -
>       python waf_preconfigure() {
>           import subprocess
>           from distutils.version import StrictVersion
>     @@ -47,7 +25,7 @@ waf_do_configure() {
> 
>       do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>       waf_do_compile()  {
>     -       ${S}/waf build ${@get_waf_parallel_make(d)}
>     +       ${S}/waf build ${@oe.utils.parallel_make_argument(d, '-j%d',
>     limit=64)}
>       }
> 
>       waf_do_install() {
>     diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
>     index 7a79d752b69..ec91927233a 100644
>     --- a/meta/lib/oe/utils.py
>     +++ b/meta/lib/oe/utils.py
>     @@ -156,6 +156,49 @@ def any_distro_features(d, features,
>     truevalue="1", falsevalue=""):
>           """
>           return bb.utils.contains_any("DISTRO_FEATURES", features,
>     truevalue, falsevalue, d)
> 
>     +def parallel_make(d):
>     +    """
>     +    Return the integer value for the number of parallel threads to
>     use when
>     +    building, scraped out of PARALLEL_MAKE. If no parallelization
>     option is
>     +    found, returns None
>     +
>     +    e.g. if PARALLEL_MAKE = "-j 10", this will return 10 as an integer.
>     +    """
>     +    pm = (d.getVar('PARALLEL_MAKE') or '').split()
>     +    # look for '-j' and throw other options (e.g. '-l') away
>     +    while pm:
>     +        opt = pm.pop(0)
>     +        if opt == '-j':
>     +            v = pm.pop(0)
>     +        elif opt.startswith('-j'):
>     +            v = opt[2:].strip()
>     +        else:
>     +            continue
>     +
>     +        return int(v)
>     +
>     +    return None
>     +
>     +def parallel_make_argument(d, fmt, limit=None):
>     +    """
>     +    Helper utility to construct a parallel make argument from the
>     number of
>     +    parallel threads specified in PARALLEL_MAKE.
>     +
>     +    Returns the input format string `fmt` where a single '%d' will
>     be expanded
>     +    with the number of parallel threads to use. If `limit` is
>     specified, the
>     +    number of parallel threads will be no larger than it. If no
>     parallelization
>     +    option is found in PARALLEL_MAKE, returns an empty string
>     +
>     +    e.g. if PARALLEL_MAKE = "-j 10", parallel_make_argument(d, "-n
>     %d") will return
>     +    "-n 10"
>     +    """
>     +    v = parallel_make(d)
>     +    if v:
>     +        if limit:
>     +            v = max(limit, v)
>     +        return fmt % v
>     +    return ''
>     +
>       def packages_filter_out_system(d):
>           """
>           Return a list of packages from PACKAGES with the "system"
>     packages such as
>     diff --git a/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>     b/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>     index fa0d66291d1..8750b3c528d 100644
>     --- a/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>     +++ b/meta/recipes-core/ovmf/ovmf_git.bb <http://ovmf_git.bb>
>     @@ -151,7 +151,7 @@ do_compile_class-native() {
> 
>       do_compile_class-target() {
>           export LFLAGS="${LDFLAGS}"
>     -    PARALLEL_JOBS="${@ '${PARALLEL_MAKE}'.replace('-j', '-n ')}"
>     +    PARALLEL_JOBS="${@oe.utils.parallel_make_argument(d, '-n %d')}"
>           OVMF_ARCH="X64"
>           if [ "${TARGET_ARCH}" != "x86_64" ] ; then
>               OVMF_ARCH="IA32"
>     diff --git a/meta/recipes-support/boost/boost.inc
>     b/meta/recipes-support/boost/boost.inc
>     index 41fc90fb211..0461ec6fcf1 100644
>     --- a/meta/recipes-support/boost/boost.inc
>     +++ b/meta/recipes-support/boost/boost.inc
>     @@ -135,29 +135,7 @@ BJAM_TOOLS   = "--ignore-site-config \
> 
>       # use PARALLEL_MAKE to speed up the build, but limit it by -j 64,
>     greater parallelism causes bjam to segfault or to ignore -j
>       # https://svn.boost.org/trac/boost/ticket/7634
>     <https://svn.boost.org/trac/boost/ticket/7634>
>     -def get_boost_parallel_make(d):
>     -    pm = d.getVar('PARALLEL_MAKE')
>     -    if pm:
>     -        # look for '-j' and throw other options (e.g. '-l') away
>     -        # because they might have different meaning in bjam
>     -        pm = pm.split()
>     -        while pm:
>     -            v = None
>     -            opt = pm.pop(0)
>     -            if opt == '-j':
>     -                v = pm.pop(0)
>     -            elif opt.startswith('-j'):
>     -                v = opt[2:].strip()
>     -            else:
>     -                v = None
>     -
>     -            if v:
>     -                v = min(64, int(v))
>     -                return '-j' + str(v)
>     -
>     -    return ""
>     -
>     -BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(d)}"
>     +BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d,
>     '-j%d', limit=64)}"
>       BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
>                      ${BJAM_TOOLS} \
>                      -sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam \
>     --
>     2.14.3
> 
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 
> 


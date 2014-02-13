Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FBAB6E898
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 03:40:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1D3eGUr026538
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Feb 2014 19:40:16 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 12 Feb 2014 19:38:38 -0800
Message-ID: <52FC3E39.8020601@windriver.com>
Date: Thu, 13 Feb 2014 11:38:33 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1392259689.git.hongxu.jia@windriver.com>	<44d5a04a1b2ed639f0f65a05418a63d4cfe7b6d5.1392259689.git.hongxu.jia@windriver.com>
	<CAMKF1spfiZ3298jFuL1k7V_pdnBpBVbvTvuk13R2yv_7TLLDeQ@mail.gmail.com>
In-Reply-To: <CAMKF1spfiZ3298jFuL1k7V_pdnBpBVbvTvuk13R2yv_7TLLDeQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 2/2] socat: enable ptest
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
X-List-Received-Date: Thu, 13 Feb 2014 03:40:17 -0000
Content-Type: multipart/alternative;
	boundary="------------030705080303020701070406"

--------------030705080303020701070406
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2014 11:26 AM, Khem Raj wrote:
>
> -Khem
> On Feb 12, 2014 6:57 PM, "Hongxu Jia" <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>>
> > ---
> >  meta/recipes-connectivity/socat/socat/run-ptest  |  5 +++++
> >  meta/recipes-connectivity/socat/socat_1.7.2.3.bb 
> <http://socat_1.7.2.3.bb> | 12 ++++++++++--
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/recipes-connectivity/socat/socat/run-ptest
> >
> > diff --git a/meta/recipes-connectivity/socat/socat/run-ptest 
> b/meta/recipes-connectivity/socat/socat/run-ptest
> > new file mode 100644
> > index 0000000..1fffab1
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/socat/socat/run-ptest
> > @@ -0,0 +1,5 @@
> > +#!/bin/bash
>
> is bash really needed ?
>

Yes, I am sure.
The socat's FAQ:
...
  23 Q: I succeeded to configure and make socat, but ./test.sh says 
something
  24 like:
  25 ./test.sh: No such file or directory
  26
  27 A: You need a bash shell, and its location must be correctly 
specified in the
  28 first line of test.sh, e.g. /usr/local/bin/bash instead of /bin/bash.
...

//Hongxu

> > +
> > +export SOCAT="/usr/bin/socat"
> > +
> > +./test.sh
> > diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.3.bb 
> <http://socat_1.7.2.3.bb> 
> b/meta/recipes-connectivity/socat/socat_1.7.2.3.bb 
> <http://socat_1.7.2.3.bb>
> > index 99060b1..2e763bb 100644
> > --- a/meta/recipes-connectivity/socat/socat_1.7.2.3.bb 
> <http://socat_1.7.2.3.bb>
> > +++ b/meta/recipes-connectivity/socat/socat_1.7.2.3.bb 
> <http://socat_1.7.2.3.bb>
> > @@ -7,6 +7,8 @@ SECTION = "console/network"
> >
> >  DEPENDS = "openssl readline"
> >
> > +RDEPENDS_${PN}-ptest += "bash"
> > +
> >  LICENSE = "GPL-2.0+-with-OpenSSL-exception"
> >  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
> > 
>  file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e"
> > @@ -14,7 +16,9 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
> >
> >  SRC_URI = 
> "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 
> <http://www.dest-unreach.org/socat/download/socat-$%7BPV%7D.tar.bz2> \
> >             file://compile.patch \
> > -           file://fix-xxx_SHIFT-autoheader.patch"
> > +           file://fix-xxx_SHIFT-autoheader.patch \
> > +           file://run-ptest \
> > +"
> >
> >  SRC_URI[md5sum] = "75008d8baf7c6c9e27aa7afb34a622de"
> >  SRC_URI[sha256sum] = 
> "0598ac54af7b138cda9e3c141bcf0cc63eeb2ab31f468a772dc3f7eb3896aad0"
> > @@ -27,7 +31,7 @@ EXTRA_OECONF += "ac_cv_have_z_modifier=yes 
> sc_cv_sys_crdly_shift=9 \
> >          ac_cv_ispeed_offset=13 \
> >  "
> >
> > -inherit autotools
> > +inherit autotools ptest
> >
> >  do_configure_prepend() {
> >      sed '/AC_DEFINE_UNQUOTED(ISPEED_OFFSET/a\AC_DEFINE(OSPEED_OFFSET,\
> > @@ -38,3 +42,7 @@ do_install_prepend () {
> >      mkdir -p ${D}${bindir}
> >      install -d ${D}${bindir} ${D}${mandir}/man1
> >  }
> > +
> > +do_install_ptest() {
> > +    cp -r ${S}/*.sh ${D}${PTEST_PATH}
> > +}
> > --
> > 1.8.1.2
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org 
> <mailto:Openembedded-core@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------030705080303020701070406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 02/13/2014 11:26 AM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1spfiZ3298jFuL1k7V_pdnBpBVbvTvuk13R2yv_7TLLDeQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p dir="ltr">-Khem<br>
        On Feb 12, 2014 6:57 PM, "Hongxu Jia" &lt;<a
          moz-do-not-send="true" href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;
        wrote:<br>
        &gt;<br>
        &gt; Signed-off-by: Hongxu Jia &lt;<a moz-do-not-send="true"
          href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
        &gt; ---<br>
        &gt;  meta/recipes-connectivity/socat/socat/run-ptest  |  5
        +++++<br>
        &gt;  meta/recipes-connectivity/socat/<a moz-do-not-send="true"
          href="http://socat_1.7.2.3.bb">socat_1.7.2.3.bb</a> | 12
        ++++++++++--<br>
        &gt;  2 files changed, 15 insertions(+), 2 deletions(-)<br>
        &gt;  create mode 100644
        meta/recipes-connectivity/socat/socat/run-ptest<br>
        &gt;<br>
        &gt; diff --git
        a/meta/recipes-connectivity/socat/socat/run-ptest
        b/meta/recipes-connectivity/socat/socat/run-ptest<br>
        &gt; new file mode 100644<br>
        &gt; index 0000000..1fffab1<br>
        &gt; --- /dev/null<br>
        &gt; +++ b/meta/recipes-connectivity/socat/socat/run-ptest<br>
        &gt; @@ -0,0 +1,5 @@<br>
        &gt; +#!/bin/bash</p>
      <p dir="ltr">is bash really needed ?<br>
      </p>
    </blockquote>
    <br>
    Yes, I am sure.<br>
    The socat's FAQ:<br>
    ...<br>
     23 Q: I succeeded to configure and make socat, but ./test.sh says
    something<br>
     24 like:<br>
     25 ./test.sh: No such file or directory<br>
     26 <br>
     27 A: You need a bash shell, and its location must be correctly
    specified in the<br>
     28 first line of test.sh, e.g. /usr/local/bin/bash instead of
    /bin/bash.<br>
    ...<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAMKF1spfiZ3298jFuL1k7V_pdnBpBVbvTvuk13R2yv_7TLLDeQ@mail.gmail.com"
      type="cite">
      <p dir="ltr">
        &gt; +<br>
        &gt; +export SOCAT="/usr/bin/socat"<br>
        &gt; +<br>
        &gt; +./test.sh<br>
        &gt; diff --git a/meta/recipes-connectivity/socat/<a
          moz-do-not-send="true" href="http://socat_1.7.2.3.bb">socat_1.7.2.3.bb</a>
        b/meta/recipes-connectivity/socat/<a moz-do-not-send="true"
          href="http://socat_1.7.2.3.bb">socat_1.7.2.3.bb</a><br>
        &gt; index 99060b1..2e763bb 100644<br>
        &gt; --- a/meta/recipes-connectivity/socat/<a
          moz-do-not-send="true" href="http://socat_1.7.2.3.bb">socat_1.7.2.3.bb</a><br>
        &gt; +++ b/meta/recipes-connectivity/socat/<a
          moz-do-not-send="true" href="http://socat_1.7.2.3.bb">socat_1.7.2.3.bb</a><br>
        &gt; @@ -7,6 +7,8 @@ SECTION = "console/network"<br>
        &gt;<br>
        &gt;  DEPENDS = "openssl readline"<br>
        &gt;<br>
        &gt; +RDEPENDS_${PN}-ptest += "bash"<br>
        &gt; +<br>
        &gt;  LICENSE = "GPL-2.0+-with-OpenSSL-exception"<br>
        &gt;  LIC_FILES_CHKSUM =
        "<a class="moz-txt-link-freetext" href="file://COPYING;md5=18810669f13b87348459e611d31ab760">file://COPYING;md5=18810669f13b87348459e611d31ab760</a> \<br>
        &gt;                    
 <a class="moz-txt-link-freetext" href="file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e">file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e</a>"<br>
        &gt; @@ -14,7 +16,9 @@ LIC_FILES_CHKSUM =
        "<a class="moz-txt-link-freetext" href="file://COPYING;md5=18810669f13b87348459e611d31ab760">file://COPYING;md5=18810669f13b87348459e611d31ab760</a> \<br>
        &gt;<br>
        &gt;  SRC_URI = "<a moz-do-not-send="true"
href="http://www.dest-unreach.org/socat/download/socat-$%7BPV%7D.tar.bz2">http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2</a>
        \<br>
        &gt;             <a class="moz-txt-link-freetext" href="file://compile.patch">file://compile.patch</a> \<br>
        &gt; -           <a class="moz-txt-link-freetext" href="file://fix-xxx_SHIFT-autoheader.patch">file://fix-xxx_SHIFT-autoheader.patch</a>"<br>
        &gt; +           <a class="moz-txt-link-freetext" href="file://fix-xxx_SHIFT-autoheader.patch">file://fix-xxx_SHIFT-autoheader.patch</a> \<br>
        &gt; +           <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \<br>
        &gt; +"<br>
        &gt;<br>
        &gt;  SRC_URI[md5sum] = "75008d8baf7c6c9e27aa7afb34a622de"<br>
        &gt;  SRC_URI[sha256sum] =
        "0598ac54af7b138cda9e3c141bcf0cc63eeb2ab31f468a772dc3f7eb3896aad0"<br>
        &gt; @@ -27,7 +31,7 @@ EXTRA_OECONF +=
        "ac_cv_have_z_modifier=yes sc_cv_sys_crdly_shift=9 \<br>
        &gt;          ac_cv_ispeed_offset=13 \<br>
        &gt;  "<br>
        &gt;<br>
        &gt; -inherit autotools<br>
        &gt; +inherit autotools ptest<br>
        &gt;<br>
        &gt;  do_configure_prepend() {<br>
        &gt;      sed
        '/AC_DEFINE_UNQUOTED(ISPEED_OFFSET/a\AC_DEFINE(OSPEED_OFFSET,\<br>
        &gt; @@ -38,3 +42,7 @@ do_install_prepend () {<br>
        &gt;      mkdir -p ${D}${bindir}<br>
        &gt;      install -d ${D}${bindir} ${D}${mandir}/man1<br>
        &gt;  }<br>
        &gt; +<br>
        &gt; +do_install_ptest() {<br>
        &gt; +    cp -r ${S}/*.sh ${D}${PTEST_PATH}<br>
        &gt; +}<br>
        &gt; --<br>
        &gt; 1.8.1.2<br>
        &gt;<br>
        &gt; _______________________________________________<br>
        &gt; Openembedded-core mailing list<br>
        &gt; <a moz-do-not-send="true"
          href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
        &gt; <a moz-do-not-send="true"
          href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
      </p>
    </blockquote>
    <br>
  </body>
</html>

--------------030705080303020701070406--

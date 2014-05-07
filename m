Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A19B360559
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 02:54:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s472seaC024332
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 May 2014 19:54:40 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 6 May 2014 19:54:39 -0700
Message-ID: <5369A07A.3050006@windriver.com>
Date: Wed, 7 May 2014 10:54:50 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1399428662.git.Qi.Chen@windriver.com>	<4fa3366ba6f01dbeedc243bcc512a967d5b39374.1399428662.git.Qi.Chen@windriver.com>
	<CAMKF1sqme+v9167=DfCG16kY8Y2Bft5wFoandyFk0oYqpwcmkQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqme+v9167=DfCG16kY8Y2Bft5wFoandyFk0oYqpwcmkQ@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sudo: upgrade from 1.8.9p5 to 1.8.10p2
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
X-List-Received-Date: Wed, 07 May 2014 02:54:40 -0000
Content-Type: multipart/alternative;
	boundary="------------030701040101010706060306"

--------------030701040101010706060306
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2014 10:30 AM, Khem Raj wrote:
>
>
> On May 6, 2014 7:12 PM, "Chen Qi" <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
> >
> > Upgrade sudo from 1.8.9p5 to the newest stable release 1.8.10p2.
> >
> > The license information is modified as required.
>
> can you b more explicit here and provide information as to what 
> changed exactly?
>

V2 sent with commit message modified.

Thanks,
Chen Qi


> >
> > As /var/run/sudo is the default directory for sudo's time stamp
> > files, this patch adds a configuration file to manage this directory.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>>
> > ---
> >  meta/recipes-extended/sudo/files/volatiles.99_sudo |    1 +
> >  meta/recipes-extended/sudo/sudo.inc                |    6 +++---
> >  .../sudo/{sudo_1.8.9p5.bb <http://sudo_1.8.9p5.bb> => 
> sudo_1.8.10p2.bb <http://sudo_1.8.10p2.bb>}     |   13 ++++++++++---
> >  3 files changed, 14 insertions(+), 6 deletions(-)
> >  create mode 100644 meta/recipes-extended/sudo/files/volatiles.99_sudo
> >  rename meta/recipes-extended/sudo/{sudo_1.8.9p5.bb 
> <http://sudo_1.8.9p5.bb> => sudo_1.8.10p2.bb 
> <http://sudo_1.8.10p2.bb>} (57%)
> >
> > diff --git a/meta/recipes-extended/sudo/files/volatiles.99_sudo 
> b/meta/recipes-extended/sudo/files/volatiles.99_sudo
> > new file mode 100644
> > index 0000000..ecb576e
> > --- /dev/null
> > +++ b/meta/recipes-extended/sudo/files/volatiles.99_sudo
> > @@ -0,0 +1 @@
> > +d root root 0755 /var/run/sudo none
> > diff --git a/meta/recipes-extended/sudo/sudo.inc 
> b/meta/recipes-extended/sudo/sudo.inc
> > index 0aa5193..6de984a 100644
> > --- a/meta/recipes-extended/sudo/sudo.inc
> > +++ b/meta/recipes-extended/sudo/sudo.inc
> > @@ -4,13 +4,14 @@ HOMEPAGE = "http://www.sudo.ws"
> >  BUGTRACKER = "http://www.sudo.ws/bugs/"
> >  SECTION = "admin"
> >  LICENSE = "ISC & BSD & Zlib"
> > -LIC_FILES_CHKSUM = 
> "file://doc/LICENSE;md5=923752f88decdea9d69f92fe42c2af80 \
> > +LIC_FILES_CHKSUM = 
> "file://doc/LICENSE;md5=69e337d679950e304953813158595256 \
> > 
>  file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=e2dbb155fc49beea947515300bab99e0 
> \
> > 
>  file://compat/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd 
> \
> > 
>  file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 
> \
> > 
>  file://compat/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 
> \
> > 
>  file://compat/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea 
> \
> > - 
>  file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681"
> > + 
>  file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 
> \
> > + 
>  file://compat/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a"
> >
> >  inherit autotools
> >
> > @@ -38,4 +39,3 @@ do_compile_prepend () {
> >  do_install_prepend (){
> >         mkdir -p ${D}/${localstatedir}/lib
> >  }
> > -
> > diff --git a/meta/recipes-extended/sudo/sudo_1.8.9p5.bb 
> <http://sudo_1.8.9p5.bb> b/meta/recipes-extended/sudo/sudo_1.8.10p2.bb 
> <http://sudo_1.8.10p2.bb>
> > similarity index 57%
> > rename from meta/recipes-extended/sudo/sudo_1.8.9p5.bb 
> <http://sudo_1.8.9p5.bb>
> > rename to meta/recipes-extended/sudo/sudo_1.8.10p2.bb 
> <http://sudo_1.8.10p2.bb>
> > index 7851473..aa8c445 100644
> > --- a/meta/recipes-extended/sudo/sudo_1.8.9p5.bb 
> <http://sudo_1.8.9p5.bb>
> > +++ b/meta/recipes-extended/sudo/sudo_1.8.10p2.bb 
> <http://sudo_1.8.10p2.bb>
> > @@ -1,12 +1,13 @@
> >  require sudo.inc
> >
> >  SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz 
> <http://ftp.sudo.ws/sudo/dist/sudo-$%7BPV%7D.tar.gz> \
> > -           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 
> '${PAM_SRC_URI}', '', d)}"
> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 
> '${PAM_SRC_URI}', '', d)} \
> > +           file://volatiles.99_sudo"
> >
> >  PAM_SRC_URI = "file://sudo.pam"
> >
> > -SRC_URI[md5sum] = "d3f1f1cfca6b2b06b048e1abb7d0227e"
> > -SRC_URI[sha256sum] = 
> "bc9d5c96de5f8b4d2b014f87a37870aef60d2891c869202454069150a21a5c21"
> > +SRC_URI[md5sum] = "5e5eab1036a7cc2c088ab0d9b6b6a42e"
> > +SRC_URI[sha256sum] = 
> "ba6cb8db6dccdb92a96e8ae63ca65c410f8b61270b603ab9af4b1154fef379f1"
> >
> >  DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 
> 'libpam', '', d)}"
> >  RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 
> 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
> > @@ -20,4 +21,10 @@ do_install_append () {
> >
> >         chmod 4111 ${D}${bindir}/sudo
> >         chmod 0440 ${D}${sysconfdir}/sudoers
> > +
> > +       # Explicitly remove the ${localstatedir}/run directory as we can
> > +       # manage it by a configuration file under 
> ${sysconfdir}/default/volatiles/
> > +       rmdir -p --ignore-fail-on-non-empty 
> ${D}${localstatedir}/run/sudo
> > +       install -d ${D}/${sysconfdir}/default/volatiles
> > +       install -m 644 ${WORKDIR}/volatiles.99_sudo 
> ${D}/${sysconfdir}/default/volatiles/99_sudo
> >  }
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org 
> <mailto:Openembedded-core@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------030701040101010706060306
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 05/07/2014 10:30 AM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1sqme+v9167=DfCG16kY8Y2Bft5wFoandyFk0oYqpwcmkQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p dir="ltr"><br>
        On May 6, 2014 7:12 PM, "Chen Qi" &lt;<a moz-do-not-send="true"
          href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;
        wrote:<br>
        &gt;<br>
        &gt; Upgrade sudo from 1.8.9p5 to the newest stable release
        1.8.10p2.<br>
        &gt;<br>
        &gt; The license information is modified as required.</p>
      <p dir="ltr">can you b more explicit here and provide information
        as to what changed exactly?</p>
    </blockquote>
    <br>
    V2 sent with commit message modified.<br>
    <br>
    Thanks,<br>
    Chen Qi<br>
    <br>
    <br>
    <blockquote
cite="mid:CAMKF1sqme+v9167=DfCG16kY8Y2Bft5wFoandyFk0oYqpwcmkQ@mail.gmail.com"
      type="cite">
      <p dir="ltr">&gt;<br>
        &gt; As /var/run/sudo is the default directory for sudo's time
        stamp<br>
        &gt; files, this patch adds a configuration file to manage this
        directory.<br>
        &gt;<br>
        &gt; Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
          href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
        &gt; ---<br>
        &gt;  meta/recipes-extended/sudo/files/volatiles.99_sudo |    1
        +<br>
        &gt;  meta/recipes-extended/sudo/sudo.inc                |    6
        +++---<br>
        &gt;  .../sudo/{<a moz-do-not-send="true"
          href="http://sudo_1.8.9p5.bb">sudo_1.8.9p5.bb</a> =&gt; <a
          moz-do-not-send="true" href="http://sudo_1.8.10p2.bb">sudo_1.8.10p2.bb</a>}
            |   13 ++++++++++---<br>
        &gt;  3 files changed, 14 insertions(+), 6 deletions(-)<br>
        &gt;  create mode 100644
        meta/recipes-extended/sudo/files/volatiles.99_sudo<br>
        &gt;  rename meta/recipes-extended/sudo/{<a
          moz-do-not-send="true" href="http://sudo_1.8.9p5.bb">sudo_1.8.9p5.bb</a>
        =&gt; <a moz-do-not-send="true" href="http://sudo_1.8.10p2.bb">sudo_1.8.10p2.bb</a>}
        (57%)<br>
        &gt;<br>
        &gt; diff --git
        a/meta/recipes-extended/sudo/files/volatiles.99_sudo
        b/meta/recipes-extended/sudo/files/volatiles.99_sudo<br>
        &gt; new file mode 100644<br>
        &gt; index 0000000..ecb576e<br>
        &gt; --- /dev/null<br>
        &gt; +++ b/meta/recipes-extended/sudo/files/volatiles.99_sudo<br>
        &gt; @@ -0,0 +1 @@<br>
        &gt; +d root root 0755 /var/run/sudo none<br>
        &gt; diff --git a/meta/recipes-extended/sudo/sudo.inc
        b/meta/recipes-extended/sudo/sudo.inc<br>
        &gt; index 0aa5193..6de984a 100644<br>
        &gt; --- a/meta/recipes-extended/sudo/sudo.inc<br>
        &gt; +++ b/meta/recipes-extended/sudo/sudo.inc<br>
        &gt; @@ -4,13 +4,14 @@ HOMEPAGE = "<a moz-do-not-send="true"
          href="http://www.sudo.ws">http://www.sudo.ws</a>"<br>
        &gt;  BUGTRACKER = "<a moz-do-not-send="true"
          href="http://www.sudo.ws/bugs/">http://www.sudo.ws/bugs/</a>"<br>
        &gt;  SECTION = "admin"<br>
        &gt;  LICENSE = "ISC &amp; BSD &amp; Zlib"<br>
        &gt; -LIC_FILES_CHKSUM =
        "<a class="moz-txt-link-freetext" href="file://doc/LICENSE;md5=923752f88decdea9d69f92fe42c2af80">file://doc/LICENSE;md5=923752f88decdea9d69f92fe42c2af80</a> \<br>
        &gt; +LIC_FILES_CHKSUM =
        "<a class="moz-txt-link-freetext" href="file://doc/LICENSE;md5=69e337d679950e304953813158595256">file://doc/LICENSE;md5=69e337d679950e304953813158595256</a> \<br>
        &gt;                    
         <a class="moz-txt-link-freetext" href="file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=e2dbb155fc49beea947515300bab99e0">file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=e2dbb155fc49beea947515300bab99e0</a>
        \<br>
        &gt;                    
         <a class="moz-txt-link-freetext" href="file://compat/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd">file://compat/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd</a>
        \<br>
        &gt;                    
         <a class="moz-txt-link-freetext" href="file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681">file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681</a>
        \<br>
        &gt;                    
         <a class="moz-txt-link-freetext" href="file://compat/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85">file://compat/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85</a>
        \<br>
        &gt;                    
         <a class="moz-txt-link-freetext" href="file://compat/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea">file://compat/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea</a>
        \<br>
        &gt; -                  
 <a class="moz-txt-link-freetext" href="file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681">file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681</a>"<br>
        &gt; +                  
         <a class="moz-txt-link-freetext" href="file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681">file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681</a>
        \<br>
        &gt; +                  
 <a class="moz-txt-link-freetext" href="file://compat/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a">file://compat/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a</a>"<br>
        &gt;<br>
        &gt;  inherit autotools<br>
        &gt;<br>
        &gt; @@ -38,4 +39,3 @@ do_compile_prepend () {<br>
        &gt;  do_install_prepend (){<br>
        &gt;         mkdir -p ${D}/${localstatedir}/lib<br>
        &gt;  }<br>
        &gt; -<br>
        &gt; diff --git a/meta/recipes-extended/sudo/<a
          moz-do-not-send="true" href="http://sudo_1.8.9p5.bb">sudo_1.8.9p5.bb</a>
        b/meta/recipes-extended/sudo/<a moz-do-not-send="true"
          href="http://sudo_1.8.10p2.bb">sudo_1.8.10p2.bb</a><br>
        &gt; similarity index 57%<br>
        &gt; rename from meta/recipes-extended/sudo/<a
          moz-do-not-send="true" href="http://sudo_1.8.9p5.bb">sudo_1.8.9p5.bb</a><br>
        &gt; rename to meta/recipes-extended/sudo/<a
          moz-do-not-send="true" href="http://sudo_1.8.10p2.bb">sudo_1.8.10p2.bb</a><br>
        &gt; index 7851473..aa8c445 100644<br>
        &gt; --- a/meta/recipes-extended/sudo/<a moz-do-not-send="true"
          href="http://sudo_1.8.9p5.bb">sudo_1.8.9p5.bb</a><br>
        &gt; +++ b/meta/recipes-extended/sudo/<a moz-do-not-send="true"
          href="http://sudo_1.8.10p2.bb">sudo_1.8.10p2.bb</a><br>
        &gt; @@ -1,12 +1,13 @@<br>
        &gt;  require sudo.inc<br>
        &gt;<br>
        &gt;  SRC_URI = "<a moz-do-not-send="true"
          href="http://ftp.sudo.ws/sudo/dist/sudo-$%7BPV%7D.tar.gz">http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz</a>
        \<br>
        &gt; -           ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
        '${PAM_SRC_URI}', '', d)}"<br>
        &gt; +           ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
        '${PAM_SRC_URI}', '', d)} \<br>
        &gt; +           <a class="moz-txt-link-freetext" href="file://volatiles.99_sudo">file://volatiles.99_sudo</a>"<br>
        &gt;<br>
        &gt;  PAM_SRC_URI = <a class="moz-txt-link-rfc2396E" href="file://sudo.pam">"file://sudo.pam"</a><br>
        &gt;<br>
        &gt; -SRC_URI[md5sum] = "d3f1f1cfca6b2b06b048e1abb7d0227e"<br>
        &gt; -SRC_URI[sha256sum] =
        "bc9d5c96de5f8b4d2b014f87a37870aef60d2891c869202454069150a21a5c21"<br>
        &gt; +SRC_URI[md5sum] = "5e5eab1036a7cc2c088ab0d9b6b6a42e"<br>
        &gt; +SRC_URI[sha256sum] =
        "ba6cb8db6dccdb92a96e8ae63ca65c410f8b61270b603ab9af4b1154fef379f1"<br>
        &gt;<br>
        &gt;  DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES',
        'pam', 'libpam', '', d)}"<br>
        &gt;  RDEPENDS_${PN} += "
        ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
        'pam-plugin-limits pam-plugin-keyinit', '', d)}"<br>
        &gt; @@ -20,4 +21,10 @@ do_install_append () {<br>
        &gt;<br>
        &gt;         chmod 4111 ${D}${bindir}/sudo<br>
        &gt;         chmod 0440 ${D}${sysconfdir}/sudoers<br>
        &gt; +<br>
        &gt; +       # Explicitly remove the ${localstatedir}/run
        directory as we can<br>
        &gt; +       # manage it by a configuration file under
        ${sysconfdir}/default/volatiles/<br>
        &gt; +       rmdir -p --ignore-fail-on-non-empty
        ${D}${localstatedir}/run/sudo<br>
        &gt; +       install -d ${D}/${sysconfdir}/default/volatiles<br>
        &gt; +       install -m 644 ${WORKDIR}/volatiles.99_sudo
        ${D}/${sysconfdir}/default/volatiles/99_sudo<br>
        &gt;  }<br>
        &gt; --<br>
        &gt; 1.7.9.5<br>
        &gt;<br>
        &gt; --<br>
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

--------------030701040101010706060306--

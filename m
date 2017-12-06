Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F64E7866F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 01:36:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB61a1Qx004552
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 5 Dec 2017 17:36:01 -0800
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 5 Dec 2017 17:36:01 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1512383059.git.Qi.Chen@windriver.com>
	<6738f34a7fff628636b703f8534af6feb55b099d.1512383059.git.Qi.Chen@windriver.com>
	<CAJTo0LaWUqqkY+cv6jScjgpDoEqPttyhZnKQZOYW4=D6DEsDQA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a2f40484-749f-72af-4ef8-b8a5a1e8edb2@windriver.com>
Date: Wed, 6 Dec 2017 09:37:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaWUqqkY+cv6jScjgpDoEqPttyhZnKQZOYW4=D6DEsDQA@mail.gmail.com>
X-Originating-IP: [128.224.162.167]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] coreutils: upgrade to 8.28
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
X-List-Received-Date: Wed, 06 Dec 2017 01:36:01 -0000
Content-Type: multipart/alternative;
	boundary="------------9EA335A97840EC9410434838"

--------------9EA335A97840EC9410434838
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2017 07:38 PM, Burton, Ross wrote:
> Looks like this fails on hosts with older makeinfo:
>
> http://errors.yoctoproject.org/Errors/Details/160224/
>
> Ross
>


I'll find a CentOS7 host and try to reproduce and fix this problem.

Best Regards,
Chen Qi

> On 4 December 2017 at 10:25, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      .../coreutils/{coreutils_8.27.bb <http://coreutils_8.27.bb> =>
>     coreutils_8.28.bb <http://coreutils_8.28.bb>}         | 8 ++++----
>      1 file changed, 4 insertions(+), 4 deletions(-)
>      rename meta/recipes-core/coreutils/{coreutils_8.27.bb
>     <http://coreutils_8.27.bb> => coreutils_8.28.bb
>     <http://coreutils_8.28.bb>} (95%)
>
>     diff --git a/meta/recipes-core/coreutils/coreutils_8.27.bb
>     <http://coreutils_8.27.bb>
>     b/meta/recipes-core/coreutils/coreutils_8.28.bb
>     <http://coreutils_8.28.bb>
>     similarity index 95%
>     rename from meta/recipes-core/coreutils/coreutils_8.27.bb
>     <http://coreutils_8.27.bb>
>     rename to meta/recipes-core/coreutils/coreutils_8.28.bb
>     <http://coreutils_8.28.bb>
>     index ea8740a..0543ceb 100644
>     --- a/meta/recipes-core/coreutils/coreutils_8.27.bb
>     <http://coreutils_8.27.bb>
>     +++ b/meta/recipes-core/coreutils/coreutils_8.28.bb
>     <http://coreutils_8.28.bb>
>     @@ -23,10 +23,10 @@ SRC_URI =
>     "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
>                 file://0001-local.mk-fix-cross-compiling-problem.patch \
>                "
>
>     -SRC_URI[tarball.md5sum] = "502795792c212932365e077946d353ae"
>     -SRC_URI[tarball.sha256sum] =
>     "8891d349ee87b9ff7870f52b6d9312a9db672d2439d289bc57084771ca21656b"
>     -SRC_URI[manpages.md5sum] = "1b31a688d06764e0e94aa20b7ea08222"
>     -SRC_URI[manpages.sha256sum] =
>     "1f615819e9167646c731636b6c5ecbe79837e82a18666bacc82c3fb1dfcfaea3"
>     +SRC_URI[tarball.md5sum] = "e7cb20d0572cc40d9f47ede6454406d1"
>     +SRC_URI[tarball.sha256sum] =
>     "1117b1a16039ddd84d51a9923948307cfa28c2cea03d1a2438742253df0a0c65"
>     +SRC_URI[manpages.md5sum] = "3a7c626aad1c9077f254e5c2553a2f60"
>     +SRC_URI[manpages.sha256sum] =
>     "d72c3fa79ae328a4fd1107102e8946755aa2e908044e1efcf1e71ef206dca042"
>
>      EXTRA_OECONF_class-native = "--without-gmp"
>      EXTRA_OECONF_class-target = "--enable-install-program=arch
>     --libexecdir=${libdir}"
>     --
>     1.9.1
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


--------------9EA335A97840EC9410434838
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/05/2017 07:38 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaWUqqkY+cv6jScjgpDoEqPttyhZnKQZOYW4=D6DEsDQA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Looks like this fails on hosts with older makeinfo:
        <div><br>
        </div>
        <div><a moz-do-not-send="true"
            href="http://errors.yoctoproject.org/Errors/Details/160224/">http://errors.yoctoproject.org/Errors/Details/160224/</a><br>
        </div>
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
      </div>
    </blockquote>
    <br>
    <br>
    I'll find a CentOS7 host and try to reproduce and fix this problem.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaWUqqkY+cv6jScjgpDoEqPttyhZnKQZOYW4=D6DEsDQA@mail.gmail.com"
      type="cite">
      <div class="gmail_extra">
        <div class="gmail_quote">On 4 December 2017 at 10:25, Chen Qi <span
            dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by:
            Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            ---<br>
             .../coreutils/{<a moz-do-not-send="true"
              href="http://coreutils_8.27.bb" rel="noreferrer"
              target="_blank">coreutils_8.27.<wbr>bb</a> =&gt; <a
              moz-do-not-send="true" href="http://coreutils_8.28.bb"
              rel="noreferrer" target="_blank">coreutils_8.28.bb</a>}   
                    | 8 ++++----<br>
             1 file changed, 4 insertions(+), 4 deletions(-)<br>
             rename meta/recipes-core/coreutils/{<a
              moz-do-not-send="true" href="http://coreutils_8.27.bb"
              rel="noreferrer" target="_blank">c<wbr>oreutils_8.27.bb</a>
            =&gt; <a moz-do-not-send="true"
              href="http://coreutils_8.28.bb" rel="noreferrer"
              target="_blank">coreutils_8.28.bb</a>} (95%)<br>
            <br>
            diff --git a/meta/recipes-core/coreutils/<a
              moz-do-not-send="true" href="http://coreutils_8.27.bb"
              rel="noreferrer" target="_blank"><wbr>coreutils_8.27.bb</a>
            b/meta/recipes-core/coreutils/<a moz-do-not-send="true"
              href="http://coreutils_8.28.bb" rel="noreferrer"
              target="_blank"><wbr>coreutils_8.28.bb</a><br>
            similarity index 95%<br>
            rename from meta/recipes-core/coreutils/<a
              moz-do-not-send="true" href="http://coreutils_8.27.bb"
              rel="noreferrer" target="_blank">co<wbr>reutils_8.27.bb</a><br>
            rename to meta/recipes-core/coreutils/<a
              moz-do-not-send="true" href="http://coreutils_8.28.bb"
              rel="noreferrer" target="_blank">co<wbr>reutils_8.28.bb</a><br>
            index ea8740a..0543ceb 100644<br>
            --- a/meta/recipes-core/coreutils/<a moz-do-not-send="true"
              href="http://coreutils_8.27.bb" rel="noreferrer"
              target="_blank"><wbr>coreutils_8.27.bb</a><br>
            +++ b/meta/recipes-core/coreutils/<a moz-do-not-send="true"
              href="http://coreutils_8.28.bb" rel="noreferrer"
              target="_blank"><wbr>coreutils_8.28.bb</a><br>
            @@ -23,10 +23,10 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}<wbr>.tar.xz;name=tarball
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0001-local.mk-fix">file://0001-local.mk-fix</a>-<wbr>cross-compiling-problem.patch
            \<br>
                       "<br>
            <br>
            -SRC_URI[tarball.md5sum] = "<wbr>502795792c212932365e077946d353<wbr>ae"<br>
            -SRC_URI[tarball.sha256sum] = "<wbr>8891d349ee87b9ff7870f52b6d9312<wbr>a9db672d2439d289bc57084771ca21<wbr>656b"<br>
            -SRC_URI[manpages.md5sum] = "<wbr>1b31a688d06764e0e94aa20b7ea082<wbr>22"<br>
            -SRC_URI[manpages.sha256sum] = "<wbr>1f615819e9167646c731636b6c5ecb<wbr>e79837e82a18666bacc82c3fb1dfcf<wbr>aea3"<br>
            +SRC_URI[tarball.md5sum] = "<wbr>e7cb20d0572cc40d9f47ede6454406<wbr>d1"<br>
            +SRC_URI[tarball.sha256sum] = "<wbr>1117b1a16039ddd84d51a992394830<wbr>7cfa28c2cea03d1a2438742253df0a<wbr>0c65"<br>
            +SRC_URI[manpages.md5sum] = "<wbr>3a7c626aad1c9077f254e5c2553a2f<wbr>60"<br>
            +SRC_URI[manpages.sha256sum] = "<wbr>d72c3fa79ae328a4fd1107102e8946<wbr>755aa2e908044e1efcf1e71ef206dc<wbr>a042"<br>
            <br>
             EXTRA_OECONF_class-native = "--without-gmp"<br>
             EXTRA_OECONF_class-target = "--enable-install-program=arch
            --libexecdir=${libdir}"<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                1.9.1<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a moz-do-not-send="true"
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------9EA335A97840EC9410434838--

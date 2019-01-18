Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 201BB6BCDC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 01:30:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0I1TWEF002312
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Jan 2019 17:29:42 -0800
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 17 Jan 2019 17:29:21 -0800
To: Christopher Larson <kergoth@gmail.com>
References: <20190117071227.57387-1-kai.kang@windriver.com>
	<CABcZANkxhSTj+bha5Sn4zqgjFKCUZUq8XTT0KDj7hndK3Da-Pg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5e2764d7-02e0-8419-9bbe-47750021e103@windriver.com>
Date: Fri, 18 Jan 2019 09:29:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CABcZANkxhSTj+bha5Sn4zqgjFKCUZUq8XTT0KDj7hndK3Da-Pg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: reset default value of DEBUG_PREFIX_MAP
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
X-List-Received-Date: Fri, 18 Jan 2019 01:30:25 -0000
Content-Type: multipart/alternative;
	boundary="------------3D1FFE0C764E9A66C0E2ABA7"
Content-Language: en-US

--------------3D1FFE0C764E9A66C0E2ABA7
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2019/1/17 下午11:19, Christopher Larson wrote:
> The commit message doesn’t match what you’re actually doing. 
> "Specifying -fdebug-prefix-map is equivalent to specifying all 
> the individual -f*-prefix-map options which means 
> including -fmacro-prefix-map and -fdebug-prefix-map currently” I 
> assume you mean "Specifying -ffile-prefix-map” there.


Sorry typo here.

Regards,
Kai


>
> On Thu, Jan 17, 2019 at 12:13 AM <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     Reset default value of DEBUG_PREFIX_MAP with '-fdebug-prefix-map'.
>     Specifying -fdebug-prefix-map is equivalent to specifying all the
>     individual -f*-prefix-map options which means including
>     -fmacro-prefix-map and -fdebug-prefix-map currently. Option
>     -fmacro-prefix-map helps to avoid buildpaths qa warnings which caused
>     by __FILE__ macro expansion for packages such as llvm and librepo.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>      meta/conf/bitbake.conf | 6 +++---
>      1 file changed, 3 insertions(+), 3 deletions(-)
>
>     diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>     index 0bdcd04d74..d20460e845 100644
>     --- a/meta/conf/bitbake.conf
>     +++ b/meta/conf/bitbake.conf
>     @@ -599,9 +599,9 @@ EXTRA_OEMAKE_prepend_task-install =
>     "${PARALLEL_MAKEINST} "
>      # Optimization flags.
>      ##################################################################
>      # Beware: applied last to first
>     -DEBUG_PREFIX_MAP ?=
>     "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}
>     \
>     -                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
>     -  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
>     +DEBUG_PREFIX_MAP ?=
>     "-ffile-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}
>     \
>     +                     -ffile-prefix-map=${STAGING_DIR_HOST}= \
>     +                     -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
>      "
>      DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types
>     ${DEBUG_PREFIX_MAP}"
>
>     -- 
>     2.20.0
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics


-- 
Kai Kang


--------------3D1FFE0C764E9A66C0E2ABA7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2019/1/17 下午11:19, Christopher
      Larson wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABcZANkxhSTj+bha5Sn4zqgjFKCUZUq8XTT0KDj7hndK3Da-Pg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">The commit message doesn’t match what you’re
          actually doing. "Specifying -fdebug-prefix-map is equivalent
          to specifying all the individual -f*-prefix-map options which
          means including -fmacro-prefix-map and -fdebug-prefix-map
          currently” I assume you mean "Specifying -ffile-prefix-map”
          there.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Sorry typo here.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CABcZANkxhSTj+bha5Sn4zqgjFKCUZUq8XTT0KDj7hndK3Da-Pg@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, Jan 17, 2019 at 12:13
          AM &lt;<a href="mailto:kai.kang@windriver.com"
            moz-do-not-send="true">kai.kang@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">From:
          Kai Kang &lt;<a href="mailto:kai.kang@windriver.com"
            target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
          <br>
          Reset default value of DEBUG_PREFIX_MAP with
          '-fdebug-prefix-map'.<br>
          Specifying -fdebug-prefix-map is equivalent to specifying all
          the<br>
          individual -f*-prefix-map options which means including<br>
          -fmacro-prefix-map and -fdebug-prefix-map currently. Option<br>
          -fmacro-prefix-map helps to avoid buildpaths qa warnings which
          caused<br>
          by __FILE__ macro expansion for packages such as llvm and
          librepo.<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a
            href="mailto:kai.kang@windriver.com" target="_blank"
            moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
          ---<br>
           meta/conf/bitbake.conf | 6 +++---<br>
           1 file changed, 3 insertions(+), 3 deletions(-)<br>
          <br>
          diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
          index 0bdcd04d74..d20460e845 100644<br>
          --- a/meta/conf/bitbake.conf<br>
          +++ b/meta/conf/bitbake.conf<br>
          @@ -599,9 +599,9 @@ EXTRA_OEMAKE_prepend_task-install =
          "${PARALLEL_MAKEINST} "<br>
           # Optimization flags.<br>
 ##################################################################<br>
           # Beware: applied last to first<br>
          -DEBUG_PREFIX_MAP ?=
"-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}
          \<br>
          -                     -fdebug-prefix-map=${STAGING_DIR_HOST}=
          \<br>
          -                   
           -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \<br>
          +DEBUG_PREFIX_MAP ?=
"-ffile-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}
          \<br>
          +                     -ffile-prefix-map=${STAGING_DIR_HOST}= \<br>
          +                     -ffile-prefix-map=${STAGING_DIR_NATIVE}=
          \<br>
           "<br>
           DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types
          ${DEBUG_PREFIX_MAP}"<br>
          <br>
          -- <br>
          2.20.0<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
      <br clear="all">
      <div><br>
      </div>
      -- <br>
      <div dir="ltr" class="gmail_signature">
        <div dir="ltr">
          <div>
            <div dir="ltr">Christopher Larson<br>
              kergoth at gmail dot com<br>
              Founder - BitBake, OpenEmbedded, OpenZaurus<br>
              Senior Software Engineer, Mentor Graphics</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang</pre>
  </body>
</html>

--------------3D1FFE0C764E9A66C0E2ABA7--

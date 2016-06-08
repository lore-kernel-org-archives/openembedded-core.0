Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E99206FEE0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 19:23:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jun 2016 12:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,440,1459839600"; 
	d="scan'208,217";a="993786907"
Received: from unknown (HELO [10.255.70.63]) ([10.255.70.63])
	by orsmga002.jf.intel.com with ESMTP; 08 Jun 2016 12:23:52 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
	<d569eff9957384d9f04fc1c3b3f54c9dd61e6cb9.1465365165.git.alejandro.hernandez@linux.intel.com>
	<CAHiDW_EhH30=8tifRos=EVJA+U27KO342_1DVjUJ2DsFTjumQQ@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <575870CF.8030508@linux.intel.com>
Date: Wed, 8 Jun 2016 14:23:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAHiDW_EhH30=8tifRos=EVJA+U27KO342_1DVjUJ2DsFTjumQQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] python3-pygobject: Upgrade from 3.18.2 to 3.21.0
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
X-List-Received-Date: Wed, 08 Jun 2016 19:23:53 -0000
Content-Type: multipart/alternative;
	boundary="------------040803020602010608080800"

--------------040803020602010608080800
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2016 03:38 AM, Jussi Kukkonen wrote:
> On 8 June 2016 at 08:56, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
> >
> > Signed-off-by: Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>>
> > ---
> >  .../{python3-pygobject_3.18.2.bb 
> <http://python3-pygobject_3.18.2.bb> => python3-pygobject_3.21.0.bb 
> <http://python3-pygobject_3.21.0.bb>}      | 4 ++--
>
> I think python3-pygobject follows the "minor-even-is-stable" release 
> numbering typical to GNOME projects.
> If that is correct, then 3.20.x might be better and inheriting 
> "upstream-version-is-even" would make sense.
>
> Jussi
I wasnt aware of this, I'll be sending a patch to upgrade to 3.20.1 later.

>
> >
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-devtools/python/{python3-pygobject_3.18.2.bb 
> <http://python3-pygobject_3.18.2.bb> => python3-pygobject_3.21.0.bb 
> <http://python3-pygobject_3.21.0.bb>} (81%)
> >
> > diff --git 
> a/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb 
> <http://python3-pygobject_3.18.2.bb> 
> b/meta/recipes-devtools/python/python3-pygobject_3.21.0.bb 
> <http://python3-pygobject_3.21.0.bb>
> > similarity index 81%
> > rename from meta/recipes-devtools/python/python3-pygobject_3.18.2.bb 
> <http://python3-pygobject_3.18.2.bb>
> > rename to meta/recipes-devtools/python/python3-pygobject_3.21.0.bb 
> <http://python3-pygobject_3.21.0.bb>
> > index 4ddae81..e5990d6 100644
> > --- a/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb 
> <http://python3-pygobject_3.18.2.bb>
> > +++ b/meta/recipes-devtools/python/python3-pygobject_3.21.0.bb 
> <http://python3-pygobject_3.21.0.bb>
> > @@ -13,8 +13,8 @@ SRC_URI = " \
> > 
>  file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
> >  "
> >
> > -SRC_URI[md5sum] = "0a956f3e785e23b0f136832f2e57a862"
> > -SRC_URI[sha256sum] = 
> "2a3cad1517916b74e131e6002c3824361aee0671ffb0d55ded119477fc1c2c5f"
> > +SRC_URI[md5sum] = "a6dba83e3a7df52ba80bd02906f74611"
> > +SRC_URI[sha256sum] = 
> "898c9ef2f80968ccf33d6fbd5087b1721b74792a308b277d02bc935450168a58"
> >
> >  S = "${WORKDIR}/${SRCNAME}-${PV}"
> >
> > --
> > 2.6.6
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org 
> <mailto:Openembedded-core@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------040803020602010608080800
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 06/08/2016 03:38 AM, Jussi Kukkonen wrote:<br>
    <blockquote
cite="mid:CAHiDW_EhH30=8tifRos=EVJA+U27KO342_1DVjUJ2DsFTjumQQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">On 8 June 2016 at 08:56, Alejandro Hernandez &lt;<a
          moz-do-not-send="true"
          href="mailto:alejandro.hernandez@linux.intel.com"><a class="moz-txt-link-abbreviated" href="mailto:alejandro.hernandez@linux.intel.com">alejandro.hernandez@linux.intel.com</a></a>&gt;
        wrote:<br>
        &gt;<br>
        &gt; Signed-off-by: Alejandro Hernandez &lt;<a
          moz-do-not-send="true"
          href="mailto:alejandro.hernandez@linux.intel.com"><a class="moz-txt-link-abbreviated" href="mailto:alejandro.hernandez@linux.intel.com">alejandro.hernandez@linux.intel.com</a></a>&gt;<br>
        &gt; ---<br>
        &gt;  .../{<a moz-do-not-send="true"
          href="http://python3-pygobject_3.18.2.bb">python3-pygobject_3.18.2.bb</a>
        =&gt; <a moz-do-not-send="true"
          href="http://python3-pygobject_3.21.0.bb">python3-pygobject_3.21.0.bb</a>}
             | 4 ++--<br>
        <br>
        I think python3-pygobject follows the "minor-even-is-stable"
        release numbering typical to GNOME projects. <br>
        If that is correct, then 3.20.x might be better and inheriting
        "upstream-version-is-even" would make sense.<br>
        <br>
        Jussi<br>
      </div>
    </blockquote>
    I wasnt aware of this, I'll be sending a patch to upgrade to 3.20.1
    later.<br>
    <br>
    <blockquote
cite="mid:CAHiDW_EhH30=8tifRos=EVJA+U27KO342_1DVjUJ2DsFTjumQQ@mail.gmail.com"
      type="cite">
      <div dir="ltr"> <br>
        &gt;<br>
        &gt;  1 file changed, 2 insertions(+), 2 deletions(-)<br>
        &gt;  rename meta/recipes-devtools/python/{<a
          moz-do-not-send="true"
          href="http://python3-pygobject_3.18.2.bb">python3-pygobject_3.18.2.bb</a>
        =&gt; <a moz-do-not-send="true"
          href="http://python3-pygobject_3.21.0.bb">python3-pygobject_3.21.0.bb</a>}
        (81%)<br>
        &gt;<br>
        &gt; diff --git a/meta/recipes-devtools/python/<a
          moz-do-not-send="true"
          href="http://python3-pygobject_3.18.2.bb">python3-pygobject_3.18.2.bb</a>
        b/meta/recipes-devtools/python/<a moz-do-not-send="true"
          href="http://python3-pygobject_3.21.0.bb">python3-pygobject_3.21.0.bb</a><br>
        &gt; similarity index 81%<br>
        &gt; rename from meta/recipes-devtools/python/<a
          moz-do-not-send="true"
          href="http://python3-pygobject_3.18.2.bb">python3-pygobject_3.18.2.bb</a><br>
        &gt; rename to meta/recipes-devtools/python/<a
          moz-do-not-send="true"
          href="http://python3-pygobject_3.21.0.bb">python3-pygobject_3.21.0.bb</a><br>
        &gt; index 4ddae81..e5990d6 100644<br>
        &gt; --- a/meta/recipes-devtools/python/<a
          moz-do-not-send="true"
          href="http://python3-pygobject_3.18.2.bb">python3-pygobject_3.18.2.bb</a><br>
        &gt; +++ b/meta/recipes-devtools/python/<a
          moz-do-not-send="true"
          href="http://python3-pygobject_3.21.0.bb">python3-pygobject_3.21.0.bb</a><br>
        &gt; @@ -13,8 +13,8 @@ SRC_URI = " \<br>
        &gt;    
         <a class="moz-txt-link-freetext" href="file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch">file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch</a>
        \<br>
        &gt;  "<br>
        &gt;<br>
        &gt; -SRC_URI[md5sum] = "0a956f3e785e23b0f136832f2e57a862"<br>
        &gt; -SRC_URI[sha256sum] =
        "2a3cad1517916b74e131e6002c3824361aee0671ffb0d55ded119477fc1c2c5f"<br>
        &gt; +SRC_URI[md5sum] = "a6dba83e3a7df52ba80bd02906f74611"<br>
        &gt; +SRC_URI[sha256sum] =
        "898c9ef2f80968ccf33d6fbd5087b1721b74792a308b277d02bc935450168a58"<br>
        &gt;<br>
        &gt;  S = "${WORKDIR}/${SRCNAME}-${PV}"<br>
        &gt;<br>
        &gt; --<br>
        &gt; 2.6.6<br>
        &gt;<br>
        &gt; --<br>
        &gt; _______________________________________________<br>
        &gt; Openembedded-core mailing list<br>
        &gt; <a moz-do-not-send="true"
          href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
        &gt; <a moz-do-not-send="true"
          href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a></div>
    </blockquote>
    <br>
  </body>
</html>

--------------040803020602010608080800--

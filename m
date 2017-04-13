Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4859677C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:19:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3D2JMoj014210
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 12 Apr 2017 19:19:22 -0700
Received: from [128.224.162.239] (128.224.162.239) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 19:19:21 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <1491994341-28659-1-git-send-email-zhixiong.chi@windriver.com>
	<CAHiDW_E2xCAED+8kCde3w3sNyFZa5w-96VfN-+kbd0+4HjmiEQ@mail.gmail.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <58EEE028.5000606@windriver.com>
Date: Thu, 13 Apr 2017 10:19:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_E2xCAED+8kCde3w3sNyFZa5w-96VfN-+kbd0+4HjmiEQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnome-common: add EXTRA_OECONF "--with-autoconf-archive"
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
X-List-Received-Date: Thu, 13 Apr 2017 02:19:23 -0000
Content-Type: multipart/alternative;
	boundary="------------030903080601080608090603"

--------------030903080601080608090603
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2017年04月12日 19:04, Jussi Kukkonen wrote:
> On 12 April 2017 at 13:52, Zhixiong Chi <zhixiong.chi@windriver.com 
> <mailto:zhixiong.chi@windriver.com>> wrote:
>
>     After updating the autoconf-archive version to 2016.09.16,
>     autoconf-archive
>     installs the same ax_*.m4 macros that gnome-common installs. So
>     there will
>     be the conflict occurs.
>     The option '--with-autoconf-archive' is passed to configure, the
>     macros
>     are not installed, and gnome-common will not install any M4 macros
>     that
>     conflict with autoconf-archive.
>     At the same time, set the RDEPENDS for gnome-common.
>
>     Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com
>     <mailto:zhixiong.chi@windriver.com>>
>     ---
>      meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
>     <http://gnome-common_3.18.0.bb> | 3 +++
>      1 file changed, 3 insertions(+)
>
>     diff --git a/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
>     <http://gnome-common_3.18.0.bb>
>     b/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
>     <http://gnome-common_3.18.0.bb>
>     index 06f3bb3..96817bb 100644
>     --- a/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
>     <http://gnome-common_3.18.0.bb>
>     +++ b/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
>     <http://gnome-common_3.18.0.bb>
>     @@ -14,6 +14,9 @@ SRC_URI[archive.sha256sum] =
>     "22569e370ae755e04527b76328befc4c73b62bfd4a572499fd
>      EXTRA_AUTORECONF = ""
>      DEPENDS = ""
>
>     +EXTRA_OECONF += " --with-autoconf-archive"
>     +RDEPENDS_${PN} = "autoconf-archive"
>
>
> autoconf-archive is not in oe-core, is it?

Yes,it is.
As Alex said, it shouldn't depend the recipe from the other layers.
I will try to move autoconf-archive into oe-core next step.

Thanks.

>     +
>      FILES_${PN} += "${datadir}/aclocal"
>      FILES_${PN}-dev = ""
>
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

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


--------------030903080601080608090603
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 2017年04月12日 19:04, Jussi Kukkonen
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHiDW_E2xCAED+8kCde3w3sNyFZa5w-96VfN-+kbd0+4HjmiEQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On 12 April 2017 at 13:52, Zhixiong
            Chi <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:zhixiong.chi@windriver.com" target="_blank">zhixiong.chi@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">After
              updating the autoconf-archive version to 2016.09.16,
              autoconf-archive<br>
              installs the same ax_*.m4 macros that gnome-common
              installs. So there will<br>
              be the conflict occurs.<br>
              The option '--with-autoconf-archive' is passed to
              configure, the macros<br>
              are not installed, and gnome-common will not install any
              M4 macros that<br>
              conflict with autoconf-archive.<br>
              At the same time, set the RDEPENDS for gnome-common.<br>
              <br>
              Signed-off-by: Zhixiong Chi &lt;<a moz-do-not-send="true"
                href="mailto:zhixiong.chi@windriver.com" target="_blank">zhixiong.chi@windriver.com</a>&gt;<br>
              ---<br>
               meta/recipes-gnome/gnome/<a moz-do-not-send="true"
                href="http://gnome-common_3.18.0.bb" rel="noreferrer"
                target="_blank">gnom<wbr>e-common_3.18.0.bb</a> | 3 +++<br>
               1 file changed, 3 insertions(+)<br>
              <br>
              diff --git a/meta/recipes-gnome/gnome/<a
                moz-do-not-send="true"
                href="http://gnome-common_3.18.0.bb" rel="noreferrer"
                target="_blank">gno<wbr>me-common_3.18.0.bb</a>
              b/meta/recipes-gnome/gnome/<a moz-do-not-send="true"
                href="http://gnome-common_3.18.0.bb" rel="noreferrer"
                target="_blank">gno<wbr>me-common_3.18.0.bb</a><br>
              index 06f3bb3..96817bb 100644<br>
              --- a/meta/recipes-gnome/gnome/<a moz-do-not-send="true"
                href="http://gnome-common_3.18.0.bb" rel="noreferrer"
                target="_blank">gno<wbr>me-common_3.18.0.bb</a><br>
              +++ b/meta/recipes-gnome/gnome/<a moz-do-not-send="true"
                href="http://gnome-common_3.18.0.bb" rel="noreferrer"
                target="_blank">gno<wbr>me-common_3.18.0.bb</a><br>
              @@ -14,6 +14,9 @@ SRC_URI[archive.sha256sum] =
              "22569e370ae755e04527b76328bef<wbr>c4c73b62bfd4a572499fd<br>
               EXTRA_AUTORECONF = ""<br>
               DEPENDS = ""<br>
              <br>
              +EXTRA_OECONF += " --with-autoconf-archive"<br>
              +RDEPENDS_${PN} = "autoconf-archive"<br>
            </blockquote>
            <div><br>
            </div>
            <div>autoconf-archive is not in oe-core, is it?</div>
            <div> </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Yes,it is.<br>
    As Alex said, it shouldn't depend the recipe from the other layers.<br>
    I will try to move autoconf-archive into oe-core next step.<br>
    <br>
    Thanks.<br>
    <br>
    <blockquote
cite="mid:CAHiDW_E2xCAED+8kCde3w3sNyFZa5w-96VfN-+kbd0+4HjmiEQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              +<br>
               FILES_${PN} += "${datadir}/aclocal"<br>
               FILES_${PN}-dev = ""<br>
              <span class="m_5071625836144556110HOEnZb"><font
                  color="#888888"><br>
                  --<br>
                  1.9.1<br>
                  <br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org"
                    target="_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                  <a moz-do-not-send="true"
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </font></span></blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036
</pre>
  </body>
</html>

--------------030903080601080608090603--

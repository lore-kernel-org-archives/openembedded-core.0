Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA5176294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 14:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 368391EE07A3;
	Tue, 23 Aug 2016 16:49:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 1Fdjt0w7DwGY; Tue, 23 Aug 2016 16:49:45 +0200 (CEST)
Received: from [10.5.19.152] (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPSA id DCE691EE075F;
	Tue, 23 Aug 2016 16:49:44 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<b0afbd8bead81db639e1ff2a74aab06c1aa73adc.1471936926.git-series.jeremy.rosen@smile.fr>
	<CAJTo0LYBVwQgyCKOuobgZ+Zz25v38gLydPDGspxydb0=MiL5=A@mail.gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <43920457-0ec6-9ef4-136a-78e2ecff03ce@smile.fr>
Date: Tue, 23 Aug 2016 16:49:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYBVwQgyCKOuobgZ+Zz25v38gLydPDGspxydb0=MiL5=A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] [cross] export CC family from BUILD_* for cross compilers
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
X-List-Received-Date: Tue, 23 Aug 2016 14:49:46 -0000
Content-Type: multipart/alternative;
	boundary="------------DB2C9267DF1E94F444D29D96"

--------------DB2C9267DF1E94F444D29D96
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/08/2016 16:46, Burton, Ross wrote:
> FYI, git am strips anything inside [square brackets] when applying, so 
> your [cross] etc doesn't make it into the series.  If you submit a v2 
> please change [cross] to cross:.
>
I didn't know that... will fix

> Ross
>
> On 23 August 2016 at 08:25, Jérémy Rosen <jeremy.rosen@smile.fr 
> <mailto:jeremy.rosen@smile.fr>> wrote:
>
>     cross-compilers are native recipes that need to be compiled by the
>     host's
>     compiler. However then do not use native.bbclass
>
>     As a consequence, the various CC, CXX etc environment variables
>     are not
>     correctly set and they will not honor the host compiler name provided
>     by the BUILD_* variables.
>
>     Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr
>     <mailto:jeremy.rosen@smile.fr>>
>     ---
>      meta/classes/cross.bbclass | 12 ++++++++++++
>      1 file changed, 12 insertions(+), 0 deletions(-)
>
>     diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
>     index 81d1c9d..8d1e779 100644
>     --- a/meta/classes/cross.bbclass
>     +++ b/meta/classes/cross.bbclass
>     @@ -68,4 +68,16 @@ do_install () {
>
>      USE_NLS = "no"
>
>     +export CC = "${BUILD_CC}"
>     +export CXX = "${BUILD_CXX}"
>     +export FC = "${BUILD_FC}"
>     +export CPP = "${BUILD_CPP}"
>     +export LD = "${BUILD_LD}"
>     +export CCLD = "${BUILD_CCLD}"
>     +export AR = "${BUILD_AR}"
>     +export AS = "${BUILD_AS}"
>     +export RANLIB = "${BUILD_RANLIB}"
>     +export STRIP = "${BUILD_STRIP}"
>     +export NM = "${BUILD_NM}"
>     +
>      inherit nopackages
>     --
>     git-series 0.8.9
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------DB2C9267DF1E94F444D29D96
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 23/08/2016 16:46, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYBVwQgyCKOuobgZ+Zz25v38gLydPDGspxydb0=MiL5=A@mail.gmail.com"
      type="cite">
      <div dir="ltr">FYI, git am strips anything inside [square
        brackets] when applying, so your [cross] etc doesn't make it
        into the series.  If you submit a v2 please change [cross] to
        cross:.
        <div><br>
        </div>
      </div>
    </blockquote>
    I didn't know that... will fix<br>
    <br>
    <blockquote
cite="mid:CAJTo0LYBVwQgyCKOuobgZ+Zz25v38gLydPDGspxydb0=MiL5=A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 23 August 2016 at 08:25, Jérémy
          Rosen <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:jeremy.rosen@smile.fr" target="_blank">jeremy.rosen@smile.fr</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">cross-compilers
            are native recipes that need to be compiled by the host's<br>
            compiler. However then do not use native.bbclass<br>
            <br>
            As a consequence, the various CC, CXX etc environment
            variables are not<br>
            correctly set and they will not honor the host compiler name
            provided<br>
            by the BUILD_* variables.<br>
            <br>
            Signed-off-by: Jérémy Rosen &lt;<a moz-do-not-send="true"
              href="mailto:jeremy.rosen@smile.fr">jeremy.rosen@smile.fr</a>&gt;<br>
            ---<br>
             meta/classes/cross.bbclass | 12 ++++++++++++<br>
             1 file changed, 12 insertions(+), 0 deletions(-)<br>
            <br>
            diff --git a/meta/classes/cross.bbclass
            b/meta/classes/cross.bbclass<br>
            index 81d1c9d..8d1e779 100644<br>
            --- a/meta/classes/cross.bbclass<br>
            +++ b/meta/classes/cross.bbclass<br>
            @@ -68,4 +68,16 @@ do_install () {<br>
            <br>
             USE_NLS = "no"<br>
            <br>
            +export CC = "${BUILD_CC}"<br>
            +export CXX = "${BUILD_CXX}"<br>
            +export FC = "${BUILD_FC}"<br>
            +export CPP = "${BUILD_CPP}"<br>
            +export LD = "${BUILD_LD}"<br>
            +export CCLD = "${BUILD_CCLD}"<br>
            +export AR = "${BUILD_AR}"<br>
            +export AS = "${BUILD_AS}"<br>
            +export RANLIB = "${BUILD_RANLIB}"<br>
            +export STRIP = "${BUILD_STRIP}"<br>
            +export NM = "${BUILD_NM}"<br>
            +<br>
             inherit nopackages<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                git-series 0.8.9<br>
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
    <br>
  </body>
</html>

--------------DB2C9267DF1E94F444D29D96--

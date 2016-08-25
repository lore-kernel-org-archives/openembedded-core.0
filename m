Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id CEC19601B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 12:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id A77971EE0AA8;
	Thu, 25 Aug 2016 14:40:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id TNsUr7KRK06a; Thu, 25 Aug 2016 14:40:35 +0200 (CEST)
Received: from [10.5.19.152] (bob75-2-81-56-46-209.fbx.proxad.net
	[81.56.46.209])
	by idris.smile.fr (Postfix) with ESMTPSA id 6383B1EE0AA7;
	Thu, 25 Aug 2016 14:40:35 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<9bf820ce898dc5e0127b0108efb64f7095887732.1471936926.git-series.jeremy.rosen@smile.fr>
	<9301FDF2-F2EB-414C-A671-9B87ED5F0D3C@gmail.com>
	<0c795b84-5305-072b-4540-8a3e3049d5b2@smile.fr>
	<17d95410-d50f-80f6-665c-35405a72e11a@smile.fr>
	<CAJTo0LZ_44oh+u0Muv=qu7Qj4eUfHBvoS4pVrND8bZqY0EZPhg@mail.gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <cd135782-5368-e383-1e13-7763c3075a4b@smile.fr>
Date: Thu, 25 Aug 2016 14:40:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ_44oh+u0Muv=qu7Qj4eUfHBvoS4pVrND8bZqY0EZPhg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] [autotools] export CCLD_FOR_BUILD
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
X-List-Received-Date: Thu, 25 Aug 2016 12:40:36 -0000
Content-Type: multipart/alternative;
	boundary="------------A8743B07C36A8A98AA91C1A3"

--------------A8743B07C36A8A98AA91C1A3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/08/2016 21:56, Burton, Ross wrote:
>
> On 24 August 2016 at 12:28, Jérémy Rosen <jeremy.rosen@smile.fr 
> <mailto:jeremy.rosen@smile.fr>> wrote:
>
>     ok, so CC_FOR_BUILD seems to be a common convention and
>     CCLD_FOR_BUILD seems only used by our patch for pcre. Fixing it to
>     use CC_FOR_BUILD for linking is trivial
>
>     but the patch is marked as submitted upstream, so Fahad... what is
>     the status ? how can we do that ?
>
>     I can also set CCLD_FOR_BUILD in ther .bb file instead of
>     autotools.bbclass, that's trivial... the question is whether we
>     should fix the patch or not...
>
>
> CC_FOR_BUILD and CPP_FOR_BUILD are de facto standards by virtue of 
> being part of autoconf-archive: 
> https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
>
> Looking at the patch wouldn't it be possible to avoid the entire .c -> 
> .o -> binary process and just go from .c -> binary via CC_FOR_BUILD?
Probably, but again the patch has been pushed upstream by someone else 
and I need to contact that person first to see how to handle it.

I can avoid that by defining CCLD_FOR_BUILD in the recipe, but since I 
need to wait for glibc for v2 anyway, I'm not in a rush...

if I have no news, I'll do that for V2


Regards
Jeremy
>
> Ross


--------------A8743B07C36A8A98AA91C1A3
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
    <div class="moz-cite-prefix">On 24/08/2016 21:56, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZ_44oh+u0Muv=qu7Qj4eUfHBvoS4pVrND8bZqY0EZPhg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 24 August 2016 at 12:28, Jérémy
            Rosen <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:jeremy.rosen@smile.fr" target="_blank">jeremy.rosen@smile.fr</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id=":124" class="">ok, so CC_FOR_BUILD seems to be a
                common convention and CCLD_FOR_BUILD seems only used by
                our patch for pcre. Fixing it to use CC_FOR_BUILD for
                linking is trivial<br>
                <br>
                but the patch is marked as submitted upstream, so
                Fahad... what is the status ? how can we do that ?<br>
                <br>
                I can also set CCLD_FOR_BUILD in ther .bb file instead
                of autotools.bbclass, that's trivial... the question is
                whether we should fix the patch or not...<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>CC_FOR_BUILD and CPP_FOR_BUILD are de facto standards
              by virtue of being part of autoconf-archive: <a
                moz-do-not-send="true"
href="https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html">https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html</a></div>
            <div> <br>
            </div>
          </div>
          Looking at the patch wouldn't it be possible to avoid the
          entire .c -&gt; .o -&gt; binary process and just go from .c
          -&gt; binary via CC_FOR_BUILD?</div>
      </div>
    </blockquote>
    Probably, but again the patch has been pushed upstream by someone
    else and I need to contact that person first to see how to handle
    it.<br>
    <br>
    I can avoid that by defining CCLD_FOR_BUILD in the recipe, but since
    I need to wait for glibc for v2 anyway, I'm not in a rush...<br>
    <br>
    if I have no news, I'll do that for V2<br>
    <br>
    <br>
    Regards<br>
    Jeremy<br>
    <blockquote
cite="mid:CAJTo0LZ_44oh+u0Muv=qu7Qj4eUfHBvoS4pVrND8bZqY0EZPhg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------A8743B07C36A8A98AA91C1A3--

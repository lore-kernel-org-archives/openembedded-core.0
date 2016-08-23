Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 5C31376988
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 14:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 341B41EE0816;
	Tue, 23 Aug 2016 16:04:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id QHAE9Wv6ZMPZ; Tue, 23 Aug 2016 16:04:51 +0200 (CEST)
Received: from [10.5.19.152] (bob75-2-81-56-46-209.fbx.proxad.net
	[81.56.46.209])
	by idris.smile.fr (Postfix) with ESMTPSA id F07B51EE03DC;
	Tue, 23 Aug 2016 16:04:50 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<206bf819f402d94d3261b1f4590330ef41449e4d.1471936926.git-series.jeremy.rosen@smile.fr>
	<CAJTo0LY4gVCD24Tc9ZJnUh0s+Lgzztk=2zG9ew14LFa6GBCGRg@mail.gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <0cddba1f-50b0-8d44-12a9-0dbc7f747a7d@smile.fr>
Date: Tue, 23 Aug 2016 16:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY4gVCD24Tc9ZJnUh0s+Lgzztk=2zG9ew14LFa6GBCGRg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] [glibc] remove hard-coded reference to gcc -E
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
X-List-Received-Date: Tue, 23 Aug 2016 14:04:52 -0000
Content-Type: multipart/alternative;
	boundary="------------9A9933AB7FE31CAD4C0C1772"

--------------9A9933AB7FE31CAD4C0C1772
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/08/2016 16:03, Burton, Ross wrote:
>
> On 23 August 2016 at 08:25, Jérémy Rosen <jeremy.rosen@smile.fr 
> <mailto:jeremy.rosen@smile.fr>> wrote:
>
>     +-open F, "cat C-translit.h.in <http://C-translit.h.in> | gcc -E -
>     |" || die "Cannot preprocess input file";
>     ++open F, 'cat C-translit.h.in <http://C-translit.h.in> | $CPP -
>     |' || die "Cannot preprocess input file";
>
>
> Patch is missing an Upstream-Status, and I expect if you allowed for 
> CPP to be unset then there's a chance you can get this upstream.
>
> ${CPP:-gcc -E} should do the trick.
>
I'm currently discussing with upstream. That script is theoretically 
only called by a Makefile that sets $CPP, but yes, that is a good 
suggestion.

> Ross


--------------9A9933AB7FE31CAD4C0C1772
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
    <div class="moz-cite-prefix">On 23/08/2016 16:03, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LY4gVCD24Tc9ZJnUh0s+Lgzztk=2zG9ew14LFa6GBCGRg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 23 August 2016 at 08:25, Jérémy
            Rosen <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:jeremy.rosen@smile.fr" target="_blank">jeremy.rosen@smile.fr</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id=":oq" class="">+-open F, "cat <a
                  moz-do-not-send="true" href="http://C-translit.h.in"
                  rel="noreferrer" target="_blank">C-translit.h.in</a> |
                gcc -E - |" || die "Cannot preprocess input file";<br>
                ++open F, 'cat <a moz-do-not-send="true"
                  href="http://C-translit.h.in" rel="noreferrer"
                  target="_blank">C-translit.h.in</a> | $CPP - |' || die
                "Cannot preprocess input file";<br>
              </div>
            </blockquote>
          </div>
          <br>
          Patch is missing an Upstream-Status, and I expect if you
          allowed for CPP to be unset then there's a chance you can get
          this upstream.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">${CPP:-gcc -E} should do the trick.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    I'm currently discussing with upstream. That script is theoretically
    only called by a Makefile that sets $CPP, but yes, that is a good
    suggestion. <br>
    <br>
    <blockquote
cite="mid:CAJTo0LY4gVCD24Tc9ZJnUh0s+Lgzztk=2zG9ew14LFa6GBCGRg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------9A9933AB7FE31CAD4C0C1772--

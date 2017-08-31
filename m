Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D52A86010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 00:57:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7V0vmaQ005528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 30 Aug 2017 17:57:49 -0700
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 30 Aug 2017 17:57:47 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1503990043-5633-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LYjm79455K_W2rcxAOFCDG8XcSbeAQAu-wyBwG1gNdjNQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <58923314-00e9-55d0-09f9-473d7525abab@windriver.com>
Date: Thu, 31 Aug 2017 08:58:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYjm79455K_W2rcxAOFCDG8XcSbeAQAu-wyBwG1gNdjNQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: 2.1.23 -> 2.2.0
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
X-List-Received-Date: Thu, 31 Aug 2017 00:57:49 -0000
Content-Type: multipart/alternative;
	boundary="------------B5A3179CD4403EEA7038963E"
Content-Language: en-US

--------------B5A3179CD4403EEA7038963E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年08月30日 18:54, Burton, Ross wrote:
> 2.4 has reached feature freeze, is there anything security related in 
> this release that we should backport?
>

Here is the commits since 2.1.23, no urgent fix, we could upgrade it 
after 2.4.

9d80fb8 Release 2.2.0
24462fe po: Auto update
45d5f58 scd: Convey the correct length for Le
13821e1 gpg: Fix memory leak while running --check-trustdb.
b065a69 gpg: Fix memory leak in sig-check.
757302c indent: Change comment style on two functions
02a5df6 build: Remove obsolete option from autogen.rc
565e486 gpgconf: Swap "auto-key-retrieve" and "no-auto-key-retrieve".
b917cb6 tests: Do not run trust-pgp-4.scm
008ae0b build: Change SWDB tag "gnupg21" to "gnupg22".
fd0e5b6 po: Update Norwegian translation
6158811 agent: Fix string translation for Windows
e6fa6b0 po: Update Japanese translation
c23a699 tests: Add tests for the PGP trust model.
cbe54b2 tests: Move some functions into a common module.
0161225 gpgconf: Make WoT settings configurable by gpgconf.
6e596b2 gpgscm: Fix -Wimplicit-fallthrough warnings.
e6f8411 gpg: default to --no-auto-key-retrieve.
2d6832a po: Update Russian translation
23107ba tests: Improve documentation.
977fc5f g10: Write status error on error of --quick-revoke-uid.
d6b40a9 Post release updates
e8ffa9a Release 2.1.23

//Hongxu

> Ross
>
> On 29 August 2017 at 08:00, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000413.html
>     <https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000413.html>
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      meta/recipes-support/gnupg/{gnupg_2.1.23.bb
>     <http://gnupg_2.1.23.bb> => gnupg_2.2.0.bb
>     <http://gnupg_2.2.0.bb>} | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>      rename meta/recipes-support/gnupg/{gnupg_2.1.23.bb
>     <http://gnupg_2.1.23.bb> => gnupg_2.2.0.bb
>     <http://gnupg_2.2.0.bb>} (91%)
>
>     diff --git a/meta/recipes-support/gnupg/gnupg_2.1.23.bb
>     <http://gnupg_2.1.23.bb>
>     b/meta/recipes-support/gnupg/gnupg_2.2.0.bb <http://gnupg_2.2.0.bb>
>     similarity index 91%
>     rename from meta/recipes-support/gnupg/gnupg_2.1.23.bb
>     <http://gnupg_2.1.23.bb>
>     rename to meta/recipes-support/gnupg/gnupg_2.2.0.bb
>     <http://gnupg_2.2.0.bb>
>     index 8cbe5e1..0176ddd 100644
>     --- a/meta/recipes-support/gnupg/gnupg_2.1.23.bb
>     <http://gnupg_2.1.23.bb>
>     +++ b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
>     <http://gnupg_2.2.0.bb>
>     @@ -16,8 +16,8 @@ SRC_URI =
>     "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>                
>     file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
>                "
>
>     -SRC_URI[md5sum] = "86c2304ead54b74a422e76c3f1bc7a91"
>     -SRC_URI[sha256sum] =
>     "a94476391595e9351f219188767a9d6ea128e83be5ed3226a7890f49aa2d0d77"
>     +SRC_URI[md5sum] = "789f16949fae2d003d387f49e9da4b74"
>     +SRC_URI[sha256sum] =
>     "d4514a0be0f7a1ff263193330019eb4b53c82f0f5e230af3c14df371271a45e6"
>
>      EXTRA_OECONF = "--disable-ldap \
>                     --disable-ccid-driver \
>     --
>     2.8.1
>
>


--------------B5A3179CD4403EEA7038963E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017年08月30日 18:54, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LYjm79455K_W2rcxAOFCDG8XcSbeAQAu-wyBwG1gNdjNQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">2.4 has reached feature freeze, is there anything
        security related in this release that we should backport?
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
    Here is the commits since 2.1.23, no urgent fix, we could upgrade it
    after 2.4.<br>
    <br>
    9d80fb8 Release 2.2.0<br>
    24462fe po: Auto update<br>
    45d5f58 scd: Convey the correct length for Le<br>
    13821e1 gpg: Fix memory leak while running --check-trustdb.<br>
    b065a69 gpg: Fix memory leak in sig-check.<br>
    757302c indent: Change comment style on two functions<br>
    02a5df6 build: Remove obsolete option from autogen.rc<br>
    565e486 gpgconf: Swap "auto-key-retrieve" and
    "no-auto-key-retrieve".<br>
    b917cb6 tests: Do not run trust-pgp-4.scm<br>
    008ae0b build: Change SWDB tag "gnupg21" to "gnupg22".<br>
    fd0e5b6 po: Update Norwegian translation<br>
    6158811 agent: Fix string translation for Windows<br>
    e6fa6b0 po: Update Japanese translation<br>
    c23a699 tests: Add tests for the PGP trust model.<br>
    cbe54b2 tests: Move some functions into a common module.<br>
    0161225 gpgconf: Make WoT settings configurable by gpgconf.<br>
    6e596b2 gpgscm: Fix -Wimplicit-fallthrough warnings.<br>
    e6f8411 gpg: default to --no-auto-key-retrieve.<br>
    2d6832a po: Update Russian translation<br>
    23107ba tests: Improve documentation.<br>
    977fc5f g10: Write status error on error of --quick-revoke-uid.<br>
    d6b40a9 Post release updates<br>
    e8ffa9a Release 2.1.23<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LYjm79455K_W2rcxAOFCDG8XcSbeAQAu-wyBwG1gNdjNQ@mail.gmail.com">
      <div dir="ltr">
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 29 August 2017 at 08:00, Hongxu Jia
          <span dir="ltr">&lt;<a href="mailto:hongxu.jia@windriver.com"
              target="_blank" moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><a
href="https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000413.html"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.gnupg.org/<wbr>pipermail/gnupg-announce/<wbr>2017q3/000413.html</a><br>
            <br>
            Signed-off-by: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            ---<br>
             meta/recipes-support/gnupg/{<a
              href="http://gnupg_2.1.23.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gn<wbr>upg_2.1.23.bb</a>
            =&gt; <a href="http://gnupg_2.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gnupg_2.2.0.bb</a>}
            | 4 ++--<br>
             1 file changed, 2 insertions(+), 2 deletions(-)<br>
             rename meta/recipes-support/gnupg/{<a
              href="http://gnupg_2.1.23.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gn<wbr>upg_2.1.23.bb</a>
            =&gt; <a href="http://gnupg_2.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gnupg_2.2.0.bb</a>}
            (91%)<br>
            <br>
            diff --git a/meta/recipes-support/gnupg/<a
              href="http://gnupg_2.1.23.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">g<wbr>nupg_2.1.23.bb</a>
            b/meta/recipes-support/gnupg/<a href="http://gnupg_2.2.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">g<wbr>nupg_2.2.0.bb</a><br>
            similarity index 91%<br>
            rename from meta/recipes-support/gnupg/<a
              href="http://gnupg_2.1.23.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gnu<wbr>pg_2.1.23.bb</a><br>
            rename to meta/recipes-support/gnupg/<a
              href="http://gnupg_2.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gnu<wbr>pg_2.2.0.bb</a><br>
            index 8cbe5e1..0176ddd 100644<br>
            --- a/meta/recipes-support/gnupg/<a
              href="http://gnupg_2.1.23.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">g<wbr>nupg_2.1.23.bb</a><br>
            +++ b/meta/recipes-support/gnupg/<a
              href="http://gnupg_2.2.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">g<wbr>nupg_2.2.0.bb</a><br>
            @@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}<wbr>-${PV}.tar.bz2
            \<br>
                        <a class="moz-txt-link-freetext" href="file://0004-autogen.sh-fix">file://0004-autogen.sh-fix</a>-<wbr>find-version-for-beta-<wbr>checking.patch
            \<br>
                       "<br>
            <br>
            -SRC_URI[md5sum] = "<wbr>86c2304ead54b74a422e76c3f1bc7a<wbr>91"<br>
            -SRC_URI[sha256sum] = "<wbr>a94476391595e9351f219188767a9d<wbr>6ea128e83be5ed3226a7890f49aa2d<wbr>0d77"<br>
            +SRC_URI[md5sum] = "<wbr>789f16949fae2d003d387f49e9da4b<wbr>74"<br>
            +SRC_URI[sha256sum] = "<wbr>d4514a0be0f7a1ff263193330019eb<wbr>4b53c82f0f5e230af3c14df371271a<wbr>45e6"<br>
            <br>
             EXTRA_OECONF = "--disable-ldap \<br>
                            --disable-ccid-driver \<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.8.1<br>
                <br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------B5A3179CD4403EEA7038963E--

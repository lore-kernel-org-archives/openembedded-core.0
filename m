Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D99476643
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 01:36:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAH1aDhh028007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Nov 2015 17:36:14 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 16 Nov 2015 17:36:13 -0800
Message-ID: <564A847F.2050004@windriver.com>
Date: Tue, 17 Nov 2015 09:35:59 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>
References: <cover.1446453113.git.hongxu.jia@windriver.com>
	<3669ff8a3e7cd747cb345814b7d9c24019ea9e73.1446453113.git.hongxu.jia@windriver.com>
	<CABcZANmU7w-__Xp6cMb1PFcxRdsjoX-ZEQkwBe1uxYhu-LnbTA@mail.gmail.com>
In-Reply-To: <CABcZANmU7w-__Xp6cMb1PFcxRdsjoX-ZEQkwBe1uxYhu-LnbTA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] logrotate: do not move binary logrotate to /usr/bin
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
X-List-Received-Date: Tue, 17 Nov 2015 01:36:21 -0000
Content-Type: multipart/alternative;
	boundary="------------060302080101060009080903"

--------------060302080101060009080903
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2015 12:32 AM, Christopher Larson wrote:
>
> On Mon, Nov 2, 2015 at 1:33 AM, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     In oe-core commit a46d3646a3e1781be4423b508ea63996b3cfca8a
>     ...
>     Author: Fahad Usman <fahad_usman@mentor.com
>     <mailto:fahad_usman@mentor.com>>
>     Date:   Tue Aug 26 13:16:48 2014 +0500
>
>     logrotate: obey our flags
>
>         Needed to quiet GNU_HASH warnings, and some minor fixes.
>     ...
>     it explicitly move logrotate to /usr/bin without any reason,
>     which is against the original Linux location /usr/sbin.
>
>     So partly revert the above commit which let logrotate be
>     kept in the original place /usr/sbin.
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      meta/recipes-extended/logrotate/logrotate_3.9.1.bb
>     <http://logrotate_3.9.1.bb> | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
>     <http://logrotate_3.9.1.bb>
>     b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
>     <http://logrotate_3.9.1.bb>
>     index 7d0a159..5f1a601 100644
>     --- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
>     <http://logrotate_3.9.1.bb>
>     +++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
>     <http://logrotate_3.9.1.bb>
>     @@ -53,7 +53,7 @@ do_compile_prepend() {
>      }
>
>      do_install(){
>     -    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
>     BINDIR=${bindir}
>     +    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
>          mkdir -p ${D}${sysconfdir}/logrotate.d
>          mkdir -p ${D}${sysconfdir}/cron.daily
>          mkdir -p ${D}${localstatedir}/lib
>
>
> This just makes it not obey our target paths again, using its 
> hardcoded destination. Why not pass BINDIR=${sbindir} instead?

It is fine to me

//Hongxu


> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--------------060302080101060009080903
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/17/2015 12:32 AM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANmU7w-__Xp6cMb1PFcxRdsjoX-ZEQkwBe1uxYhu-LnbTA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Mon, Nov 2, 2015 at 1:33 AM,
            Hongxu Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":a4" class="a3s" style="overflow:hidden">In
                oe-core commit a46d3646a3e1781be4423b508ea63996b3cfca8a<br>
                ...<br>
                Author: Fahad Usman &lt;<a moz-do-not-send="true"
                  href="mailto:fahad_usman@mentor.com">fahad_usman@mentor.com</a>&gt;<br>
                Date:   Tue Aug 26 13:16:48 2014 +0500<br>
                <br>
                    <span class="il">logrotate</span>: obey our flags<br>
                <br>
                    Needed to quiet GNU_HASH warnings, and some minor
                fixes.<br>
                ...<br>
                it explicitly move <span class="il">logrotate</span> to
                /usr/bin without any reason,<br>
                which is against the original Linux location /usr/sbin.<br>
                <br>
                So partly revert the above commit which let <span
                  class="il">logrotate</span> be<br>
                kept in the original place /usr/sbin.<br>
                <br>
                Signed-off-by: Hongxu Jia &lt;<a moz-do-not-send="true"
                  href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
                ---<br>
                <span class=""> meta/recipes-extended/<span class="il">logrotate</span>/<a
                    moz-do-not-send="true"
                    href="http://logrotate_3.9.1.bb" rel="noreferrer"
                    target="_blank">logrotate_3.9.1.bb</a> | 2 +-<br>
                   1 file changed, 1 insertion(+), 1 deletion(-)<br>
                  <br>
                </span>diff --git a/meta/recipes-extended/<span
                  class="il">logrotate</span>/<a moz-do-not-send="true"
                  href="http://logrotate_3.9.1.bb" rel="noreferrer"
                  target="_blank">logrotate_3.9.1.bb</a>
                b/meta/recipes-extended/<span class="il">logrotate</span>/<a
                  moz-do-not-send="true"
                  href="http://logrotate_3.9.1.bb" rel="noreferrer"
                  target="_blank">logrotate_3.9.1.bb</a><br>
                index 7d0a159..5f1a601 100644<br>
                --- a/meta/recipes-extended/<span class="il">logrotate</span>/<a
                  moz-do-not-send="true"
                  href="http://logrotate_3.9.1.bb" rel="noreferrer"
                  target="_blank">logrotate_3.9.1.bb</a><br>
                +++ b/meta/recipes-extended/<span class="il">logrotate</span>/<a
                  moz-do-not-send="true"
                  href="http://logrotate_3.9.1.bb" rel="noreferrer"
                  target="_blank">logrotate_3.9.1.bb</a><br>
                @@ -53,7 +53,7 @@ do_compile_prepend() {<br>
                 }<br>
                <br>
                 do_install(){<br>
                -    oe_runmake install DESTDIR=${D} PREFIX=${D}
                MANDIR=${mandir} BINDIR=${bindir}<br>
                +    oe_runmake install DESTDIR=${D} PREFIX=${D}
                MANDIR=${mandir}<br>
                     mkdir -p ${D}${sysconfdir}/<span class="il">logrotate</span>.d<br>
                     mkdir -p ${D}${sysconfdir}/cron.daily<br>
                     mkdir -p ${D}${localstatedir}/lib</div>
            </blockquote>
          </div>
          <br>
          This just makes it not obey our target paths again, using its
          hardcoded destination. Why not pass BINDIR=${sbindir} instead?<br>
        </div>
      </div>
    </blockquote>
    <br>
    It is fine to me<br>
    <br>
    //Hongxu<br>
    <br>
    <br>
    <blockquote
cite="mid:CABcZANmU7w-__Xp6cMb1PFcxRdsjoX-ZEQkwBe1uxYhu-LnbTA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">-- <br>
          <div class="gmail_signature">Christopher Larson<br>
            clarson at kergoth dot com<br>
            Founder - BitBake, OpenEmbedded, OpenZaurus<br>
            Maintainer - Tslib<br>
            Senior Software Engineer, Mentor Graphics</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------060302080101060009080903--

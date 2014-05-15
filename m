Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88D9A660E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 02:32:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4F2Wn46018495
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 May 2014 19:32:49 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 14 May 2014 19:32:49 -0700
Message-ID: <5374273C.1040603@windriver.com>
Date: Thu, 15 May 2014 10:32:28 +0800
From: Wenlin Kang <wenlin.kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>
References: <1400059849-7711-1-git-send-email-wenlin.kang@windriver.com>
	<CABcZANmJwy2uid_pwHZzt=PHYpW=CetpkB0U3r-c=0EcFUONXg@mail.gmail.com>
In-Reply-To: <CABcZANmJwy2uid_pwHZzt=PHYpW=CetpkB0U3r-c=0EcFUONXg@mail.gmail.com>
X-Originating-IP: [128.224.162.182]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: fixed bash build error
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
X-List-Received-Date: Thu, 15 May 2014 02:32:56 -0000
Content-Type: multipart/alternative;
	boundary="------------050509080309010700020400"

--------------050509080309010700020400
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年05月15日 01:45, Christopher Larson wrote:
>
> On Wed, May 14, 2014 at 2:30 AM, Wenlin Kang 
> <wenlin.kang@windriver.com <mailto:wenlin.kang@windriver.com>> wrote:
>
>     When build bash, a error occurs, the cause is that autotools uses
>     improper Makefile.in.in <http://Makefile.in.in> which is from
>     path/gettext/po/ but not bash
>     itself in bash/po/,so to avoid some error to occur, we should use
>     package itself Makefile.in.in <http://Makefile.in.in> file if it has.
>
>     Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com
>     <mailto:wenlin.kang@windriver.com>>
>
>
> This will cause breakage when the shipped Makefile.in.in 
> <http://Makefile.in.in> gettext version mismatches with the 
> gettext-native/gettext we built.

     but if we directly use gettext-native/gettext/Makefile.in.in just 
as now,  for bash, it do occur some problem,  can't  get correct value 
of PACKAGE, VERSION due to use incorrect  variable name(the right should 
is PACKAGE_NAME, PACKAGE_VERSION) , can't get BUILD_DIR, and  can't get 
po-directories(it indeed isn't exist) in bash/po/Makefile.
these all can trigger a build error in bash/po ,  so, whether we can 
have a much well solution for it, can you have some good advices, thanks?
> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


-- 
Thanks,
Wenlin Kang


--------------050509080309010700020400
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2014年05月15日 01:45, Christopher
      Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANmJwy2uid_pwHZzt=PHYpW=CetpkB0U3r-c=0EcFUONXg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Wed, May 14, 2014 at 2:30 AM,
            Wenlin Kang <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:wenlin.kang@windriver.com" target="_blank">wenlin.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":lg" class="a3s" style="overflow:hidden">When
                build bash, a error occurs, the cause is that autotools
                uses<br>
                improper <a moz-do-not-send="true"
                  href="http://Makefile.in.in" target="_blank">Makefile.in.in</a>
                which is from path/gettext/po/ but not bash<br>
                itself in bash/po/,so to avoid some error to occur, we
                should use<br>
                package itself <a moz-do-not-send="true"
                  href="http://Makefile.in.in" target="_blank">Makefile.in.in</a>
                file if it has.<br>
                <br>
                Signed-off-by: Wenlin Kang &lt;<a moz-do-not-send="true"
                  href="mailto:wenlin.kang@windriver.com">wenlin.kang@windriver.com</a>&gt;</div>
            </blockquote>
          </div>
          <br>
        </div>
        <div class="gmail_extra">This will cause breakage when the
          shipped <a moz-do-not-send="true"
            href="http://Makefile.in.in">Makefile.in.in</a> gettext
          version mismatches with the gettext-native/gettext we built.<br>
        </div>
      </div>
    </blockquote>
    <br>
        but if we directly use gettext-native/gettext/Makefile.in.in
    just as now,  for bash, it do occur some problem,  can't  get 
    correct value of PACKAGE, VERSION due to use incorrect  variable
    name(the right should is PACKAGE_NAME, PACKAGE_VERSION)
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <span style="color: rgb(51, 51, 51); font-family: arial; font-size:
      24px; font-style: normal; font-variant: normal; font-weight:
      normal; letter-spacing: normal; line-height: 24px; orphans: auto;
      text-align: start; text-indent: 0px; text-transform: none;
      white-space: nowrap; widows: auto; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255); display: inline !important; float: none;"></span> , can't 
    get BUILD_DIR, and  can't get po-directories(it indeed isn't exist)
    in bash/po/Makefile.<br>
    these all can trigger a build error in bash/po ,  so, whether we can
    have a much well solution for it, can you have some good advices,
    thanks?<br>
    <blockquote
cite="mid:CABcZANmJwy2uid_pwHZzt=PHYpW=CetpkB0U3r-c=0EcFUONXg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          -- <br>
          Christopher Larson<br>
          clarson at kergoth dot com<br>
          Founder - BitBake, OpenEmbedded, OpenZaurus<br>
          Maintainer - Tslib<br>
          Senior Software Engineer, Mentor Graphics
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Thanks,
Wenlin Kang</pre>
  </body>
</html>

--------------050509080309010700020400--

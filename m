Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E369F713A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 08:04:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAD84EkY023239
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Nov 2014 00:04:14 -0800 (PST)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 13 Nov 2014 00:04:14 -0800
Message-ID: <54646673.3020702@windriver.com>
Date: Thu, 13 Nov 2014 16:06:11 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1415789100.git.Qi.Chen@windriver.com>
	<a44b261f0031a4d82f8fae0e968522139f607f90.1415789100.git.Qi.Chen@windriver.com>
	<CAJTo0LbDXrc=RK5zbE2z24K86Ti5eEcS1LRYCOHC7jfFeUOpFA@mail.gmail.com>
In-Reply-To: <CAJTo0LbDXrc=RK5zbE2z24K86Ti5eEcS1LRYCOHC7jfFeUOpFA@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: add option for valgrind header checking
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
X-List-Received-Date: Thu, 13 Nov 2014 08:04:15 -0000
Content-Type: multipart/alternative;
	boundary="------------060104020207060108010009"

--------------060104020207060108010009
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2014 11:55 PM, Burton, Ross wrote:
> On 12 November 2014 10:45, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     +-AC_CHECK_HEADERS_ONCE([valgrind/memcheck.h valgrind/valgrind.h])
>     ++AC_ARG_ENABLE(valgrindheader,
>     AS_HELP_STRING([--disable-valgrindheader], [disable valgrind
>     header checking]))
>     ++if test "x$enable_valgrindheader" != "xno"; then
>     ++        AC_CHECK_HEADERS_ONCE([valgrind/memcheck.h
>     valgrind/valgrind.h])
>     ++fi
>
>
> If the user passes --enable-valgrindheader and valgrind isn't present, 
> it doesn't fail.  Combined with the lack of a valgrind build 
> dependency in the PACKAGECONFIG statement this isn't a very useful 
> PACKAGECONFIG option as it only works when not specified, and if it's 
> specified is non-deterministic.
>

Hi Ross,

I've sent to V2 with modification in PACKAGECONFIG. With this 
modification, the build result would not be non-deterministic.

Best Regards,
Chen Qi

> It appears that this valgrind support is for running the test suite 
> under valgrind for leak detection, which is something we're unlikely 
> to do.  A quick fix would be to comment out the check.
>
> A proper fix would be to use AC_ARG_WITH(valgrind), default to "auto", 
> use the pkg-config macros and respect yes/no/auto as appropriate.  The 
> mantra here being to spend ten minutes fixing it properly upstream 
> instead of having to rewrite the patch often as upstream changes their 
> configure script.
>
> Ross


--------------060104020207060108010009
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/12/2014 11:55 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbDXrc=RK5zbE2z24K86Ti5eEcS1LRYCOHC7jfFeUOpFA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On 12 November 2014 10:45, Chen Qi <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">+-AC_CHECK_HEADERS_ONCE([valgrind/memcheck.h
              valgrind/valgrind.h])<br>
              ++AC_ARG_ENABLE(valgrindheader,
              AS_HELP_STRING([--disable-valgrindheader], [disable
              valgrind header checking]))<br>
              ++if test "x$enable_valgrindheader" != "xno"; then<br>
              ++        AC_CHECK_HEADERS_ONCE([valgrind/memcheck.h
              valgrind/valgrind.h])<br>
              ++fi<br>
            </blockquote>
            <div><br>
            </div>
            <div>If the user passes --enable-valgrindheader and valgrind
              isn't present, it doesn't fail.  Combined with the lack of
              a valgrind build dependency in the PACKAGECONFIG statement
              this isn't a very useful PACKAGECONFIG option as it only
              works when not specified, and if it's specified is
              non-deterministic.</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Hi Ross,<br>
    <br>
    I've sent to V2 with modification in PACKAGECONFIG. With this
    modification, the build result would not be non-deterministic.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbDXrc=RK5zbE2z24K86Ti5eEcS1LRYCOHC7jfFeUOpFA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>It appears that this valgrind support is for running
              the test suite under valgrind for leak detection, which is
              something we're unlikely to do.  A quick fix would be to
              comment out the check.</div>
            <div><br>
            </div>
            <div>A proper fix would be to use AC_ARG_WITH(valgrind),
              default to "auto", use the pkg-config macros and respect
              yes/no/auto as appropriate.  The mantra here being to
              spend ten minutes fixing it properly upstream instead of
              having to rewrite the patch often as upstream changes
              their configure script.</div>
            <div><br>
            </div>
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------060104020207060108010009--

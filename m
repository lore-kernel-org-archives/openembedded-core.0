Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D447C6FF64
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 13:05:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2ID4x24026224
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 18 Mar 2016 06:04:59 -0700
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 18 Mar 2016 06:04:58 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1458282563.git.hongxu.jia@windriver.com>
	<bf3c411f84f26b13de2a4f40d1d7141b735ccb3f.1458282563.git.hongxu.jia@windriver.com>
	<CAHiDW_HdK9jJmmFvt+PMgbK9O0qukSRw=MuY_+N-zXMH+wup=w@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56EBFCF8.6020603@windriver.com>
Date: Fri, 18 Mar 2016 21:04:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_HdK9jJmmFvt+PMgbK9O0qukSRw=MuY_+N-zXMH+wup=w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/18] dtc.inc: fix buildpaths QA issue
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
X-List-Received-Date: Fri, 18 Mar 2016 13:05:13 -0000
Content-Type: multipart/alternative;
	boundary="------------090102030803080606020301"

--------------090102030803080606020301
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2016 08:01 PM, Jussi Kukkonen wrote:
>
>
>     +Upstream-Status: Inappropriate [openembedded specific]
>
>
> Is this really an openembedded specific change?
>
>     +
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + Makefile | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/Makefile b/Makefile
>     +index 18838cc..4954f32 100644
>     +--- a/Makefile
>     ++++ b/Makefile
>     +@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =
>     + CPPFLAGS = -I libfdt -I .
>     + WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual
>     -Wnested-externs \
>     +       -Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
>     -Wshadow
>     +-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
>     ++CFLAGS = $(DEBUG_FLAGS) -Os -fPIC -Werror $(WARNINGS)
>

See here, variable DEBUG_FLAGS is oe specific. That's the reason.

//Hongxu

--------------090102030803080606020301
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/18/2016 08:01 PM, Jussi Kukkonen
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHiDW_HdK9jJmmFvt+PMgbK9O0qukSRw=MuY_+N-zXMH+wup=w@mail.gmail.com"
      type="cite">
      <blockquote class="gmail_quote" style="margin:0 0 0
        .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
        +Upstream-Status: Inappropriate [openembedded specific]<br>
      </blockquote>
      <div><br>
      </div>
      <div>Is this really an openembedded specific change?</div>
      <div><br>
      </div>
      <blockquote class="gmail_quote" style="margin:0 0 0
        .8ex;border-left:1px #ccc solid;padding-left:1ex">+<br>
        +Signed-off-by: Hongxu Jia &lt;<a moz-do-not-send="true"
          href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
        +---<br>
        + Makefile | 2 +-<br>
        + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
        +<br>
        +diff --git a/Makefile b/Makefile<br>
        +index 18838cc..4954f32 100644<br>
        +--- a/Makefile<br>
        ++++ b/Makefile<br>
        +@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =<br>
        + CPPFLAGS = -I libfdt -I .<br>
        + WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual
        -Wnested-externs \<br>
        +       -Wstrict-prototypes -Wmissing-prototypes
        -Wredundant-decls -Wshadow<br>
        +-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)<br>
        ++CFLAGS = $(DEBUG_FLAGS) -Os -fPIC -Werror $(WARNINGS)</blockquote>
    </blockquote>
    <br>
    See here, variable DEBUG_FLAGS is oe specific. That's the reason.<br>
    <br>
    //Hongxu<br>
  </body>
</html>

--------------090102030803080606020301--

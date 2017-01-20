Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 17A936093A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 07:13:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0K7DFkQ015697
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jan 2017 23:13:15 -0800 (PST)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 19 Jan 2017 23:13:15 -0800
To: Jussi Kukkonen <jussi.kukkonen@intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1484819263.git.dengke.du@windriver.com>
	<5f146756851fbbddb0b37c85b2705857495d38e0.1484819263.git.dengke.du@windriver.com>
	<CAJTo0LbhNAXNKTYX8CwFYvXGbjthTpsVQ-ddsO7Za6E0tfW0iQ@mail.gmail.com>
	<CAHiDW_FMcOb2-Rmh0bgJ7jksK47WUDxNzZwGJHG42Tp0QE08yw@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <0901b20b-af67-9e20-5b66-63a36d7779c8@windriver.com>
Date: Fri, 20 Jan 2017 15:13:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAHiDW_FMcOb2-Rmh0bgJ7jksK47WUDxNzZwGJHG42Tp0QE08yw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssh: upgrade to 7.4p1
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
X-List-Received-Date: Fri, 20 Jan 2017 07:13:17 -0000
Content-Type: multipart/alternative;
	boundary="------------0DD8F8556C3EF5DDFF7F85CB"

--------------0DD8F8556C3EF5DDFF7F85CB
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jussi

The remaining patch are still useful, I just rebase those patchs on 
version 74.p1. I will explain it.

Thanks.


On 2017年01月19日 20:32, Jussi Kukkonen wrote:
>
>
> On 19 January 2017 at 13:52, Burton, Ross <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
>
>     You're removing this patch:
>
>     On 19 January 2017 at 09:50, Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>> wrote:
>
>         ---
>         a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
>         +++ /dev/null
>         @@ -1,69 +0,0 @@
>         -Adjust test cases to work with busybox.
>         -
>         -- Replace dd parameter "obs" with "bs".
>         -- Replace "head -<num>" with "head -n <num>".
>         -
>         -Signed-off-by: Maxin B. John <maxin.john@enea.com
>         <mailto:maxin.john@enea.com>>
>         -Upstream-Status: Pending
>         -
>         -Index: openssh-6.8p1/regress/cipher-speed.sh
>         -===================================================================
>         ---- openssh-6.8p1.orig/regress/cipher-speed.sh
>         -+++ openssh-6.8p1/regress/cipher-speed.sh
>         -@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=0; for
>         -               printf "%-60s" "$c/$m:"
>         -               ( ${SSH} -o 'compression no' \
>         -                       -F $OBJ/ssh_proxy -2 -m $m -c $c
>         somehost \
>         --                      exec sh -c \'"dd of=/dev/null obs=32k"\' \
>         -+                      exec sh -c \'"dd of=/dev/null bs=32k"\' \
>
>
>     But upstream still has exec sh -c \'"dd of=/dev/null obs=32k"\',
>     so this patch is still needed.
>
>     Please always explain why patches are being removed in the commit
>     message.
>
>
> There's also lots of changes to the remaining patches. Some of them 
> look weird -- possibly they're just whitespace changes? Please mention 
> what the patch changes are in the commit message.
>
> Jussi


--------------0DD8F8556C3EF5DDFF7F85CB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Hi Jussi</p>
    <p>The remaining patch are still useful, I just rebase those patchs
      on version 74.p1. I will explain it.</p>
    <p>Thanks.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2017年01月19日 20:32, Jussi Kukkonen
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHiDW_FMcOb2-Rmh0bgJ7jksK47WUDxNzZwGJHG42Tp0QE08yw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 19 January 2017 at 13:52, Burton,
            Ross <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:ross.burton@intel.com" target="_blank">ross.burton@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div dir="ltr">
                <div class="gmail_extra">You're removing this patch:</div>
                <div class="gmail_extra"><span class=""><br>
                    <div class="gmail_quote">On 19 January 2017 at
                      09:50, Dengke Du <span dir="ltr">&lt;<a
                          moz-do-not-send="true"
                          href="mailto:dengke.du@windriver.com"
                          target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:dengke.du@windriver.com">dengke.du@windriver.com</a></a>&gt;</span>
                      wrote:<br>
                      <blockquote class="gmail_quote" style="margin:0px
                        0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
                        <div id="m_-6663932194610955239gmail-:g0"
                          class="m_-6663932194610955239gmail-a3s
                          m_-6663932194610955239gmail-aXjCH
                          m_-6663932194610955239gmail-m159b623a3630db7c">---
                          a/meta/recipes-connectivity/op<wbr>enssh/openssh/add-test-support<wbr>-for-busybox.patch<br>
                          +++ /dev/null<br>
                          @@ -1,69 +0,0 @@<br>
                          -Adjust test cases to work with busybox.<br>
                          -<br>
                          -- Replace dd parameter "obs" with "bs".<br>
                          -- Replace "head -&lt;num&gt;" with "head -n
                          &lt;num&gt;".<br>
                          -<br>
                          -Signed-off-by: Maxin B. John &lt;<a
                            moz-do-not-send="true"
                            href="mailto:maxin.john@enea.com"
                            target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:maxin.john@enea.com">maxin.john@enea.com</a></a>&gt;<br>
                          -Upstream-Status: Pending<br>
                          -<br>
                          -Index: openssh-6.8p1/regress/cipher-s<wbr>peed.sh<br>
                          -=============================<wbr>==============================<wbr>========<br>
                          ---- openssh-6.8p1.orig/regress/cip<wbr>her-speed.sh<br>
                          -+++ openssh-6.8p1/regress/cipher-s<wbr>peed.sh<br>
                          -@@ -17,7 +17,7 @@ for c in `${SSH} -Q
                          cipher`; do n=0; for<br>
                          -               printf "%-60s" "$c/$m:"<br>
                          -               ( ${SSH} -o 'compression no' \<br>
                          -                       -F $OBJ/ssh_proxy -2
                          -m $m -c $c somehost \<br>
                          --                      exec sh -c \'"dd
                          of=/dev/null obs=32k"\' \<br>
                          -+                      exec sh -c \'"dd
                          of=/dev/null bs=32k"\' \</div>
                      </blockquote>
                    </div>
                    <br>
                  </span>But upstream still has exec sh -c \'"dd
                  of=/dev/null obs=32k"\', so this patch is still
                  needed.</div>
                <div class="gmail_extra"><br>
                </div>
                <div class="gmail_extra">Please always explain why
                  patches are being removed in the commit message.</div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>There's also lots of changes to the remaining patches.
              Some of them look weird -- possibly they're just
              whitespace changes? Please mention what the patch changes
              are in the commit message.</div>
            <div><br>
            </div>
            <div>Jussi</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------0DD8F8556C3EF5DDFF7F85CB--

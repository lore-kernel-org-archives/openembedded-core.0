Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C19671E14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 02:06:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0K26fTi013338
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jan 2017 18:06:41 -0800 (PST)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 19 Jan 2017 18:06:40 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1484819263.git.dengke.du@windriver.com>
	<5f146756851fbbddb0b37c85b2705857495d38e0.1484819263.git.dengke.du@windriver.com>
	<CAJTo0LbhNAXNKTYX8CwFYvXGbjthTpsVQ-ddsO7Za6E0tfW0iQ@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <cfd6d299-c631-b3a6-94ee-a752476fbedc@windriver.com>
Date: Fri, 20 Jan 2017 10:06:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbhNAXNKTYX8CwFYvXGbjthTpsVQ-ddsO7Za6E0tfW0iQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 20 Jan 2017 02:06:41 -0000
Content-Type: multipart/alternative;
	boundary="------------9F1A3A1C8FC0FFA5B83D1926"

--------------9F1A3A1C8FC0FFA5B83D1926
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for reminding, I use the "devtool modify openssh", so it has 
apply the add-test-

support-for-busybox.patch to the openssh, I am not find this, it's my 
fault. I will do this again.

On 2017年01月19日 19:52, Burton, Ross wrote:
> You're removing this patch:
>
> On 19 January 2017 at 09:50, Dengke Du <dengke.du@windriver.com 
> <mailto:dengke.du@windriver.com>> wrote:
>
>     ---
>     a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
>     +++ /dev/null
>     @@ -1,69 +0,0 @@
>     -Adjust test cases to work with busybox.
>     -
>     -- Replace dd parameter "obs" with "bs".
>     -- Replace "head -<num>" with "head -n <num>".
>     -
>     -Signed-off-by: Maxin B. John <maxin.john@enea.com
>     <mailto:maxin.john@enea.com>>
>     -Upstream-Status: Pending
>     -
>     -Index: openssh-6.8p1/regress/cipher-speed.sh
>     -===================================================================
>     ---- openssh-6.8p1.orig/regress/cipher-speed.sh
>     -+++ openssh-6.8p1/regress/cipher-speed.sh
>     -@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=0; for
>     -               printf "%-60s" "$c/$m:"
>     -               ( ${SSH} -o 'compression no' \
>     -                       -F $OBJ/ssh_proxy -2 -m $m -c $c somehost \
>     --                      exec sh -c \'"dd of=/dev/null obs=32k"\' \
>     -+                      exec sh -c \'"dd of=/dev/null bs=32k"\' \
>
>
> But upstream still has exec sh -c \'"dd of=/dev/null obs=32k"\', so 
> this patch is still needed.
>
> Please always explain why patches are being removed in the commit message.
>
> Ross


--------------9F1A3A1C8FC0FFA5B83D1926
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Thanks for reminding, I use the "devtool modify openssh", so it
      has apply the add-test-</p>
    <div id="gmail-:g0" class="gmail-a3s gmail-aXjCH
      gmail-m159b623a3630db7c"><wbr>support-for-busybox.patch to the
      openssh, I am not find this, it's my fault. I will do this again.<br>
      <br>
    </div>
    <div class="moz-cite-prefix">On 2017年01月19日 19:52, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbhNAXNKTYX8CwFYvXGbjthTpsVQ-ddsO7Za6E0tfW0iQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra">You're removing this patch:</div>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 19 January 2017 at 09:50, Dengke
            Du <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:dengke.du@windriver.com" target="_blank">dengke.du@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id="gmail-:g0" class="gmail-a3s gmail-aXjCH
                gmail-m159b623a3630db7c">---
                a/meta/recipes-connectivity/<wbr>openssh/openssh/add-test-<wbr>support-for-busybox.patch<br>
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
                  href="mailto:maxin.john@enea.com"><a class="moz-txt-link-abbreviated" href="mailto:maxin.john@enea.com">maxin.john@enea.com</a></a>&gt;<br>
                -Upstream-Status: Pending<br>
                -<br>
                -Index: openssh-6.8p1/regress/cipher-<wbr>speed.sh<br>
                -=============================<wbr>==============================<wbr>========<br>
                ---- openssh-6.8p1.orig/regress/<wbr>cipher-speed.sh<br>
                -+++ openssh-6.8p1/regress/cipher-<wbr>speed.sh<br>
                -@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=0;
                for<br>
                -               printf "%-60s" "$c/$m:"<br>
                -               ( ${SSH} -o 'compression no' \<br>
                -                       -F $OBJ/ssh_proxy -2 -m $m -c $c
                somehost \<br>
                --                      exec sh -c \'"dd of=/dev/null
                obs=32k"\' \<br>
                -+                      exec sh -c \'"dd of=/dev/null
                bs=32k"\' \</div>
            </blockquote>
          </div>
          <br>
          But upstream still has exec sh -c \'"dd of=/dev/null
          obs=32k"\', so this patch is still needed.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Please always explain why patches are
          being removed in the commit message.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------9F1A3A1C8FC0FFA5B83D1926--

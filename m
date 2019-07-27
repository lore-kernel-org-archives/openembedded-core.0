Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 720607E08D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 01:36:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6R1aJCB007489
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jul 2019 18:36:19 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 26 Jul 2019 18:36:19 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190726092342.37231-1-kai.kang@windriver.com>
	<CANNYZj8Jm7q5NfUjHVuDJGaJHC51txQ-iMWZP7YC4-nWkRstdg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <ee2018da-9448-97ba-b34e-c490164492bb@windriver.com>
Date: Sat, 27 Jul 2019 09:35:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8Jm7q5NfUjHVuDJGaJHC51txQ-iMWZP7YC4-nWkRstdg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-sato-sdk: test image with 512M memory
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
X-List-Received-Date: Sat, 27 Jul 2019 01:36:21 -0000
Content-Type: multipart/alternative;
	boundary="------------099B525E31E49A6FDF29AE05"
Content-Language: en-US

--------------099B525E31E49A6FDF29AE05
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2019/7/26 下午6:11, Alexander Kanavin wrote:
> I think you need to use QB_MEM here.

Used TEST_QEMUPARAMS because I found the following line in 
testimage.bbclass:

# TEST_QEMUPARAMS can be used to pass extra parameters to qemu, e.g. "-m 
1024" for setting the amount o f ram to 1 GB.


And it seems QB_MEM is not used when boot the qemu during testimage.


>
> Also, maybe we should just bump the 256M default?

I hope so.


Regards,
Kai


>
> Alex
>
> On Fri, 26 Jul 2019 at 12:24, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     When run do_testimage for core-image-sato-sdk, it fails to pass test
>     case:
>
>     | RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED
>     (0.43s)
>
>     It is OOM issue and daemon rpc.statd is killed:
>
>     |  [  531.306146] Out of memory: Kill process 193 (rpc.statd)
>     score 200 or sacrifice child
>
>     Increase the memory of qemu to 512M to avoid such OOM issue.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>      meta/recipes-sato/images/core-image-sato-sdk.bb
>     <http://core-image-sato-sdk.bb> | 1 +
>      1 file changed, 1 insertion(+)
>
>     diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb
>     <http://core-image-sato-sdk.bb>
>     b/meta/recipes-sato/images/core-image-sato-sdk.bb
>     <http://core-image-sato-sdk.bb>
>     index d7cc52b52b..f7963d018e 100644
>     --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
>     <http://core-image-sato-sdk.bb>
>     +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
>     <http://core-image-sato-sdk.bb>
>     @@ -9,3 +9,4 @@ IMAGE_FEATURES += "dev-pkgs tools-sdk \
>
>      IMAGE_INSTALL += "kernel-devsrc"
>
>     +TEST_QEMUPARAMS = "-m 512"
>     -- 
>     2.20.0
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
Kai Kang


--------------099B525E31E49A6FDF29AE05
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2019/7/26 下午6:11, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj8Jm7q5NfUjHVuDJGaJHC51txQ-iMWZP7YC4-nWkRstdg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">I think you need to use QB_MEM here.</div>
    </blockquote>
    <p>Used TEST_QEMUPARAMS because I found the following line in
      testimage.bbclass:</p>
    <p># TEST_QEMUPARAMS can be used to pass extra parameters to qemu,
      e.g. "-m 1024" for setting the amount o f ram to 1 GB.</p>
    <p><br>
    </p>
    <p>And it seems QB_MEM is not used when boot the qemu during
      testimage.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj8Jm7q5NfUjHVuDJGaJHC51txQ-iMWZP7YC4-nWkRstdg@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Also, maybe we should just bump the 256M default?</div>
      </div>
    </blockquote>
    <p>I hope so. <br>
    </p>
    <p><br>
    </p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj8Jm7q5NfUjHVuDJGaJHC51txQ-iMWZP7YC4-nWkRstdg@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Alex</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, 26 Jul 2019 at 12:24,
          &lt;<a href="mailto:kai.kang@windriver.com"
            moz-do-not-send="true">kai.kang@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">From:
          Kai Kang &lt;<a href="mailto:kai.kang@windriver.com"
            target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
          <br>
          When run do_testimage for core-image-sato-sdk, it fails to
          pass test<br>
          case:<br>
          <br>
          | RESULTS - systemd.SystemdBasicTests.test_systemd_failed:
          FAILED (0.43s)<br>
          <br>
          It is OOM issue and daemon rpc.statd is killed:<br>
          <br>
          |  [  531.306146] Out of memory: Kill process 193 (rpc.statd)
          score 200 or sacrifice child<br>
          <br>
          Increase the memory of qemu to 512M to avoid such OOM issue.<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a
            href="mailto:kai.kang@windriver.com" target="_blank"
            moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
          ---<br>
           meta/recipes-sato/images/<a
            href="http://core-image-sato-sdk.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">core-image-sato-sdk.bb</a>
          | 1 +<br>
           1 file changed, 1 insertion(+)<br>
          <br>
          diff --git a/meta/recipes-sato/images/<a
            href="http://core-image-sato-sdk.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">core-image-sato-sdk.bb</a>
          b/meta/recipes-sato/images/<a
            href="http://core-image-sato-sdk.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">core-image-sato-sdk.bb</a><br>
          index d7cc52b52b..f7963d018e 100644<br>
          --- a/meta/recipes-sato/images/<a
            href="http://core-image-sato-sdk.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">core-image-sato-sdk.bb</a><br>
          +++ b/meta/recipes-sato/images/<a
            href="http://core-image-sato-sdk.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">core-image-sato-sdk.bb</a><br>
          @@ -9,3 +9,4 @@ IMAGE_FEATURES += "dev-pkgs tools-sdk \<br>
          <br>
           IMAGE_INSTALL += "kernel-devsrc"<br>
          <br>
          +TEST_QEMUPARAMS = "-m 512"<br>
          -- <br>
          2.20.0<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang</pre>
  </body>
</html>

--------------099B525E31E49A6FDF29AE05--

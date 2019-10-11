Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 74F83731CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 01:23:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9B1NXpV021004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Oct 2019 18:23:33 -0700 (PDT)
Received: from [128.224.158.194] (128.224.158.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 10 Oct 2019 18:23:33 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
	<874b5e653ac604a410f2290e0b97ad7acb4a0d39.1567169002.git.alex.kanavin@gmail.com>
	<3625c508-3380-25b3-aacd-63543d3782b1@windriver.com>
	<CANNYZj_SOSotWpU_rBema9Pt_RAcdqAYws3Pxs=7JmwXK3Wz3w@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <f804f910-749b-3dd4-2e7d-01f8332c0a02@windriver.com>
Date: Fri, 11 Oct 2019 09:23:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_SOSotWpU_rBema9Pt_RAcdqAYws3Pxs=7JmwXK3Wz3w@mail.gmail.com>
X-Originating-IP: [128.224.158.194]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/13] qemu: switch to '-vga std' emulated hardware from vmware/cirrus for x86/mips
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
X-List-Received-Date: Fri, 11 Oct 2019 01:23:40 -0000
Content-Type: multipart/alternative;
	boundary="------------758E85407C3DDA9C48A9B9B9"
Content-Language: en-US

--------------758E85407C3DDA9C48A9B9B9
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10/10/19 6:02 PM, Alexander Kanavin wrote:
> On Thu, 10 Oct 2019 at 08:16, Changqing Li <changqing.li@windriver.com 
> <mailto:changqing.li@windriver.com>> wrote:
>
>     After switch from -vga vmware to -vga std (use qemux86-64),  start
>     image by "runqemu nographic",
>
>     Memory used by process Xorg raised a lot,   for my image,   from
>     ~%7 to ~%34 (check by ps aux --sort -rss)
>
>     also check memory by command "systemctl status xserver-nodm", 
>     raised from ~60M to ~120M.
>
>     with the high raise of memory usage of Xorg, when run oe-test on
>     the target,  OOM is happened like:
>
>     [ 1038.221438]*Out of memory*: Killed process 180 (Xorg)
>     total-vm:335368kB, anon-rss:68824kB, file-rss:0kB, shmem-rss:140kB
>
>
>     Also test with poky distro,  and image core-image-sato, also
>     installed procps.
>
>     1. "ps aux --sort -rss":  Xorg from  ~3.6%  to ~ 17.4%
>
>     2. "systemctl status xserver-nodm":  from ~65M to ~131M
>
>
>     Any idea about how to resolve this problem?  do we really need
>     unify all boards to -vga=std? Thanks.
>
>
> The increased memory usage is due to glamor loading the full 3D stack, 
> mesa and friends. You can drop opengl from DISTRO_FEATURES, or 
> otherwise disable glamor in xorg recipe via PACKAGECONFIG.
>
> Or you can bump the available RAM for your image like is already done 
> for core-image-sato.
>
> Alex

Thanks!

Sandy


--------------758E85407C3DDA9C48A9B9B9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/10/19 6:02 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_SOSotWpU_rBema9Pt_RAcdqAYws3Pxs=7JmwXK3Wz3w@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">On Thu, 10 Oct 2019 at 08:16, Changqing Li &lt;<a
            href="mailto:changqing.li@windriver.com"
            moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">After switch from -vga vmware to -vga
              std (use qemux86-64),  start image by "runqemu nographic",
              <br>
              <p>Memory used by process Xorg raised a lot,   for my
                image,   from ~%7 to ~%34 (check by ps aux --sort -rss)<br>
              </p>
              <p>also check memory by command "systemctl status
                xserver-nodm",  raised from ~60M to ~120M.</p>
              <p>with the high raise of memory usage of Xorg, when run
                oe-test on the target,  OOM is happened like:</p>
              <p><span
style="color:rgb(51,51,51);font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(245,245,245);text-decoration-style:initial;text-decoration-color:initial;display:inline;float:none">[
                  1038.221438]<span> </span></span><b
style="color:rgb(51,51,51);font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(245,245,245);text-decoration-style:initial;text-decoration-color:initial">Out
                  of memory</b><span
style="color:rgb(51,51,51);font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(245,245,245);text-decoration-style:initial;text-decoration-color:initial;display:inline;float:none">:
                  Killed process 180 (Xorg) total-vm:335368kB,
                  anon-rss:68824kB, file-rss:0kB, shmem-rss:140kB</span></p>
              <p><br>
              </p>
              <p>Also test with poky distro,  and image core-image-sato,
                also installed procps.<br>
              </p>
              <p>1. "ps aux --sort -rss":  Xorg from  ~3.6%  to ~ 17.4%</p>
              <p>2. "systemctl status xserver-nodm":  from ~65M to ~131M</p>
              <p><br>
              </p>
              <p>Any idea about how to resolve this problem?  do we
                really need unify all boards to -vga=std? Thanks.</p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>The increased memory usage is due to glamor loading the
            full 3D stack, mesa and friends. You can drop opengl from
            DISTRO_FEATURES, or otherwise disable glamor in xorg recipe
            via PACKAGECONFIG.</div>
          <div><br>
          </div>
          <div>Or you can bump the available RAM for your image like is
            already done for core-image-sato.</div>
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Thanks!</p>
    <p>Sandy<br>
    </p>
  </body>
</html>

--------------758E85407C3DDA9C48A9B9B9--

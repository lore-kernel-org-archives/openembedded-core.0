Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D83860024
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 01:51:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0U1pJNN028342
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Jan 2015 17:51:19 -0800 (PST)
Received: from yu.wr (128.224.163.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 29 Jan 2015 17:51:18 -0800
Message-ID: <54CAE393.2020605@windriver.com>
Date: Fri, 30 Jan 2015 09:51:15 +0800
From: Pengyu Ma <pengyu.ma@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Nicolas Dechesne
	<nicolas.dechesne@linaro.org>
References: <1422435425-20620-1-git-send-email-pengyu.ma@windriver.com>
	<CAP71Wjyba6f0VpKMFJkOs21KPFdtX_ScR3E=jtJTit_mkaN0cA@mail.gmail.com>
	<54CA05D4.6040404@windriver.com>
	<CAP71WjwH+Z6Ys+vLQ66Agr07HrDNzVmy1q5NFgLXzdwCK5L=+A@mail.gmail.com>
	<CAJTo0LaxjO4nX9fWWQN-e0EgTSt6RRc9U-DovdQFY5+z7tMLmw@mail.gmail.com>
In-Reply-To: <CAJTo0LaxjO4nX9fWWQN-e0EgTSt6RRc9U-DovdQFY5+z7tMLmw@mail.gmail.com>
X-Originating-IP: [128.224.163.160]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] mesa: Upgrade to 10.4.0
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
X-List-Received-Date: Fri, 30 Jan 2015 01:51:28 -0000
Content-Type: multipart/alternative;
	boundary="------------070808080305020108010603"

--------------070808080305020108010603
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 01/29/2015 06:35 PM, Burton, Ross wrote:
>
> On 29 January 2015 at 10:10, Nicolas Dechesne 
> <nicolas.dechesne@linaro.org <mailto:nicolas.dechesne@linaro.org>> wrote:
>
>     well, i am not sure this is right... at least probably not the right
>     argument. oe-core is not meant to be tied to specific intel stable
>     releases, whether it is about content or  schedule..
>
>     i would believe our goal is to provide the most recent stable release
>     instead. so that each OE (well, Yocto) release ends up with the most
>     recent versions.
>
>     fwiw, for the boards/platforms i care about, 10.4.3 would be fine.
>
>
> Agreed.  The Intel driver release is tested with 10.4.0 but 10.4.3 is 
> a newer point release so should work, and Intel's aim of ensuring that 
> the latest driver stack is supported doesn't trump having the latest 
> upstream releases in oe-core.
>
> If it turns out that 10.4.3 is critically broken with the Intel driver 
> then *meta-intel* can ship 10.4.0.
>
> Please re-submit this with 10.4.3 instead of 10.4.0.
>
mesa_git bb will keep sync the latest version 10.4.3, that's why we keep 
both _git and 10.4.0.
Now all all the version of xorg-video-intel, libdrm, and xserver-xorg 
are the same with Intel Graphic stack 2014 Q4.
So mesa_10.4.0 will make a stable and verified solution here,
and _git version will make the latest version here.

Pengyu

> Ross


--------------070808080305020108010603
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 01/29/2015 06:35 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaxjO4nX9fWWQN-e0EgTSt6RRc9U-DovdQFY5+z7tMLmw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 29 January 2015 at 10:10, Nicolas
            Dechesne <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:nicolas.dechesne@linaro.org"
                target="_blank">nicolas.dechesne@linaro.org</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":20z" class="a3s" style="overflow:hidden">well, i
                am not sure this is right... at least probably not the
                right<br>
                argument. oe-core is not meant to be tied to specific
                intel stable<br>
                releases, whether it is about content or  schedule..<br>
                <br>
                i would believe our goal is to provide the most recent
                stable release<br>
                instead. so that each OE (well, Yocto) release ends up
                with the most<br>
                recent versions.<br>
                <br>
                fwiw, for the boards/platforms i care about, 10.4.3
                would be fine.</div>
            </blockquote>
            <div><br>
            </div>
            <div>Agreed.  The Intel driver release is tested with 10.4.0
              but 10.4.3 is a newer point release so should work, and
              Intel's aim of ensuring that the latest driver stack is
              supported doesn't trump having the latest upstream
              releases in oe-core.</div>
            <div><br>
            </div>
            <div>If it turns out that 10.4.3 is critically broken with
              the Intel driver then *meta-intel* can ship 10.4.0.</div>
            <div><br>
            </div>
            <div>Please re-submit this with 10.4.3 instead of 10.4.0.</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    mesa_git bb will keep sync the latest version 10.4.3, that's why we
    keep both _git and 10.4.0.<br>
    Now all all the version of xorg-video-intel, libdrm, and
    xserver-xorg are the same with Intel Graphic stack 2014 Q4.<br>
    So mesa_10.4.0 will make a stable and verified solution here,<br>
    and _git version will make the latest version here.<br>
    <br>
    Pengyu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaxjO4nX9fWWQN-e0EgTSt6RRc9U-DovdQFY5+z7tMLmw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------070808080305020108010603--

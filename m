Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF8C361EB2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 06:32:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4S6WTTH017205
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 May 2013 23:32:29 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 27 May 2013 23:32:29 -0700
Message-ID: <51A44F8D.90002@windriver.com>
Date: Tue, 28 May 2013 14:32:45 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <cover.1369719531.git.Qi.Chen@windriver.com>
	<CANwerB12XmNSm9AYAdz+SZGp6VYmjDiLyJYQY8g6F+GdJqn0rQ@mail.gmail.com>
In-Reply-To: <CANwerB12XmNSm9AYAdz+SZGp6VYmjDiLyJYQY8g6F+GdJqn0rQ@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] switch to using busybox instead of tinylogin
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
X-List-Received-Date: Tue, 28 May 2013 06:32:29 -0000
Content-Type: multipart/alternative;
	boundary="------------070100090900060902000706"

--------------070100090900060902000706
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/28/2013 02:25 PM, Jonathan Liu wrote:
> On 28 May 2013 15:39, <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>
>     The following changes since commit
>     21089515bd18ba18e86ec8f72ff8141b9fb1dea8:
>
>       ref-manual: Added xmlto and dblatex packages for docs
>     (2013-05-22 17:23:41 +0100)
>
>     are available in the git repository at:
>
>       git://git.pokylinux.org/poky-contrib
>     <http://git.pokylinux.org/poky-contrib> ChenQi/tinylogin-busybox
>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/tinylogin-busybox
>
>     Chen Qi (2):
>       packagegroup-core-boot: use busybox as the default login manager
>       busybox: enable login/password commands by default
>
>      meta/recipes-core/busybox/busybox-1.20.2/defconfig |   26
>     ++++++++++----------
>      .../packagegroups/packagegroup-core-boot.bb
>     <http://packagegroup-core-boot.bb>        |    2 +-
>      2 files changed, 14 insertions(+), 14 deletions(-)
>
>
> After switching from tinylogin to busybox, the following commands that 
> used to be provided by tinylogin are provided by other packages 
> instead of busybox:
> -/bin/login [shadow]
> -/sbin/getty [util-linux-agetty]
> -/usr/bin/passwd  [shadow]
> -/usr/bin/su [shadow]
>
> Perhaps util-linux-agetty and shadow packages have higher alternatives 
> priority?
>
The answer seems to be 'yes'.

meta/recipes-core/busybox/busybox.inc:ALTERNATIVE_PRIORITY = "50"
meta/recipes-extended/shadow/shadow_4.1.4.3.bb:ALTERNATIVE_PRIORITY = "200"
meta/recipes-core/util-linux/util-linux.inc:ALTERNATIVE_PRIORITY = "100"

//Chen Qi

> Regards,
> Jonathan


--------------070100090900060902000706
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 05/28/2013 02:25 PM, Jonathan Liu
      wrote:<br>
    </div>
    <blockquote
cite="mid:CANwerB12XmNSm9AYAdz+SZGp6VYmjDiLyJYQY8g6F+GdJqn0rQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">On 28 May 2013 15:39, <span dir="ltr">&lt;<a
            moz-do-not-send="true" href="mailto:Qi.Chen@windriver.com"
            target="_blank">Qi.Chen@windriver.com</a>&gt;</span> wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">From:
              Chen Qi &lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
              <br>
              The following changes since commit
              21089515bd18ba18e86ec8f72ff8141b9fb1dea8:<br>
              <br>
                ref-manual: Added xmlto and dblatex packages for docs
              (2013-05-22 17:23:41 +0100)<br>
              <br>
              are available in the git repository at:<br>
              <br>
                git://<a moz-do-not-send="true"
                href="http://git.pokylinux.org/poky-contrib"
                target="_blank">git.pokylinux.org/poky-contrib</a>
              ChenQi/tinylogin-busybox<br>
                <a moz-do-not-send="true"
href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/tinylogin-busybox"
                target="_blank">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/tinylogin-busybox</a><br>
              <br>
              Chen Qi (2):<br>
                packagegroup-core-boot: use busybox as the default login
              manager<br>
                busybox: enable login/password commands by default<br>
              <br>
               meta/recipes-core/busybox/busybox-1.20.2/defconfig |   26
              ++++++++++----------<br>
               .../packagegroups/<a moz-do-not-send="true"
                href="http://packagegroup-core-boot.bb" target="_blank">packagegroup-core-boot.bb</a>
                     |    2 +-<br>
               2 files changed, 14 insertions(+), 14 deletions(-)<br>
            </blockquote>
            <div><br>
            </div>
            After switching from tinylogin to busybox, the following
            commands that used to be provided by tinylogin are provided
            by other packages instead of busybox:<br>
            <div>-/bin/login [shadow]<br>
            </div>
            <div>-/sbin/getty [util-linux-agetty]<br>
            </div>
            <div>-/usr/bin/passwd  [shadow]</div>
            <div>-/usr/bin/su [shadow]<br>
            </div>
            <div><br>
            </div>
            <div style="">Perhaps util-linux-agetty and shadow packages
              have higher alternatives priority?</div>
            <div style=""><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    The answer seems to be 'yes'.<br>
    <br>
    meta/recipes-core/busybox/busybox.inc:ALTERNATIVE_PRIORITY = "50"<br>
    meta/recipes-extended/shadow/shadow_4.1.4.3.bb:ALTERNATIVE_PRIORITY
    = "200"<br>
    meta/recipes-core/util-linux/util-linux.inc:ALTERNATIVE_PRIORITY =
    "100"<br>
    <br>
    //Chen Qi<br>
    <br>
    <blockquote
cite="mid:CANwerB12XmNSm9AYAdz+SZGp6VYmjDiLyJYQY8g6F+GdJqn0rQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div style="">Regards,</div>
            <div style="">Jonathan</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------070100090900060902000706--

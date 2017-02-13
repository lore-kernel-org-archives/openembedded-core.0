Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21A0A60670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 01:35:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1D1Zkut020969
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 12 Feb 2017 17:35:46 -0800
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 12 Feb 2017 17:35:45 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
	<f3c4e388c57e638701c92b4a152817d77b6bc469.1486622007.git.hongxu.jia@windriver.com>
	<CAJTo0LbJHaDUaF3AWzSYyOFCcCH0yYutEctaQ_p7xt+cKyktHw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <4c74e0c7-0e2c-0d3d-c252-3de7c4b146b4@windriver.com>
Date: Mon, 13 Feb 2017 09:35:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbJHaDUaF3AWzSYyOFCcCH0yYutEctaQ_p7xt+cKyktHw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 11/13] bash: update patches for 4.4
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
X-List-Received-Date: Mon, 13 Feb 2017 01:35:48 -0000
Content-Type: multipart/alternative;
	boundary="------------8C3E933A9B0322194D07C144"

--------------8C3E933A9B0322194D07C144
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年02月10日 18:54, Burton, Ross wrote:
>
> On 9 February 2017 at 06:45, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     +do_install_append_class-target () {
>     +       # Workaround do_package_write_rpm failure
>     +       rm ${D}${libdir}/bash/uname
>     +}
>
>
> This isn't target specific as it also breaks nativesdk builds 
> (http://errors.yoctoproject.org/Errors/Details/131136/). To be honest 
> I'd prefer to fix the problem in rpm (or the build of this binary) 
> than work around it.
>

OK, I will try to fix rpm.

Hi Ross,

Could you accept the upgrade patches except ncurses and bash?
If yes, I will only resend ncurses and bash.

//Hongxu

> Ross



--------------8C3E933A9B0322194D07C144
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2017年02月10日 18:54, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbJHaDUaF3AWzSYyOFCcCH0yYutEctaQ_p7xt+cKyktHw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 9 February 2017 at 06:45, Hongxu
            Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id="gmail-:115" class="gmail-a3s gmail-aXjCH
                gmail-m15a219f6d24915e0">+do_install_append_class-<wbr>target
                () {<br>
                +       # Workaround do_package_write_rpm failure<br>
                +       rm ${D}${libdir}/<span class="gmail-il">bash</span>/uname<br>
                +}<br>
              </div>
            </blockquote>
          </div>
          <br>
          This isn't target specific as it also breaks nativesdk builds
          (<a moz-do-not-send="true"
            href="http://errors.yoctoproject.org/Errors/Details/131136/">http://errors.yoctoproject.org/Errors/Details/131136/</a>). 
          To be honest I'd prefer to fix the problem in rpm (or the
          build of this binary) than work around it.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    OK, I will try to fix rpm.<br>
    <br>
    Hi Ross,<br>
    <br>
    Could you accept the upgrade patches except ncurses and bash?<br>
    If yes, I will only resend ncurses and bash.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbJHaDUaF3AWzSYyOFCcCH0yYutEctaQ_p7xt+cKyktHw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------8C3E933A9B0322194D07C144--

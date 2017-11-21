Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2850F7868A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 01:16:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAL1G0A5012166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Nov 2017 17:16:00 -0800 (PST)
Received: from [128.224.162.147] (128.224.162.147) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 20 Nov 2017 17:15:59 -0800
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <cbb65333-4bc3-ec34-ffed-da65fc767030@windriver.com>
Date: Tue, 21 Nov 2017 09:18:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: fix formatting IDE storage does not trigger "change" uevents
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
X-List-Received-Date: Tue, 21 Nov 2017 01:16:01 -0000
Content-Type: multipart/alternative;
	boundary="------------2E59D4664801D85926CBB752"
Content-Language: en-US

--------------2E59D4664801D85926CBB752
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年11月20日 19:07, Burton, Ross wrote:
> On 17 November 2017 at 06:08, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     +qemu by default emulates IDE and the linux-yocto kernel(s) use
>     +CONFIG_IDE instead of the more modern libsata, so disks appear as
>     +/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE
>     +is deprecated.
>
>
> Can we fix our kernel and/or qemu configuration too?
>

Hi Bruce,

Do you have any suggestion? How about disable CONFIG_IDE?

//Hongxu

> Ross



--------------2E59D4664801D85926CBB752
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017年11月20日 19:07, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 17 November 2017 at 06:08, Hongxu Jia <span
          dir="ltr">&lt;<a href="mailto:hongxu.jia@windriver.com"
            target="_blank" moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">+qemu by
              default emulates IDE and the linux-yocto kernel(s) use<br>
              +CONFIG_IDE instead of the more modern libsata, so disks
              appear as<br>
              +/dev/hd*. A similar patch rejected by upstream because
              CONFIG_IDE<br>
              +is deprecated.<br>
            </blockquote>
            <div><br>
            </div>
            <div>Can we fix our kernel and/or qemu configuration too?</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Hi Bruce,<br>
    <br>
    Do you have any suggestion? How about disable CONFIG_IDE?<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Ross </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------2E59D4664801D85926CBB752--

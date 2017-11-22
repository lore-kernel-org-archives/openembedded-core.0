Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40C61607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 03:33:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAM3XlDC001980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 21 Nov 2017 19:33:47 -0800
Received: from [128.224.162.147] (128.224.162.147) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 21 Nov 2017 19:33:46 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com>
	<cbb65333-4bc3-ec34-ffed-da65fc767030@windriver.com>
	<CADkTA4O=gNCQLLJ5Yu5MM7T2kbEb1=RFjb=Va0vUoS1VW7CEYA@mail.gmail.com>
	<a738dbce-f217-54a3-c633-7945dafd462e@windriver.com>
	<CAJTo0LZNDCQNS9pCphNowjKTN-3ArhtCs2QMXz37FKkMTGujDA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <f5d2f302-55a0-f48a-7ece-e7b38235f7ea@windriver.com>
Date: Wed, 22 Nov 2017 11:36:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZNDCQNS9pCphNowjKTN-3ArhtCs2QMXz37FKkMTGujDA@mail.gmail.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 22 Nov 2017 03:33:53 -0000
Content-Type: multipart/alternative;
	boundary="------------F0F7EC56555392E9C20A212A"
Content-Language: en-US

--------------F0F7EC56555392E9C20A212A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年11月21日 19:31, Burton, Ross wrote:
> On 21 November 2017 at 07:00, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     1. Tweak kernel-cache to remove CONFIG_IDE for all available bsp.
>         It require necessary test to prove it is safe to remove it.
>         If the test is OK, I will send patch to yocto mailing list.
>
>
> I know you have your own huge autobuilder framework inside WR but I'll 
> happily throw a patch against oe-core at the public autobuilders for 
> extra testing.
>

No problem, I would like the public autobuilders.

But there several banners:

1. I do not have account on public autobuilder
     https://autobuilder.yocto.io/

     Maybe I should ask Michael or Joshua for help

2. The fix is on kernel-cache, not directly on oe-core,
     So it is difficult to use autobuilder

    Maybe I should ask Bruce for help

3. Most importantly, how to test, when find a way,
     the ideally is to add the test case to oe-core's
     meta-selftest

    I should do some investigation on the storage test.

So I think I should do 3 first, and then 1/2 later

//Hongxu

> Ross



--------------F0F7EC56555392E9C20A212A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017年11月21日 19:31, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZNDCQNS9pCphNowjKTN-3ArhtCs2QMXz37FKkMTGujDA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 21 November 2017 at 07:00, Hongxu Jia <span
          dir="ltr">&lt;<a href="mailto:hongxu.jia@windriver.com"
            target="_blank" moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF"><span class="">
                  <div class="m_-1761857646591655639moz-cite-prefix">1.
                    Tweak kernel-cache to remove CONFIG_IDE for all
                    available bsp.<br>
                  </div>
                </span>     It require necessary test to prove it is
                safe to remove it.<br>
                    If the test is OK, I will send patch to yocto
                mailing list.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>I know you have your own huge autobuilder framework
              inside WR but I'll happily throw a patch against oe-core
              at the public autobuilders for extra testing.</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    No problem, I would like the public autobuilders.<br>
    <br>
    But there several banners:<br>
    <br>
    1. I do not have account on public autobuilder<br>
        <a class="moz-txt-link-freetext" href="https://autobuilder.yocto.io/">https://autobuilder.yocto.io/</a><br>
    <br>
        Maybe I should ask Michael or Joshua for help<br>
    <br>
    2. The fix is on kernel-cache, not directly on oe-core,<br>
        So it is difficult to use autobuilder<br>
    <br>
       Maybe I should ask Bruce for help<br>
    <br>
    3. Most importantly, how to test, when find a way,<br>
        the ideally is to add the test case to oe-core's <br>
        meta-selftest<br>
    <br>
       I should do some investigation on the storage test.<br>
    <br>
    So I think I should do 3 first, and then 1/2 later<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LZNDCQNS9pCphNowjKTN-3ArhtCs2QMXz37FKkMTGujDA@mail.gmail.com">
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

--------------F0F7EC56555392E9C20A212A--

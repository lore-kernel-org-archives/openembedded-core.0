Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6E56AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 06:57:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAL6vrGf014082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Nov 2017 22:57:53 -0800 (PST)
Received: from [128.224.162.147] (128.224.162.147) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 20 Nov 2017 22:57:52 -0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com>
	<cbb65333-4bc3-ec34-ffed-da65fc767030@windriver.com>
	<CADkTA4O=gNCQLLJ5Yu5MM7T2kbEb1=RFjb=Va0vUoS1VW7CEYA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <a738dbce-f217-54a3-c633-7945dafd462e@windriver.com>
Date: Tue, 21 Nov 2017 15:00:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4O=gNCQLLJ5Yu5MM7T2kbEb1=RFjb=Va0vUoS1VW7CEYA@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Nov 2017 06:57:53 -0000
Content-Type: multipart/alternative;
	boundary="------------6BCCF6D85838B08FE72D6A83"
Content-Language: en-US

--------------6BCCF6D85838B08FE72D6A83
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年11月21日 11:04, Bruce Ashfield wrote:
>
>
> On Mon, Nov 20, 2017 at 8:18 PM, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     On 2017年11月20日 19:07, Burton, Ross wrote:
>>     On 17 November 2017 at 06:08, Hongxu Jia
>>     <hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>> wrote:
>>
>>         +qemu by default emulates IDE and the linux-yocto kernel(s) use
>>         +CONFIG_IDE instead of the more modern libsata, so disks
>>         appear as
>>         +/dev/hd*. A similar patch rejected by upstream because
>>         CONFIG_IDE
>>         +is deprecated.
>>
>>
>>     Can we fix our kernel and/or qemu configuration too?
>>
>
>     Hi Bruce,
>
>     Do you have any suggestion? How about disable CONFIG_IDE?
>
>
> I've been telling people we can disable CONFIG_IDE for years now.
>
> It just requires the kernel-cache change, and someone to boot all 
> arches to show that
> it continues to work, as well as a quick search for references to hda 
> to make sure they
> are all gone.
>
> Not something that is on my TODO list at the moment, but I'd take 
> patches to the kernel
> part (with that testing shown).
>

I think I could have a try to clean up CONFIG_IDE.

Two steps:
1. Tweak kernel-cache to remove CONFIG_IDE for all available bsp.
     It require necessary test to prove it is safe to remove it.
     If the test is OK, I will send patch to yocto mailing list.

2. After 1 merged to kernel, I will clean up hda related (systemd/udev)
     in oe-core, and send the fix to this mailing list.

//Hongxu

> Bruce
>
>
>     //Hongxu
>
>>     Ross
>
>
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"



--------------6BCCF6D85838B08FE72D6A83
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017年11月21日 11:04, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4O=gNCQLLJ5Yu5MM7T2kbEb1=RFjb=Va0vUoS1VW7CEYA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Mon, Nov 20, 2017 at 8:18 PM,
            Hongxu Jia <span dir="ltr">&lt;<a
                href="mailto:hongxu.jia@windriver.com" target="_blank"
                moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF"><span class="">
                  <div class="m_-548668992200033025moz-cite-prefix">On
                    2017年11月20日 19:07, Burton, Ross wrote:<br>
                  </div>
                  <blockquote type="cite">
                    <div dir="ltr">On 17 November 2017 at 06:08, Hongxu
                      Jia <span dir="ltr">&lt;<a
                          href="mailto:hongxu.jia@windriver.com"
                          target="_blank" moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;</span>
                      wrote:<br>
                      <div class="gmail_extra">
                        <div class="gmail_quote">
                          <blockquote class="gmail_quote"
                            style="margin:0 0 0 .8ex;border-left:1px
                            #ccc solid;padding-left:1ex">+qemu by
                            default emulates IDE and the linux-yocto
                            kernel(s) use<br>
                            +CONFIG_IDE instead of the more modern
                            libsata, so disks appear as<br>
                            +/dev/hd*. A similar patch rejected by
                            upstream because CONFIG_IDE<br>
                            +is deprecated.<br>
                          </blockquote>
                          <div><br>
                          </div>
                          <div>Can we fix our kernel and/or qemu
                            configuration too?</div>
                          <div><br>
                          </div>
                        </div>
                      </div>
                    </div>
                  </blockquote>
                  <br>
                </span> Hi Bruce,<br>
                <br>
                Do you have any suggestion? How about disable
                CONFIG_IDE?<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>I've been telling people we can disable CONFIG_IDE for
              years now.</div>
            <div><br>
            </div>
            <div>It just requires the kernel-cache change, and someone
              to boot all arches to show that</div>
            <div>it continues to work, as well as a quick search for
              references to hda to make sure they</div>
            <div>are all gone.</div>
            <div><br>
            </div>
            <div>Not something that is on my TODO list at the moment,
              but I'd take patches to the kernel</div>
            <div>part (with that testing shown).</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I think I could have a try to clean up CONFIG_IDE.<br>
    <br>
    Two steps:<br>
    1. Tweak kernel-cache to remove CONFIG_IDE for all available bsp.<br>
        It require necessary test to prove it is safe to remove it.<br>
        If the test is OK, I will send patch to yocto mailing list.<br>
    <br>
    2. After 1 merged to kernel, I will clean up hda related
    (systemd/udev)<br>
        in oe-core, and send the fix to this mailing list.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4O=gNCQLLJ5Yu5MM7T2kbEb1=RFjb=Va0vUoS1VW7CEYA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF"> <br>
                //Hongxu<br>
                <br>
                <blockquote type="cite">
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
              </div>
              <br>
              --<br>
              ______________________________<wbr>_________________<br>
              Openembedded-core mailing list<br>
              <a href="mailto:Openembedded-core@lists.openembedded.org"
                moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
              <a
                href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              <br>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------6BCCF6D85838B08FE72D6A83--

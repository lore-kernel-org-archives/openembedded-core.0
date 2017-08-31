Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D29E78371
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 00:52:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7V0qSuW016246
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Aug 2017 17:52:28 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 30 Aug 2017 17:52:26 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <1503991517-3965-1-git-send-email-yi.zhao@windriver.com>
	<1503991517-3965-2-git-send-email-yi.zhao@windriver.com>
	<CAJTo0LazwJDfbXnnoLPiMH3+yqDFHm_nHJs=66nm8Ygkqf11cw@mail.gmail.com>
	<4366abb5-d116-03dc-eae6-7af98965d288@windriver.com>
	<CAHiDW_HXpZOhODj0=0xyV9EJLdYcO-g4e-Cye3U-vzNSiWMjcQ@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <4b1e1cc4-3e18-e81d-9ddd-aa176ee01749@windriver.com>
Date: Thu, 31 Aug 2017 08:53:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAHiDW_HXpZOhODj0=0xyV9EJLdYcO-g4e-Cye3U-vzNSiWMjcQ@mail.gmail.com>
X-Originating-IP: [128.224.162.198]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] iproute2: enable build tipc by default
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
X-List-Received-Date: Thu, 31 Aug 2017 00:52:28 -0000
Content-Type: multipart/alternative;
	boundary="------------571BAA8A4820B47895C431EA"
Content-Language: en-US

--------------571BAA8A4820B47895C431EA
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2017年08月30日 15:43, Jussi Kukkonen 写道:
> On 30 August 2017 at 03:35, Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>> wrote:
>
>
>
>     在 2017年08月30日 00:13, Burton, Ross 写道:
>>     On 29 August 2017 at 08:25, Yi Zhao <yi.zhao@windriver.com
>>     <mailto:yi.zhao@windriver.com>> wrote:
>>
>>         -PACKAGECONFIG ??= ""
>>         -PACKAGECONFIG[tipc] = ",,libmnl,"
>>
>>
>>     Surely it would be a lot better to just add tipc to the default
>>     PACKAGECONFIG, so this support and dependencies can be turned off
>>     if required?
>
>     There is no easy way to turn off the support with this patch. User
>     should remove tipc from EXTRA_OEMAKE manually.
>     The package isn't installed to rootfs by default if no package
>     requires it.
>
>
> The question is why not leave the PACKAGECONFIG there so there would 
> be an easy way to turn it off?

I just thought this would make the code more clear. The source doesn't 
build with autotools,  PACKAGECONFIG[tipc] = ",,libmnl," looks a little 
strange.
If it is not a good idea, I will send a v2 patch to keep the PACKAGECONFIG.

Thanks,
Yi


>
> Jussi


--------------571BAA8A4820B47895C431EA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">在 2017年08月30日 15:43, Jussi Kukkonen 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHiDW_HXpZOhODj0=0xyV9EJLdYcO-g4e-Cye3U-vzNSiWMjcQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On 30 August 2017 at 03:35, Yi Zhao <span
              dir="ltr">&lt;<a href="mailto:yi.zhao@windriver.com"
                target="_blank" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF"><span class="">
                  <p><br>
                  </p>
                  <br>
                  <div class="m_-2270919719305798428moz-cite-prefix">在
                    2017年08月30日 00:13, Burton, Ross 写道:<br>
                  </div>
                  <blockquote type="cite">
                    <div dir="ltr">On 29 August 2017 at 08:25, Yi Zhao <span
                        dir="ltr">&lt;<a
                          href="mailto:yi.zhao@windriver.com"
                          target="_blank" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;</span>
                      wrote:
                      <div class="gmail_extra">
                        <div class="gmail_quote">
                          <blockquote class="gmail_quote"
                            style="margin:0 0 0 .8ex;border-left:1px
                            #ccc solid;padding-left:1ex"> -PACKAGECONFIG
                            ??= ""<br>
                            -PACKAGECONFIG[tipc] = ",,libmnl,"<br>
                          </blockquote>
                          <div><br>
                          </div>
                          <div>Surely it would be a lot better to just
                            add tipc to the default PACKAGECONFIG, so
                            this support and dependencies can be turned
                            off if required?</div>
                        </div>
                      </div>
                    </div>
                  </blockquote>
                  <br>
                </span> There is no easy way to turn off the support
                with this patch. User should remove tipc from
                EXTRA_OEMAKE manually.<br>
                The package isn't installed to rootfs by default if no
                package requires it.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>The question is why not leave the PACKAGECONFIG there
              so there would be an easy way to turn it off? <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I just thought this would make the code more clear. The source
    doesn't build with autotools,  PACKAGECONFIG[tipc] = ",,libmnl,"
    looks a little strange. <br>
    If it is not a good idea, I will send a v2 patch to keep the
    PACKAGECONFIG.<br>
    <br>
    Thanks,<br>
    Yi<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CAHiDW_HXpZOhODj0=0xyV9EJLdYcO-g4e-Cye3U-vzNSiWMjcQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
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

--------------571BAA8A4820B47895C431EA--

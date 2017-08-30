Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 55ACB7809C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 00:34:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7U0YZKs028878
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Aug 2017 17:34:35 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 Aug 2017 17:34:34 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1503991517-3965-1-git-send-email-yi.zhao@windriver.com>
	<1503991517-3965-2-git-send-email-yi.zhao@windriver.com>
	<CAJTo0LazwJDfbXnnoLPiMH3+yqDFHm_nHJs=66nm8Ygkqf11cw@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <4366abb5-d116-03dc-eae6-7af98965d288@windriver.com>
Date: Wed, 30 Aug 2017 08:35:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LazwJDfbXnnoLPiMH3+yqDFHm_nHJs=66nm8Ygkqf11cw@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 Aug 2017 00:34:36 -0000
Content-Type: multipart/alternative;
	boundary="------------482320321437799810870A32"
Content-Language: en-US

--------------482320321437799810870A32
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2017年08月30日 00:13, Burton, Ross 写道:
> On 29 August 2017 at 08:25, Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>> wrote:
>
>     -PACKAGECONFIG ??= ""
>     -PACKAGECONFIG[tipc] = ",,libmnl,"
>
>
> Surely it would be a lot better to just add tipc to the default 
> PACKAGECONFIG, so this support and dependencies can be turned off if 
> required?

There is no easy way to turn off the support with this patch. User 
should remove tipc from EXTRA_OEMAKE manually.
The package isn't installed to rootfs by default if no package requires it.

Yi


>
> Ross


--------------482320321437799810870A32
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
    <div class="moz-cite-prefix">在 2017年08月30日 00:13, Burton, Ross 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LazwJDfbXnnoLPiMH3+yqDFHm_nHJs=66nm8Ygkqf11cw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 29 August 2017 at 08:25, Yi Zhao <span
          dir="ltr">&lt;<a href="mailto:yi.zhao@windriver.com"
            target="_blank" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;</span>
        wrote:
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              -PACKAGECONFIG ??= ""<br>
              -PACKAGECONFIG[tipc] = ",,libmnl,"<br>
            </blockquote>
            <div><br>
            </div>
            <div>Surely it would be a lot better to just add tipc to the
              default PACKAGECONFIG, so this support and dependencies
              can be turned off if required?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    There is no easy way to turn off the support with this patch. User
    should remove tipc from EXTRA_OEMAKE manually.<br>
    The package isn't installed to rootfs by default if no package
    requires it.<br>
    <br>
    Yi<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LazwJDfbXnnoLPiMH3+yqDFHm_nHJs=66nm8Ygkqf11cw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------482320321437799810870A32--

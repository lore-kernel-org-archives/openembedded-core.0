Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0CEB77F76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 01:05:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6C15PjJ009515
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 11 Jul 2017 18:05:25 -0700
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Jul 2017 18:05:24 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1499760817-127823-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LasUeR3oPuGjD1G4KFJN3wZLScKWmY1v0DiJy1ds2vdEg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <2193dcd4-c45f-8bfd-17a6-5f16a2d099f2@windriver.com>
Date: Wed, 12 Jul 2017 09:05:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LasUeR3oPuGjD1G4KFJN3wZLScKWmY1v0DiJy1ds2vdEg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: fix genetle shutdown not work while bind9 compile with --enable-threads
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
X-List-Received-Date: Wed, 12 Jul 2017 01:05:26 -0000
Content-Type: multipart/alternative;
	boundary="------------AFFF2CBB3BC3EF0737319A2D"
Content-Language: en-US

--------------AFFF2CBB3BC3EF0737319A2D
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年07月11日 19:19, Burton, Ross wrote:
>
> On 11 July 2017 at 09:13, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     +Upstream-Status: Inappropriate [OE specific]
>
>
> This is not OE specific.  We enable a specific build combination, and 
> it breaks.
>
> Have you reported this upstream? Should we disable gentle shutdown as 
> it's clearly not being tested that much?
>

The upstream disable gentle shutdown and disable threads
by default. The difficult point is disable thread in bind6,
and the fix is on dhcp.

We enable threads and backport the patch from fedora.

Disable gentle shutdown will introduce other issue (dhcpd
could not stopped by SIGTERM)

The root cause is enable threads, if we disable it, everything is ok.

I will try to find a nice way to report upstream.

//Hongxu

> Ross



--------------AFFF2CBB3BC3EF0737319A2D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017年07月11日 19:19, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LasUeR3oPuGjD1G4KFJN3wZLScKWmY1v0DiJy1ds2vdEg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 11 July 2017 at 09:13, Hongxu Jia
            <span dir="ltr">&lt;<a
                href="mailto:hongxu.jia@windriver.com" target="_blank"
                moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":bp" class="a3s aXjCH m15d30b6314b88378">+Upstream-Status:
                Inappropriate [OE specific]<br>
              </div>
            </blockquote>
          </div>
          <br>
          This is not OE specific.  We enable a specific build
          combination, and it breaks.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Have you reported this upstream? 
          Should we disable gentle shutdown as it's clearly not being
          tested that much?</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    The upstream disable gentle shutdown and disable threads<br>
    by default. The difficult point is disable thread in bind6,<br>
    and the fix is on dhcp.<br>
    <br>
    We enable threads and backport the patch from fedora.<br>
    <br>
    Disable gentle shutdown will introduce other issue (dhcpd<br>
    could not stopped by SIGTERM)<br>
    <br>
    The root cause is enable threads, if we disable it, everything is
    ok.<br>
    <br>
    I will try to find a nice way to report upstream.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LasUeR3oPuGjD1G4KFJN3wZLScKWmY1v0DiJy1ds2vdEg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------AFFF2CBB3BC3EF0737319A2D--

Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC807029A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 02:31:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA82Vt4m022020
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 18:31:55 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Nov 2014 18:31:55 -0800
Message-ID: <545D8096.5050706@windriver.com>
Date: Sat, 8 Nov 2014 10:31:50 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<16384282a6c5f4878b1c377bbe38cfae1d311d0b.1415346812.git.hongxu.jia@windriver.com>
	<20141107143813.GF2444@jama>
	<CAJTo0LacPP-ZNLR-ZtTVSJZKJWR91LkUUqKvkSMifYvKkRw-Qw@mail.gmail.com>
In-Reply-To: <CAJTo0LacPP-ZNLR-ZtTVSJZKJWR91LkUUqKvkSMifYvKkRw-Qw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] avahi.inc: use avahi-daemon as avahi's provider
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
X-List-Received-Date: Sat, 08 Nov 2014 02:32:06 -0000
Content-Type: multipart/alternative;
	boundary="------------080805000905060400050500"

--------------080805000905060400050500
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2014 10:42 PM, Burton, Ross wrote:
>
> On 7 November 2014 14:38, Martin Jansa <martin.jansa@gmail.com 
> <mailto:martin.jansa@gmail.com>> wrote:
>
>     On Fri, Nov 07, 2014 at 03:57:01PM +0800, Hongxu Jia wrote:
>     > The package avahi does not exist, so we use avahi-daemon as the
>     provider.
>     > It avoids the do_rootfs failure while IMAGE_INSTALL += "avahi"
>
>     Why don't you fix your IMAGE_INSTALL instead?
>
>
> Or propose the recipe is changed so that the daemon is in PN (which 
> rprovides avahi-daemon for compatibility).  Providing PN seems like 
> the worst solution.
>

Good idea, V2 incoming

//Hongxu


> Ross


--------------080805000905060400050500
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/07/2014 10:42 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LacPP-ZNLR-ZtTVSJZKJWR91LkUUqKvkSMifYvKkRw-Qw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 7 November 2014 14:38, Martin
            Jansa <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:martin.jansa@gmail.com" target="_blank">martin.jansa@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class="">On Fri, Nov 07, 2014 at 03:57:01PM +0800,
                Hongxu Jia wrote:<br>
                &gt; The package avahi does not exist, so we use
                avahi-daemon as the provider.<br>
                &gt; It avoids the do_rootfs failure while IMAGE_INSTALL
                += "avahi"<br>
                <br>
              </span>Why don't you fix your IMAGE_INSTALL instead?</blockquote>
          </div>
          <br>
          Or propose the recipe is changed so that the daemon is in PN
          (which rprovides avahi-daemon for compatibility).  Providing
          PN seems like the worst solution.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    Good idea, V2 incoming<br>
    <br>
    //Hongxu<br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0LacPP-ZNLR-ZtTVSJZKJWR91LkUUqKvkSMifYvKkRw-Qw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------080805000905060400050500--

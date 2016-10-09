Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04BE0719BA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Oct 2016 01:43:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u991h9Pq025137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sat, 8 Oct 2016 18:43:09 -0700
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 8 Oct 2016 18:43:08 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20160920091958.23448-1-Yuanjie.Huang@windriver.com>
	<CAMKF1sooPU-oSmeGuNQXjEUvgWfAXubQuKc6bk=L45WtRD4xjQ@mail.gmail.com>
	<e72d26a5-046a-6c89-009c-7cbaf8aaab3c@windriver.com>
	<CAJTo0LZv9h-BrVNypGiZEQqoGps09kioNwBfMtUncA8rUk7vvQ@mail.gmail.com>
From: Yuanjie Huang <yuanjie.huang@windriver.com>
Message-ID: <7c41e6fe-a064-f6ab-dd66-15016183a756@windriver.com>
Date: Sun, 9 Oct 2016 09:43:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZv9h-BrVNypGiZEQqoGps09kioNwBfMtUncA8rUk7vvQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-sanitizers: Fix libtool library files
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
X-List-Received-Date: Sun, 09 Oct 2016 01:43:12 -0000
Content-Type: multipart/alternative;
	boundary="------------D5CD334E8479EA0985B4602E"

--------------D5CD334E8479EA0985B4602E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

Is it recommended practice to remove libtool .la files for oe-core when 
some issue pops? If yes, I would withdraw and prepare a new patch that 
complies with the practice.

Thanks,
Yuanjie

On 09/21/2016 05:01 PM, Burton, Ross wrote:
>
> On 21 September 2016 at 02:46, Yuanjie Huang 
> <yuanjie.huang@windriver.com <mailto:yuanjie.huang@windriver.com>> wrote:
>
>     We have some user making use of these libraries directly,
>     otherwise, cross gcc can link these sanitizer libraries with just
>     -fsantizer flag without problem. Without .la files, his flow can
>     not be libtoolized.
>
>
> libtool works fine without .la files on linux, which is why the 
> remove-libtool class works (which can be a distro-level inherit and 
> deletes every .la before it reaches the sysroot).
>
> Ross


--------------D5CD334E8479EA0985B4602E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Hi Ross,</p>
    <p>Is it recommended practice to remove libtool .la files for
      oe-core when some issue pops? If yes, I would withdraw and prepare
      a new patch that complies with the practice.<br>
    </p>
    Thanks,<br>
    Yuanjie<br>
    <br>
    <div class="moz-cite-prefix">On 09/21/2016 05:01 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZv9h-BrVNypGiZEQqoGps09kioNwBfMtUncA8rUk7vvQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 21 September 2016 at 02:46,
            Yuanjie Huang <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:yuanjie.huang@windriver.com"
                target="_blank">yuanjie.huang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":15q" class="a3s aXjCH m1574a6cecf964841">We have
                some user making use of these libraries directly,
                otherwise, cross gcc can link these sanitizer libraries
                with just -fsantizer flag without problem. Without .la
                files, his flow can not be libtoolized.<br>
              </div>
            </blockquote>
          </div>
          <br>
          libtool works fine without .la files on linux, which is why
          the remove-libtool class works (which can be a distro-level
          inherit and deletes every .la before it reaches the sysroot).</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------D5CD334E8479EA0985B4602E--

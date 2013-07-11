Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1916161883
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 11:27:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6BBRd2m018429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Jul 2013 04:27:39 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 11 Jul 2013 04:27:38 -0700
Message-ID: <51DE96A8.7020106@windriver.com>
Date: Thu, 11 Jul 2013 19:27:36 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
	<a546f2c5f8ecec522cb8087015359f433fb5c998.1373443071.git.hongxu.jia@windriver.com>
	<CAJTo0LZTHz5hE8jx+6qNtePXj-LcMpsXEJ3zbwN4jS9npDHpLg@mail.gmail.com>
	<CAJTo0LbGRLcbb_9J1AdDM1ZFX18SYQi_h6VPwxN3SESDdnN0gA@mail.gmail.com>
	<1373539530.2389.320.camel@phil-desktop.brightsign>
	<CAJTo0La1Npg5YwJ8ihzfbZvepOvg2HdjkbK_ir6WOvBVHBBkcQ@mail.gmail.com>
In-Reply-To: <CAJTo0La1Npg5YwJ8ihzfbZvepOvg2HdjkbK_ir6WOvBVHBBkcQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] nss: add version 3.15.1
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
X-List-Received-Date: Thu, 11 Jul 2013 11:27:39 -0000
Content-Type: multipart/alternative;
	boundary="------------020706090600080704090809"

--------------020706090600080704090809
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2013 07:14 PM, Burton, Ross wrote:
> On 11 July 2013 11:45, Phil Blundell <pb@pbcl.net> wrote:
>> I think you could still legitimately question whether having recipes in
>> oe-core that are "just for LSB" is sensible and/or desirable, not least
>> because dangling libraries that don't have any users are hard to test.
> I was just pondering the idea of a "meta-lsb"...
The reason why I choose to put nss into oe-core is I found  nspr in oe-core.
They both used for lsb-test and come from mozilla.

Anyone has a better idea about where to put?

https://developer.mozilla.org/en-US/docs/NSS
https://developer.mozilla.org/en-US/docs/NSPR

//Hongxu
>
> Ross


--------------020706090600080704090809
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 07/11/2013 07:14 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0La1Npg5YwJ8ihzfbZvepOvg2HdjkbK_ir6WOvBVHBBkcQ@mail.gmail.com"
      type="cite">
      <pre wrap="">On 11 July 2013 11:45, Phil Blundell <a class="moz-txt-link-rfc2396E" href="mailto:pb@pbcl.net">&lt;pb@pbcl.net&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">I think you could still legitimately question whether having recipes in
oe-core that are "just for LSB" is sensible and/or desirable, not least
because dangling libraries that don't have any users are hard to test.
</pre>
      </blockquote>
      <pre wrap="">
I was just pondering the idea of a "meta-lsb"...</pre>
    </blockquote>
    The reason why I choose to put nss into oe-core is I found  nspr in
    oe-core.<br>
    They both used for lsb-test and come from mozilla.<br>
    <br>
    Anyone has a better idea about where to put?<br>
    <br>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <a href="https://developer.mozilla.org/en-US/docs/NSS">https://developer.mozilla.org/en-US/docs/NSS</a><br>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <a href="https://developer.mozilla.org/en-US/docs/NSPR">https://developer.mozilla.org/en-US/docs/NSPR</a><br>
    <br>
    //Hongxu<br>
    <blockquote
cite="mid:CAJTo0La1Npg5YwJ8ihzfbZvepOvg2HdjkbK_ir6WOvBVHBBkcQ@mail.gmail.com"
      type="cite">
      <pre wrap="">

Ross
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------020706090600080704090809--

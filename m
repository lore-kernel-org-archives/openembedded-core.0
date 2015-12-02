Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6AE2605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:28:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB2ASIwT010510
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Dec 2015 02:28:18 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Dec 2015 02:28:18 -0800
Message-ID: <565EC7BE.6060105@windriver.com>
Date: Wed, 2 Dec 2015 18:28:14 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1449032673.git.hongxu.jia@windriver.com>
	<8e3c76d86f19c59b63908de6d7d9c2cc24858858.1449032673.git.hongxu.jia@windriver.com>
	<CAJTo0LaqebZA8akpdnAtFU2rJHsFX=1AxxtHWbq3JuEe5vBVyg@mail.gmail.com>
	<565EBF04.6050509@windriver.com>
	<CAJTo0Lag5J+cytX8C+Z7b8dmX65MZWJBV6JXQt=Ocwy==szenA@mail.gmail.com>
In-Reply-To: <CAJTo0Lag5J+cytX8C+Z7b8dmX65MZWJBV6JXQt=Ocwy==szenA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python: gcc optimization level 2
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
X-List-Received-Date: Wed, 02 Dec 2015 10:28:20 -0000
Content-Type: multipart/alternative;
	boundary="------------050808080204020408060809"

--------------050808080204020408060809
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2015 05:57 PM, Burton, Ross wrote:
>
> On 2 December 2015 at 09:51, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     The root cause is the qemu didn't support gcc optimization level 3
>     very well.
>
>
> Oh, so the problem only appears in qemu if you enable tuning that is 
> known to be broken in qemu?

Yes, since I tested qemux86/qemux86-64 with default tune, and everything 
is ok.

> I don't think we should apply the Python workaround to oe-core as 
> everyone will suffer for a configuration that is known to be broken 
> (and isn't enabled in oe-core).

Trace the issue costs a lot of time,  the original failure was invoking
'smart update' in qemu, and found out the python md5/sha checksum
output incorrect, and then found out qemu86-64 with corei7-64 did
not support gcc optimization level 3 '-O3' very well [YOCTO #8748]

BTW, boot the same image with virtualbox, everything is ok

//Hongxu

>
> Ross


--------------050808080204020408060809
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/02/2015 05:57 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lag5J+cytX8C+Z7b8dmX65MZWJBV6JXQt=Ocwy==szenA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 2 December 2015 at 09:51, Hongxu
            Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000">The root cause is
                the qemu didn't support gcc optimization level 3 very
                well.<br>
              </div>
            </blockquote>
          </div>
          <br>
          Oh, so the problem only appears in qemu if you enable tuning
          that is known to be broken in qemu?  </div>
      </div>
    </blockquote>
    <br>
    Yes, since I tested qemux86/qemux86-64 with default tune, and
    everything is ok.<br>
    <br>
    <blockquote
cite="mid:CAJTo0Lag5J+cytX8C+Z7b8dmX65MZWJBV6JXQt=Ocwy==szenA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">I don't think we should apply the
          Python workaround to oe-core as everyone will suffer for a
          configuration that is known to be broken (and isn't enabled in
          oe-core).</div>
      </div>
    </blockquote>
    <br>
    Trace the issue costs a lot of time,  the original failure was
    invoking<br>
    'smart update' in qemu, and found out the python md5/sha checksum<br>
    output incorrect, and then found out qemu86-64 with corei7-64 did<br>
    not support gcc optimization level 3 '-O3' very well
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    [YOCTO #8748]<br>
    <br>
    BTW, boot the same image with virtualbox, everything is ok<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0Lag5J+cytX8C+Z7b8dmX65MZWJBV6JXQt=Ocwy==szenA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------050808080204020408060809--

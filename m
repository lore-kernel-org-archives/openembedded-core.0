Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB155601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 09:51:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB29p3Pa022863
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Dec 2015 01:51:03 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Dec 2015 01:51:03 -0800
Message-ID: <565EBF04.6050509@windriver.com>
Date: Wed, 2 Dec 2015 17:51:00 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1449032673.git.hongxu.jia@windriver.com>
	<8e3c76d86f19c59b63908de6d7d9c2cc24858858.1449032673.git.hongxu.jia@windriver.com>
	<CAJTo0LaqebZA8akpdnAtFU2rJHsFX=1AxxtHWbq3JuEe5vBVyg@mail.gmail.com>
In-Reply-To: <CAJTo0LaqebZA8akpdnAtFU2rJHsFX=1AxxtHWbq3JuEe5vBVyg@mail.gmail.com>
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
X-List-Received-Date: Wed, 02 Dec 2015 09:51:03 -0000
Content-Type: multipart/alternative;
	boundary="------------050803080702030005070305"

--------------050803080702030005070305
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2015 05:19 PM, Burton, Ross wrote:
>
> On 2 December 2015 at 05:06, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     The qemu didn't support '-march=corei7 -mtune=corei7' and
>     gcc optimization level 3 '-O3' very well, in which the
>     /usr/lib64/python2.7/test/test_md5.py and
>     /usr/lib64/python2.7/test/test_sha.py failed.
>
>     So we use gcc optimization level 2 to instead.
>
>     YOCTO [# 8747]
>
>
> Has anyone decided if this is a bug in the compiler, or the Python 
> code making assumptions that don't hold at -O3?
>

The root cause is the qemu didn't support gcc optimization level 3 very 
well.

This fix is a workaround, and I file another defect to trace the root cause.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8748

//Hongxu

> Ross


--------------050803080702030005070305
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/02/2015 05:19 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaqebZA8akpdnAtFU2rJHsFX=1AxxtHWbq3JuEe5vBVyg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 2 December 2015 at 05:06, Hongxu
            Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":6gr" class="a3s" style="overflow:hidden">The
                qemu didn't support '-march=corei7 -mtune=corei7' and<br>
                gcc optimization level 3 '-O3' very well, in which the<br>
                /usr/lib64/python2.7/test/test_md5.py and<br>
                /usr/lib64/python2.7/test/test_sha.py failed.<br>
                <br>
                So we use gcc optimization level 2 to instead.<br>
                <br>
                YOCTO [# 8747]</div>
            </blockquote>
          </div>
          <br>
          Has anyone decided if this is a bug in the compiler, or the
          Python code making assumptions that don't hold at -O3?</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    The root cause is the
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    qemu didn't support gcc optimization level 3 very well.<br>
    <br>
    This fix is a workaround, and I file another defect to trace the
    root cause.<br>
    <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=8748">https://bugzilla.yoctoproject.org/show_bug.cgi?id=8748</a><br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaqebZA8akpdnAtFU2rJHsFX=1AxxtHWbq3JuEe5vBVyg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------050803080702030005070305--

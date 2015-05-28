Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1FACB7562E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 08:06:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S86Zvr015837
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 May 2015 01:06:35 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 01:06:35 -0700
Message-ID: <5566CC85.80707@windriver.com>
Date: Thu, 28 May 2015 16:06:29 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1431997609.git.kai.kang@windriver.com>	<e2402c26a050c4bb6387b3ee235aad25572124e3.1431997609.git.kai.kang@windriver.com>
	<CAP9ODKqJnHrxU=jagLe8SKH_X0YX__7Pd-iZ9EesUY8GRGjeYA@mail.gmail.com>
In-Reply-To: <CAP9ODKqJnHrxU=jagLe8SKH_X0YX__7Pd-iZ9EesUY8GRGjeYA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] alsa-tools: upgrade to version 1.0.29
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
X-List-Received-Date: Thu, 28 May 2015 08:06:38 -0000
Content-Type: multipart/alternative;
	boundary="------------090706060903090807040607"

--------------090706060903090807040607
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年05月27日 20:06, Otavio Salvador wrote:
> On Mon, May 18, 2015 at 10:08 PM, Kai Kang <kai.kang@windriver.com> wrote:
>> Upgrade alsa-tools from verion 1.0.28 to 1.0.29.
>>
>> * update autotools.patch
>> * add file gitcompile which exists in git repo but missing in release
>>    tar ball for sub-directory hdajacksensetest
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> Seems this broke framebuffer build:
>
> framebuffer fsl-image-machine-test@ls1021aqds (1/7) patching file Makefile
> framebuffer fsl-image-machine-test@ls1021aqds (1/7) Hunk #1 FAILED at 1.
> framebuffer fsl-image-machine-test@ls1021aqds (1/7) 1 out of 1 hunk
> FAILED -- rejects in file Makefile
> framebuffer fsl-image-machine-test@ls1021aqds (1/7) Patch
> makefile_no_gtk.patch does not apply (enforce with -f)
> framebuffer fsl-image-machine-test@ls1021aqds (1/7) ERROR: Function
> failed: patch_do_patch
> framebuffer fsl-image-machine-test@ls1021aqds (1/7) ERROR: Logfile of
> failure stored in:
> .../build-framebuffer/tmp/work/cortexa7hf-vfp-neon-poky-linux-gnueabi/alsa-tools/1.0.29-r0/temp/log.do_patch.26177
> framebuffer fsl-image-machine-test@ls1021aqds (1/7) recipe
> alsa-tools-1.0.29-r0: task do_patch: Failed
>
> Is it possible to take a look?
>
>

OK. I'll send a patch to fix it .

-- 
Regards,
Neil | Kai Kang


--------------090706060903090807040607
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2015年05月27日 20:06, Otavio Salvador
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAP9ODKqJnHrxU=jagLe8SKH_X0YX__7Pd-iZ9EesUY8GRGjeYA@mail.gmail.com"
      type="cite">
      <pre wrap="">On Mon, May 18, 2015 at 10:08 PM, Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Upgrade alsa-tools from verion 1.0.28 to 1.0.29.

* update autotools.patch
* add file gitcompile which exists in git repo but missing in release
  tar ball for sub-directory hdajacksensetest

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="">
Seems this broke framebuffer build:

framebuffer fsl-image-machine-test@ls1021aqds (1/7) patching file Makefile
framebuffer fsl-image-machine-test@ls1021aqds (1/7) Hunk #1 FAILED at 1.
framebuffer fsl-image-machine-test@ls1021aqds (1/7) 1 out of 1 hunk
FAILED -- rejects in file Makefile
framebuffer fsl-image-machine-test@ls1021aqds (1/7) Patch
makefile_no_gtk.patch does not apply (enforce with -f)
framebuffer fsl-image-machine-test@ls1021aqds (1/7) ERROR: Function
failed: patch_do_patch
framebuffer fsl-image-machine-test@ls1021aqds (1/7) ERROR: Logfile of
failure stored in:
.../build-framebuffer/tmp/work/cortexa7hf-vfp-neon-poky-linux-gnueabi/alsa-tools/1.0.29-r0/temp/log.do_patch.26177
framebuffer fsl-image-machine-test@ls1021aqds (1/7) recipe
alsa-tools-1.0.29-r0: task do_patch: Failed

Is it possible to take a look?


</pre>
    </blockquote>
    <font size="+1"><br>
      OK. I'll send a patch to fix it .</font><br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------090706060903090807040607--

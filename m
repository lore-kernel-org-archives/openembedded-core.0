Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8045176FD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 01:43:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9T1hLGL018214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Oct 2015 18:43:21 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 28 Oct 2015 18:43:20 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
References: <cover.1446009435.git.kai.kang@windriver.com>
	<484dd4883f19d258e29e343f1b0735d2940d7424.1446009435.git.kai.kang@windriver.com>
	<CAHiDW_EvNU3w7gKaz1N_=ZZU+wfGkf696i78TZf3-PZbGaRTrg@mail.gmail.com>
	<56309F82.203@windriver.com> <5630A999.1030605@linux.intel.com>
	<CAJTo0LYJGSbo-vPOn9oS03tnd08G6=tTxuwJB8-eMyUR=1B_5Q@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <563179B8.6070305@windriver.com>
Date: Thu, 29 Oct 2015 09:43:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYJGSbo-vPOn9oS03tnd08G6=tTxuwJB8-eMyUR=1B_5Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix unsafe memory access
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
X-List-Received-Date: Thu, 29 Oct 2015 01:43:21 -0000
Content-Type: multipart/alternative;
	boundary="------------060304000409020304050105"

--------------060304000409020304050105
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年10月28日 19:15, Burton, Ross wrote:
>
> On 28 October 2015 at 10:55, Alexander Kanavin 
> <alexander.kanavin@linux.intel.com 
> <mailto:alexander.kanavin@linux.intel.com>> wrote:
>
>         I suppose Backport is the best choice in upstream status [ Pending
>         Submitted Accepted Backport Denied Inappropriate ]. Though it
>         is not
>         from official upstream, it is from somewhere else as listed in
>         the patch.
>
>
>     'Submitted [where]' is the right choice here, I think.
>
>
> Yes, this is exactly what Submitted is for.

OK. I'll send V2.

Thanks,
Kai

>
> Ross
>
>


-- 
Regards,
Neil | Kai Kang


--------------060304000409020304050105
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2015年10月28日 19:15, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYJGSbo-vPOn9oS03tnd08G6=tTxuwJB8-eMyUR=1B_5Q@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 28 October 2015 at 10:55,
            Alexander Kanavin <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:alexander.kanavin@linux.intel.com"
                target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:alexander.kanavin@linux.intel.com">alexander.kanavin@linux.intel.com</a></a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class="">
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">I
                  suppose Backport is the best choice in upstream status
                  [ Pending<br>
                  Submitted Accepted Backport Denied Inappropriate ].
                  Though it is not<br>
                  from official upstream, it is from somewhere else as
                  listed in the patch.<br>
                </blockquote>
                <br>
              </span>
              'Submitted [where]' is the right choice here, I think.<br>
            </blockquote>
          </div>
          <br>
          Yes, this is exactly what Submitted is for.</div>
      </div>
    </blockquote>
    <br>
    OK. I'll send V2.<br>
    <br>
    Thanks,<br>
    Kai<br>
    <br>
    <blockquote
cite="mid:CAJTo0LYJGSbo-vPOn9oS03tnd08G6=tTxuwJB8-eMyUR=1B_5Q@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------060304000409020304050105--

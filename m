Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 86097601A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 02:42:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0I2g8X5019681
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jan 2017 18:42:08 -0800 (PST)
Received: from [128.224.162.177] (128.224.162.177) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 17 Jan 2017 18:42:08 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1482130882-148241-1-git-send-email-wenlin.kang@windriver.com>
	<CAJTo0LYgLj4o1srO59zCz5KhSio-C5-GFTnLaAmKcripb04Sgg@mail.gmail.com>
	<60c61d77-2b93-8b94-007d-ff185fb8c68f@windriver.com>
From: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <4a79dcc0-ed9a-c40a-605a-82643fdb957d@windriver.com>
Date: Wed, 18 Jan 2017 10:42:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <60c61d77-2b93-8b94-007d-ff185fb8c68f@windriver.com>
X-Originating-IP: [128.224.162.177]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: specify explicitly tar path
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
X-List-Received-Date: Wed, 18 Jan 2017 02:42:09 -0000
Content-Type: multipart/alternative;
	boundary="------------6E2C69F9099872EA1EC43B3E"

--------------6E2C69F9099872EA1EC43B3E
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年12月20日 17:47, Wenlin Kang wrote:
> On 2016年12月19日 19:39, Burton, Ross wrote:
>>
>> On 19 December 2016 at 07:01, Wenlin Kang <wenlin.kang@windriver.com 
>> <mailto:wenlin.kang@windriver.com>> wrote:
>>
>>     +-     AC_PATH_PROG(TAR,"tar")
>>     +-        _mytar=$ac_cv_path_TAR
>>
>>
>> You don't need to patch configure.ac <http://configure.ac> as you can 
>> just set pass ac_cv_path_TAR=${base_bindir/tar in EXTRA_OECONF.
>>
>> Ross
>
> Your means is that we should only set --with-tar=${base_bindir}/tar in 
> EXTRA_OECONF, not to modify configure.ac, right?
> If that, the configure code will skip directly "ustar format check 
> code", not check whether tar supports "ustar format",
> and think it doesn't support ustar format, so I think we need to 
> modify the configure(related m4/tar-ustar.m4 file)
> when set  --with-tar=${base_bindir}/tar in EXTRA_OECONF.
>

    Hi Ross

    Do you have any thoughts for above my explain? and can you merge 
that patch to oecore ? thanks.

> -- 
> Thanks,
> Wenlin Kang
>
>


-- 
Thanks,
Wenlin Kang


--------------6E2C69F9099872EA1EC43B3E
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2016年12月20日 17:47, Wenlin Kang
      wrote:<br>
    </div>
    <blockquote
      cite="mid:60c61d77-2b93-8b94-007d-ff185fb8c68f@windriver.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="moz-cite-prefix">On 2016年12月19日 19:39, Burton, Ross
        wrote:<br>
      </div>
      <blockquote
cite="mid:CAJTo0LYgLj4o1srO59zCz5KhSio-C5-GFTnLaAmKcripb04Sgg@mail.gmail.com"
        type="cite">
        <div dir="ltr">
          <div class="gmail_extra"><br>
            <div class="gmail_quote">On 19 December 2016 at 07:01,
              Wenlin Kang <span dir="ltr">&lt;<a moz-do-not-send="true"
                  href="mailto:wenlin.kang@windriver.com"
                  target="_blank">wenlin.kang@windriver.com</a>&gt;</span>
              wrote:<br>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                <div id=":1z8" class="a3s aXjCH m15915e3c168c1608">+-   
                      AC_PATH_PROG(TAR,"tar")<br>
                  +-        _mytar=$ac_cv_path_TAR<br>
                </div>
              </blockquote>
            </div>
            <br>
            You don't need to patch <a moz-do-not-send="true"
              href="http://configure.ac">configure.ac</a> as you can
            just set pass ac_cv_path_TAR=${base_bindir/tar in
            EXTRA_OECONF.</div>
          <div class="gmail_extra"><br>
          </div>
          <div class="gmail_extra">Ross</div>
        </div>
      </blockquote>
      <br>
      Your means is that we should only set 
      --with-tar=${base_bindir}/tar in EXTRA_OECONF, not to modify
      configure.ac, right?<br>
      If that, the configure code will skip directly "ustar format check
      code", not check whether tar supports "ustar format",<br>
      and think it doesn't support ustar format, so I think we need to
      modify the configure(related m4/tar-ustar.m4 file) <br>
      when set  --with-tar=${base_bindir}/tar in EXTRA_OECONF.<br>
      <br>
    </blockquote>
    <br>
       Hi Ross<br>
        <br>
       Do you have any thoughts for above my explain? and can you merge
    that patch to oecore ? thanks. <br>
    <br>
    <blockquote
      cite="mid:60c61d77-2b93-8b94-007d-ff185fb8c68f@windriver.com"
      type="cite">
      <pre class="moz-signature" cols="72">-- 
Thanks,
Wenlin Kang</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Thanks,
Wenlin Kang</pre>
  </body>
</html>

--------------6E2C69F9099872EA1EC43B3E--

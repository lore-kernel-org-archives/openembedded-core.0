Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id C155771E15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 01:41:32 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id f188so79078870pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 17:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=Ke9MBBbA42ExpuYRE3cbIR1+6l7ma+4tJml7qL2QFmw=;
	b=dbwPM0/AkwZE6j+TaNg0MMolpLh3UJCGyBUvnHAZVVhEQ6QMSRkorp0C6X8wZOplcO
	TEC2rlsQhY7hofj4Vs40ZvDWVAkvhaXfWg6vgzexTiTt2whXLVyesuo+ZNjfHOdIQZ9A
	mvxBtPLk7qXhCLEzz0PjayU0dXltCAPYPR1wGZidSLbk2uVwV5eh2DcCZ//fqFZXb16s
	abIQpPfAQgQjkuX6pQ/DT2czMgex1N7CbNZu2RTuokh8b88i6/n937mJv7VDXWXMi+ho
	Fm5jeYSMLUP6BFi4ZmO2a8NgNfbCozGLpaUlXtRypBGzGF3mYWl/znBKKLvZiazHqXje
	lw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=Ke9MBBbA42ExpuYRE3cbIR1+6l7ma+4tJml7qL2QFmw=;
	b=IP0pvHUwmPc3fiVGNY0zHPUpFABpEq675a1/uUBanXWj8ABoAWSuTiJ5MiekZj3Xd3
	cyfctkvNXZ3PjiJSsj503FY5iZ0iLggB8G9HeW3YUQccLwMZjJxQ//ESlnsfU3Fcz4/O
	eAGghfsWYVHeAnOkEvoKo02ObxYudFqDCIRyPpBzxTHLPtn5Lr6z3owwGApEF8Ii8KJU
	HDVxWIQB9xkD7Pk3mm0369rJMDEc5/Q4av22z6vqoBuH6X+luXfvOmWM81KdklYZUnkp
	+CgQAyEZEBZKSx0vs1aeZym97nuf6ZEfiaqkdDF3cygBiL7i+ySA4JX/0t/fKi3URBzN
	17fg==
X-Gm-Message-State: AIkVDXLoVJr81X1DGS8PtHIFMauvs+fR7OJ3mtyBmexyLKxQVUWo/KcqO271SmiQNzMycg==
X-Received: by 10.99.158.18 with SMTP id s18mr3590003pgd.88.1482284493965;
	Tue, 20 Dec 2016 17:41:33 -0800 (PST)
Received: from [10.22.11.123] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	x4sm42188061pgc.14.2016.12.20.17.41.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 17:41:33 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>,
	Robert Yang <liezhi.yang@windriver.com>
References: <cover.1481700149.git.liezhi.yang@windriver.com>
	<CAJTo0LbWYxOFm578U4c=c=Dy0ChF-VehMk3pUB3kAT-puCntFA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <15e9ceff-a480-1cb4-1375-58cbbb2258d1@gmail.com>
Date: Tue, 20 Dec 2016 17:41:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbWYxOFm578U4c=c=Dy0ChF-VehMk3pUB3kAT-puCntFA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/8] Fixes for eSDK and testsdkext
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
X-List-Received-Date: Wed, 21 Dec 2016 01:41:34 -0000
Content-Type: multipart/alternative;
	boundary="------------AA3BAF8766794985406752A1"

--------------AA3BAF8766794985406752A1
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/20/2016 07:41 AM, Burton, Ross wrote:
> This doesn't apply to master since Josh's getVar() changes landed, can 
> you please rebase?

Would this appropriate for Morty in its current version?
- Armin
>
> Ross
>
> On 14 December 2016 at 07:24, Robert Yang <liezhi.yang@windriver.com 
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     * V2
>       1) Fix Paul's comments:
>          - Drop "don't reset when the test is failed"
>          - Update bug id for "oe-publish-sdk: add pyshtables.py to
>     .gitignore"
>          - Split "install multilib targets as populate_sdk does" into
>     2 commits:
>            "break the long lines"
>            "install multilib SDKs"
>       2) Use shorter subject lines
>
>     * V1
>       Initial version
>
>     // Robert
>
>     The following changes since commit
>     4e412234c37efec42b3962c11d44903c0c58c92e:
>
>       libpcap: Disable exposed bits of WinPCAP remote capture support
>     (2016-12-13 22:47:35 +0000)
>
>     are available in the git repository at:
>
>       git://git.openembedded.org/openembedded-core-contrib
>     <http://git.openembedded.org/openembedded-core-contrib> rbt/eSDK
>     http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/eSDK
>     <http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/eSDK>
>
>     Robert Yang (8):
>       populate_sdk_ext.bbclass: break the long lines
>       populate_sdk_ext.bbclass: install multilib SDKs
>       oeqa/sdkext/devtool.py: remove sources before run test cases
>       oe-publish-sdk: make cmd easier to read
>       oe-publish-sdk: add pyshtables.py to .gitignore
>       oeqa/oetest.py: add hasLockedSig()
>       oeqa/sdkext/devtool.py: skip a testcase when no libxml2
>       oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN
>
>      meta/classes/populate_sdk_ext.bbclass | 63
>     ++++++++++++++++++++++++-----------
>      meta/lib/oe/copy_buildsystem.py       | 18 ++++++++++
>      meta/lib/oeqa/oetest.py               | 13 ++++++++
>      meta/lib/oeqa/sdkext/devtool.py       |  8 ++++-
>      scripts/oe-publish-sdk                | 19 +++++++++--
>      5 files changed, 98 insertions(+), 23 deletions(-)
>
>     --
>     2.10.2
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>


--------------AA3BAF8766794985406752A1
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 12/20/2016 07:41 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbWYxOFm578U4c=c=Dy0ChF-VehMk3pUB3kAT-puCntFA@mail.gmail.com"
      type="cite">
      <div dir="ltr">This doesn't apply to master since Josh's getVar()
        changes landed, can you please rebase?</div>
    </blockquote>
    <br>
    Would this appropriate for Morty in its current version?<br>
    - Armin<br>
    <blockquote
cite="mid:CAJTo0LbWYxOFm578U4c=c=Dy0ChF-VehMk3pUB3kAT-puCntFA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 14 December 2016 at 07:24, Robert
          Yang <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:liezhi.yang@windriver.com" target="_blank">liezhi.yang@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">* V2<br>
              1) Fix Paul's comments:<br>
                 - Drop "don't reset when the test is failed"<br>
                 - Update bug id for "oe-publish-sdk: add pyshtables.py
            to .gitignore"<br>
                 - Split "install multilib targets as populate_sdk does"
            into 2 commits:<br>
                   "break the long lines"<br>
                   "install multilib SDKs"<br>
              2) Use shorter subject lines<br>
            <br>
            * V1<br>
              Initial version<br>
            <br>
            // Robert<br>
            <br>
            The following changes since commit
            4e412234c37efec42b3962c11d4490<wbr>3c0c58c92e:<br>
            <br>
              libpcap: Disable exposed bits of WinPCAP remote capture
            support (2016-12-13 22:47:35 +0000)<br>
            <br>
            are available in the git repository at:<br>
            <br>
              git://<a moz-do-not-send="true"
              href="http://git.openembedded.org/openembedded-core-contrib"
              rel="noreferrer" target="_blank">git.openembedded.org/<wbr>openembedded-core-contrib</a>
            rbt/eSDK<br>
              <a moz-do-not-send="true"
href="http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/eSDK"
              rel="noreferrer" target="_blank">http://cgit.openembedded.org/<wbr>cgit.cgi/openembedded-core-<wbr>contrib/log/?h=rbt/eSDK</a><br>
            <br>
            Robert Yang (8):<br>
              populate_sdk_ext.bbclass: break the long lines<br>
              populate_sdk_ext.bbclass: install multilib SDKs<br>
              oeqa/sdkext/devtool.py: remove sources before run test
            cases<br>
              oe-publish-sdk: make cmd easier to read<br>
              oe-publish-sdk: add pyshtables.py to .gitignore<br>
              oeqa/oetest.py: add hasLockedSig()<br>
              oeqa/sdkext/devtool.py: skip a testcase when no libxml2<br>
              oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN<br>
            <br>
             meta/classes/populate_sdk_ext.<wbr>bbclass | 63
            ++++++++++++++++++++++++------<wbr>-----<br>
             meta/lib/oe/copy_buildsystem.<wbr>py       | 18 ++++++++++<br>
             meta/lib/oeqa/oetest.py               | 13 ++++++++<br>
             meta/lib/oeqa/sdkext/devtool.<wbr>py       |  8 ++++-<br>
             scripts/oe-publish-sdk                | 19 +++++++++--<br>
             5 files changed, 98 insertions(+), 23 deletions(-)<br>
            <span class="HOEnZb"><font color="#888888"><br>
                --<br>
                2.10.2<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a moz-do-not-send="true"
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------AA3BAF8766794985406752A1--

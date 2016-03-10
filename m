Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F3AC97017D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 08:41:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2A8fSPZ015241
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Mar 2016 00:41:28 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 10 Mar 2016 00:41:27 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
	<14047fe718ae0dcf3e1671364bcfa76e31aecc77.1457593651.git.hongxu.jia@windriver.com>
	<CAMKF1sqhFDRPHEFJFPoqqKpNbhKA9Sw9CpxA1+OOLceqEVPHrw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56E13335.5030702@windriver.com>
Date: Thu, 10 Mar 2016 16:41:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqhFDRPHEFJFPoqqKpNbhKA9Sw9CpxA1+OOLceqEVPHrw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 18/18] cmake-native:convert source file to relative path
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
X-List-Received-Date: Thu, 10 Mar 2016 08:41:31 -0000
Content-Type: multipart/alternative;
	boundary="------------060703050906010103000408"

--------------060703050906010103000408
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2016 04:08 PM, Khem Raj wrote:
>
> We should submit these kind of changes upstream first and get an 
> opinion before forking like this
>

OK, I will have a try.

>
>     +Although there is CMAKE_USE_RELATIVE_PATHS, but upstream
>     +explicitly did not support relative path.
>     +In git://cmake.org/cmake.git <http://cmake.org/cmake.git>
>     +...
>     +commit 1335992c8f4e8b96f1a21d5dcc7d65a9fbd84c11
>     +Author: Stephen Kelly <steveire@gmail.com
>     <mailto:steveire@gmail.com>>
>     +Date:   Mon Jun 1 19:56:46 2015 +0200
>     +
>     +    Remove CMAKE_USE_RELATIVE_PATHS variable.
>     +...
>     +The reason is in https://cmake.org/Wiki/CMake_FAQ
>     +(Why does CMake use full paths, or can I copy my build tree?)
>

Currently, The upstream explicitly do not support it.

//Hongxu

>     +
>     +But oe-core need the source file path relative while compiling
>     +to avoid build path issue. The fix partly refer the above commit,
>     +but in order to minimize the influence, it only tweak gcc compiling
>     +rule in generated Makefile (With "Building ** object" message).
>



--------------060703050906010103000408
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/10/2016 04:08 PM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1sqhFDRPHEFJFPoqqKpNbhKA9Sw9CpxA1+OOLceqEVPHrw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <p dir="ltr">We should submit these kind of changes upstream first
        and get an opinion before forking like this</p>
    </blockquote>
    <br>
    OK, I will have a try.<br>
    <br>
    <blockquote
cite="mid:CAMKF1sqhFDRPHEFJFPoqqKpNbhKA9Sw9CpxA1+OOLceqEVPHrw@mail.gmail.com"
      type="cite">
      <div class="gmail_quote">
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <br>
          +Although there is CMAKE_USE_RELATIVE_PATHS, but upstream<br>
          +explicitly did not support relative path.<br>
          +In git://<a moz-do-not-send="true"
            href="http://cmake.org/cmake.git" rel="noreferrer"
            target="_blank">cmake.org/cmake.git</a><br>
          +...<br>
          +commit 1335992c8f4e8b96f1a21d5dcc7d65a9fbd84c11<br>
          +Author: Stephen Kelly &lt;<a moz-do-not-send="true"
            href="mailto:steveire@gmail.com">steveire@gmail.com</a>&gt;<br>
          +Date:   Mon Jun 1 19:56:46 2015 +0200<br>
          +<br>
          +    Remove CMAKE_USE_RELATIVE_PATHS variable.<br>
          +...<br>
          +The reason is in <a moz-do-not-send="true"
            href="https://cmake.org/Wiki/CMake_FAQ" rel="noreferrer"
            target="_blank">https://cmake.org/Wiki/CMake_FAQ</a><br>
          +(Why does CMake use full paths, or can I copy my build tree?)<br>
        </blockquote>
      </div>
    </blockquote>
    <br>
    Currently, The upstream explicitly do not support it.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAMKF1sqhFDRPHEFJFPoqqKpNbhKA9Sw9CpxA1+OOLceqEVPHrw@mail.gmail.com"
      type="cite">
      <div class="gmail_quote">
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          +<br>
          +But oe-core need the source file path relative while
          compiling<br>
          +to avoid build path issue. The fix partly refer the above
          commit,<br>
          +but in order to minimize the influence, it only tweak gcc
          compiling<br>
          +rule in generated Makefile (With "Building ** object"
          message).<br>
        </blockquote>
      </div>
    </blockquote>
    <br>
    <br>
  </body>
</html>

--------------060703050906010103000408--

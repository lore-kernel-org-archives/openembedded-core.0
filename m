Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE902731C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 02:03:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBK23f7B000764
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 19 Dec 2016 18:03:41 -0800
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Dec 2016 18:03:40 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1482125840.git.dengke.du@windriver.com>
	<b462c405d5967bc06c0cb6e7b984c95852739480.1482125840.git.dengke.du@windriver.com>
	<CAJTo0LaPw5z2W5-rx3DJrNj0w1APeTCsAhwGq8GEGC6_zAW4fg@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <224071e0-f86e-e4dd-f83c-593c5a22a3b4@windriver.com>
Date: Tue, 20 Dec 2016 10:03:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaPw5z2W5-rx3DJrNj0w1APeTCsAhwGq8GEGC6_zAW4fg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/2] apr: fix off_t size can't match when configure and in target glibc
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
X-List-Received-Date: Tue, 20 Dec 2016 02:03:42 -0000
Content-Type: multipart/alternative;
	boundary="------------4A8ADCC7EB0D86D9110BA118"

--------------4A8ADCC7EB0D86D9110BA118
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Thank you for reminding, the following types were hardcoded in apr 
source code when cross compiling:

     pid_t     8

     ssize_t  8

     size_t    8

     off_t      8

I will send V3.


On 2016年12月19日 19:56, Burton, Ross wrote:
>
> On 19 December 2016 at 05:40, Dengke Du <dengke.du@windriver.com 
> <mailto:dengke.du@windriver.com>> wrote:
>
>     +I have send a discussing for the upstream, the maintainer said
>     the macro in
>     +APR designed with only any attention paid to the build platform,
>     considering
>     +cross compiling less, we can check the discussing from:
>
>
> Sigh...
>
> Have you verified that there are no other instances of that macros in 
> configure.ac <http://configure.ac>?  It's clear that it's broken by 
> design and should just be removed.
>
> Ross


--------------4A8ADCC7EB0D86D9110BA118
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Thank you for reminding, the following types were hardcoded in
      apr source code when cross compiling:</p>
    <p>    pid_t     8</p>
    <p>    ssize_t  8</p>
    <p>    size_t    8</p>
    <p>    off_t      8</p>
    <p>I will send V3.</p>
    <br>
    <div class="moz-cite-prefix">On 2016年12月19日 19:56, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaPw5z2W5-rx3DJrNj0w1APeTCsAhwGq8GEGC6_zAW4fg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 19 December 2016 at 05:40, Dengke
            Du <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:dengke.du@windriver.com" target="_blank">dengke.du@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":24c" class="a3s aXjCH m159159940b77dd71">+I have
                send a discussing for the upstream, the maintainer said
                the macro in<br>
                +APR designed with only any attention paid to the build
                platform, considering<br>
                +cross compiling less, we can check the discussing from:</div>
            </blockquote>
          </div>
          <br>
          Sigh...</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Have you verified that there are no
          other instances of that macros in <a moz-do-not-send="true"
            href="http://configure.ac">configure.ac</a>?  It's clear
          that it's broken by design and should just be removed.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------4A8ADCC7EB0D86D9110BA118--

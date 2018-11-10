Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 933636C18E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Nov 2018 02:22:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAA2MPI7009687
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 18:22:25 -0800 (PST)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 9 Nov 2018 18:22:24 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1541754618.git.hongxu.jia@windriver.com>
	<c54208078931ad047bd69fc38f27de2e2d367fbf.1541754618.git.hongxu.jia@windriver.com>
	<5c0fe7734469e010f42c6d14477928c4f6599447.camel@linuxfoundation.org>
	<a1a2bb6a-7ace-086c-e4f2-bd91f7b7d9b7@windriver.com>
Message-ID: <2fd9b7ba-ca8e-fea4-c138-93f6f717f18d@windriver.com>
Date: Sat, 10 Nov 2018 10:22:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a1a2bb6a-7ace-086c-e4f2-bd91f7b7d9b7@windriver.com>
Subject: Re: [PATCH 1/2] rng-tools: 5 -> 6.6
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
X-List-Received-Date: Sat, 10 Nov 2018 02:22:26 -0000
Content-Type: multipart/alternative;
	boundary="------------6F96B91370997FA1ECB3A875"
Content-Language: en-US

--------------6F96B91370997FA1ECB3A875
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018/11/10 上午9:14, Hongxu Jia wrote:
>
>
>> There are also other weird hangs being observed on the autobuilder
>> after these changes. I can't prove its this patchset but I am
>> suspicious and its something in master-next as things were working just
>> fine until we started poking around all this again :(
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/34/builds/182/steps/7/logs/stdio 
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/2/builds/188/steps/7/logs/stdio 
>>

I am trying to catch the issue patches

//Hongxu


--------------6F96B91370997FA1ECB3A875
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018/11/10 上午9:14, Hongxu Jia wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a1a2bb6a-7ace-086c-e4f2-bd91f7b7d9b7@windriver.com"><br>
      <br>
      <blockquote type="cite" style="color: #000000;">There are also
        other weird hangs being observed on the autobuilder
        <br>
        after these changes. I can't prove its this patchset but I am
        <br>
        suspicious and its something in master-next as things were
        working just
        <br>
        fine until we started poking around all this again <span
          class="moz-smiley-s2" title=":("><span>:(</span></span>
        <br>
        <br>
        <a class="moz-txt-link-freetext"
href="https://autobuilder.yoctoproject.org/typhoon/#/builders/34/builds/182/steps/7/logs/stdio"
          moz-do-not-send="true">https://autobuilder.yoctoproject.org/typhoon/#/builders/34/builds/182/steps/7/logs/stdio</a>
        <br>
        <a class="moz-txt-link-freetext"
href="https://autobuilder.yoctoproject.org/typhoon/#/builders/2/builds/188/steps/7/logs/stdio"
          moz-do-not-send="true">https://autobuilder.yoctoproject.org/typhoon/#/builders/2/builds/188/steps/7/logs/stdio</a>
        <br>
      </blockquote>
    </blockquote>
    <p>I am trying to catch the issue patches</p>
    <p>//Hongxu<br>
    </p>
  </body>
</html>

--------------6F96B91370997FA1ECB3A875--

Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8F671AD9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 10:57:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0DAvGeh000019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Jan 2017 02:57:16 -0800 (PST)
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Fri, 13 Jan 2017 02:57:16 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<ca764bbf717c216d58b7622911621e928615189e.1482739038.git.Qi.Chen@windriver.com>
	<CAJTo0LZUoxeKVP6MikAgjJYgbDg365zRTq+F_EpqZcouPx5LWg@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <10a8f875-1535-cf26-8b88-7489ab9d31f3@windriver.com>
Date: Fri, 13 Jan 2017 18:57:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZUoxeKVP6MikAgjJYgbDg365zRTq+F_EpqZcouPx5LWg@mail.gmail.com>
X-Originating-IP: [128.224.162.184]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] byacc: upgrade to 20161202
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
X-List-Received-Date: Fri, 13 Jan 2017 10:57:18 -0000
Content-Type: multipart/alternative;
	boundary="------------8BA27E74ED3297143989E3A1"

--------------8BA27E74ED3297143989E3A1
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2017 07:18 AM, Burton, Ross wrote:
>
> On 26 December 2016 at 08:10, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>
>
> I haven't yet looked into why it could be happening, but it appears 
> the upgraded byacc doesn't like building for beaglebone on poky-lsb:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/builds/1002/steps/BuildImages_1/logs/stdio
>
> Ross


Hi Ross,

I've fixed the problem and updated the remote branch.

   git://git.pokylinux.org/poky-contrib ChenQi/PU-20161226
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20161226

In particular, 0001-byacc-do-not-reorder-CC-and-CFLAGS.patch is added to 
fix the problem of byacc configure script dropping some $CC options.

Best Regards,

Chen Qi





--------------8BA27E74ED3297143989E3A1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/13/2017 07:18 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZUoxeKVP6MikAgjJYgbDg365zRTq+F_EpqZcouPx5LWg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 26 December 2016 at 08:10, Chen Qi
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id="gmail-:15v" class="gmail-a3s gmail-aXjCH
                gmail-m1593a2e5ee9c3799">Signed-off-by: Chen Qi &lt;<a
                  moz-do-not-send="true"
                  href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
              </div>
            </blockquote>
          </div>
          <br>
          I haven't yet looked into why it could be happening, but it
          appears the upgraded byacc doesn't like building for
          beaglebone on poky-lsb:</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra"><a moz-do-not-send="true"
href="https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/builds/1002/steps/BuildImages_1/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/builds/1002/steps/BuildImages_1/logs/stdio</a><br>
        </div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Hi Ross,</p>
    <p>I've fixed the problem and updated the remote branch.</p>
    <pre wrap="">  git://git.pokylinux.org/poky-contrib ChenQi/PU-20161226
  <a class="moz-txt-link-freetext" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20161226">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20161226</a></pre>
    <p>In particular, 0001-byacc-do-not-reorder-CC-and-CFLAGS.patch is
      added to fix the problem of byacc configure script dropping some
      $CC options.<br>
    </p>
    <p>Best Regards,</p>
    <p>Chen Qi<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------8BA27E74ED3297143989E3A1--

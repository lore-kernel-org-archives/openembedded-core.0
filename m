Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF33770CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 07:54:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0P7sfMM025215
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 23:54:41 -0800
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 24 Jan 2016 23:54:40 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1447406020.git.kai.kang@windriver.com>
	<565FA0EB.2060206@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56A5D4CC.2070001@windriver.com>
Date: Mon, 25 Jan 2016 15:54:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <565FA0EB.2060206@windriver.com>
Subject: Re: [PATCH 0/1] Don't expand vars which starts with multilib prefix already
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
X-List-Received-Date: Mon, 25 Jan 2016 07:54:41 -0000
Content-Type: multipart/alternative;
	boundary="------------090708040700030902040407"

--------------090708040700030902040407
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年12月03日 09:54, Kang Kai wrote:
> On 2015年11月13日 17:24, kai.kang@windriver.com wrote:
>> From: Kai Kang<kai.kang@windriver.com>
>>
>> Test steps:
>> 1 set MACHINE and multilibs in local.conf
>>
>> ===============================================
>> MACHINE = "qemux86-64"
>>
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32 multilib:lib64"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>> DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64"
>> ===============================================
>>
>> 2 bitbake lib64-meta-ide-support core-image-sato
>>
>> The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:
>>
>>    build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib kangkai/multilib
>>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/multilib
>>
>> Kai Kang (1):
>>    toolchain-scripts.bbclass: do not expand vars which starts with
>>      multilib prefixes
>>
>>   meta/classes/toolchain-scripts.bbclass | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>
> Ping.

Ping again.


>
> -- 
> Regards,
> Neil | Kai Kang


-- 
Regards,
Neil | Kai Kang


--------------090708040700030902040407
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2015年12月03日 09:54, Kang Kai wrote:<br>
    </div>
    <blockquote cite="mid:565FA0EB.2060206@windriver.com" type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div class="moz-cite-prefix">On 2015年11月13日 17:24, <a
          moz-do-not-send="true" class="moz-txt-link-abbreviated"
          href="mailto:kai.kang@windriver.com"><a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a></a>
        wrote:<br>
      </div>
      <blockquote cite="mid:cover.1447406020.git.kai.kang@windriver.com"
        type="cite">
        <pre wrap="">From: Kai Kang <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Test steps:
1 set MACHINE and multilibs in local.conf

===============================================
MACHINE = "qemux86-64" 

require conf/multilib.conf                                                                                   
MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64"
===============================================

2 bitbake lib64-meta-ide-support core-image-sato

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/multilib
  <a moz-do-not-send="true" class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/multilib">http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/multilib</a>

Kai Kang (1):
  toolchain-scripts.bbclass: do not expand vars which starts with
    multilib prefixes

 meta/classes/toolchain-scripts.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

</pre>
      </blockquote>
      <font size="+1"><br>
        Ping.</font><br>
    </blockquote>
    <br>
    Ping again.<br>
    <br>
    <br>
    <blockquote cite="mid:565FA0EB.2060206@windriver.com" type="cite"> <br>
      <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------090708040700030902040407--

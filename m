Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F61374F0E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 07:05:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U75BNH004285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 May 2018 00:05:12 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 30 May 2018 00:05:11 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1527654433-263632-1-git-send-email-changqing.li@windriver.com>
	<CANNYZj8kCFWOfoDdn+F8LsGtT7oG6TKapBEnzPTSL=K0sttbRg@mail.gmail.com>
From: cli10 <changqing.li@windriver.com>
Message-ID: <5b7ff97e-01dd-527f-9ca2-942997b7e6e9@windriver.com>
Date: Wed, 30 May 2018 15:05:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8kCFWOfoDdn+F8LsGtT7oG6TKapBEnzPTSL=K0sttbRg@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemuwrapper-cross: fix postinst failed warning
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
X-List-Received-Date: Wed, 30 May 2018 07:05:12 -0000
Content-Type: multipart/alternative;
	boundary="------------F8FB926F08C4408C1F71C0A3"
Content-Language: en-US

--------------F8FB926F08C4408C1F71C0A3
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

OK, I will test with your patch:-)

On 05/30/2018 02:41 PM, Alexander Kanavin wrote:
> 2018-05-30 7:27 GMT+03:00  <changqing.li@windriver.com>:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> 1. some binary like udev-hwdb/pixbufcache/gio-module-cache/fontcache
>> uses qemu usermode by default,  but some architecture such as Intel
>> skylake does not support qemu usermode, this can lead to a build warning as below:
>> 2. font is not arch related, but receipe like liberation-fonts inherit fontcache,
>> fontcache called update_font_cache, update_font_cache use qemuwrapper,
>> qemuwrapper is arch related, so update_font_cache will core dumped as below:
> I need to apologize. I went ahead and fixed all of these issues myself
> over the weekend, and improved a few other things in how postinsts
> (and postinst intercepts) are handled. Should've told you immediately.
> The seven patches have been sent, so if you can test and confirm that
> they indeed fix these issues, I'd appreciate.
> http://lists.openembedded.org/pipermail/openembedded-core/2018-May/151196.html
>
> Alex
>

-- 
BRs

Sandy(Li Changqing)
+861084778653


--------------F8FB926F08C4408C1F71C0A3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#99FF99">
    OK, I will test with your patch<span class="moz-smiley-s1"><span>:-)</span></span><br>
    <br>
    <div class="moz-cite-prefix">On 05/30/2018 02:41 PM, Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj8kCFWOfoDdn+F8LsGtT7oG6TKapBEnzPTSL=K0sttbRg@mail.gmail.com">
      <pre wrap="">2018-05-30 7:27 GMT+03:00  <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>:
</pre>
      <blockquote type="cite">
        <pre wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

1. some binary like udev-hwdb/pixbufcache/gio-module-cache/fontcache
uses qemu usermode by default,  but some architecture such as Intel
skylake does not support qemu usermode, this can lead to a build warning as below:
2. font is not arch related, but receipe like liberation-fonts inherit fontcache,
fontcache called update_font_cache, update_font_cache use qemuwrapper,
qemuwrapper is arch related, so update_font_cache will core dumped as below:
</pre>
      </blockquote>
      <pre wrap="">
I need to apologize. I went ahead and fixed all of these issues myself
over the weekend, and improved a few other things in how postinsts
(and postinst intercepts) are handled. Should've told you immediately.
The seven patches have been sent, so if you can test and confirm that
they indeed fix these issues, I'd appreciate.
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/pipermail/openembedded-core/2018-May/151196.html">http://lists.openembedded.org/pipermail/openembedded-core/2018-May/151196.html</a>

Alex

</pre>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
+861084778653</pre>
  </body>
</html>

--------------F8FB926F08C4408C1F71C0A3--

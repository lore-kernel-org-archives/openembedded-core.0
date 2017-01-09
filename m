Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31B1C71A92
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 09:39:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v099dYi2010703
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Jan 2017 01:39:34 -0800 (PST)
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 9 Jan 2017 01:39:33 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
	<CAJTo0LaqVCZMyHhB30c=-yKmWMapkM+HYiDfNv1uD89pUgqEqA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <30f94fc0-e3b6-9ccf-8e03-f6c7f2f81086@windriver.com>
Date: Mon, 9 Jan 2017 17:39:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaqVCZMyHhB30c=-yKmWMapkM+HYiDfNv1uD89pUgqEqA@mail.gmail.com>
X-Originating-IP: [128.224.162.184]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] flex: upgrade to 2.6.2
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
X-List-Received-Date: Mon, 09 Jan 2017 09:39:37 -0000
Content-Type: multipart/alternative;
	boundary="------------2EA1A75CDD1EC9D3A0DE98F6"

--------------2EA1A75CDD1EC9D3A0DE98F6
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2017 10:59 PM, Burton, Ross wrote:
>
> On 26 December 2016 at 08:10, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     +  cp ${B}/src/stage1flex ${D}/${bindir}
>
>
> Can this not just use the flex from flex-native directly instead of 
> having to install the stage1flex?
>
> Ross


Hi Ross,

I just found that nativesdk-flex also needs the following patch to 
compile correctly.

0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch

I've fixed the problem and updated the remote branch.

   git://git.pokylinux.org/poky-contrib ChenQi/PU-20161226
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20161226


Best Regards,
Chen Qi


--------------2EA1A75CDD1EC9D3A0DE98F6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/06/2017 10:59 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaqVCZMyHhB30c=-yKmWMapkM+HYiDfNv1uD89pUgqEqA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 26 December 2016 at 08:10, Chen Qi
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":777" class="a3s aXjCH m1593a2e26ecad7ee">+     
                 cp ${B}/src/stage1flex ${D}/${bindir}<br>
              </div>
            </blockquote>
          </div>
          <br>
        </div>
        <div class="gmail_extra">Can this not just use the flex from
          flex-native directly instead of having to install the
          stage1flex?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Hi Ross,</p>
    <p>I just found that nativesdk-flex also needs the following patch
      to compile correctly.</p>
    <pre wrap="">0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch</pre>
    <p>I've fixed the problem and updated the remote branch.</p>
    <pre wrap="">  git://git.pokylinux.org/poky-contrib ChenQi/PU-20161226
  <a class="moz-txt-link-freetext" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20161226">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20161226</a>


Best Regards,
Chen Qi
</pre>
    <pre wrap="">
</pre>
  </body>
</html>

--------------2EA1A75CDD1EC9D3A0DE98F6--

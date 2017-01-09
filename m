Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8450260670
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 01:53:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v091rgKv026063
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Jan 2017 17:53:42 -0800 (PST)
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 8 Jan 2017 17:53:41 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
	<CAJTo0LaqVCZMyHhB30c=-yKmWMapkM+HYiDfNv1uD89pUgqEqA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <9bcb0f76-972e-852a-de19-feaeb0daa9e7@windriver.com>
Date: Mon, 9 Jan 2017 09:53:48 +0800
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
X-List-Received-Date: Mon, 09 Jan 2017 01:53:43 -0000
Content-Type: multipart/alternative;
	boundary="------------CD28976822CBD1E4DF7BBF3E"

--------------CD28976822CBD1E4DF7BBF3E
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

I'm not sure if I understand it correctly. stage1flex has to be in 
sysroot to be used safely. Otherwise, if rm_work is enabled, things are 
removed. And for stage1flex to be in sysroot, it has to be installed.

Best Regards,

Chen Qi


--------------CD28976822CBD1E4DF7BBF3E
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
    <p>I'm not sure if I understand it correctly. stage1flex has to be
      in sysroot to be used safely. Otherwise, if rm_work is enabled,
      things are removed. And for stage1flex to be in sysroot, it has to
      be installed.</p>
    <p>Best Regards,</p>
    <p>Chen Qi<br>
    </p>
  </body>
</html>

--------------CD28976822CBD1E4DF7BBF3E--

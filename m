Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADF3D780A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 05:42:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5C5gVJF005056
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 11 Jun 2017 22:42:31 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 11 Jun 2017 22:42:30 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1497001417.git.dengke.du@windriver.com>
	<d3fa5353a75efd6bc2253bc09974b763112e8b5a.1497001417.git.dengke.du@windriver.com>
	<CAJTo0LZM6ZCxYHY9Jy=mObo29DKrUJChm-fCr=Fk0HPPSa+6Vg@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <8863a9c6-c22f-dca4-a2a7-19d55fb44c66@windriver.com>
Date: Mon, 12 Jun 2017 13:42:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZM6ZCxYHY9Jy=mObo29DKrUJChm-fCr=Fk0HPPSa+6Vg@mail.gmail.com>
X-Originating-IP: [128.224.162.194]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] archiver.bbclass: add task do_prepare_recipe_sysroot before do_configure
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
X-List-Received-Date: Mon, 12 Jun 2017 05:42:32 -0000
Content-Type: multipart/alternative;
	boundary="------------22A758AD0C431E7268C85CF7"
Content-Language: en-US

--------------22A758AD0C431E7268C85CF7
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Thanks, that commit works, please ignore this patch.

On 2017年06月10日 00:38, Burton, Ross wrote:
>
> On 9 June 2017 at 10:45, Dengke Du <dengke.du@windriver.com 
> <mailto:dengke.du@windriver.com>> wrote:
>
>     When recipe inherit archiver.bbclass and enable:
>
>         ARCHIVER_MODE[src] = "configured"
>
>     output errors:
>
>         automake: command not found
>
>
> I think oe-core aa2240657b015d46e9ba4bcb6264709a82313d83 fixes this 
> already, can you verify?
>
> Ross


--------------22A758AD0C431E7268C85CF7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Thanks, that commit works, please ignore this patch.<br>
    <br>
    <div class="moz-cite-prefix">On 2017年06月10日 00:38, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZM6ZCxYHY9Jy=mObo29DKrUJChm-fCr=Fk0HPPSa+6Vg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 9 June 2017 at 10:45, Dengke Du <span
              dir="ltr">&lt;<a href="mailto:dengke.du@windriver.com"
                target="_blank" moz-do-not-send="true">dengke.du@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
              <div id="gmail-:4rc" class="gmail-a3s gmail-aXjCH
                gmail-m15c8c3f3160b262c">When recipe inherit
                archiver.bbclass and enable:<br>
                <br>
                    ARCHIVER_MODE[src] = "configured"<br>
                <br>
                output errors:<br>
                <br>
                    automake: command not found</div>
            </blockquote>
          </div>
          <br>
          I think oe-core aa2240657b015d46e9ba4bcb6264709a82313d83 fixes
          this already, can you verify?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------22A758AD0C431E7268C85CF7--

Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F059D783D5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 00:56:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8C0uGPB008166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 11 Sep 2017 17:56:16 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 11 Sep 2017 17:56:14 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1505114394.git.dengke.du@windriver.com>
	<426c9f986646adcd1dbcb601f81ae08f87cbee9d.1505114394.git.dengke.du@windriver.com>
	<CAJTo0LaSerr07urbRCe_Nxbx1mfKxBD-Wje2P9wqJLtc+tS-uQ@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <62d2d18c-d3eb-6d00-3304-6df90e4a9332@windriver.com>
Date: Tue, 12 Sep 2017 08:55:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaSerr07urbRCe_Nxbx1mfKxBD-Wje2P9wqJLtc+tS-uQ@mail.gmail.com>
X-Originating-IP: [128.224.162.194]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ovmf: fix do_compile error when len(tmp)=410
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
X-List-Received-Date: Tue, 12 Sep 2017 00:56:16 -0000
Content-Type: multipart/alternative;
	boundary="------------0C3A132231B18BB87DBD465C"
Content-Language: en-US

--------------0C3A132231B18BB87DBD465C
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ok, I will resend it with 1023.


On 2017年09月11日 18:51, Burton, Ross wrote:
> On 11 September 2017 at 08:29, Dengke Du <dengke.du@windriver.com 
> <mailto:dengke.du@windriver.com>> wrote:
>
>     +-#define MAX_LONG_FILE_PATH 500
>     ++#define MAX_LONG_FILE_PATH 800
>
>
> Making this limit a little bigger seems like a great way to hit it 
> with a slightly longer path.  The other patch 
> (VfrCompile-increase-path-length-limit.patch) increases it to 1023 
> which seems to be a more future-proof solution (and consistent).
>
> Ross


--------------0C3A132231B18BB87DBD465C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Ok, I will resend it with 1023.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2017年09月11日 18:51, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LaSerr07urbRCe_Nxbx1mfKxBD-Wje2P9wqJLtc+tS-uQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 11 September 2017 at 08:29, Dengke Du <span
          dir="ltr">&lt;<a href="mailto:dengke.du@windriver.com"
            target="_blank" moz-do-not-send="true">dengke.du@windriver.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">+-#define
              MAX_LONG_FILE_PATH 500<br>
              ++#define MAX_LONG_FILE_PATH 800<br>
            </blockquote>
            <div><br>
            </div>
            <div>Making this limit a little bigger seems like a great
              way to hit it with a slightly longer path.  The other
              patch (<span style="font-size:12.800000190734863px">VfrCompile-increase-</span><wbr
                style="font-size:12.800000190734863px"><span
                style="font-size:12.800000190734863px">path-length-limit.patch)
                increases it to 1023 which seems to be a more
                future-proof solution (and consistent).</span></div>
            <div><span style="font-size:12.800000190734863px"><br>
              </span></div>
            <div><span style="font-size:12.800000190734863px">Ross</span></div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------0C3A132231B18BB87DBD465C--

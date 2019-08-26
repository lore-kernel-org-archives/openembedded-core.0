Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B22FE7F5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 01:28:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7Q1SrO8022072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Aug 2019 18:28:53 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 25 Aug 2019 18:28:52 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190823081945.49883-1-kai.kang@windriver.com>
	<CANNYZj8S5kUL_=nXEQtEcrGM8W174gUx7b-0pJ15edbPG4ej5w@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <b0cbad63-7ead-a303-b870-b72773e7e060@windriver.com>
Date: Mon, 26 Aug 2019 09:28:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8S5kUL_=nXEQtEcrGM8W174gUx7b-0pJ15edbPG4ej5w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libwacom: add recipe
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
X-List-Received-Date: Mon, 26 Aug 2019 01:28:53 -0000
Content-Type: multipart/alternative;
	boundary="------------784C0DECBFB6C81D7ED3EB83"
Content-Language: en-US

--------------784C0DECBFB6C81D7ED3EB83
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2019/8/23 下午6:21, Alexander Kanavin wrote:
> On Fri, 23 Aug 2019 at 10:20, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     Package libinput has a package config 'libwacom'. When it is set,
>     package libwacom is required. So add the recipe of libwacom.
>
>
> This recipe probably needs to go to meta-oe? Why oe-core?

Because libinput is in 
openembedded-core/meta/recipes-graphics/wayland/libinput_1.13.4.bb.
If package config 'libwacom' is enabled and libwacom belongs to meta-oe, 
then oe-core may need meta-oe.

Regards,
Kai


>
> Alex


-- 
Kai Kang


--------------784C0DECBFB6C81D7ED3EB83
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2019/8/23 下午6:21, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj8S5kUL_=nXEQtEcrGM8W174gUx7b-0pJ15edbPG4ej5w@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">On Fri, 23 Aug 2019 at 10:20, &lt;<a
            href="mailto:kai.kang@windriver.com" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Package libinput has a
            package config 'libwacom'. When it is set,<br>
            package libwacom is required. So add the recipe of libwacom.<br>
          </blockquote>
          <div><br>
          </div>
          <div>This recipe probably needs to go to meta-oe? Why oe-core?</div>
        </div>
      </div>
    </blockquote>
    <p>Because libinput is in
      openembedded-core/meta/recipes-graphics/wayland/libinput_1.13.4.bb.<br>
      If package config 'libwacom' is enabled and libwacom belongs to
      meta-oe, then oe-core may need meta-oe.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj8S5kUL_=nXEQtEcrGM8W174gUx7b-0pJ15edbPG4ej5w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang</pre>
  </body>
</html>

--------------784C0DECBFB6C81D7ED3EB83--

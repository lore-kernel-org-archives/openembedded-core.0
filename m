Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C7266E5CC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 01:06:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u29165MF016172
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 8 Mar 2016 17:06:08 -0800
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Mar 2016 17:06:04 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1456449257.git.hongxu.jia@windriver.com>
	<f6f440f9fbb9c8dccc4c0e449529ed3f3cb9fc65.1456449257.git.hongxu.jia@windriver.com>
	<CAJTo0LbV7TfDKoZuT2OjV3PU7HaQ24DOpqZ2qGFOb0fhtXM9mA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56DF76F0.6020104@windriver.com>
Date: Wed, 9 Mar 2016 09:05:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbV7TfDKoZuT2OjV3PU7HaQ24DOpqZ2qGFOb0fhtXM9mA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/15] python-pycairo: fix buildpath QA issue
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
X-List-Received-Date: Wed, 09 Mar 2016 01:06:13 -0000
Content-Type: multipart/alternative;
	boundary="------------000703050703040705070309"

--------------000703050703040705070309
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2016 11:26 PM, Burton, Ross wrote:
>
> On 26 February 2016 at 01:45, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     +do_unpack[postfuncs] += "unpack_waf"
>     +do_unpack[vardeps] += "unpack_waf"
>     +unpack_waf() {
>     +       # Just self extract tarball embedded in waf, do not care
>     help message.
>     +       # Do not generate bytecode, becuase we need to patch
>     python file later
>     +       PYTHONDONTWRITEBYTECODE=True ./waf --help >/dev/null
>     +}
>
>
> Presumably this isn't pycairo-specific but impacts every recipe using waf?
>
>      do_configure() {
>     -       BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} ./waf
>     configure --prefix=${D}${prefix} --libdir=${D}${libdir}
>     +       BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} ./waf
>     configure --prefix=${prefix} --libdir=${libdir}
>      }
>
>
> Looks like this recipe needs to use the waf class for a start.
>

OK, I will try to merge these to waf.bbclass. V2 Incoming

//Hongxu

> Ross


--------------000703050703040705070309
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/08/2016 11:26 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbV7TfDKoZuT2OjV3PU7HaQ24DOpqZ2qGFOb0fhtXM9mA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 26 February 2016 at 01:45, Hongxu
            Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":5al" class="a3s" style="overflow:hidden">+do_unpack[postfuncs]
                += "unpack_waf"<br>
                +do_unpack[vardeps] += "unpack_waf"<br>
                +unpack_waf() {<br>
                +       # Just self extract tarball embedded in waf, do
                not care help message.<br>
                +       # Do not generate bytecode, becuase we need to
                patch python file later<br>
                +       PYTHONDONTWRITEBYTECODE=True ./waf --help
                &gt;/dev/null<br>
                +}<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Presumably this isn't pycairo-specific but impacts
              every recipe using waf?</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":5al" class="a3s" style="overflow:hidden">
                 do_configure() {<br>
                -       BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
                ./waf configure --prefix=${D}${prefix}
                --libdir=${D}${libdir}<br>
                +       BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
                ./waf configure --prefix=${prefix} --libdir=${libdir}<br>
                 }</div>
            </blockquote>
          </div>
          <br>
          Looks like this recipe needs to use the waf class for a start.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    OK, I will try to merge these to waf.bbclass. V2 Incoming<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbV7TfDKoZuT2OjV3PU7HaQ24DOpqZ2qGFOb0fhtXM9mA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000703050703040705070309--

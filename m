Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AAADA7711B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 07:09:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7G79vbM017620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Aug 2016 00:09:57 -0700 (PDT)
Received: from [128.224.162.225] (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 16 Aug 2016 00:09:56 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1470967099.git.dengke.du@windriver.com>
	<18de1b4818af9e90e4578af9335497c5edd7ae9f.1470967099.git.dengke.du@windriver.com>
	<CAJTo0Lamk-EkyDpjsWw0DxKooqTd1=+0+f7kZD8Aa1yXCXQ5og@mail.gmail.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
Message-ID: <57B2BC42.101@windriver.com>
Date: Tue, 16 Aug 2016 15:09:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lamk-EkyDpjsWw0DxKooqTd1=+0+f7kZD8Aa1yXCXQ5og@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] bash: fix run-intl ptest failed
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
X-List-Received-Date: Tue, 16 Aug 2016 07:10:01 -0000
Content-Type: multipart/alternative;
	boundary="------------050804010907020208040800"

--------------050804010907020208040800
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

OK, I will add it now.

//dengke

On 2016年08月15日 23:03, Burton, Ross wrote:
>
> On 12 August 2016 at 03:08, Dengke Du <dengke.du@windriver.com 
> <mailto:dengke.du@windriver.com>> wrote:
>
>     NOTE:
>        Ensure the system contain fr-fr & de-de locales
>
>        Some tests of intl.tests need to change locales to accomplish.
>     So you need add
>        the following to a conf file:
>
>                     IMAGE_LINGUAS = "en-us fr-fr de-de"
>
>
> Would it be possible to sanity check this in the run-ptest, so if the 
> required locales are not present it emits a warning?
>
> Ross


--------------050804010907020208040800
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    OK, I will add it now.<br>
    <br>
    //dengke<br>
    <br>
    <div class="moz-cite-prefix">On 2016年08月15日 23:03, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lamk-EkyDpjsWw0DxKooqTd1=+0+f7kZD8Aa1yXCXQ5og@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 12 August 2016 at 03:08, Dengke Du
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:dengke.du@windriver.com" target="_blank">dengke.du@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":mb" class="a3s aXjCH m1567c82dfd21aa19">NOTE:<br>
                   Ensure the system contain fr-fr &amp; de-de locales<br>
                <br>
                   Some tests of intl.tests need to change locales to
                accomplish. So you need add<br>
                   the following to a conf file:<br>
                <br>
                                IMAGE_LINGUAS = "en-us fr-fr de-de"</div>
            </blockquote>
          </div>
          <br>
          Would it be possible to sanity check this in the run-ptest, so
          if the required locales are not present it emits a warning?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------050804010907020208040800--

Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1286FF84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 09:54:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2G9sxk6020017
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2016 02:54:59 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 16 Mar 2016 02:54:57 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1457438802.git.dengke.du@windriver.com>
	<f20640eec6e027b1e3b905a3357c934a4fe93d98.1457438802.git.dengke.du@windriver.com>
	<CAJTo0LZBXfcUxUqCPP+S9mUbUq1vZO3XWHUOWKrV7Gqznuu_fg@mail.gmail.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
Message-ID: <56E92D70.6030308@windriver.com>
Date: Wed, 16 Mar 2016 17:54:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZBXfcUxUqCPP+S9mUbUq1vZO3XWHUOWKrV7Gqznuu_fg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] quilt: fix ptest faildiff.test failed
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
X-List-Received-Date: Wed, 16 Mar 2016 09:55:00 -0000
Content-Type: multipart/alternative;
	boundary="------------020202010703030200040800"

--------------020202010703030200040800
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

OK, it's a good idea!

//dengke

On 2016年03月08日 23:08, Burton, Ross wrote:
>
> On 8 March 2016 at 12:11, Dengke Du <dengke.du@windriver.com 
> <mailto:dengke.du@windriver.com>> wrote:
>
>     So I change the file "meta/recipes-devtools/quilt/quilt/run-ptest",
>     when it meet the faildiff.test it skipped. I will report this bug to
>     quilt upstream.
>
>
> We're seeing a number of tests that expect to run as a non-root user.  
> Maybe ptest-runner should create a ptest user and run the test suites 
> as that user instead?
>
> Ross


--------------020202010703030200040800
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    OK, it's a good idea!<br>
    <br>
    //dengke<br>
    <br>
    <div class="moz-cite-prefix">On 2016年03月08日 23:08, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZBXfcUxUqCPP+S9mUbUq1vZO3XWHUOWKrV7Gqznuu_fg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 8 March 2016 at 12:11, Dengke Du <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:dengke.du@windriver.com" target="_blank">dengke.du@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":l4" class="a3s" style="overflow:hidden">So I
                change the file
                "meta/recipes-devtools/quilt/quilt/run-ptest",<br>
                when it meet the faildiff.test it skipped. I will report
                this bug to<br>
                quilt upstream.</div>
            </blockquote>
          </div>
          <br>
          We're seeing a number of tests that expect to run as a
          non-root user.  Maybe ptest-runner should create a ptest user
          and run the test suites as that user instead?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------020202010703030200040800--

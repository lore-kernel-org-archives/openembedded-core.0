Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3683D7199F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:50:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9B9on2t026456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Oct 2016 02:50:49 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Oct 2016 02:50:48 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Mark Hatle
	<mark.hatle@windriver.com>
References: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
	<39a3791d-d74a-21de-5806-edda4c26b33f@windriver.com>
	<CAJTo0Lb04c39Qz-oTpP-BrLT=ARmr8z9uwEugrc2vK1n6wOp7w@mail.gmail.com>
From: Yuanjie Huang <yuanjie.huang@windriver.com>
Message-ID: <d3ff1e21-3b54-e32f-e4b4-63f94970b0f8@windriver.com>
Date: Tue, 11 Oct 2016 17:50:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb04c39Qz-oTpP-BrLT=ARmr8z9uwEugrc2vK1n6wOp7w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix timestamp of plural.c after unpack
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
X-List-Received-Date: Tue, 11 Oct 2016 09:50:49 -0000
Content-Type: multipart/alternative;
	boundary="------------4B6FF986A6F915C8D706ADD3"

--------------4B6FF986A6F915C8D706ADD3
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

The generated parser contains huge hunks of code actually shipped with 
bison, so I think we should also expect some semantic difference.

Yuanjie

On 10/11/2016 05:17 PM, Burton, Ross wrote:
>
> On 11 October 2016 at 09:37, Mark Hatle <mark.hatle@windriver.com 
> <mailto:mark.hatle@windriver.com>> wrote:
>
>     My understanding of the issue is that the extraction of the
>     plural.c and
>     plural.y files happens so quickly that it is unclear to make if
>     one is older
>     then the other -- so it sometimes uses bison to rebuild the
>     plural.c.  This
>     produces a non-deterministic build.
>
>
> Surely the rebuilt plural.c should be identical to the shipped one? 
> (semantically if not literally)
>
> Ross


--------------4B6FF986A6F915C8D706ADD3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>The generated parser contains huge hunks of code actually shipped
      with bison, so I think we should also expect some semantic
      difference.<br>
    </p>
    Yuanjie<br>
    <br>
    <div class="moz-cite-prefix">On 10/11/2016 05:17 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lb04c39Qz-oTpP-BrLT=ARmr8z9uwEugrc2vK1n6wOp7w@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 11 October 2016 at 09:37, Mark
            Hatle <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:mark.hatle@windriver.com" target="_blank">mark.hatle@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":1g3" class="a3s aXjCH m157b2edf9bd2361e">My
                understanding of the issue is that the extraction of the
                plural.c and<br>
                plural.y files happens so quickly that it is unclear to
                make if one is older<br>
                then the other -- so it sometimes uses bison to rebuild
                the plural.c.  This<br>
                produces a non-deterministic build.<br>
              </div>
            </blockquote>
          </div>
          <br>
          Surely the rebuilt plural.c should be identical to the shipped
          one? (semantically if not literally)</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------4B6FF986A6F915C8D706ADD3--

Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2216E668
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 01:59:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u381xNmN017443
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 7 Apr 2016 18:59:24 -0700
Received: from [128.224.162.210] (128.224.162.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 7 Apr 2016 18:59:23 -0700
Message-ID: <570710A7.9020306@windriver.com>
Date: Fri, 8 Apr 2016 10:00:07 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1460020929.git.Qi.Chen@windriver.com>
	<ca141106b28e9f213b0965de589507300ccbbca3.1460020929.git.Qi.Chen@windriver.com>
	<CAJTo0LZLevMcyDJhgGe9uADDW60PgBXHm+GD1kijm8F6BSnCRw@mail.gmail.com>
In-Reply-To: <CAJTo0LZLevMcyDJhgGe9uADDW60PgBXHm+GD1kijm8F6BSnCRw@mail.gmail.com>
X-Originating-IP: [128.224.162.210]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] grub2: fix do_configure failure when largefile is not in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 08 Apr 2016 01:59:27 -0000
Content-Type: multipart/alternative;
	boundary="------------030501010709010304010502"

--------------030501010709010304010502
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2016 06:24 PM, Burton, Ross wrote:
>
> On 7 April 2016 at 10:22, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     configure: error: Large file support is required
>
>
> Is it safe to ignore configure.ac <http://configure.ac> telling you 
> that large file support is required?
>
> Ross

Frankly I'm not sure about it ...
Maybe Khem has more knowledge in this area.

Best Regards,
Chen Qi

--------------030501010709010304010502
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 04/07/2016 06:24 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZLevMcyDJhgGe9uADDW60PgBXHm+GD1kijm8F6BSnCRw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 7 April 2016 at 10:22, Chen Qi <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":eqq" class="a3s" style="overflow:hidden"> 
                configure: error: Large file support is required<br>
              </div>
            </blockquote>
          </div>
          <br>
          Is it safe to ignore <a moz-do-not-send="true"
            href="http://configure.ac">configure.ac</a> telling you that
          large file support is required?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    Frankly I'm not sure about it ...<br>
    Maybe Khem has more knowledge in this area.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
  </body>
</html>

--------------030501010709010304010502--

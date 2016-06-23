Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9C960124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 01:30:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5N1UJJ0018910
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Jun 2016 18:30:19 -0700 (PDT)
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 22 Jun 2016 18:30:18 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1466069361.git.Qi.Chen@windriver.com>
	<18032fc6b17d21b4fcb431114a6000042b38e3d9.1466069361.git.Qi.Chen@windriver.com>
	<CAJTo0LYpa5AMtaiOT_9L851vTyMbcNuPSWjdvmWQJq=EhJYzhA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <576B3BB2.4090604@windriver.com>
Date: Thu, 23 Jun 2016 09:30:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYpa5AMtaiOT_9L851vTyMbcNuPSWjdvmWQJq=EhJYzhA@mail.gmail.com>
X-Originating-IP: [128.224.162.229]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] recipetool/create.py: fix LICENSE value
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
X-List-Received-Date: Thu, 23 Jun 2016 01:30:21 -0000
Content-Type: multipart/alternative;
	boundary="------------030909070901030405080407"

--------------030909070901030405080407
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2016 06:57 PM, Burton, Ross wrote:
>
> On 16 June 2016 at 10:30, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     When there multiple license in a repo, the LICENSE value be created as
>     something like "LGPLv2.1 GPLv2", which causes the following warning.
>
>     LICENSE value "LGPLv2.1 GPLv2" has an invalid format - license
>     names must
>     be separated by the following characters to indicate the license
>     selection: &|()
>
>     Fix it by using '&' to join multiple licenses.
>
>
> This behaviour is intentional, as recipetool isn't smart enough to 
> read the licensing terms and decide if there are multiple licenses in 
> aggregate (&) or a choice of licenses (|).  The solution is to list 
> all the licenses that have been found, let bitbake throw a warning, 
> and the person creating a recipe comprehend the licensing situation 
> and add the relevant operations.
>
> Ross

Thanks for your detailed explanation.

Best Regards,
Chen Qi

--------------030909070901030405080407
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 06/22/2016 06:57 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYpa5AMtaiOT_9L851vTyMbcNuPSWjdvmWQJq=EhJYzhA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 16 June 2016 at 10:30, Chen Qi <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":4h0" class="a3s aXjCH m155588cf4b54ba0a">When
                there multiple license in a repo, the LICENSE value be
                created as<br>
                something like "LGPLv2.1 GPLv2", which causes the
                following warning.<br>
                <br>
                LICENSE value "LGPLv2.1 GPLv2" has an invalid format -
                license names must<br>
                be separated by the following characters to indicate the
                license selection: &amp;|()<br>
                <br>
                Fix it by using '&amp;' to join multiple licenses.<br>
              </div>
            </blockquote>
          </div>
          <br>
          This behaviour is intentional, as recipetool isn't smart
          enough to read the licensing terms and decide if there are
          multiple licenses in aggregate (&amp;) or a choice of licenses
          (|).  The solution is to list all the licenses that have been
          found, let bitbake throw a warning, and the person creating a
          recipe comprehend the licensing situation and add the relevant
          operations.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    Thanks for your detailed explanation.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
  </body>
</html>

--------------030909070901030405080407--

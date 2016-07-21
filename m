Return-Path: <Jianchuan.Wang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60C0A6FF0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 09:37:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6L9bGkI024648
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 21 Jul 2016 02:37:20 -0700
Received: from [128.224.162.163] (128.224.162.163) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jul 2016 02:37:16 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1468896078-226867-1-git-send-email-jianchuan.wang@windriver.com>
	<CAJTo0La8K1ujxo9K7pXm1roNarYH77ijc50ps13y_hP9uAgDeQ@mail.gmail.com>
From: Jianchuan Wang <Jianchuan.Wang@windriver.com>
Message-ID: <579097CA.108@windriver.com>
Date: Thu, 21 Jul 2016 17:37:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La8K1ujxo9K7pXm1roNarYH77ijc50ps13y_hP9uAgDeQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] net-tools: lib/inet6.c:INET6_rresolve() - various fixes [ LIN9-1102 ]
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
X-List-Received-Date: Thu, 21 Jul 2016 09:37:22 -0000
Content-Type: multipart/alternative;
	boundary="------------060406060403080101070304"

--------------060406060403080101070304
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/20/2016 08:33 PM, Burton, Ross wrote:
> Please have a more useful short summary.
>
> On 19 July 2016 at 03:41, <jianchuan.wang@windriver.com 
> <mailto:jianchuan.wang@windriver.com>> wrote:
>
>     From: Shan Hai <shan.hai@windriver.com
>     <mailto:shan.hai@windriver.com>>
>
>     Integrate net-tools upstream commit a70c568b907d to fix a bug which
>     causes the 'netstat -a' to print "[UNKNOWN]" in case of DNS problem
>     instead of IPv6 address.
>
The commit a70c568b907d is from 
https://github.com/ecki/net-tools/commit/a70c568b907d23ec2cf7defc81be50c351968f12, 
not from net-tools upstream.

I will correct the description.

Thanks,
Jianchuan

> ...
>
>      +Upstream-Status: Pending
>
>
> Don't you mean Backport?
>
> Ross


--------------060406060403080101070304
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 07/20/2016 08:33 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0La8K1ujxo9K7pXm1roNarYH77ijc50ps13y_hP9uAgDeQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Please have a more useful short summary.<br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 19 July 2016 at 03:41, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:jianchuan.wang@windriver.com"
                target="_blank">jianchuan.wang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
              Shan Hai &lt;<a moz-do-not-send="true"
                href="mailto:shan.hai@windriver.com">shan.hai@windriver.com</a>&gt;<br>
              <br>
              Integrate net-tools upstream commit a70c568b907d to fix a
              bug which<br>
              causes the 'netstat -a' to print "[UNKNOWN]" in case of
              DNS problem<br>
              instead of IPv6 address.</blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    The commit a70c568b907d is from <a title="Follow link"
href="https://github.com/ecki/net-tools/commit/a70c568b907d23ec2cf7defc81be50c351968f12">https://github.com/ecki/net-tools/commit/a70c568b907d23ec2cf7defc81be50c351968f12</a>,
    not from net-tools upstream.<br>
    <br>
    I will correct the description.<br>
    <br>
    Thanks,<br>
    Jianchuan<br>
    <br>
    <blockquote
cite="mid:CAJTo0La8K1ujxo9K7pXm1roNarYH77ijc50ps13y_hP9uAgDeQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>... </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"> +Upstream-Status:
              Pending</blockquote>
            <div><br>
            </div>
            <div>Don't you mean Backport?</div>
            <div><br>
            </div>
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------060406060403080101070304--

Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53B3973012
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 03:15:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1M3FAYQ001335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 21 Feb 2017 19:15:10 -0800
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 21 Feb 2017 19:15:09 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1487329062.git.Qi.Chen@windriver.com>
	<1f3643c5e63b1771dc73c89b8f69e794944bf284.1487329062.git.Qi.Chen@windriver.com>
	<CAJTo0LZp8hqN6huAWAJmjhmBnpvO9FCTAm7_renpBN8OocVO_w@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ad50369e-b300-fe38-0816-7e3bcfc4d1c5@windriver.com>
Date: Wed, 22 Feb 2017 11:15:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZp8hqN6huAWAJmjhmBnpvO9FCTAm7_renpBN8OocVO_w@mail.gmail.com>
X-Originating-IP: [128.224.162.201]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] sudo: upgrade to 1.8.19p2
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
X-List-Received-Date: Wed, 22 Feb 2017 03:15:09 -0000
Content-Type: multipart/alternative;
	boundary="------------84740069E67AD940849B33C8"

--------------84740069E67AD940849B33C8
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/17/2017 11:59 PM, Burton, Ross wrote:
>
> On 17 February 2017 at 10:59, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     -LIC_FILES_CHKSUM =
>     "file://doc/LICENSE;md5=c16e542408abda013d672be8eb88d174 \
>     +LIC_FILES_CHKSUM =
>     "file://doc/LICENSE;md5=f600a47c2a2cdde5899e449607810ed1 \
>
>
> Please remember to explain why this was changed.
>
> Also, this changing on an upgrade kind of makes the point of the 
> .inc/.bb split meaningless, so feel free to merge them.
>
> Ross

I've added the comments and send out V2.

As the change of the contents in doc/LICENSE is a small change, '2015' 
changed to '2017', I think we don't merge the .inc and .bb files.

Best Regards,

Chen Qi


--------------84740069E67AD940849B33C8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 02/17/2017 11:59 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZp8hqN6huAWAJmjhmBnpvO9FCTAm7_renpBN8OocVO_w@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 17 February 2017 at 10:59, Chen Qi
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":4xk" class="a3s aXjCH m15a4bba4f7c12d92">-LIC_FILES_CHKSUM
                = "<a class="moz-txt-link-freetext" href="file://doc/LICENSE;md5=">file://doc/LICENSE;md5=</a><wbr>c16e542408abda013d672be8eb88d1<wbr>74
                \<br>
                +LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://doc/LICENSE;md5=">file://doc/LICENSE;md5=</a><wbr>f600a47c2a2cdde5899e449607810e<wbr>d1
                \<br>
              </div>
            </blockquote>
          </div>
          <br>
          Please remember to explain why this was changed.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Also, this changing on an upgrade kind
          of makes the point of the .inc/.bb split meaningless, so feel
          free to merge them.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p>I've added the comments and send out V2.</p>
    <p>As the change of the contents in doc/LICENSE is a small change,
      '2015' changed to '2017', I think we don't merge the .inc and .bb
      files.</p>
    <p>Best Regards,</p>
    <p>Chen Qi<br>
    </p>
  </body>
</html>

--------------84740069E67AD940849B33C8--

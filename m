Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 765BF75E2D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 08:41:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1M8fF7i027398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Feb 2016 00:41:15 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Feb 2016 00:41:15 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1455606710.git.kai.kang@windriver.com>
	<edb161a868336c0688a6e03343ee7920b34222f5.1455606710.git.kai.kang@windriver.com>
	<CAJTo0LYOpP40zsTFKahoMzU1caXH+=qTUwgAAy1aV--pK_-E_g@mail.gmail.com>
	<56C407CB.4060100@windriver.com>
	<CAJTo0LY2DFyOqFU5AtrmtDFHZroGWgoeCRvychC-c1Ed-qHmnQ@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56CAC9A9.7070906@windriver.com>
Date: Mon, 22 Feb 2016 16:41:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY2DFyOqFU5AtrmtDFHZroGWgoeCRvychC-c1Ed-qHmnQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: fix simultaneous with flock
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
X-List-Received-Date: Mon, 22 Feb 2016 08:41:16 -0000
Content-Type: multipart/alternative;
	boundary="------------050603080901040509080001"

--------------050603080901040509080001
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年02月18日 07:49, Burton, Ross wrote:
>
> On 17 February 2016 at 05:40, Kang Kai <Kai.Kang@windriver.com 
> <mailto:Kai.Kang@windriver.com>> wrote:
>
>     I prefer to keep such check. There is more than one case that
>     causes operation error such as pass wrong parameters. The messages
>     are  helpful for developers.
>
>
> In that case the groupadd will return an error code.  What situations 
> with proper locking will result in groupadd running successfully but 
> the group not being added?

Sorry for late reply.

I think I understand your meanings. V3 will be sent.

--Kai


>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------050603080901040509080001
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2016年02月18日 07:49, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LY2DFyOqFU5AtrmtDFHZroGWgoeCRvychC-c1Ed-qHmnQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 17 February 2016 at 05:40, Kang
            Kai <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Kai.Kang@windriver.com" target="_blank">Kai.Kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF">I prefer to keep
                such check. There is more than one case that causes
                operation error such as pass wrong parameters. The
                messages are  helpful for developers.<br>
              </div>
            </blockquote>
            <div> </div>
          </div>
          <br>
          In that case the groupadd will return an error code.  What
          situations with proper locking will result in groupadd running
          successfully but the group not being added?</div>
      </div>
    </blockquote>
    <br>
    Sorry for late reply.<br>
    <br>
    I think I understand your meanings. V3 will be sent.<br>
    <br>
    --Kai<br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0LY2DFyOqFU5AtrmtDFHZroGWgoeCRvychC-c1Ed-qHmnQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------050603080901040509080001--

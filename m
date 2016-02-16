Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69FAB6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 02:14:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1G2ETul021080
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 15 Feb 2016 18:14:30 -0800
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 15 Feb 2016 18:14:28 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1455501148.git.kai.kang@windriver.com>
	<eea9c9c9b686194c87e06b478b4e3a8e3447d358.1455501148.git.kai.kang@windriver.com>
	<CAJTo0LaQ-viF19UDx0XAVFiEi=7a+rf6maPfjr-6QSLhVwRSSQ@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56C28603.9050200@windriver.com>
Date: Tue, 16 Feb 2016 10:14:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaQ-viF19UDx0XAVFiEi=7a+rf6maPfjr-6QSLhVwRSSQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Feb 2016 02:14:32 -0000
Content-Type: multipart/alternative;
	boundary="------------000309060400080900050703"

--------------000309060400080900050703
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年02月15日 20:31, Burton, Ross wrote:
>
> On 15 February 2016 at 01:59, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     +          eval flock -x -w 100
>     $rootdir/tmp/user-and-group-ops.flock -c  \'$PSEUDO useradd
>     $opts\' || true
>
>
> This is a great patch, but why not just flock $rootdir/etc instead of 
> new file in tmp?    Surely images end up being created with 
> /tmp/user-and-group-ops.flock in them?

I didn't try to think take a directory as a lock and I'll try it. For 
the lock file in $rootdir/tmp/, it is ok that /tmp will be remounted and 
user won't see the lock file.

Thanks,
Kai



>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------000309060400080900050703
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2016年02月15日 20:31, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaQ-viF19UDx0XAVFiEi=7a+rf6maPfjr-6QSLhVwRSSQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 15 February 2016 at 01:59, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2u7" class="a3s" style="overflow:hidden">+     
                         eval flock -x -w 100
                $rootdir/tmp/user-and-group-ops.flock -c  \'$PSEUDO
                useradd $opts\' || true<br>
              </div>
            </blockquote>
          </div>
          <br>
          This is a great patch, but why not just flock $rootdir/etc
          instead of new file in tmp?    Surely images end up being
          created with /tmp/user-and-group-ops.flock in them?</div>
      </div>
    </blockquote>
    <br>
    I didn't try to think take a directory as a lock and I'll try it. 
    For the lock file in $rootdir/tmp/, it is ok that /tmp will be
    remounted and user won't see the lock file.<br>
    <br>
    Thanks,<br>
    Kai<br>
    <br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0LaQ-viF19UDx0XAVFiEi=7a+rf6maPfjr-6QSLhVwRSSQ@mail.gmail.com"
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

--------------000309060400080900050703--

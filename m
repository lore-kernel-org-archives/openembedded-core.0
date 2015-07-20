Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0B76AC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 01:47:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6K1llqh016994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Jul 2015 18:47:47 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 19 Jul 2015 18:47:46 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1436147616.git.kai.kang@windriver.com>
	<420375e6b2530660687099c64dc948dc05c86e0b.1436147616.git.kai.kang@windriver.com>
	<CAJTo0LaW6LJ0SrJ5CkxeqDpjEm3iFpL0niqnDRdQjX0i3MNZtQ@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <55AC5345.9090802@windriver.com>
Date: Mon, 20 Jul 2015 09:47:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaW6LJ0SrJ5CkxeqDpjEm3iFpL0niqnDRdQjX0i3MNZtQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] volatile-binds: correct path of command umount
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
X-List-Received-Date: Mon, 20 Jul 2015 01:47:51 -0000
Content-Type: multipart/alternative;
	boundary="------------080100070107030606040601"

--------------080100070107030606040601
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年07月17日 19:47, Burton, Ross wrote:
>
> On 6 July 2015 at 02:59, Kai Kang <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     +          -e "/^ExecStop=/s/sbin/bin/" \
>
>
> Should't that be something like ${bindir}?

Thanks. I'll update it.

--Kai

>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------080100070107030606040601
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2015年07月17日 19:47, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaW6LJ0SrJ5CkxeqDpjEm3iFpL0niqnDRdQjX0i3MNZtQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 6 July 2015 at 02:59, Kai Kang <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":4i3" class="a3s" style="overflow:hidden">+     
                         -e "/^ExecStop=/s/sbin/bin/" \<br>
              </div>
            </blockquote>
          </div>
          <br>
          Should't that be something like ${bindir}?</div>
      </div>
    </blockquote>
    <br>
    Thanks. I'll update it.<br>
    <br>
    --Kai<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaW6LJ0SrJ5CkxeqDpjEm3iFpL0niqnDRdQjX0i3MNZtQ@mail.gmail.com"
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

--------------080100070107030606040601--

Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD26377805
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 02:21:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9B2LUAF025997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 10 Oct 2017 19:21:30 -0700
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 10 Oct 2017 19:21:28 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1506644875-30179-1-git-send-email-yi.zhao@windriver.com>
	<CAJTo0LaM_D3862Yuq3Y6vQkMa3bwBjgozYZd93r1nv=dV=F2wQ@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <befa3c4e-b7eb-f722-8a4c-54885a262b14@windriver.com>
Date: Wed, 11 Oct 2017 10:20:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaM_D3862Yuq3Y6vQkMa3bwBjgozYZd93r1nv=dV=F2wQ@mail.gmail.com>
X-Originating-IP: [128.224.162.198]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: install wd_keepalive service file to its own package
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
X-List-Received-Date: Wed, 11 Oct 2017 02:21:29 -0000
Content-Type: multipart/alternative;
	boundary="------------96EB93F6712856822DDEF15D"
Content-Language: en-US

--------------96EB93F6712856822DDEF15D
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2017年10月02日 20:19, Burton, Ross 写道:
> On 29 September 2017 at 01:27, Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>> wrote:
>
>     Move wd_keepalive.service from watchdog package to watchdog-keepalive
>     package. Also remove debian specific code from the service file.
>
>
> Remember to say *why*.  Reading the diff tells us that you are putting 
> wd-keepalive into a separate package, but doesn't explain *why*.

My patch just move wd_keepalive.service  file from wathdog package to 
watchdog-keepalive package to fix commit 
c14550deb824b3ef8087dede22d664879e85006d .  The package splitting was 
introduced by commit 7a79aba22be0ca0bc3535dea64a79b697013337d by Fabio 
Berton and reason is in the log message.

Yi


>
> I suspect its because you should only be running one of them and if 
> they both start then they'll race.  I also suspect the real solution 
> is to have them either one or both disabled by default instead, as it 
> appears to be perfectly reasonable to start with one and then swap to 
> the other.
>
> Ross


--------------96EB93F6712856822DDEF15D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">在 2017年10月02日 20:19, Burton, Ross 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LaM_D3862Yuq3Y6vQkMa3bwBjgozYZd93r1nv=dV=F2wQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 29 September 2017 at 01:27, Yi Zhao <span
          dir="ltr">&lt;<a href="mailto:yi.zhao@windriver.com"
            target="_blank" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Move
              wd_keepalive.service from watchdog package to
              watchdog-keepalive<br>
              package. Also remove debian specific code from the service
              file.<br>
            </blockquote>
            <div><br>
            </div>
            <div>Remember to say *why*.  Reading the diff tells us that
              you are putting wd-keepalive into a separate package, but
              doesn't explain *why*.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    My patch just move wd_keepalive.service  file from wathdog package
    to watchdog-keepalive package to fix commit
    c14550deb824b3ef8087dede22d664879e85006d .  The package splitting 
    was introduced by commit 7a79aba22be0ca0bc3535dea64a79b697013337d 
    by Fabio Berton and reason is in the log message.<br>
    <br>
    Yi<br>
    <br>
     <br>
    <blockquote type="cite"
cite="mid:CAJTo0LaM_D3862Yuq3Y6vQkMa3bwBjgozYZd93r1nv=dV=F2wQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>I suspect its because you should only be running one of
              them and if they both start then they'll race.  I also
              suspect the real solution is to have them either one or
              both disabled by default instead, as it appears to be
              perfectly reasonable to start with one and then swap to
              the other.</div>
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

--------------96EB93F6712856822DDEF15D--

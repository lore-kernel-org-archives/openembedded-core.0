Return-Path: <Rob.Woolley@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23BBD73A53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 15:37:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2AFbXO1013012
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Mar 2015 08:37:34 -0700 (PDT)
Received: from yow-rwoolley-lx.wrs.com (128.224.20.147) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 10 Mar 2015 08:37:33 -0700
Message-ID: <54FF0FBC.3050806@windriver.com>
Date: Tue, 10 Mar 2015 11:37:32 -0400
From: Rob Woolley <rob.woolley@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1425945178-14806-1-git-send-email-rob.woolley@windriver.com>
	<CAJTo0LY-DwnvrtA0mfDTKnggkBZ491POJJVMTTap87koO+c4Fw@mail.gmail.com>
In-Reply-To: <CAJTo0LY-DwnvrtA0mfDTKnggkBZ491POJJVMTTap87koO+c4Fw@mail.gmail.com>
X-Originating-IP: [128.224.20.147]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] Identify existing configuration files
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
X-List-Received-Date: Tue, 10 Mar 2015 15:37:37 -0000
Content-Type: multipart/alternative;
	boundary="------------060208060901090303000309"

--------------060208060901090303000309
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

Sure thing.

I applied them to a fresh clone of openembedded-core.git and pushed it 
to the conffiles branch on github:
https://github.com/rcwoolley/openembedded-core/tree/conffiles

Regards,
Rob

On 03/10/2015 09:51 AM, Burton, Ross wrote:
> Hi Rob,
>
> On 9 March 2015 at 23:52, Rob Woolley <rob.woolley@windriver.com 
> <mailto:rob.woolley@windriver.com>> wrote:
>
>     Some package formats explicitly track which files are
>     configuration files
>     so that they are not overwritten on updates.
>
>     This series explicitly identifies files that were already being
>     packaged,
>     but not known as configuration files.
>
>
> Do you have these patches in a branch?  git am is claiming they're 
> corrupted, so something must have happened to them in transit.
>
> Cheers,
> Ross


--------------060208060901090303000309
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Ross,<br>
    <br>
    Sure thing.<br>
    <br>
    I applied them to a fresh clone of openembedded-core.git and pushed
    it to the conffiles branch on github:<br>
    <a
      href="https://github.com/rcwoolley/openembedded-core/tree/conffiles">https://github.com/rcwoolley/openembedded-core/tree/conffiles<br>
    </a><br>
    Regards,<br>
    Rob<br>
    <br>
    <div class="moz-cite-prefix">On 03/10/2015 09:51 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LY-DwnvrtA0mfDTKnggkBZ491POJJVMTTap87koO+c4Fw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra">Hi Rob,</div>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 9 March 2015 at 23:52, Rob Woolley
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:rob.woolley@windriver.com" target="_blank">rob.woolley@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":232" class="a3s" style="overflow:hidden">Some
                package formats explicitly track which files are
                configuration files<br>
                so that they are not overwritten on updates.<br>
                <br>
                This series explicitly identifies files that were
                already being packaged,<br>
                but not known as configuration files.</div>
            </blockquote>
          </div>
          <br>
          Do you have these patches in a branch?  git am is claiming
          they're corrupted, so something must have happened to them in
          transit.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Cheers,</div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------060208060901090303000309--

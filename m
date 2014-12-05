Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1D987232E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 08:13:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB58DJAA009487
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 5 Dec 2014 00:13:19 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 5 Dec 2014 00:13:19 -0800
Message-ID: <54816939.4060707@windriver.com>
Date: Fri, 5 Dec 2014 16:13:45 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1417499998.git.Qi.Chen@windriver.com>
	<2d5ed9ff99319e5eb332b5008b39ee8d6e381dd1.1417499998.git.Qi.Chen@windriver.com>
	<CAJTo0LbG0hoAN5HnWMjU8n+7AWEoHN3j6fATHsMaXMwBaGNOTg@mail.gmail.com>
In-Reply-To: <CAJTo0LbG0hoAN5HnWMjU8n+7AWEoHN3j6fATHsMaXMwBaGNOTg@mail.gmail.com>
X-Originating-IP: [128.224.162.226]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bind: fix conf.patch to remove configuration that causes failure
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
X-List-Received-Date: Fri, 05 Dec 2014 08:13:25 -0000
Content-Type: multipart/alternative;
	boundary="------------060401010105080501040705"

--------------060401010105080501040705
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2014 08:23 PM, Burton, Ross wrote:
>
> On 2 December 2014 at 06:00, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     conf.patch added db.255 confgiuration entry to named.conf. However,
>     We don't have db.255 configuration file, so remove this entry to avoid
>     the following failure.
>
>
> Can you explain why the correct fix is to remove the reference to 
> db.255, and not add a db.255 configuration file?
>
> Ross

Hi Ross,

Sorry for the late reply. I just noticed this email.

I chose to remove reference to db.255 because I saw there was no db.255.
I didn't take a second thinking about this problem.

I will send out V2 by adding db.255 configuration file.

Best Regards,
Chen Qi


--------------060401010105080501040705
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/03/2014 08:23 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbG0hoAN5HnWMjU8n+7AWEoHN3j6fATHsMaXMwBaGNOTg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 2 December 2014 at 06:00, Chen Qi
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":6nu" class="a3s" style="overflow:hidden">conf.patch
                added db.255 confgiuration entry to named.conf. However,<br>
                We don't have db.255 configuration file, so remove this
                entry to avoid<br>
                the following failure.<br>
              </div>
            </blockquote>
          </div>
          <br>
          Can you explain why the correct fix is to remove the reference
          to db.255, and not add a db.255 configuration file?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    Hi Ross,<br>
    <br>
    Sorry for the late reply. I just noticed this email.<br>
    <br>
    I chose to remove reference to db.255 because I saw there was no
    db.255.<br>
    I didn't take a second thinking about this problem.<br>
    <br>
    I will send out V2 by adding db.255 configuration file.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
  </body>
</html>

--------------060401010105080501040705--

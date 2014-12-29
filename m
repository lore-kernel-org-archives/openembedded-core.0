Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF846017E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 11:48:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBTBm1KB012745
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 29 Dec 2014 03:48:01 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 29 Dec 2014 03:48:00 -0800
Message-ID: <54A13F75.6080908@windriver.com>
Date: Mon, 29 Dec 2014 19:48:05 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1419586441.git.Qi.Chen@windriver.com>
	<4b642d59f869280dcd66c38d7744a4a822bfa1a7.1419586441.git.Qi.Chen@windriver.com>
	<CAJTo0Lay14Pytm5sHVBxqFmC5==abKa3M4o6Oc2Jef5L2FtYvQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lay14Pytm5sHVBxqFmC5==abKa3M4o6Oc2Jef5L2FtYvQ@mail.gmail.com>
X-Originating-IP: [128.224.162.226]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] pciutils: add PACKAGECONFIG for 'hwdb'
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
X-List-Received-Date: Mon, 29 Dec 2014 11:48:04 -0000
Content-Type: multipart/alternative;
	boundary="------------060801090708090107010909"

--------------060801090708090107010909
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/2014 07:45 PM, Burton, Ross wrote:
> Hi Chen,
>
> On 26 December 2014 at 09:35, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Add PACKAGECONFIG for 'hwdb' to fix the following QA warning.
>     WARNING: QA Issue: libpci rdepends on libudev, but it isn't a
>     build dependency? [build-deps]
>     WARNING: QA Issue: pciutils rdepends on libudev, but it isn't a
>     build dependency? [build-deps]
>
>
> Respecting the systemd DISTRO_FEATURE to enable/disable the hwdb 
> PACKAGECONFIG would make a lot of sense, can you send a patch?
>
> Ross

Yes.
The default value will be "hwdb" if 'systemd' is in distro features.

Regards,
Chen Qi


--------------060801090708090107010909
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/29/2014 07:45 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lay14Pytm5sHVBxqFmC5==abKa3M4o6Oc2Jef5L2FtYvQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra">Hi Chen,</div>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 26 December 2014 at 09:35, Chen Qi
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2kk" class="a3s" style="overflow:hidden">Add
                PACKAGECONFIG for 'hwdb' to fix the following QA
                warning.<br>
                WARNING: QA Issue: libpci rdepends on libudev, but it
                isn't a build dependency? [build-deps]<br>
                WARNING: QA Issue: <span class="il">pciutils</span>
                rdepends on libudev, but it isn't a build dependency?
                [build-deps]<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Respecting the systemd DISTRO_FEATURE to enable/disable
              the hwdb PACKAGECONFIG would make a lot of sense, can you
              send a patch?</div>
            <div><br>
            </div>
            <div>Ross </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Yes.<br>
    The default value will be "hwdb" if 'systemd' is in distro features.<br>
    <br>
    Regards,<br>
    Chen Qi<br>
    <br>
  </body>
</html>

--------------060801090708090107010909--

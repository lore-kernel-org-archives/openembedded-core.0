Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5300A6E687
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 01:38:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0M1cQeB013215
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 21 Jan 2016 17:38:26 -0800
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 21 Jan 2016 17:38:25 -0800
Message-ID: <56A1882A.50802@windriver.com>
Date: Fri, 22 Jan 2016 09:38:50 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1452655299.git.Qi.Chen@windriver.com>
	<35fd9829f35bd0486288037c7f0a3cf5ada85948.1452655299.git.Qi.Chen@windriver.com>
	<CAJTo0LbRy5fd8Wcz5ZqQ0cTjW1o+wJ-m-srL-H0cRknQua9upw@mail.gmail.com>
In-Reply-To: <CAJTo0LbRy5fd8Wcz5ZqQ0cTjW1o+wJ-m-srL-H0cRknQua9upw@mail.gmail.com>
X-Originating-IP: [128.224.162.246]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cups: upgrade to 2.1.2
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
X-List-Received-Date: Fri, 22 Jan 2016 01:38:29 -0000
Content-Type: multipart/alternative;
	boundary="------------040401020101020801000608"

--------------040401020101020801000608
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2016 10:44 PM, Burton, Ross wrote:
>
> On 13 January 2016 at 03:23, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Add PACKAGECONFIG for systemd. And install our own systemd unit files.
>
>
> Why would we want to use our own units over the upstream units?
>
> Ross

Hi Ross,

Sorry for the late reply.

Our unit files are the same with the Fedora's.
And the unit files that cups it self provides have strange names like 
org.cups.cupsd.socket and org.cups.cupsd.service.
And contents are something like below.

chenqi@pek-hostel-deb01:~/poky/build-systemd/tmp/work/core2-64-poky-linux/cups/2.1.2-r0/cups-2.1.2/scheduler 
[1] $ cat org.cups.cupsd.service
[Unit]
Description=CUPS Scheduler
Documentation=man:cupsd(8)

[Service]
ExecStart=/usr/sbin/cupsd -l
Type=simple

[Install]
Also=org.cups.cupsd.socket org.cups.cupsd.path
WantedBy=printer.target

So if we use unit files that cups provides, we either change both the 
file names and the contents, or we use these strange names.

Best Regards,
Chen Qi

--------------040401020101020801000608
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/18/2016 10:44 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbRy5fd8Wcz5ZqQ0cTjW1o+wJ-m-srL-H0cRknQua9upw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 13 January 2016 at 03:23, Chen Qi
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":5qy" class="a3s" style="overflow:hidden">Add
                PACKAGECONFIG for systemd. And install our own systemd
                unit files.<br>
              </div>
            </blockquote>
          </div>
          <br>
          Why would we want to use our own units over the upstream
          units?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    Hi Ross, <br>
    <br>
    Sorry for the late reply.<br>
    <br>
    Our unit files are the same with the Fedora's.<br>
    And the unit files that cups it self provides have strange names
    like org.cups.cupsd.socket and org.cups.cupsd.service.<br>
    And contents are something like below.<br>
    <br>
    <a class="moz-txt-link-abbreviated" href="mailto:chenqi@pek-hostel-deb01:~/poky/build-systemd/tmp/work/core2-64-poky-linux/cups/2.1.2-r0/cups-2.1.2/scheduler">chenqi@pek-hostel-deb01:~/poky/build-systemd/tmp/work/core2-64-poky-linux/cups/2.1.2-r0/cups-2.1.2/scheduler</a>
    [1] $ cat org.cups.cupsd.service<br>
    [Unit]<br>
    Description=CUPS Scheduler<br>
    Documentation=<a class="moz-txt-link-freetext" href="man:cupsd(8)">man:cupsd(8)</a><br>
    <br>
    [Service]<br>
    ExecStart=/usr/sbin/cupsd -l<br>
    Type=simple<br>
    <br>
    [Install]<br>
    Also=org.cups.cupsd.socket org.cups.cupsd.path<br>
    WantedBy=printer.target<br>
    <br>
    So if we use unit files that cups provides, we either change both
    the file names and the contents, or we use these strange names.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
  </body>
</html>

--------------040401020101020801000608--

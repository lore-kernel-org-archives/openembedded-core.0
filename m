Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12BD760777
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 01:49:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v061nxNj012746
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jan 2017 17:49:59 -0800 (PST)
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 5 Jan 2017 17:49:58 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1483500113.git.Qi.Chen@windriver.com>
	<898ed8805458cc57a90ec929c7405ac1fbc06080.1483500113.git.Qi.Chen@windriver.com>
	<CAJTo0LZtLv5YeANvJYGV1ut4a9q-n5ZWtbGb3znYzvjtVGxwvQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <71cebdd1-b564-34f2-5e4a-da2e8fdfa316@windriver.com>
Date: Fri, 6 Jan 2017 09:49:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZtLv5YeANvJYGV1ut4a9q-n5ZWtbGb3znYzvjtVGxwvQ@mail.gmail.com>
X-Originating-IP: [128.224.162.184]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: upgrade to 1.26.1
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
X-List-Received-Date: Fri, 06 Jan 2017 01:50:00 -0000
Content-Type: multipart/alternative;
	boundary="------------482644EE9F66924ED115E448"

--------------482644EE9F66924ED115E448
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2017 06:21 PM, Burton, Ross wrote:
>
> On 4 January 2017 at 03:22, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Upgrade busybox to 1.26.1. Also upgrade the git version to the
>     corresponding
>     commit.
>
>
> Did you examine the changes that this introduces?
>
> The packages grow a fairly large amount, and a number of new symlinks 
> are introduced. Interestingly /bin/sh is now provided by both 
> busybox.nosuid and busybox.suid.
>
> Ross


Hi Ross,

When I made this patch, my criteria are:

1) image with systemd as init manager and busybox installed works well

2) image with sysvinit as init manager and busybox installed works well

3) image with busybox as init manager works well

I didn't check the package size of busybox, nor did I check the symlinks.

I'll compare the old version of busybox and the new version ASAP to find 
out whether there would be potential problems in our system.

Best Regards,

Chen Qi


--------------482644EE9F66924ED115E448
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/05/2017 06:21 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZtLv5YeANvJYGV1ut4a9q-n5ZWtbGb3znYzvjtVGxwvQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 4 January 2017 at 03:22, Chen Qi <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id="m_-5806657399527285488:38m"
                class="m_-5806657399527285488a3s
                m_-5806657399527285488aXjCH
                m_-5806657399527285488m1596780f2e5e8286">Upgrade <span
                  class="m_-5806657399527285488il">busybox</span> to
                1.26.1. Also upgrade the git version to the
                corresponding<br>
                commit.<br>
              </div>
            </blockquote>
          </div>
          <br>
          Did you examine the changes that this introduces?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">The packages grow a fairly large
          amount, and a number of new symlinks are introduced. 
          Interestingly /bin/sh is now provided by both busybox.nosuid
          and busybox.suid.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Hi Ross,<br>
    </p>
    <p>When I made this patch, my criteria are:</p>
    <p>1) image with systemd as init manager and busybox installed works
      well</p>
    <p>2) image with sysvinit as init manager and busybox installed
      works well</p>
    <p>3) image with busybox as init manager works well</p>
    <p>I didn't check the package size of busybox, nor did I check the
      symlinks.</p>
    <p>I'll compare the old version of busybox and the new version ASAP
      to find out whether there would be potential problems in our
      system.</p>
    <p>Best Regards,</p>
    <p>Chen Qi<br>
    </p>
  </body>
</html>

--------------482644EE9F66924ED115E448--

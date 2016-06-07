Return-Path: <contact@jgueytat.fr>
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
	[217.70.183.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7A734731C9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 14:42:39 +0000 (UTC)
Received: from mfilter14-d.gandi.net (mfilter14-d.gandi.net [217.70.178.142])
	by relay2-d.mail.gandi.net (Postfix) with ESMTP id DEF7EC5A81;
	Tue,  7 Jun 2016 16:42:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter14-d.gandi.net
Received: from relay2-d.mail.gandi.net ([IPv6:::ffff:217.70.183.194])
	by mfilter14-d.gandi.net (mfilter14-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id T_o5DpIqyECQ; Tue,  7 Jun 2016 16:42:38 +0200 (CEST)
X-Originating-IP: 77.154.202.6
Received: from [192.168.43.244] (6.202.154.77.rev.sfr.net [77.154.202.6])
	(Authenticated sender: contact@jgueytat.fr)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8D12AC5A8F;
	Tue,  7 Jun 2016 16:42:37 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1464732695-28729-1-git-send-email-contact@jgueytat.fr>
	<1464732695-28729-2-git-send-email-contact@jgueytat.fr>
	<CAJTo0LbcSVF9NX2yojP+CgE1=GHwbq1eyRNVyTxN7F19ucb4Rg@mail.gmail.com>
From: Julien Gueytat <contact@jgueytat.fr>
Message-ID: <5756DD5C.3020203@jgueytat.fr>
Date: Tue, 7 Jun 2016 16:42:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbcSVF9NX2yojP+CgE1=GHwbq1eyRNVyTxN7F19ucb4Rg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [yocto] [psplash][PATCH v2 2/2] Add --fbdev option to psplash like --rotation.
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
X-List-Received-Date: Tue, 07 Jun 2016 14:42:41 -0000
Content-Type: multipart/alternative;
	boundary="------------070306090108090003050109"

--------------070306090108090003050109
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

The patch for the application of this has been sent previously on 
openembedded-core@lists.openembedded.org mailing list.

Mail Subject: [OE-core] [psplash][PATCH] Add --fbdev option to psplash 
like --rotation.
Date: 22/05/2016

Best Regards,
and have a great day!


Le 05/06/2016 23:15, Burton, Ross a écrit :
>
> On 31 May 2016 at 23:11, Julien Gueytat <contact@jgueytat.fr 
> <mailto:contact@jgueytat.fr>> wrote:
>
>     A new fbdev file is needed and should be overrided if needed.
>     The number contained in fbdev will be used as X in /dev/fbX.
>
>     By overriding fbdev you can have a splash screen on another
>     framebuffer than /dev/fbO.
>
>     The getenv(FBDEV) line has been replaced by this option since
>     the environment variables are not read yet when psplash starts.
>
>
> These have been pushed to psplash master, thanks Julien.
>
> Ross


--------------070306090108090003050109
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    The patch for the application of this has been sent previously on
    <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> mailing list.<br>
    <br>
    Mail Subject: [OE-core] [psplash][PATCH] Add --fbdev option to
    psplash like --rotation.<br>
    Date: 22/05/2016<br>
    <br>
    Best Regards,<br>
    and have a great day!<br>
    <br>
    <br>
    <div class="moz-cite-prefix">Le 05/06/2016 23:15, Burton, Ross a
      écrit :<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbcSVF9NX2yojP+CgE1=GHwbq1eyRNVyTxN7F19ucb4Rg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 31 May 2016 at 23:11, Julien
            Gueytat <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:contact@jgueytat.fr" target="_blank">contact@jgueytat.fr</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class="">A new fbdev file is needed and should be
                overrided if needed.<br>
                The number contained in fbdev will be used as X in
                /dev/fbX.<br>
                <br>
                By overriding fbdev you can have a splash screen on
                another<br>
                framebuffer than /dev/fbO.<br>
                <br>
              </span>The getenv(FBDEV) line has been replaced by this
              option since<br>
              the environment variables are not read yet when <span
                class="il">psplash</span> starts.</blockquote>
          </div>
          <br>
          These have been pushed to psplash master, thanks Julien.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------070306090108090003050109--

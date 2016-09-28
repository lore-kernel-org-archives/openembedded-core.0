Return-Path: <contact@jgueytat.fr>
X-Greylist: delayed 1726 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Sep 2016 17:07:36 UTC
Received: from slow1-d.mail.gandi.net (slow1-d.mail.gandi.net [217.70.178.86])
	by mail.openembedded.org (Postfix) with ESMTP id 047F860123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 17:07:36 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id D016A49680A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 18:30:37 +0200 (CEST)
Received: from mfilter38-d.gandi.net (mfilter38-d.gandi.net [217.70.178.169])
	by relay6-d.mail.gandi.net (Postfix) with ESMTP id 155F4FB8D1;
	Wed, 28 Sep 2016 18:30:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter38-d.gandi.net
Received: from relay6-d.mail.gandi.net ([IPv6:::ffff:217.70.183.198])
	by mfilter38-d.gandi.net (mfilter38-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id aRASHLKpnHvh; Wed, 28 Sep 2016 18:30:33 +0200 (CEST)
X-Originating-IP: 92.90.16.73
Received: from [192.168.43.244] (73.16.90.92.rev.sfr.net [92.90.16.73])
	(Authenticated sender: contact@jgueytat.fr)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 7340AFB8C2;
	Wed, 28 Sep 2016 18:30:32 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
References: <1475078770-26139-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LbTrb=-boXa+p6oWxvu9RS1V6hMPKrXBFOOHS0yTmv+Og@mail.gmail.com>
From: Julien Gueytat <contact@jgueytat.fr>
Message-ID: <57EBF027.9000300@jgueytat.fr>
Date: Wed, 28 Sep 2016 18:30:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbTrb=-boXa+p6oWxvu9RS1V6hMPKrXBFOOHS0yTmv+Og@mail.gmail.com>
Cc: 00moses.alexander00@gmail.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] db: Upgrade to 6.0.35
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
X-List-Received-Date: Wed, 28 Sep 2016 17:07:40 -0000
Content-Type: multipart/alternative;
	boundary="------------090209020305010605050401"

--------------090209020305010605050401
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Related to the db recipe. There are also the patches that needs to be 
regenerated as the same patches are applied for the two current versions.
At least on Ubuntu 16.06 the same patch can't be applied anymore on the 
two versions as the lines where to apply the patches differs too much.


Le 28/09/2016 18:24, Burton, Ross a écrit :
>
> On 28 September 2016 at 17:06, Aníbal Limón 
> <anibal.limon@linux.intel.com <mailto:anibal.limon@linux.intel.com>> 
> wrote:
>
>     @@ -18,16 +18,15 @@ RCONFLICTS_${PN} = "db3"
>      PR = "r1"
>
>
> Remove this PR please.
>
>      # Note, when upgraded to 6.1.x, a patch in RPM will need to be
>     removed to activate db 6.1 support.
>     -
>     -SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz
>     <http://download.oracle.com/berkeley-db/db-$%7BPV%7D.tar.gz> \
>     +SRC_URI = "http://distfiles.gentoo.org/distfiles/db-${PV}.tar.gz
>     <http://distfiles.gentoo.org/distfiles/db-$%7BPV%7D.tar.gz> \
>
>
> What is distfiles.gentoo.org <http://distfiles.gentoo.org>'s policy 
> when db-6.0.36 is released?  Could the tarball be deleted the day 
> after we release?  In general we've been either using 
> snapshot.debian.org <http://snapshot.debian.org> or pointing directly 
> at the yoctoproject.org <http://yoctoproject.org> source mirror for 
> tarballs we can't rely upon over time.
>
> Ross
>
>


--------------090209020305010605050401
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Related to the db recipe. There are also the patches that needs to
    be regenerated as the same patches are applied for the two current
    versions.<br>
    At least on Ubuntu 16.06 the same patch can't be applied anymore on
    the two versions as the lines where to apply the patches differs too
    much.<br>
    <br>
    <br>
    <div class="moz-cite-prefix">Le 28/09/2016 18:24, Burton, Ross a
      écrit :<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbTrb=-boXa+p6oWxvu9RS1V6hMPKrXBFOOHS0yTmv+Og@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 28 September 2016 at 17:06, Aníbal
            Limón <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:anibal.limon@linux.intel.com"
                target="_blank">anibal.limon@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2md" class="a3s aXjCH m157718b82bf8531b">@@
                -18,16 +18,15 @@ RCONFLICTS_${PN} = "db3"<br>
                 PR = "r1"<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Remove this PR please.</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2md" class="a3s aXjCH m157718b82bf8531b">
                 # Note, when upgraded to 6.1.x, a patch in RPM will
                need to be removed to activate db 6.1 support.<br>
                -<br>
                -SRC_URI = "<a moz-do-not-send="true"
                  href="http://download.oracle.com/berkeley-db/db-$%7BPV%7D.tar.gz"
                  rel="noreferrer" target="_blank">http://download.oracle.com/<wbr>berkeley-db/db-${PV}.tar.gz</a>
                \<br>
                +SRC_URI = "<a moz-do-not-send="true"
                  href="http://distfiles.gentoo.org/distfiles/db-$%7BPV%7D.tar.gz"
                  rel="noreferrer" target="_blank">http://distfiles.gentoo.org/<wbr>distfiles/db-${PV}.tar.gz</a>
                \<br>
              </div>
            </blockquote>
          </div>
          <br>
          What is <a moz-do-not-send="true"
            href="http://distfiles.gentoo.org">distfiles.gentoo.org</a>'s
          policy when db-6.0.36 is released?  Could the tarball be
          deleted the day after we release?  In general we've been
          either using <a moz-do-not-send="true"
            href="http://snapshot.debian.org">snapshot.debian.org</a> or
          pointing directly at the <a moz-do-not-send="true"
            href="http://yoctoproject.org">yoctoproject.org</a> source
          mirror for tarballs we can't rely upon over time.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------090209020305010605050401--

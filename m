Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0845F6010E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 06:17:40 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VBImY-0000nE-SZ from Muhammad_Shakeel@mentor.com ;
	Sun, 18 Aug 2013 23:17:38 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 18 Aug 2013 23:17:39 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Mon, 19 Aug 2013 07:17:37 +0100
Message-ID: <5211B8C4.7070601@mentor.com>
Date: Mon, 19 Aug 2013 11:18:44 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1376674064-14468-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAMKF1srCL2f+Cxb+2xvLY4_+oikJgXtj0vcR3=9h0tbDf1jGSg@mail.gmail.com>
In-Reply-To: <CAMKF1srCL2f+Cxb+2xvLY4_+oikJgXtj0vcR3=9h0tbDf1jGSg@mail.gmail.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 19 Aug 2013 06:17:39.0078 (UTC)
	FILETIME=[CE0B6A60:01CE9CA3]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] [v3] openssh: Add systemd support
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
X-List-Received-Date: Mon, 19 Aug 2013 06:17:42 -0000
Content-Type: multipart/alternative;
	boundary="------------070908010406090705090301"

--------------070908010406090705090301
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 08/16/2013 10:47 PM, Khem Raj wrote:
>
>
>
> On Fri, Aug 16, 2013 at 10:27 AM, Shakeel, Muhammad 
> <muhammad_shakeel@mentor.com <mailto:muhammad_shakeel@mentor.com>> wrote:
>
>     From: Muhammad Shakeel <muhammad_shakeel@mentor.com
>     <mailto:muhammad_shakeel@mentor.com>>
>
>     -Remove dependency on meta-systemd
>
>     +[Service]
>     +ExecStart=-/usr/sbin/sshd -i
>
>
>
> it would be nice if it was using libdir/bindir instead of hardcoded paths
> coudld be achieved by generating the unit files from some sort of .in 
> files at build time so it could benefit
> the distros which dont use /usr e.g.
> ​​
>
>     +       sed -i 's,/bin/,${base_bindir}/,g'
>     ${D}${systemd_unitdir}/system/sshd.socket
>     ${D}${systemd_unitdir}/system/sshd@.service
>     +       sed -i 's,/usr/sbin/,${sbindir}/,g'
>     ${D}${systemd_unitdir}/system/sshd@.service
>     +       sed -i 's,/usr/bin/,${bindir}/,g'
>     ${D}${systemd_unitdir}/system/sshdgenkeys.service
>
>
/usr/sbin/ is being sed'ed with ${sbindir} in do_install_append of the 
respective recipe file. /usr/bin/ and /bin/ is also taken care of.

Regards

--------------070908010406090705090301
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/16/2013 10:47 PM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1srCL2f+Cxb+2xvLY4_+oikJgXtj0vcR3=9h0tbDf1jGSg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_default" style="font-family:courier
          new,monospace;font-size:small"><br>
        </div>
        <div class="gmail_extra"><br>
          <br>
          <div class="gmail_quote">On Fri, Aug 16, 2013 at 10:27 AM,
            Shakeel, Muhammad <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:muhammad_shakeel@mentor.com"
                target="_blank">muhammad_shakeel@mentor.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
              Muhammad Shakeel &lt;<a moz-do-not-send="true"
                href="mailto:muhammad_shakeel@mentor.com">muhammad_shakeel@mentor.com</a>&gt;<br>
              <br>
              -Remove dependency on meta-systemd<br>
              <br>
              +[Service]<br>
              +ExecStart=-/usr/sbin/sshd -i</blockquote>
            <br>
            <div><br>
            </div>
            <div style="font-family:'courier
              new',monospace;font-size:small" class="gmail_default">it
              would be nice if it was using libdir/bindir instead of
              hardcoded paths</div>
            <div style="font-family:'courier
              new',monospace;font-size:small" class="gmail_default">coudld
              be achieved by generating the unit files from some sort of
              .in files at build time so it could benefit</div>
            <div style="font-family:'courier
              new',monospace;font-size:small" class="gmail_default">
              the distros which dont use /usr e.g.</div>
            <div style="font-family:'courier
              new',monospace;font-size:small" class="gmail_default">
              ​​</div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              +       sed -i 's,/bin/,${base_bindir}/,g'
              ${D}${systemd_unitdir}/system/sshd.socket
              ${D}${<a class="moz-txt-link-abbreviated" href="mailto:systemd_unitdir}/system/sshd@.service">systemd_unitdir}/system/sshd@.service</a><br>
              +       sed -i 's,/usr/sbin/,${sbindir}/,g'
              ${D}${<a class="moz-txt-link-abbreviated" href="mailto:systemd_unitdir}/system/sshd@.service">systemd_unitdir}/system/sshd@.service</a><br>
              +       sed -i 's,/usr/bin/,${bindir}/,g'
              ${D}${systemd_unitdir}/system/sshdgenkeys.service<br>
            </blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    /usr/sbin/ is being sed'ed with ${sbindir} in do_install_append of
    the respective recipe file. /usr/bin/ and /bin/ is also taken care
    of.<br>
    <br>
    Regards<br>
  </body>
</html>

--------------070908010406090705090301--

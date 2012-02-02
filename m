Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rt3Kw-0005NA-8B
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 21:32:54 +0100
Received: by eekd41 with SMTP id d41so768020eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 12:24:58 -0800 (PST)
Received: by 10.14.35.73 with SMTP id t49mr1340630eea.84.1328214285599;
	Thu, 02 Feb 2012 12:24:45 -0800 (PST)
Received: from [192.168.1.2] ([79.117.107.69])
	by mx.google.com with ESMTPS id b3sm13098424een.2.2012.02.02.12.24.44
	(version=SSLv3 cipher=OTHER); Thu, 02 Feb 2012 12:24:45 -0800 (PST)
Message-ID: <4F2AF10C.1000002@gherzan.ro>
Date: Thu, 02 Feb 2012 22:24:44 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1328199617-1195-1-git-send-email-andrei@gherzan.ro>
	<CAP9ODKoNUJz4ZJc=uCz35Cynua-XhkwVmGvSNnjkX5hu_VhQGg@mail.gmail.com>
In-Reply-To: <CAP9ODKoNUJz4ZJc=uCz35Cynua-XhkwVmGvSNnjkX5hu_VhQGg@mail.gmail.com>
Subject: Re: [PATCH] dhcp: Update to 4.2.3-P2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Feb 2012 20:32:54 -0000
Content-Type: multipart/alternative;
	boundary="------------070103020502000209010407"

--------------070103020502000209010407
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/2012 08:32 PM, Otavio Salvador wrote:
> On Thu, Feb 2, 2012 at 14:20, Andrei Gherzan <andrei@gherzan.ro 
> <mailto:andrei@gherzan.ro>> wrote:
>
>     From: Andrei Gherzan <andrei.gherzan@windriver.com
>     <mailto:andrei.gherzan@windriver.com>>
>
>     1. Update to 4.2.3-P2
>     2. From 4.2.0 final release, -lcrypto check was removed and we
>     compile static libraries
>     from bind that are linked to libcrypto. This is why i added a
>     patch in order to add
>     -lcrypto to LIBS.
>
>
> The patch I sent yestarday will cause a conflict in this one. You 
> might want to rebase it against my tree at: 
> https://github.com/OSSystems/oe-core
>
> If you want, you can cherry-pick mine and send it together with your 
> one so we avoid a conflict for Richard or Saul to deal with.

I will cherry pick your commit and send my commit again as i forgot to 
"Signed-off".
@g


--------------070103020502000209010407
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 02/02/2012 08:32 PM, Otavio Salvador wrote:
    <blockquote
cite="mid:CAP9ODKoNUJz4ZJc=uCz35Cynua-XhkwVmGvSNnjkX5hu_VhQGg@mail.gmail.com"
      type="cite">
      <div class="gmail_quote">On Thu, Feb 2, 2012 at 14:20, Andrei
        Gherzan <span dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:andrei@gherzan.ro">andrei@gherzan.ro</a>&gt;</span>
        wrote:<br>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          From: Andrei Gherzan &lt;<a moz-do-not-send="true"
            href="mailto:andrei.gherzan@windriver.com">andrei.gherzan@windriver.com</a>&gt;<br>
          <br>
          1. Update to 4.2.3-P2<br>
          2. From 4.2.0 final release, -lcrypto check was removed and we
          compile static libraries<br>
          from bind that are linked to libcrypto. This is why i added a
          patch in order to add<br>
          -lcrypto to LIBS.<br>
        </blockquote>
        <div><br>
        </div>
        <div>The patch I sent yestarday will cause a conflict in this
          one. You might want to rebase it against my tree at:&nbsp;<a
            moz-do-not-send="true"
            href="https://github.com/OSSystems/oe-core">https://github.com/OSSystems/oe-core</a></div>
        <div><br>
        </div>
        <div>If you want, you can cherry-pick mine and send it together
          with your one so we avoid a conflict for Richard or Saul to
          deal with.</div>
      </div>
    </blockquote>
    <br>
    I will cherry pick your commit and send my commit again as i forgot
    to "Signed-off".
    <blockquote
cite="mid:CAP9ODKoNUJz4ZJc=uCz35Cynua-XhkwVmGvSNnjkX5hu_VhQGg@mail.gmail.com"
      type="cite">
      <div class="gmail_quote">
        <div>&nbsp;</div>
      </div>
    </blockquote>
    @g<br>
    <br>
  </body>
</html>

--------------070103020502000209010407--

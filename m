Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RvG0U-0003fL-QE
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 23:28:54 +0100
Received: by eekd41 with SMTP id d41so292953eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 14:20:51 -0800 (PST)
Received: by 10.14.28.199 with SMTP id g47mr9159360eea.16.1328739650906;
	Wed, 08 Feb 2012 14:20:50 -0800 (PST)
Received: from [192.168.1.2] ([79.117.107.69])
	by mx.google.com with ESMTPS id n56sm2110507eeh.6.2012.02.08.14.20.50
	(version=SSLv3 cipher=OTHER); Wed, 08 Feb 2012 14:20:50 -0800 (PST)
Message-ID: <4F32F541.90005@gherzan.ro>
Date: Thu, 09 Feb 2012 00:20:49 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
	<1328717410.14363.46.camel@phil-desktop>
	<CAP9ODKqUo7qazvdbWxQB_bQh3jpf+Uf=kf1YVp=Y-oB6QQYGGQ@mail.gmail.com>
	<1328720440.14363.56.camel@phil-desktop>
	<4F32C1A6.70402@gherzan.ro>
	<CAP9ODKqaWXbWMx7WRgDEDfqpWM1YPEhbPG_V93mYtd_QVqQJ1g@mail.gmail.com>
In-Reply-To: <CAP9ODKqaWXbWMx7WRgDEDfqpWM1YPEhbPG_V93mYtd_QVqQJ1g@mail.gmail.com>
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
X-List-Received-Date: Wed, 08 Feb 2012 22:28:54 -0000
Content-Type: multipart/alternative;
	boundary="------------080700070003080306020200"

--------------080700070003080306020200
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

  On 02/08/2012 08:46 PM, Otavio Salvador wrote:
> On Wed, Feb 8, 2012 at 16:40, Andrei Gherzan <andrei@gherzan.ro 
> <mailto:andrei@gherzan.ro>> wrote:
>
>     ...
>
>
> In my opinion we ought to merge your patch without handling crypto 
> issue right now while we set in one way of fixing it.
>
> It seems to me that the fix is to move libcrypto to base_libdir and 
> don't touch dhcp for this.
>
Should we move the whole openssl package to prefix=/ ? Or just the 
libcrypto library?

@g

--------------080700070003080306020200
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    &nbsp;On 02/08/2012 08:46 PM, Otavio Salvador wrote:
    <blockquote
cite="mid:CAP9ODKqaWXbWMx7WRgDEDfqpWM1YPEhbPG_V93mYtd_QVqQJ1g@mail.gmail.com"
      type="cite">
      <div class="gmail_quote">On Wed, Feb 8, 2012 at 16:40, Andrei
        Gherzan <span dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:andrei@gherzan.ro">andrei@gherzan.ro</a>&gt;</span>
        wrote:<br>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div bgcolor="#FFFFFF" text="#000000">
            <div>
              <div class="h5">...</div>
            </div>
          </div>
        </blockquote>
        <div><br>
        </div>
        <div>In my opinion we ought to merge your patch without handling
          crypto issue right now while we set in one way of fixing it.</div>
        <div><br>
        </div>
        <div>It seems to me that the fix is to move libcrypto to
          base_libdir and don't touch dhcp for this.&nbsp;</div>
      </div>
      <div><br>
      </div>
    </blockquote>
    Should we move the whole openssl package to prefix=/ ? Or just the
    libcrypto library?<br>
    <br>
    @g<br>
  </body>
</html>

--------------080700070003080306020200--

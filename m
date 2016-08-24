Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id EF9D67318A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 788AA1EE0ACB;
	Wed, 24 Aug 2016 09:45:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id NiwgSb1QJOwF; Wed, 24 Aug 2016 09:45:46 +0200 (CEST)
Received: from [10.9.18.210] (229.29.205.77.rev.sfr.net [77.205.29.229])
	by idris.smile.fr (Postfix) with ESMTPSA id 05DE11EE0AC8;
	Wed, 24 Aug 2016 09:45:45 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<b86b4b20c396d99c96592d5df5439af7bb6ec536.1471936926.git-series.jeremy.rosen@smile.fr>
	<CADkTA4M9zMN7tLeKfZERc3QmirsJLyAnMSVzN2AQJ2gRAkYm7g@mail.gmail.com>
	<B2BB2260-8436-4148-BD30-649D7D4899BC@gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <171aac50-dac3-28d3-7a8e-8cb1ebf03ec8@smile.fr>
Date: Wed, 24 Aug 2016 09:45:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <B2BB2260-8436-4148-BD30-649D7D4899BC@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] [linux-libc-headers] allow overriding compiler name in KConfig
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
X-List-Received-Date: Wed, 24 Aug 2016 07:45:50 -0000
Content-Type: multipart/alternative;
	boundary="------------41E81F1C663B1A2D9F7C5FB1"

--------------41E81F1C663B1A2D9F7C5FB1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

[...]
>>
>> If this is broken, it needs to be fixed upstream.
>
> I agree. now a days we have more than gcc available as system C 
> compiler perhaps your patch might be upstream worthy.
>
As stated elsewhere, I now have a proper way to override the variables 
without patching the build system. V2 of this patch serie will get rid 
of that patch entirely and deal with it purely in the recipe
>> -- 
>> "Thou shalt not follow the NULL pointer, for chaos and madness await 
>> thee at its end"
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org 
>> <mailto:Openembedded-core@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------41E81F1C663B1A2D9F7C5FB1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    [...]<br>
    <blockquote
      cite="mid:B2BB2260-8436-4148-BD30-649D7D4899BC@gmail.com"
      type="cite">
      <div>
        <blockquote type="cite" class="">
          <div class="">
            <div dir="ltr" class="">
              <div class="gmail_extra">
                <div class="gmail_quote">
                  <div class=""><br class="">
                  </div>
                  <div class="">If this is broken, it needs to be fixed
                    upstream.<br class="">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </blockquote>
        <div><br class="">
        </div>
        <div>I agree. now a days we have more than gcc available as
          system C compiler perhaps your patch might be upstream worthy.</div>
        <br class="">
      </div>
    </blockquote>
    As stated elsewhere, I now have a proper way to override the
    variables without patching the build system. V2 of this patch serie
    will get rid of that patch entirely and deal with it purely in the
    recipe<br class="">
    <blockquote
      cite="mid:B2BB2260-8436-4148-BD30-649D7D4899BC@gmail.com"
      type="cite">
      <div>
        <blockquote type="cite" class="">
          <div class="">
            <div dir="ltr" class="">
              <div class="gmail_extra">-- <br class="">
                <div class="gmail_signature"
                  data-smartmail="gmail_signature">"Thou shalt not
                  follow the NULL pointer, for chaos and madness await
                  thee at its end"</div>
              </div>
            </div>
            -- <br class="">
            _______________________________________________<br class="">
            Openembedded-core mailing list<br class="">
            <a moz-do-not-send="true"
              href="mailto:Openembedded-core@lists.openembedded.org"
              class="">Openembedded-core@lists.openembedded.org</a><br
              class="">
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br
              class="">
          </div>
        </blockquote>
      </div>
      <br class="">
    </blockquote>
    <br>
  </body>
</html>

--------------41E81F1C663B1A2D9F7C5FB1--

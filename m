Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0195C65C94
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 02:30:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s642Ur4k007880
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Jul 2014 19:30:53 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 3 Jul 2014 19:30:53 -0700
Message-ID: <53B611D9.2020501@windriver.com>
Date: Fri, 4 Jul 2014 10:30:49 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>
References: <1404286429-13962-1-git-send-email-ming.liu@windriver.com>
	<CABcZANn4B6SzNTT+eCi9bsWQxDcDJ4PCFT5kHwV6c5nxShmyhg@mail.gmail.com>
	<53B45FDC.1050703@linux.intel.com> <53B4BF4B.5090306@windriver.com>
	<CABcZANnpq=UnWN6YNaPtuGrg6Xb3CUh9Pqc0bxL0G2o9cirdRQ@mail.gmail.com>
In-Reply-To: <CABcZANnpq=UnWN6YNaPtuGrg6Xb3CUh9Pqc0bxL0G2o9cirdRQ@mail.gmail.com>
X-Originating-IP: [128.224.163.186]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: add usleep support from RHEL
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
X-List-Received-Date: Fri, 04 Jul 2014 02:31:00 -0000
Content-Type: multipart/alternative;
	boundary="------------060304080702020403040207"

--------------060304080702020403040207
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2014 11:45 AM, Christopher Larson wrote:
>
> On Wed, Jul 2, 2014 at 7:26 PM, Ming Liu <ming.liu@windriver.com 
> <mailto:ming.liu@windriver.com>> wrote:
>
>     On 07/03/2014 03:39 AM, Saul Wold wrote:
>
>         On 07/02/2014 10:37 AM, Christopher Larson wrote:
>
>             On Wed, Jul 2, 2014 at 12:33 AM, Ming Liu
>             <ming.liu@windriver.com <mailto:ming.liu@windriver.com>>
>             wrote:
>
>                 Add usleep in to support sleeping some number of
>                 microseconds.
>
>                 Signed-off-by: Ming Liu <ming.liu@windriver.com
>                 <mailto:ming.liu@windriver.com>>
>
>
>             Maybe it's just me, but initscripts seems like a horrible
>             place to put this.
>
>
>
>         It's not just you!  Not sure why it's being added here and I
>         don't see any usage of it, so more information is required.
>
>     Why I've sent this is because I noticed there was no usleep binary
>     in any of the packages in oe repositories, and I assumed that the
>     end user might like to use it in their rootfs, so I migrated it
>     from initscripts package of RHEL. Anyway, if all you guys think
>     it's not necessary and not appropriate, I will not insist it, we
>     could just ignore my proposal. :)
>
>
> The tool itself sounds like it could be of use, but it should likely 
> get its own recipe in meta-oe until/if something in oe-core actually 
> needs it.
Got it, thanks! I will do that.

the best,
thank you
> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--------------060304080702020403040207
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 07/03/2014 11:45 AM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANnpq=UnWN6YNaPtuGrg6Xb3CUh9Pqc0bxL0G2o9cirdRQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Wed, Jul 2, 2014 at 7:26 PM, Ming
            Liu <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:ming.liu@windriver.com" target="_blank">ming.liu@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote">
              <div class="HOEnZb adM">
                <div class="h5">On 07/03/2014 03:39 AM, Saul Wold wrote:<br>
                  <blockquote class="gmail_quote">
                    On 07/02/2014 10:37 AM, Christopher Larson wrote:<br>
                    <blockquote class="gmail_quote">
                      On Wed, Jul 2, 2014 at 12:33 AM, Ming Liu &lt;<a
                        moz-do-not-send="true"
                        href="mailto:ming.liu@windriver.com"
                        target="_blank">ming.liu@windriver.com</a>&gt;
                      wrote:<br>
                      <br>
                      <blockquote class="gmail_quote">
                        Add usleep in to support sleeping some number of
                        microseconds.<br>
                        <br>
                        Signed-off-by: Ming Liu &lt;<a
                          moz-do-not-send="true"
                          href="mailto:ming.liu@windriver.com"
                          target="_blank">ming.liu@windriver.com</a>&gt;<br>
                        <br>
                      </blockquote>
                      <br>
                      Maybe it's just me, but initscripts seems like a
                      horrible place to put this.<br>
                      <br>
                      <br>
                      <br>
                    </blockquote>
                    It's not just you!  Not sure why it's being added
                    here and I don't see any usage of it, so more
                    information is required.<br>
                  </blockquote>
                </div>
              </div>
              Why I've sent this is because I noticed there was no
              usleep binary in any of the packages in oe repositories,
              and I assumed that the end user might like to use it in
              their rootfs, so I migrated it from initscripts package of
              RHEL. Anyway, if all you guys think it's not necessary and
              not appropriate, I will not insist it, we could just
              ignore my proposal. :)</blockquote>
          </div>
          <br>
        </div>
        <div class="gmail_extra">The tool itself sounds like it could be
          of use, but it should likely get its own recipe in meta-oe
          until/if something in oe-core actually needs it.<br>
        </div>
      </div>
    </blockquote>
    Got it, thanks! I will do that.<br>
    <br>
    the best,<br>
    thank you<br>
    <blockquote
cite="mid:CABcZANnpq=UnWN6YNaPtuGrg6Xb3CUh9Pqc0bxL0G2o9cirdRQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">-- <br>
          Christopher Larson<br>
          clarson at kergoth dot com<br>
          Founder - BitBake, OpenEmbedded, OpenZaurus<br>
          Maintainer - Tslib<br>
          Senior Software Engineer, Mentor Graphics
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------060304080702020403040207--

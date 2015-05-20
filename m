Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8709965D19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 02:17:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4K2Hg8j003939
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 May 2015 19:17:44 -0700 (PDT)
Received: from [128.224.163.153] (128.224.163.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 19 May 2015 19:17:41 -0700
Message-ID: <555BEED0.2010909@windriver.com>
Date: Wed, 20 May 2015 10:17:52 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1432024013.git.Qi.Chen@windriver.com>
	<971f18fc4a97344769e54313a78898f86f520a7e.1432024013.git.Qi.Chen@windriver.com>
	<1432032474.32616.25.camel@linuxfoundation.org>
	<CABcZAN=Ky_TKqC8y3ecYh7Mf_SkQYJ0UUvDXMHnQCKZBpW+1KA@mail.gmail.com>
In-Reply-To: <CABcZAN=Ky_TKqC8y3ecYh7Mf_SkQYJ0UUvDXMHnQCKZBpW+1KA@mail.gmail.com>
X-Originating-IP: [128.224.163.153]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] buildstats-summary: add eventmask
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
X-List-Received-Date: Wed, 20 May 2015 02:17:52 -0000
Content-Type: multipart/alternative;
	boundary="------------020508050903080803000307"

--------------020508050903080803000307
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 05/19/2015 09:40 PM, Christopher Larson wrote:
>
> On Tue, May 19, 2015 at 3:47 AM, Richard Purdie 
> <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     On Tue, 2015-05-19 at 16:29 +0800, Chen Qi wrote:
>     > Add eventmask for buildstats_summary handler.
>
>     Why?
>
>     This says what you've done but not why we need this...
>
>     Cheers,
>
>     Richard
>
>
> Also, this adds the eventmask, but doesn’t remove the then-redundant 
> isinstance() on the event object.

Hi Richard and Christopher,

Thanks for you advice.
I'll send out V2.

Regards,
Chen Qi

> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--------------020508050903080803000307
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 05/19/2015 09:40 PM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZAN=Ky_TKqC8y3ecYh7Mf_SkQYJ0UUvDXMHnQCKZBpW+1KA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Tue, May 19, 2015 at 3:47 AM,
            Richard Purdie <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:richard.purdie@linuxfoundation.org"
                target="_blank">richard.purdie@linuxfoundation.org</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class="">On Tue, 2015-05-19 at 16:29 +0800, Chen Qi
                wrote:<br>
                &gt; Add eventmask for buildstats_summary handler.<br>
                <br>
              </span>Why?<br>
              <br>
              This says what you've done but not why we need this...<br>
              <br>
              Cheers,<br>
              <br>
              Richard</blockquote>
          </div>
          <br>
          Also, this adds the eventmask, but doesn’t remove the
          then-redundant isinstance() on the event object.<br>
        </div>
      </div>
    </blockquote>
    <br>
    Hi Richard and Christopher,<br>
    <br>
    Thanks for you advice.<br>
    I'll send out V2.<br>
    <br>
    Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CABcZAN=Ky_TKqC8y3ecYh7Mf_SkQYJ0UUvDXMHnQCKZBpW+1KA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">-- <br>
          <div class="gmail_signature">Christopher Larson<br>
            clarson at kergoth dot com<br>
            Founder - BitBake, OpenEmbedded, OpenZaurus<br>
            Maintainer - Tslib<br>
            Senior Software Engineer, Mentor Graphics</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------020508050903080803000307--

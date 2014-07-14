Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id AE29770355
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 23:05:54 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id eu11so6142970pac.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 16:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type;
	bh=rPM8h+19ZF+fmhlPpmncueAEiXDpr6aa2gXw0ANVB+g=;
	b=PN7jQG0eOA+dvlNvJHWiyxP8Nx8tBsWiW52Efvj83da04ayDAHXHfUt27H6MdOTCqh
	Iq5rILQjjBcQxU6X5AVycSZlny9TZoJmKZTpHmlEOUUGYiJJAI4q3aUkARnJloK0gqOB
	KawaNCctiZ3WEFI5KDT3WzPYCyPYYhtqTwaqd+8FaOM4IlvvL6pf6oFcUCK+FT0Zbyfn
	iSRBUGpDVpMS8y6lp1XW1abLBt5S8hkHDkHCO2f/KMwUOj8LHmF2DttYdV8/fep3DN+F
	/8VzLyW7S/raguKP3m737W28MmnkeS/jjNvMK+rlct7Iikv3JAz/cLNR5bv5PR4UcpFV
	E6Kw==
X-Gm-Message-State: ALoCoQksZr1CzeVAix9+pGR/oaPsdZa/4vjR7AKvo5WI/V4lg2zdw0ULSP/sdvJa1MAmnoAt74sp
X-Received: by 10.66.65.204 with SMTP id z12mr11271058pas.97.1405379155663;
	Mon, 14 Jul 2014 16:05:55 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	mz8sm15992147pdb.62.2014.07.14.16.05.53 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Jul 2014 16:05:55 -0700 (PDT)
Message-ID: <53C46250.4070905@mvista.com>
Date: Mon, 14 Jul 2014 16:05:52 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>, Saul Wold <sgw@linux.intel.com>
References: <53C45BD7.1020104@mvista.com> <53C45EC0.6070801@linux.intel.com>
	<CABcZANkqBZ3Kw7POOBYQ-1=6rxZSioakS-K7qbS2CcYvp1C_xg@mail.gmail.com>
In-Reply-To: <CABcZANkqBZ3Kw7POOBYQ-1=6rxZSioakS-K7qbS2CcYvp1C_xg@mail.gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: /etc/os-release
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
X-List-Received-Date: Mon, 14 Jul 2014 23:05:57 -0000
Content-Type: multipart/alternative;
	boundary="------------050403030507010100000005"

--------------050403030507010100000005
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Chris,

On 07/14/2014 03:54 PM, Christopher Larson wrote:
> On Mon, Jul 14, 2014 at 3:50 PM, Saul Wold <sgw@linux.intel.com 
> <mailto:sgw@linux.intel.com>> wrote:
>
>     On 07/14/2014 03:38 PM, akuster wrote:
>
>         Hello all,
>
>         I noticed some reference to /etc/os-release in some recipes.
>         Where can I
>         find the initial creation of /etc/os-release? If one is not
>         created,
>         would there desire to have one?
>
>     Really?  We reference it in the meta/lib/oe/lsb.py
>     release_dict_file() function to search for LSB information of the
>     host machine to identify the host distro version information.
>
>     Can you be specific about which recipes are using os-release, I
>     did do a search.
>
>
> I'm pretty sure we don't have an os-release recipe in oe-core at all 
> yet, so the file isn't going to exist on target. Mentor has one in 
> meta-mentor at the moment pending time to submit it again / poke on 
> the existing thread. See the thread with the subject "[RFC PATCH 0/2] 
> Add /etc/os-release". It's definitely something we should have, in my 
> opinion.
Yeah, That is what I was thinking of.
Thanks for the pointer.

- Armin

> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--------------050403030507010100000005
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Chris,<br>
    <br>
    <div class="moz-cite-prefix">On 07/14/2014 03:54 PM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANkqBZ3Kw7POOBYQ-1=6rxZSioakS-K7qbS2CcYvp1C_xg@mail.gmail.com"
      type="cite">
      <div dir="ltr">On Mon, Jul 14, 2014 at 3:50 PM, Saul Wold <span
          dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:sgw@linux.intel.com" target="_blank">sgw@linux.intel.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div>On 07/14/2014 03:38 PM, akuster wrote:<br>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  Hello all,<br>
                  <br>
                  I noticed some reference to /etc/os-release in some
                  recipes. Where can I<br>
                  find the initial creation of /etc/os-release? If one
                  is not created,<br>
                  would there desire to have one?<br>
                  <br>
                </blockquote>
              </div>
              Really?  We reference it in the meta/lib/oe/lsb.py
              release_dict_file() function to search for LSB information
              of the host machine to identify the host distro version
              information.<br>
              <br>
              Can you be specific about which recipes are using
              os-release, I did do a search.</blockquote>
          </div>
          <br>
        </div>
        <div class="gmail_extra">I'm pretty sure we don't have an
          os-release recipe in oe-core at all yet, so the file isn't
          going to exist on target. Mentor has one in meta-mentor at the
          moment pending time to submit it again / poke on the existing
          thread. See the thread with the subject "[RFC PATCH 0/2] Add
          /etc/os-release". It's definitely something we should have, in
          my opinion.<br>
        </div>
      </div>
    </blockquote>
    Yeah, That is what I was thinking of. <br>
    Thanks for the pointer.<br>
    <br>
    - Armin<br>
    <br>
    <blockquote
cite="mid:CABcZANkqBZ3Kw7POOBYQ-1=6rxZSioakS-K7qbS2CcYvp1C_xg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          -- <br>
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

--------------050403030507010100000005--

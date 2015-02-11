Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-03.prod.phx3.secureserver.net
	(p3plsmtpa08-03.prod.phx3.secureserver.net [173.201.193.104])
	by mail.openembedded.org (Postfix) with ESMTP id DE1A7609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 00:41:41 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-03.prod.phx3.secureserver.net with 
	id qohh1p00S0BVjqb01ohipx; Tue, 10 Feb 2015 17:41:42 -0700
Message-ID: <54DAA547.3060909@pabigot.com>
Date: Tue, 10 Feb 2015 18:41:43 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1423420390.git.pab@pabigot.com>
	<CABcZANmkGNPwvdt==h_LAA-Q6e5Umwti2g=qvj3r_vyQrqxjHA@mail.gmail.com>
	<CAJTo0LaNQLGjMWDUQr0SMFDDRe3KTH_MxoUbHMJ9ex9W854jKg@mail.gmail.com>
In-Reply-To: <CAJTo0LaNQLGjMWDUQr0SMFDDRe3KTH_MxoUbHMJ9ex9W854jKg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 00/10] bluez4/bluez5 selection fixing Yocto 5031
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
X-List-Received-Date: Wed, 11 Feb 2015 00:41:52 -0000
Content-Type: multipart/alternative;
	boundary="------------010708030407060001010603"

--------------010708030407060001010603
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2015 09:43 AM, Burton, Ross wrote:
>
> On 8 February 2015 at 21:16, Christopher Larson <clarson@kergoth.com 
> <mailto:clarson@kergoth.com>> wrote:
>
>         DISTRO_FEATURES_append = " bluez5"
>             PREFERRED_PROVIDER_bluez-hcidump = "bluez5"
>             PNBLACKLIST[bluez-hcidump] = "superseded by bluez5"
>             PNBLACKLIST[gst-plugin-bluetooth] = "dropped from bluez5"
>             PNBLACKLIST[bluez4] = "superseded by bluez5"
>
>
>     For what it's worth, I like the look of this series (and have
>     since they were first posted). Hopefully it gets merged.
>
>
> My concern with this series is using DISTRO_FEATURES to control what 
> version of BlueZ is used in the image.  What makes BlueZ so special 
> that it deserves a DISTRO_FEATURE as opposed to a 
> PREFERRED_PROVIDER_virtual/bluez or a variable such as BLUEZ_VERSION 
> defined in bluetooth.bbclass?

Tried that first pass; I'll defer to RP and the list archives for the 
rationale.

>
> Oh, and gst-plugins-bad has support for BlueZ5 but this series doesn't 
> enable it.

I saw no sign of such support when I started back in November, and 
though the gst-plugins-bad master branch does have it now it looks like 
the package would have to be updated from 0.10.23 to enable it.  IMO 
that's out of scope.  My intent with this series is to make it possible 
to use bluez5 at all, not to make sure that every package that might 
work with bluez5 has support enabled.  That's best left to people who 
have the hardware/use-cases that allow such a configuration to be validated.

Peter

--------------010708030407060001010603
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 02/10/2015 09:43 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaNQLGjMWDUQr0SMFDDRe3KTH_MxoUbHMJ9ex9W854jKg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 8 February 2015 at 21:16,
            Christopher Larson <span dir="ltr">&lt;<a
                moz-do-not-send="true" href="mailto:clarson@kergoth.com"
                target="_blank">clarson@kergoth.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class="">
                <div class="gmail_quote">
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    <div style="overflow:hidden">   
                      DISTRO_FEATURES_append = " bluez5"<br>
                          PREFERRED_PROVIDER_bluez-hcidump = "bluez5"<br>
                          PNBLACKLIST[bluez-hcidump] = "superseded by
                      bluez5"<br>
                          PNBLACKLIST[gst-plugin-bluetooth] = "dropped
                      from bluez5"<br>
                          PNBLACKLIST[bluez4] = "superseded by bluez5"</div>
                  </blockquote>
                </div>
                <br>
              </span>For what it's worth, I like the look of this series
              (and have since they were first posted). Hopefully it gets
              merged.</blockquote>
          </div>
          <br>
          My concern with this series is using DISTRO_FEATURES to
          control what version of BlueZ is used in the image.  What
          makes BlueZ so special that it deserves a DISTRO_FEATURE as
          opposed to a PREFERRED_PROVIDER_virtual/bluez or a variable
          such as BLUEZ_VERSION defined in bluetooth.bbclass?</div>
      </div>
    </blockquote>
    <br>
    Tried that first pass; I'll defer to RP and the list archives for
    the rationale.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaNQLGjMWDUQr0SMFDDRe3KTH_MxoUbHMJ9ex9W854jKg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Oh, and gst-plugins-bad has support for
          BlueZ5 but this series doesn't enable it.</div>
      </div>
    </blockquote>
    <br>
    I saw no sign of such support when I started back in November, and
    though the gst-plugins-bad master branch does have it now it looks
    like the package would have to be updated from 0.10.23 to enable
    it.  IMO that's out of scope.  My intent with this series is to make
    it possible to use bluez5 at all, not to make sure that every
    package that might work with bluez5 has support enabled.  That's
    best left to people who have the hardware/use-cases that allow such
    a configuration to be validated.<br>
    <br>
    Peter<br>
  </body>
</html>

--------------010708030407060001010603--

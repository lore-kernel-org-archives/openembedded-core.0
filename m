Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-02.prod.phx3.secureserver.net
	(p3plsmtpa07-02.prod.phx3.secureserver.net [173.201.192.231])
	by mail.openembedded.org (Postfix) with ESMTP id A7B6872A2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 23:41:48 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-02.prod.phx3.secureserver.net with 
	id Cnho1q00Y0BVjqb01nhp97; Mon, 06 Apr 2015 16:41:50 -0700
Message-ID: <552319BE.3020308@pabigot.com>
Date: Mon, 06 Apr 2015 18:41:50 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>
	<552282D7.6040108@pabigot.com>
	<CAP9ODKobzYLZS9K55S5rSw=Z=LHOaDOTt5mkzTx3SjomMvXnXg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F49465B@irsmsx105.ger.corp.intel.com>
	<5522F8D7.3050007@pabigot.com>
	<CABcZANmh-o58Z5iHW++S30_JP6r3q-8+3-g5hegiwV1_2_OP1Q@mail.gmail.com>
In-Reply-To: <CABcZANmh-o58Z5iHW++S30_JP6r3q-8+3-g5hegiwV1_2_OP1Q@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Mon, 06 Apr 2015 23:41:49 -0000
Content-Type: multipart/alternative;
	boundary="------------030803070003080804050303"

--------------030803070003080804050303
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2015 04:39 PM, Christopher Larson wrote:
>
> On Mon, Apr 6, 2015 at 2:21 PM, Peter A. Bigot <pab@pabigot.com 
> <mailto:pab@pabigot.com>> wrote:
>
>     On 04/06/2015 09:32 AM, Iorga, Cristian wrote:
>
>         Well,
>
>         1. Peter, Otavio: There is not a single doubt about moving to
>         BlueZ 5 as default in 1.9;
>         2. The requested feedback was about the actual implementation;
>         3. Peter: " I do think it's a bit abrupt to make it the
>         default in the first stable release that provides a usable
>         bluez5."; The change is intended for 1.9,the release that will
>         come in October 2015. Do you think that it is still abrupt?
>         BlueZ5 is present in YP as an alternative BT stack from 1.7,
>         it will still be a fully supported alternative in the
>         (unreleased) 1.8 (as far as upstream goes as "fully
>         supported", of course), it will the default BT stack in 1.9
>         (coming October 2015), while BlueZ 4 will still be supported
>         as an obsolete, but still functional alternative; for 2.0 (why
>         1.10??), if that will be the name, all mechanisms for having
>         BlueZ alternatives will be removed, and BlueZ 5 will be the
>         only official supported BT stack. That's more than two years
>         for a transition, is that too soon??
>
>
>     Sorry; I got confused about which numbers were which and where
>     things are in the release cycle.  I didn't consider bluez5 to be
>     generally usable until the patches that were merged in February
>     for what will be 1.8.  Since both bluez4 and bluez5 will be
>     available in 1.8, making the default bluez5 in 1.9 is fine, and
>     removing bluez4 in what follows is fine.  (I have no idea what
>     version is intended to follow 1.9, but if it isn't some huge
>     backwards-incompatible change I would expect it to be 1.10 rather
>     than 2.0.  That's just from the way I normally manage versioning
>     myself.)
>
>     I have no objections to the technical approach in the patch (it's
>     consistent with what I had in mind when I created that bbclass)
>     but I'm not familiar with how DISTRO_FEATURES_BACKFILL is supposed
>     to work so abstain from further comment.
>
>
> Backfill lets you add features which become default in DISTRO_FEATURES 
> even when a distro overrides DISTRO_FEATURES, unless they explicitly 
> add them to DISTRO_FEATURES_BACKFILL_CONSIDERED.

Thank you.  So, if I understand correctly, the effect of adding bluez5 
to DISTRO_FEATURES_BACKFILL while keeping the current logic:

# bluetooth support on the platform:
# "" if bluetooth is not in DISTRO_FEATURES
# else "bluez5" if bluez5 is in DISTRO_FEATURES
# else "bluez4"

is that bluez5 becomes the default and is in DISTRO_FEATURES 
automatically, and it stays the default even if bluez4 is also in 
DISTRO_FEATURES unless somebody adds bluez5 to 
DISTRO_FEATURES_BACKFILL_CONSIDERED at which point bluez4 takes precedence.

If that understanding is correct, and reviewing 
http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-features-backfill, 
it's not clear to me that it's the right approach.  We're not 
backfilling "bluetooth", which remains optional and continues to control 
whether either "bluez4" or "bluez5" is relevant.  We're changing the 
default provider of bluetooth services, something that I think can 
reasonably be changed between releases, and something that 1.8 already 
controls (via explicit specification of bluez4 or bluez5 in 
DISTRO_FEATURES).

In the absence of more detail on why using DISTRO_FEATURES_BACKFILL is a 
better solution I prefer Cristian's original approach.

Peter


--------------030803070003080804050303
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 04/06/2015 04:39 PM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANmh-o58Z5iHW++S30_JP6r3q-8+3-g5hegiwV1_2_OP1Q@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Mon, Apr 6, 2015 at 2:21 PM, Peter
            A. Bigot <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:pab@pabigot.com" target="_blank">pab@pabigot.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class="">On 04/06/2015 09:32 AM, Iorga, Cristian wrote:<br>
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">
                  Well,<br>
                  <br>
                  1. Peter, Otavio: There is not a single doubt about
                  moving to BlueZ 5 as default in 1.9;<br>
                  2. The requested feedback was about the actual
                  implementation;<br>
                  3. Peter: " I do think it's a bit abrupt to make it
                  the default in the first stable release that provides
                  a usable bluez5."; The change is intended for 1.9,the
                  release that will come in October 2015. Do you think
                  that it is still abrupt? BlueZ5 is present in YP as an
                  alternative BT stack from 1.7, it will still be a
                  fully supported alternative in the (unreleased) 1.8
                  (as far as upstream goes as "fully supported", of
                  course), it will the default BT stack in 1.9 (coming
                  October 2015), while BlueZ 4 will still be supported
                  as an obsolete, but still functional alternative; for
                  2.0 (why 1.10??), if that will be the name, all
                  mechanisms for having BlueZ alternatives will be
                  removed, and BlueZ 5 will be the only official
                  supported BT stack. That's more than two years for a
                  transition, is that too soon??<br>
                </blockquote>
                <br>
              </span>
              Sorry; I got confused about which numbers were which and
              where things are in the release cycle.  I didn't consider
              bluez5 to be generally usable until the patches that were
              merged in February for what will be 1.8.  Since both
              bluez4 and bluez5 will be available in 1.8, making the
              default bluez5 in 1.9 is fine, and removing bluez4 in what
              follows is fine.  (I have no idea what version is intended
              to follow 1.9, but if it isn't some huge
              backwards-incompatible change I would expect it to be 1.10
              rather than 2.0.  That's just from the way I normally
              manage versioning myself.)<br>
              <br>
              I have no objections to the technical approach in the
              patch (it's consistent with what I had in mind when I
              created that bbclass) but I'm not familiar with how
              DISTRO_FEATURES_BACKFILL is supposed to work so abstain
              from further comment.</blockquote>
          </div>
          <br>
          Backfill lets you add features which become default in
          DISTRO_FEATURES even when a distro overrides DISTRO_FEATURES,
          unless they explicitly add them to
          DISTRO_FEATURES_BACKFILL_CONSIDERED.<br>
        </div>
      </div>
    </blockquote>
    <br>
    Thank you.  So, if I understand correctly, the effect of adding
    bluez5 to DISTRO_FEATURES_BACKFILL while keeping the current logic:<br>
    <br>
    # bluetooth support on the platform:<br>
    # "" if bluetooth is not in DISTRO_FEATURES<br>
    # else "bluez5" if bluez5 is in DISTRO_FEATURES<br>
    # else "bluez4"<br>
    <br>
    is that bluez5 becomes the default and is in DISTRO_FEATURES
    automatically, and it stays the default even if bluez4 is also in
    DISTRO_FEATURES unless somebody adds bluez5 to
    DISTRO_FEATURES_BACKFILL_CONSIDERED at which point bluez4 takes
    precedence.<br>
    <br>
    If that understanding is correct, and reviewing
    <a class="moz-txt-link-freetext" href="http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-features-backfill">http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-features-backfill</a>,
    it's not clear to me that it's the right approach.  We're not
    backfilling "bluetooth", which remains optional and continues to
    control whether either "bluez4" or "bluez5" is relevant.  We're
    changing the default provider of bluetooth services, something that
    I think can reasonably be changed between releases, and something
    that 1.8 already controls (via explicit specification of bluez4 or
    bluez5 in DISTRO_FEATURES).<br>
    <br>
    In the absence of more detail on why using DISTRO_FEATURES_BACKFILL
    is a better solution I prefer Cristian's original approach.<br>
    <br>
    Peter<br>
    <br>
  </body>
</html>

--------------030803070003080804050303--

Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T5N7m-0007On-8c
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 22:38:30 +0200
Received: by eaad12 with SMTP id d12so688749eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 13:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=spChuunSzNncKtCjiD4smcotvaOle667eExE0wBmW74=;
	b=mtMqIsDoQBegXkifE3BhRBtIcMPTURVXLInuqkKxGJTDA8JaYz1TuuZ5eZ3Tlo8c+u
	duwF0Xlm5DjSfRdBhyc5oc3/9/Q4BQjFSkPXA4VT22rYmAwgIXf8m134eoPU8nIB7AKt
	4XC1dSuqbidVMGbYZNDrrZ2h/tzSAJALZFEerm/8J14qkKjIA8YS9U9z4VabqEGPidea
	3WPijf6BhwKnEfAxamGx5K0YyhXgQeLAArpJjr0o3uSdTqOIwW2ZnIGEBeerQxhjDx0J
	SfWKFsXvDGsGNKYXHD3jFghBThainJVg2BKHrHYAyAUJUf7Bdl6J+94A+oVTUUjXb1Bj
	Gxkg==
Received: by 10.14.202.131 with SMTP id d3mr12073885eeo.32.1345926381185; Sat,
	25 Aug 2012 13:26:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Sat, 25 Aug 2012 13:25:50 -0700 (PDT)
In-Reply-To: <1345913213.14369.131.camel@ted>
References: <1345913213.14369.131.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Aug 2012 13:25:50 -0700
Message-ID: <CAMKF1sqsvRFa0iC0p4RCaCkQ+swt6E1YiSc5UYXEZT8tBN2FDw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Heads up: xxx-nativesdk -> nativesdk-xxx change
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Aug 2012 20:38:30 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 25, 2012 at 9:46 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> As was previous discussed on the list a while ago, we have a problem
> with nativesdk where the code is getting complex and convoluted as its
> simply not possible to automatically "extend" using a suffix.
>
> Extension using a prefix works comparatively well be comparison as shown
> by the multilib code. Its for this reason I'd like to switch the
> meta-toolchain nativesdk recipes to become a prefix rather than a
> suffix.
>
> I'm going to propose some patches soon that do this. The patches are
> fairly nasty to write and maintain so will need to merge fairly quickly.
>
> If anyone does have a strong objection to this change, now is the time
> to raise it. I'd prefer not to have to do this but having considered all
> the options, its the best thing to do for the future and will result in
> cleaner metadata (look at PKGSUFFIX in eglibc for an example of how
> messy this gets).

I think we should then also remove prefixing others too for consistency

its hard enough to get the OE terminology to users for gcc and
gcc-cross and gcc-crosssdk and so on and now we are creating an
anomaly here. I am ok
if call it cross-gcc and crosssdk-gcc and native-gcc and so on. That
will make it consistent to prefix everything then

>
> Note that -native are unchanged and there is no problem or planned
> change which them, this just affects nativesdk.
>
> An example WIP patch is:
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t1&id=2aa1acf11dd26bc194668be81544d08ab5e9bb24
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



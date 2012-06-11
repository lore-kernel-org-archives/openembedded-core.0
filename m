Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8eQ-0008WC-37
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:43:38 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:33:02 -0700
Received: by lbbgh12 with SMTP id gh12so2562681lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=+m+aq57YUPDMghNnrSvZz7vRaGQ1Sq33b9KpvEurMLg=;
	b=D1j8EYnuUvKCxMJ0a/ZBOqeZhn7TmmVoXMP5HnlzrO/k3VOn1JLUb4c9P9HhdDy9cI
	93c9NKrkcNB5WP0rKRdkRkiaalg02MeKCcK0g89uAud0p7eAfwHVSbfB0T/TskxL3NQi
	TD8x5q2GyaqREiPUHtcjoou09vjGdegTAOMiXhzmKsTGZ2A1ben7hQcW2fcuwpJ4rUJG
	DVnewqxmnS2ar0mp1mChozgQKBCSVu0OynZyc5ixQSNsW0SWt0N2wetDA6nPU/VrQRcO
	OPrSiOzBUdBZo8Yf4/wl3USNW+5CvY/ZlmEvZujwNQrQpd/7epK4rUA7dPvWWu4laLDG
	y7Vg==
MIME-Version: 1.0
Received: by 10.152.103.109 with SMTP id fv13mr18046053lab.33.1339435980277;
	Mon, 11 Jun 2012 10:33:00 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:33:00 -0700 (PDT)
In-Reply-To: <1339152317.27075.1.camel@ted>
References: <cover.1338994308.git.mark.hatle@windriver.com>
	<1339152317.27075.1.camel@ted>
Date: Mon, 11 Jun 2012 10:33:00 -0700
Message-ID: <CAPhnLPAAkMSDq2SCWxA6NJTz6GJha5EnNFc=akYnPQ8HGUPW5w@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQk3f6v3U2DEnbdPlLR303n/TOFzcwmuVvToLRcuSTzcQ0CkX6AYoiNtnoPbf4mBKtB5Ib+T
Subject: Re: [PATCH 0/6] Misc package fixes
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
X-List-Received-Date: Mon, 11 Jun 2012 17:43:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 8, 2012 at 3:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-06-06 at 09:53 -0500, Mark Hatle wrote:
>> A small collection of misc package fixes...
>>
>> The following changes since commit f8a054aca9962ebfd4c74fc1d34cd684de6b3=
568:
>>
>> =A0 perl: Allow perl to cross build and native build in a directory name=
d "t" (2012-06-05 23:02:20 +0100)
>>
>> are available in the git repository at:
>> =A0 git://git.pokylinux.org/poky-contrib mhatle/misc
>> =A0 http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/misc
>>
>> Jesse Zhang (1):
>> =A0 beecrypt: disable java
>>
>> Joe Slater (2):
>> =A0 shared-mime-info: fix build race condition
>> =A0 gettext: install libgettextlib.a before removing it
>
> These had patches missing Upstream-Status fields. I've fixed it up this
> time but please pass the message back to include them in future.
>
> Cheers,
>
> Richard
>

Merged into OE-Core

Thanks

-b

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release



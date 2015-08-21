Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id E02AB60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 07:09:22 +0000 (UTC)
Received: by obbfr1 with SMTP id fr1so51964415obb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 00:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nA1loDOBz/SUkN9TTE67vEhOHbM9C6TsEM2AQqt2b5Q=;
	b=BIcSXo0cfm7Tm74uf4I91+UYjwcf4JGTJUbqqmQZcN7KdvjpNZyxqLTzDzigInPOba
	f+QqWhBLlrdix8CqNLYeGSR1TUCvGT8JnU10DZ9qlFlC42wR+Ww0vEglAMK65zXg1IsS
	p/T5J616/5T34vPcoTUamY//tgjVeZCMKCnRPhdcSTOSKLf6BYciZ1S44di5dBZ4PnGS
	dNujg6/qs7QRooiDL7MTLaIvusJZTxe9SEu/4TVCXWvDXhpbcezYg9b1yEM7Z/W9+A1E
	O49VwP/+NzbThYqOoahpmoGl6Wk2mhVv8Y/4ovf/5rl9NXqjTUum7bJoMlbhcEgryTtS
	GsSw==
X-Gm-Message-State: ALoCoQmjij/JHGoWhsFIUPB9h4oMBJx67z0b/mhB1DkrsPpCyW0HizIkwoly3B02Wml3CFyuoxl7
X-Received: by 10.60.145.134 with SMTP id su6mr6462221oeb.22.1440140962926;
	Fri, 21 Aug 2015 00:09:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Fri, 21 Aug 2015 00:08:53 -0700 (PDT)
In-Reply-To: <CAJTo0LZgiz9jVRwkyZpAVxv50EwEo=BDBUb0U7M4fBxZexkU-g@mail.gmail.com>
References: <cover.1440070230.git.jussi.kukkonen@intel.com>
	<53a7964df547908768b1554486603bb4f0d9830e.1440070230.git.jussi.kukkonen@intel.com>
	<CAJTo0LZgiz9jVRwkyZpAVxv50EwEo=BDBUb0U7M4fBxZexkU-g@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 21 Aug 2015 10:08:53 +0300
Message-ID: <CAHiDW_E2xi68qwAikPy18aQw-r-Ue5qU8v8pApUFiPX37gLMTA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libical: Upgrade 1.0.0 -> 1.0.1
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
X-List-Received-Date: Fri, 21 Aug 2015 07:09:27 -0000
Content-Type: text/plain; charset=UTF-8

On 20 August 2015 at 19:11, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 August 2015 at 12:39, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> +inherit cmake perlnative
>
> Why perlnative considering it doesn't depend on any native perl modules?

It does some fairly simple header autogeneration during build (see
src/libical/Makefile.am and scripts/). As far as I can tell it does
not require modules other than core -- but I don't know much about
perl (especially in OE build) so let me know if there's gotchas I
should look out for.

Jussi


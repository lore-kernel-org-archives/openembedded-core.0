Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TZ0n8-0001HL-GD
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 15:51:49 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 15 Nov 2012 06:37:44 -0800
Received: by mail-ob0-f197.google.com with SMTP id tb18so6875044obb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 06:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=mziULzFyTXJAvxWRvN64rbFkNS68W0UzTMVKn4N0rZg=;
	b=lQmPAKeI7SO/kKnaakO7W68yDZ/ffW/qX/A8GH0LNos2hXgWQZTdy3c3dfm1fDEVhz
	fyTY1sB/7JsiiraVvjLophPUoaXmcvpN6Crjnh3hgutoN5iWJBB1k3JfsdM0sEn/K9NW
	qgJ8p8MpV2HX5k1r3VDF8yv6FarjsaSFtlVOtnnQJjMx+E9YhjdTo6wqW5se+P8qqE5Z
	zBuvRwTVcLUQV5C1az66nxFZC6CK6AQ2mgoiRy9cZulgjRI6uQvO1AQ1t0oTvOqCwwW6
	NP1+iltbLpGZtfrYm7Md3xsaiToFTS2FThnbRSZI0KSn9sq0UUTONWRZ4nW5Is9LsTT5
	UrnA==
Received: by 10.182.8.10 with SMTP id n10mr1021542oba.19.1352990262796;
	Thu, 15 Nov 2012 06:37:42 -0800 (PST)
Received: by 10.182.8.10 with SMTP id n10mr1021534oba.19.1352990262680; Thu,
	15 Nov 2012 06:37:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Thu, 15 Nov 2012 06:37:22 -0800 (PST)
In-Reply-To: <F50B87185088EB4790E240C070C3DF4B160E6AE1@IRSMSX104.ger.corp.intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<96e8a890aa256c71895cabe5f36c3c42edc1a086.1352898505.git.laurentiu.palcu@intel.com>
	<1352987675.3709.69.camel@ted>
	<F50B87185088EB4790E240C070C3DF4B160E6AE1@IRSMSX104.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Nov 2012 14:37:22 +0000
Message-ID: <CAJTo0Lahg4qAjaozvAO-hr7NVKQ8BE_bK9zfw91N2udS46fzhA@mail.gmail.com>
To: "Palcu, Laurentiu" <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQlq5vvC+CxJ6QrRgFeedXD9nxmxDhlpn1qEaf4dVBaPbw3QRUuKP0T8yAtzexjMdwl9Uld1g08kfL5IT2B1MfVTQA8fd4n3u8JI8ayEiPk5hok0nP0dL6dnEg5UMpsG82mgfRcJeSelj+ATGZVVjXT8RS4idupbpwQy01vA3/kVv7A/TUTIB3ugOdC9Ui4vpZSzNfjK
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 04/12] xkeyboard-config: upgrade to 2.7
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
X-List-Received-Date: Thu, 15 Nov 2012 14:51:50 -0000
Content-Type: text/plain; charset=UTF-8

On 15 November 2012 14:20, Palcu, Laurentiu <laurentiu.palcu@intel.com> wrote:
> That's weird... I tested the compilation using the Yocto autobuilder nightly targets for
> all architectures with/without shared state. All were successful. However, I applied the
> patches on top of the commit I specified in the cover letter. A didn't retest with the
> latest changes in master...

Ordering issue - it doesn't depend on x11 but checks at configure.  We
need to add --disable-runtime-deps to the configure invocation  - I
thought I'd already done this but obviously not.

Laurentiu - can you add this to your branch?

Ross



Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T8zan-00027o-IM
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 22:19:25 +0200
Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 04 Sep 2012 13:07:02 -0700
Received: by iaky10 with SMTP id y10so10068385iak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 13:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=oPbQrji9V/R2c0giMn82gntcUheRgnCeD1nP3qPNfXA=;
	b=NI2D6Hj21KE7goB+iujuLHmaCkIBCvJT6Us8+sD6htyIGFQubQ6zOUZQjIuRk6ekpB
	OGd10M5IyINSfiKdiyZ+RNPkNL4W1xSEc8clxJdxca7mtHFMZRXSxqbzdpW29jOqlQig
	hx/SbeKGDHdWrhTtQBi9dkO3XhWRDRqBiLz2nKWjCT0SDAWOEu+W7Izhjb7SS6AKS8fx
	PjalyvgjIdXdLKuz+/1kh9iCsRTzNTUiDg3ISSwA6LjPhzjE5xYNvJubZnRIyOIlHvjK
	SReX6SOOjzAyQG7xcJ8mZzWvtr9jBUXzP6h1CHeptsLZUjEbdu0cH0EXD4wzbGdWOFy3
	ehuA==
Received: by 10.50.191.227 with SMTP id hb3mr5501265igc.43.1346789221242; Tue,
	04 Sep 2012 13:07:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.69 with HTTP; Tue, 4 Sep 2012 13:06:41 -0700 (PDT)
In-Reply-To: <50465A0D.6090309@windriver.com>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
	<CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
	<1346278937.4396.57.camel@x121e.pbcl.net>
	<1346423384.2673.102.camel@phil-desktop>
	<1346428885.16485.29.camel@ted>
	<CAMKF1soyonS_-QFV3XKaz1=i_Krguy4i2Nnt1Ep8O9mkTR-3Jg@mail.gmail.com>
	<CAMKF1sqqWJEwsvng_BHbqACJWhUBDRfW4Nixd2t2O1eADmCE5w@mail.gmail.com>
	<43FF08E0-8A1F-4B64-9552-D5C68A207D0C@gmail.com>
	<50462C35.6000400@windriver.com>
	<CAJTo0LY5-Zuw=O_gPaHy326v4VCa704rruHZiefuxBQDbBKwLQ@mail.gmail.com>
	<50465A0D.6090309@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Sep 2012 21:06:41 +0100
Message-ID: <CAJTo0LaqmMMj0yepcr-TLKUQVa1jXCB+7OPs7-peaYG-FjRKFA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQk2wN2DLyl/j+WyPJEFJ580vu7HZXvV+ypZoGMtmbyZZiVrOXMRgEgCDy0zFwGQKk7eqKuE
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Tue, 04 Sep 2012 20:19:25 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2012 20:44, Mark Hatle <mark.hatle@windriver.com> wrote:
>> So that's a false positive, and libgudev can be moved back into /usr
>> where it belongs?
>
> The gobject linkage into udev is either the result of a newer version of
> udev, different configuration options or "something else".  The version
> we're using from the Denzil branch did not generate this failure.  (maybe
> the check was in error?)

gudev is relatively new, so probably isn't in the Denzil udev.  It
would be interesting to see if it's used in early boot or not (I
suspect not, as it depends on GObject), and only selectively move
parts of udev to /lib as required instead of forcing everything to
move.

Ross



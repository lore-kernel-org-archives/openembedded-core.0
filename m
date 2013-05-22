Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3B636608CA;
	Wed, 22 May 2013 11:01:56 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id oz10so1315866veb.38
	for <multiple recipients>; Wed, 22 May 2013 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=kRBTrwutiESq1UNRWIZWHGF4rAjw4DGgxnxebJZ7+mg=;
	b=tfp3tATs3QltdYqvEziG7yeEhPkkQgXO6bFE2tf3HP7h5wkbk2Xj+k773y3cGIh0nN
	DRXvFwHeRL3+3U31lejSDo1agHl96Y9NmAvAgG389vpMQf0sjxMEj2udK+N9PCwP/DbV
	Cx/+bNk//wdQ7wEOxCl/rXr9Fn6JOhZQtRwzfJmWwtb3B+49LfmDQBEha+eUBjUGlXKz
	8UMpeErQWycgcs2n5AeQ7LiSRwFO3Vh84L2y99Fqs7X5GZyfK0olyug60v2zpQaIrz3H
	j9hYU+UsMYFfbNg9gHSXVx5sTocSdWkMx79Irdv5EzV+2VMMUsR7PKZQLPIESGmQk4iW
	vFNA==
MIME-Version: 1.0
X-Received: by 10.220.85.66 with SMTP id n2mr2615548vcl.31.1369220516510; Wed,
	22 May 2013 04:01:56 -0700 (PDT)
Received: by 10.52.18.177 with HTTP; Wed, 22 May 2013 04:01:56 -0700 (PDT)
In-Reply-To: <CAJTo0Lb-d-ZOYc+WxaONDXy+vwbsEJKG8SsnQ0LDP7og5Sm9SQ@mail.gmail.com>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
	<CAJTo0Lb-d-ZOYc+WxaONDXy+vwbsEJKG8SsnQ0LDP7og5Sm9SQ@mail.gmail.com>
Date: Wed, 22 May 2013 13:01:56 +0200
Message-ID: <CALbNGRQPq9X0JiooyTz11i+-v8zpUHCVWO3R4qzPr3tyJgmKnQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org, ross.burton@intel.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Wed, 22 May 2013 11:01:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2013 at 12:31 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
> On 22 May 2013 09:31, Andreas M=C3=BCller <schnitzeltony@googlemail.com> =
wrote:
>> 1. systemd migration:
>>
>> From what I see the only major step left over is to bury meta-systemd.
>> The only appends found there are those for oe-core. I asked for this
>> long time ago [1] and support was offered but...
>
> This is a 1.5 goal, and will be getting around to it but I'm also
> going on holiday in the first week of June, so if you want to send
> patches before I get to it them you're more than welcome.
>
>> * Are there plans to update gtk3 to 3.8.x to have wayland support?
>
> Yes, another 1.5 feature I own.  I have most of the pieces around now.
>  If anyone has a ARM or PPC board to immediate hand, then doing a
> configure of at-spi2-core and at-spi2-gtk on the devices to get the
Haven't found at-spi2-gtk. Do you mean at-spi2-atk?

Andreas


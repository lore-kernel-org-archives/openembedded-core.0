Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEB465C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 08:53:28 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id g201so11625817oib.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 00:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=1/uz+f5pD58ovp5YXAaSHpdv61iXR7vjxCzaU9VUe/c=;
	b=MiL0nkjsc+L+aQZS2SRC3Pyc+8laS/+ysQbN78qqzc2Htcd3spC7yfpnl61HCzsjRx
	i9nrDa0IpbfjU7IxbqD7ZDix8vhs8rDklOy1yEnSPY4+lBIBQ+GNLimW8zSgk11cSD2d
	rXRuhXEEAo31mkpbLBAUGwgrSoeVYy17aTjoaILKgmCZIqGvXmYxL69xlPh43ewiFNWV
	39qdCXQZ7OtcsE2IB8sTWmAvUN7++pmihNNSILN86Xs1BItZ9ODmJFUQUxRfrT85xec+
	tQSFVKU114roA24f20Wu24guPzlPIXVGQiAC0J5HmGFc/jrNFsLD8hGkvKdRtk3NCW60
	YJzA==
MIME-Version: 1.0
X-Received: by 10.202.16.17 with SMTP id 17mr490459oiq.74.1415955208647; Fri,
	14 Nov 2014 00:53:28 -0800 (PST)
Received: by 10.202.67.84 with HTTP; Fri, 14 Nov 2014 00:53:28 -0800 (PST)
In-Reply-To: <CAJTo0Lbs=jzjEvpw64X5iJ9DqG5BV8Sgc9-A80Nf2mM8q=CF_w@mail.gmail.com>
References: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
	<1415346729-16760-2-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lbs=jzjEvpw64X5iJ9DqG5BV8Sgc9-A80Nf2mM8q=CF_w@mail.gmail.com>
Date: Fri, 14 Nov 2014 09:53:28 +0100
Message-ID: <CALbNGRQA6wnsseWxKxkN_QgB9btuVpe5rCTx-1D6t-ehnr1EPg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] midori: update to 0.5.8
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
X-List-Received-Date: Fri, 14 Nov 2014 08:53:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Ross,

The xserever & midori series I has not the most promising start :)

On Thu, Nov 13, 2014 at 7:14 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> Hi Andreas,
>
> On 7 November 2014 07:52, Andreas M=C3=BCller <schnitzeltony@googlemail.c=
om>
> wrote:
>>
>> +SRC_URI =3D
>> "http://www.midori-browser.org/downloads/${BPN}_${PV}_all_.tar.bz2 \
>
>
> ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
> http://www.midori-browser.org/downloads/midori_0.5.8_all_.tar.bz2:
> 2014-11-13 18:07:07 ERROR 404: Not Found.
>
>> +S =3D "${WORKDIR}"
I checked: Now 0.5.9 is out and 0.5.8 location is gone. I will ask for
some permanent archive.
>
>
> This is... worrying.  If the tarball doesn't extract into a folder, pleas=
e
> use the subdir parameter in SRC_URI to put it into one.
Right - will fix that in V2

Andreas


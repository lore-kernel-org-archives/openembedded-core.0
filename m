Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id B4DBE6B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 13:40:11 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id db10so2466079veb.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 06:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=4IrYDEkdZT8L39N4MuP4Na0nc9ZFEhfP2CxYrzFLECs=;
	b=EIFdJPbGGPtN01wGUsCCjnGjz5Kwk3iEncsm4hsVY1NFvOP6F161jLz7FS4X4phUsj
	aA2gCYOffKngEOz5/vovFi3kwibLxzJqxEJQ2F58hgRrBzNzyI3cac29a47drfAk6U+G
	T0+V1J0yFhzIk6UJYAWr+xiKMxIYX/zKCfkPSpZ5RNH6JSMPHMk5192rP0+w91od/Ttm
	J4MYJrduWk5UsCGTB7pSrFeyGq921/aiNhxogZ1bBidYaeIPX1VyZ85zcZpJi5K79krK
	Q+B0F365Cuz+SWgVALwuD88zt/qp1HhVWiORMqZC/TrB3I7A1ppTu0FbOh42kdDBPWXP
	SUrA==
X-Received: by 10.220.1.9 with SMTP id 9mr4092006vcd.37.1374154812316; Thu, 18
	Jul 2013 06:40:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 18 Jul 2013 06:39:52 -0700 (PDT)
In-Reply-To: <CAP9ODKqDSUs8gx1tKbSGT89Ap_hPX6xeD4DKteXKhxNO681Ymw@mail.gmail.com>
References: <CA+jg_OV-i-dRAw92j2dXsodfi5=EmXSnFuA-GVvRCJYbEbS=gg@mail.gmail.com>
	<CAJTo0LaDbFWTXQ0NPtjQ-LMt+B+ZABRG17Ed3BW1=mH2Bv3jgQ@mail.gmail.com>
	<CAP9ODKqDSUs8gx1tKbSGT89Ap_hPX6xeD4DKteXKhxNO681Ymw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2013 14:39:52 +0100
Message-ID: <CAJTo0La40j24AqhFxuZMmjHe9cF6Ssr-jV2D7hhRCMKbLeyLnA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQlsgiN8n8HMv/GZnAEVM0OkVS3neX22FC79F3ezS+qSrSAUFjcjDJYitjsjpUQCJvUn955v
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: No package 'cairo' found for GTK+
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
X-List-Received-Date: Thu, 18 Jul 2013 13:40:11 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2013 14:25, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Thu, Jul 18, 2013 at 10:13 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 18 July 2013 13:33, Daiane Angolini <daiane.list@gmail.com> wrote:
>>> I'm facing the following error. Anyone know what I should try in order
>>> | configure: error: Package requirements (glib-2.0 >= 2.28.0    atk >=
>>> 1.29.2    pango >= 1.20    cairo >= 1.6    gdk-pixbuf-2.0 >= 2.21.0)
>>> were not met:
>>> |
>>> | No package 'cairo' found
>>
>> cairo is a build dependency on GTK+, so I'd recommend having a look at
>> the config.log file it generated and see if that has any hints.
>
> Well, the error seems very clear. cairo pkgconfig is not found.

Yes.  And as I said, cairo is a build dependency of GTK+:

DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native
docbook-utils-native \
 cairo gdk-pixbuf

We need to see the detailed config.log to see *why* it can't find it.
Maybe there's a dependency in cairo.pc that the recipes don't know
about.

> Did you build GTK lately Ross?

Daily, and just to be sure, about 20 seconds ago.

Ross


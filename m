Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 65B3A60097
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 07:42:38 +0000 (UTC)
Received: by obbgh1 with SMTP id gh1so119627739obb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 00:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CIY3iUbTG2DvTPMUWQ9tbxyrEjoMeE5IZYf2FYx2jSM=;
	b=k4XzzU2E6nge3/UAjSdgyK936Wi/s7C8PYgpjplClKf9on5vvW5IVswUR+XZR1jn73
	sq7gP4DaB/1dvac7IXZj+nXiEKABvWnnJTfBauVF22h3sFuBGMN+y8o17Joab+8qd6qS
	cLorgFHZC9L+TZ8XBUGKMgCYs6TxtjMvRAnhAyhnr/2dQrb4pdBnG/pjoCnyOHJ/K5Ns
	9xzcgAq86dEJYJar92AHtRER68eedp5fF6l6glaen5hRJJDEIf5dx6Jt8PGGGIhNzUd1
	B6DwIGZwLAcnuoMghdwbO1k+Q6vNi1tY17Lh+5wj3nlN3nYHZDZ79Zi1jJOWKZ8Z3/DJ
	D2ag==
X-Gm-Message-State: ALoCoQk9GBQTjQZ3hgWWw8t1mO/AWfyiQ+nClU2F4ar0AS2TBRhueRHhXoWdK5inbCo23WFg1+Il
X-Received: by 10.182.74.166 with SMTP id u6mr30151071obv.68.1428478959790;
	Wed, 08 Apr 2015 00:42:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.92.139 with HTTP; Wed, 8 Apr 2015 00:42:08 -0700 (PDT)
In-Reply-To: <55249123.6090008@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
	<7c8475e9f21581916595d0ef7d587ce3ec1614a9.1428405830.git.liezhi.yang@windriver.com>
	<1428442765.14020.482.camel@linuxfoundation.org>
	<55249123.6090008@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 8 Apr 2015 10:42:08 +0300
Message-ID: <CAHiDW_FjO_0BP9+AoQDbS=Y268oUs1TXBhNh2_Vti_yhdMap-A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/10] glib-2.0: 2.42.1 -> 2.44.0
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
X-List-Received-Date: Wed, 08 Apr 2015 07:42:41 -0000
Content-Type: text/plain; charset=UTF-8

On 8 April 2015 at 05:23, Robert Yang <liezhi.yang@windriver.com> wrote:
> On 04/08/2015 05:39 AM, Richard Purdie wrote:
>> This blew up badly on the autobuilder:
>>
>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=c8da6d7390ad626c03d5b9b431a97adeaeb60a89
>
> Sorry, the failures are on CentOS 6.6, please ignore this upgrade atm, I
> will
> find a CentOS 6.x to fix the problem.

That's typedef redefinition (C11 feature and supported by gcc for
quite a while). Why does CentOS specifically choke on that?

Anyway, upstream has decided to roll this back: apparently some gcc
versions that are still in use do not support the feature.
GLib commit 4a292721bc should help.

Jussi


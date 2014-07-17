Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3B73170612
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:39:33 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id j5so2080418qga.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CRvUfotrSR5vAXzyZaWmB5WlSUaaCNIzwBYVTkGoPAg=;
	b=dei5NGaFoWg34ld0tsXmPv5bNmVOib3fYxL9p6XA9Etpwb1kRHxoIKVEJCy2JnoHjk
	zc5EgUJUX0TK117TTqLDYDzw52LUSncmQovefPeQcSOU5ALOalZq0upQG2vISVDczpku
	BJocZSnYQ920RoOm7vVhp2elIQhgUnI5WdyXEyAaNPVuYlwLJe/rGJZxJCoCKSNzZf2Y
	WmsXdxPELSPS+Ioe5mqG3MhIynTWRo/634rB5oYfzcXPYTsOIxu0DW7wbI7mMzB6zCUK
	bYkD/bahNTeTWgNjKloIapLPxrVCuHUesWDA9pfwEiJSq4aatqgAASn0qviYU+0nACtM
	/ofw==
X-Gm-Message-State: ALoCoQmWMzXuDxC8aNCRmUTbQoz5chiBB7KiWLj4R3iYwgO1/yri0/acpY9O0FuRbbfmXOQeGALx
X-Received: by 10.140.19.80 with SMTP id 74mr5118023qgg.32.1405607975126; Thu,
	17 Jul 2014 07:39:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Thu, 17 Jul 2014 07:39:15 -0700 (PDT)
In-Reply-To: <5307977.FlueH2KIor@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1405542583.git.ross.burton@intel.com>
	<630fae1a4789305e375dc7897b9bbb71a240e250.1405542583.git.ross.burton@intel.com>
	<5307977.FlueH2KIor@peggleto-mobl5.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Jul 2014 15:39:15 +0100
Message-ID: <CAJTo0LZwn_M1zT0mWEETmG3U-ooYz9=Bh15+36oU64OkyEVABw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] license.bbclass: canonicalise licenses when dealing with INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Thu, 17 Jul 2014 14:39:38 -0000
Content-Type: text/plain; charset=UTF-8

On 17 July 2014 15:28, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Wednesday 16 July 2014 22:08:13 Ross Burton wrote:
>> If INCOMPATIBLE_LICENSE=GPLv3.0 but the recipe sets LICENSE=GPLv3, the
>
> Pedantic, but INCOMPATIBLE_LICENSE = "GPL-3.0" surely?

Yes, sigh.

Ross


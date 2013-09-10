Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD2A6C01E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 16:10:13 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x19so3840553qcw.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 09:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UTEMxO6lUNc1graOcz1FlCmhGG2IOvA9kiP3vxyDZak=;
	b=LzZzmsnx1DI5ugw4uOVJbWEbxGOggr47arB6JDmOO1mgtgtaF0mL+/wPfUoHMGjcVo
	xn0Xs7MOeC2Lh6srWKo2R+jYDvrq8IYxz9J2kjkepp0ah7zU0Ee9dPtBOZgGh4ZB+e/P
	jJuh5AYytbY8vXLrUPqe919CElxuX+sYLLgtMiL7/b4HBJiMlq83He/kOuYx7AxoTOcN
	qbNjI1KmTsREivVgoHdXHxtBQ9Bnv39gAzgN8vElE3HTO5c72qdnWGyx97ZHjZL9ztjJ
	qkWqaIxeHMSdYKoILsHSA+jhswzSwSqIFAnupaHvLcwKubtbdebBnFNMTm4V/R944yWv
	ZRgw==
X-Gm-Message-State: ALoCoQkjX0Sk9eYDgMQncmYb3p52DZ8Pg5v09Xya0MSuvmR06P5mNlBqMKDAk5AFbxzkQDnq4gg5
X-Received: by 10.49.134.102 with SMTP id pj6mr34169374qeb.49.1378829414710;
	Tue, 10 Sep 2013 09:10:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.211 with HTTP; Tue, 10 Sep 2013 09:09:54 -0700 (PDT)
In-Reply-To: <522F41AD.9080305@linux.intel.com>
References: <1378807330-15606-1-git-send-email-b28495@freescale.com>
	<522F41AD.9080305@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Sep 2013 17:09:54 +0100
Message-ID: <CAJTo0LaFw9PsnfQHf9CLwzRgBkYM5tcCXQLntTXTLwgvLcJLEA@mail.gmail.com>
To: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libcroco: disable Bsymbolic if it is not supported on some hosts
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
X-List-Received-Date: Tue, 10 Sep 2013 16:10:14 -0000
Content-Type: text/plain; charset=UTF-8

On 10 September 2013 16:58, Alexandru Palalau
<alexandrux.palalau@linux.intel.com> wrote:
>> +EXTRA_OECONF += "--enable_Bsymbolic=auto"
>
> I think that the correct parameter would be --enalbe-Bsymbolic (no
> underscore as Ross already mentioned)

The ironyometer is at 11 now thanks to even more typos!  This patch is doomed.

https://git.gnome.org/browse/libcroco/tree/configure.in?id=0.6.8#n101

The option is "--enable-Bsymbolic=auto". :)

Ross


Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9DC6B1FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 12:56:30 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id da11so8257610veb.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 05:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=wsr55QkIz/SeHHzHhKNqN3FCD3+mzxD1e2IwgrKVvDk=;
	b=hYg1a8XXSvZEjt5OAxbgLtlVYHFLpBdHrrfwynoMWcHsTLuoN07FU7BJcZdemLrGeN
	ldrW0LG+KiaDZSMoA2zZb42Rh5zVbc2N7pcvU+4OoEHHuTkKsKWQASVEPLWQeqIOfclv
	xc/OKmzddb6vI79G8Nndk7EIOec3lCz8A3t57xG9RTZjgYEmI1DZnKlRtL1dYUTzn15i
	mlPWLbk9Bedy8Z34gYDZHqsS8MyJ378DbgKCTJWNEk9L0nxhSrLU6sYd1QIkse4wYsnJ
	iNfKBnf318qKXTnNilk5EjX9BUdwf24VMJRIK9klVFB12vSjddTRCnYDUkv84Kuz3Fe9
	PcFg==
X-Received: by 10.58.24.41 with SMTP id r9mr24088350vef.44.1373633790831; Fri,
	12 Jul 2013 05:56:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 12 Jul 2013 05:56:10 -0700 (PDT)
In-Reply-To: <cover.1373591508.git.sgw@linux.intel.com>
References: <cover.1373591508.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2013 13:56:10 +0100
Message-ID: <CAJTo0LYd4ddbuN76WkNRgaWnqoyO3GEOdic=i3AraTr30EFW1g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlVPgfnLhzSGKTfg++2aYzK/SeUmBTQgfNqoGkYJUZsri15SfimrFy7oSntzeuK6RqJx/iZ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/30] PENDING FINAL REVIEW
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
X-List-Received-Date: Fri, 12 Jul 2013 12:56:30 -0000
Content-Type: text/plain; charset=UTF-8

On 12 July 2013 02:23, Saul Wold <sgw@linux.intel.com> wrote:
>   nss: create checksum files for the nss libraries

I wonder why this can't be done using nss-native, but there's probably
a good reason.

Acked-by: Ross Burton <ross.burton@intel.com>

Ross


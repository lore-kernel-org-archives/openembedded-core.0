Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 66B286D2C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:08:48 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hu8so2345750vcb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 10:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KjEUYxEEoM+VGS6RCmJpc/t6zo+3I8wTIHH9BEQimoo=;
	b=RasxcozmCYFx32iMKrxhPNb4hop0DA9zS2FS/OHqYjWNRfXOojZYeCTRpgwTwwn1cv
	nhObg91nX+ugfoD5A589ETv4al7Vq7rv/8sroFdwnBQpZ9SX9v6psyhJExFR4Xr7ril3
	GC25puxEA8eqCr+cuexDMTUh9sBS5VAIYWmdZFW2lTdNa/PTPiu9ZJmL0pGDfJ3iorjU
	YhJN1xE/WbmZHEJxdNRjDTFJg5tm7IwfSgMPlEGS9j6sjnFDJBXj6ZLe2/riBByKFbMG
	nYiJotYZtqH09ETzOMKRLl/ayxghG5Z9Q95Q5H2om9O60ZqmdSf6qeM9FQeAjks7887e
	qJ8g==
X-Gm-Message-State: ALoCoQkmcbZxjge5oSH/P6ETyPriJ/LcyJFjjpIRUYWlLD8B0HUYzr4QWDIjLwCDOPYbNFBuU0JW
X-Received: by 10.52.230.35 with SMTP id sv3mr2044449vdc.27.1382980130011;
	Mon, 28 Oct 2013 10:08:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 28 Oct 2013 10:08:29 -0700 (PDT)
In-Reply-To: <CAP9ODKogpWd7aU2U5qpQ1mztUPwHtQjOQF0krwiLi5wm921pRg@mail.gmail.com>
References: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKogpWd7aU2U5qpQ1mztUPwHtQjOQF0krwiLi5wm921pRg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Oct 2013 17:08:29 +0000
Message-ID: <CAJTo0LZ4Qbt-fc=H9cRszfSUwUiMq4H0KQq-GvPij81fUVrgPQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] gnome: set UNKNOWN_CONFIGURE_WHITELIST
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
X-List-Received-Date: Mon, 28 Oct 2013 17:08:48 -0000
Content-Type: text/plain; charset=UTF-8

On 28 October 2013 15:59, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Mon, Oct 28, 2013 at 12:33 PM, Ross Burton <ross.burton@intel.com> wrote:
>> This class passes --disable-introspection to everything that inherits it but not
>> all GNOME modules support introspection, so add that option to the
>> unknown-configure-options sanity test whitelist.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> I understand the change but it does not match with the commit log.

How so?

-EXTRA_OECONF += "--enable-introspection=no"
+EXTRA_OECONF += "--disable-introspection"

This is a semantically identical change as far as autoconf is
concerned, that makes the whitelist clearer.

+UNKNOWN_CONFIGURE_WHITELIST += "--disable-introspection"

This is the unknown configure options whitelist.

Ross


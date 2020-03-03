Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id A698C61966
	for <openembedded-core@openembedded.org>;
	Tue,  3 Mar 2020 07:01:19 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z15so2946931wrl.1
	for <openembedded-core@openembedded.org>;
	Mon, 02 Mar 2020 23:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=6Z4uW86yCgLJbKYSkXBKSmYuPb58U0HiKwaGxgPm4yI=;
	b=GOheiqJOeYv6n4qqLPLZqGiTvSnq1/bI8QlcNOxW1kQtp/5S6YXiBgkennCsOoduJY
	lrKFXICTqnvxtM3Um05D7FxIrAfOjVVLchqtmSglxrpdLRRE3mxHw8pUYG2PDraiY0G0
	HdNdbrGeLotf2g1ZWlP0X9RsbXwCGztMlGcOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6Z4uW86yCgLJbKYSkXBKSmYuPb58U0HiKwaGxgPm4yI=;
	b=U6fwKk4Q1NDxR56oQgepdruIlZR2zRM1uG07fRR4dXN4+ROviJ0yrQn8kCp0avXkWs
	iWX5gBTpqHb8SqKEJmV0e9akqiJGaM6rLcFapE9In/clyhMd93o3JW/RBiZ3hCn6zBND
	jUF/VOoAhEPGo7lwDn34qv5dPBvL4x/AJyRlZb7kQqfvygR8LbPz/iTpdmbyJjaqHgv1
	JrXswq55nNNx1EADOVupxkbBlOM754aHrYvw38/kRDNiCsm0y6aJtSOMmRHfSsViJ6jy
	/jYrlIZEMx0HUfNIf2uRR46SN8IZXMjjyDy2BXU4UZcUg9OfO04384aEqUMbRCvF8KIR
	QUBA==
X-Gm-Message-State: ANhLgQ1+sjXeq0jpUKgXMPuopnPxzZ/f0NzIicPVpoBuo8i4p+e6FkJr
	jGf7Mxo7/3mb6AelgkxHIsijkg==
X-Google-Smtp-Source: ADFU+vtF9pFHwvDjmwXtGZd8152b1pfCSACQYX33jskXFG2FE9YFtOAdJZpahPjzkvgffi6Z5AebXg==
X-Received: by 2002:adf:f181:: with SMTP id h1mr3818962wro.361.1583218880025; 
	Mon, 02 Mar 2020 23:01:20 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id i4sm2412528wmd.23.2020.03.02.23.01.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Mar 2020 23:01:19 -0800 (PST)
Message-ID: <1c358709eca41c0607ba0301bdaa45b01da2e454.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, openembedded-core
	<openembedded-core@openembedded.org>
Date: Tue, 03 Mar 2020 07:01:17 +0000
In-Reply-To: <47102fa1-dd23-b5ce-1fcb-d05d97d74794@gmail.com>
References: <e7b54a7b237a70346379df8483837a6b97ccc73f.camel@linuxfoundation.org>
	<c88b00fa-a513-c0a0-eb30-62cef90f66bb@gmail.com>
	<df13465da1047d41fb47b19c7479a836b8b71245.camel@linuxfoundation.org>
	<47102fa1-dd23-b5ce-1fcb-d05d97d74794@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: M3 build status
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
X-List-Received-Date: Tue, 03 Mar 2020 07:01:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-02 at 20:17 -0800, akuster808 wrote:
> 
> On 3/2/20 8:47 AM, Richard Purdie wrote:
> > On Sat, 2020-02-29 at 07:38 -0800, akuster808 wrote:
> > > On 2/29/20 5:13 AM, Richard Purdie wrote:
> > > > Just to quickly update everyone, a number of patches we
> > > > probably
> > > > wanted
> > > > in 3.1 have had issues but have had the issues resolved and the
> > > > patches
> > > > have now merged. Thanks to all who dived in and helped with
> > > > those!
> > > So no Bind update?
> > There is still time, please send an updated patch!
> Its unclear to me what change is outstanding.

libuv maintainer entry?

If I merge what is there if will break builds :(

Cheers,

Richard



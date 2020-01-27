Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB0C7FA11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 23:17:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t2so13803811wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 15:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=JNNCPLmkzjTMSlFnHD9KK1GKE8gSUmEpSxYuP0vVUhU=;
	b=Kiz5zDmp5OaMn+/QO2eC8UjA2CIttR+WVBDbagAfqgk9/ThrapabJawbyam3h8jlQl
	xCHxKhDJivhDYp0zc+4hcf8SjNCcTvQl1REpXayjvelA032ZUF8N4q9GxkW4g8URGUIR
	C4yEjb2aXFWlQAk8BwAtXOD/ZliKkT9KSox7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JNNCPLmkzjTMSlFnHD9KK1GKE8gSUmEpSxYuP0vVUhU=;
	b=L4hHTjh2ctxI8vdDUTPk6F+BV2yd3XWKQq0ceneEd1/p2f2lprbelTTWiS20z6VgR2
	Gb5eCCcG0oNpXJBEGKmEMEe5kfrQXMBwyPuZwtfNoc+WVj/AD6j3fTwkicLXkTv9cUC5
	t9uzKOnZrK0yOi6B9/xKU3Hnm75yfVGgoTJaLCxFoImiQUFVynNw7nX07zWnpi6QfxpA
	bzaVjd4bOQYPQ08EC9mkkfucZHx7UokB3a9DiKLUh6UuUVTj2weoxEz17c4Q58mi3BZS
	uZoHYtD5iyov+CFmqUxXFRNG2kSnzSWOw4wnx5QX7JFu+yo7kfyT+TirxVLjBrDiM2Ih
	jZZA==
X-Gm-Message-State: APjAAAXI17IFdFTxGEo/JQIHALczo2eDmxBrTaqRDQ2xolEfhNA48Ccs
	juBrJFHGCyI8QvpAaoJoAzwlFg==
X-Google-Smtp-Source: APXvYqxqDp4VXAdHILTM2pCwcK4ItyONqwleuU5grllgKcc2o/Z1aTOxpD3V3Pg1AsVjHKKJ+RPUQg==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr23962646wrt.367.1580167074112; 
	Mon, 27 Jan 2020 15:17:54 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k11sm445791wmc.20.2020.01.27.15.17.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 15:17:53 -0800 (PST)
Message-ID: <934659c54763bc377a85b1b9ea3c499a7220a21b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Date: Mon, 27 Jan 2020 23:17:51 +0000
In-Reply-To: <500729986.2189004.1579871056402.JavaMail.zimbra@savoirfairelinux.com>
References: <20200120102705.20916-1-jean-marie.lemetayer@savoirfairelinux.com>
	<3d7273734bd7ce04a6b6ca76f210204a948328dc.camel@linuxfoundation.org>
	<500729986.2189004.1579871056402.JavaMail.zimbra@savoirfairelinux.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Jonas Andersson <jonaskgandersson@gmail.com>,
	paul eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Chris Elston <cdelston0@gmail.com>, bunk <bunk@stusta.de>,
	paul <paul@betafive.co.uk>, rennes-dev <rennes-dev@savoirfairelinux.com>
Subject: Re: [PATCH v5 00/13] NPM refactoring
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
X-List-Received-Date: Mon, 27 Jan 2020 23:17:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-01-24 at 08:04 -0500, Jean-Marie LEMETAYER wrote:
> On Jan 24, 2020, at 12:56 PM, Richard Purdie 
> > from some of the checksum code changes but also some nodejs-native
> > being missing (incorrect guards on npm code?)
> 
> The npm recipes needs nodejs-native which is in the meta-
> openembedded/meta-oe layer.
> 
> So the builder needs to add this layer to be able to have a
> successful build.
> 
> This can lead to another question: Shouldn't the nodejs recipe be in
> OE-core ?

I've merged this series, thanks for your patience!

I had to disable the oe-selftests which need npm for now. You have a
good question here and yes, we need to think about this.

I didn't want to block the series on this though and felt this should
be a separate discussion.

Cheers,

Richard



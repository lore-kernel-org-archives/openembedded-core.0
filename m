Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 904A07BDAE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 13:00:59 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id g76so6060199itg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 05:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2z3XnTnK8ErDv1UsFwS0aBVRWBzrYNpMMWI3dSDXAlI=;
	b=HN50v6Z7oQ+NXXVHCFGzbqUAqyDGqG9Z14sQrtd0sa4VoGv9n/UEp9+gTplebOK1+D
	aksPKfM7gmMLbrhquNJBrchfdg4mpbgK7PPLxoQCDKinHPO/8+FKuhi/7bD4v5CKgPjA
	i/OIZc2JdMi11NFHJhD/q0lFjdOHuqrkKNO0TrsMOuZjUeYBcdliG+SgU0c3kalLLOC3
	NRPPFPh9cOCjwcJABLyEwHUJJfFWx7XOLkFpoo1aBYuCHWuRy9+vntBAysQNCte1QC73
	7QeRU6ai7Gk5Utkyfi6sGdPjk+CK0+SezDLTuqGyjTNqFNQ6xpeHbNL3qKrrZBKyPqRS
	jEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2z3XnTnK8ErDv1UsFwS0aBVRWBzrYNpMMWI3dSDXAlI=;
	b=ql9028swSEVQSexyfu0P1g5EIyOx/BgvVoHTnTyeVdSrtgu7iJewpBMqTgoqHvgwhz
	qIwVM+YlNLm7U+Id0CEN3Qu12e+guYo33HmrmlgGhhgPBvdQJPTA4fYRMq4SWSADOLe3
	aEtqEWxeGPtnkP79TxhUf20AOmWLT4DT+3Y2PtpdBkwxho0DHveItZa01ZTNCy0+UjTx
	N1hh+q8hUgMadFOYhGBHI+iXhwE/emQ5ufz3uoe3jWZdAeVOZSR7Lz7d/5weS11/cUz0
	g31Gx/ScnjpFEJtPaw8AtMemfkjDuQamkPzDUnwA6wOq0V55aIBsFgoWuhvlFtfXOIpQ
	qojQ==
X-Gm-Message-State: AJcUukfoaW4hCQ790xkGay393xfAe/yM6fAS/WuNnABeo5onmfFR1zSC
	KBXWWsN/BWyX/QSN4+Iyjps9bQsYk4h7kXH8qzWT+A==
X-Google-Smtp-Source: ALg8bN7fa+AgDUlCs9ZX5q7BghBcEsoMcvPobBJWC6pQZh1mff9Ec+ENji3AklhksMLa2u2Oxos2Z4HHq3NXYUGHVIk=
X-Received: by 2002:a02:9c53:: with SMTP id h19mr1004050jal.31.1546952460539; 
	Tue, 08 Jan 2019 05:01:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546938633.git.Qi.Chen@windriver.com>
	<11e2fba7bd1e165047915f5a77cb85ba96410da4.1546938633.git.Qi.Chen@windriver.com>
	<CAJTo0La-LVLk8OPabGePojhGMYvA6RRY-8DakEHecVUq_amELA@mail.gmail.com>
	<7e7292a7d955db6ae138a10af3c5894dedbd6c29.camel@linuxfoundation.org>
	<CAJTo0Lbj10QLG-AH6YYOua1NtZfcPGKi0swnKR444bPjBrJZEQ@mail.gmail.com>
	<6af27248c02eb709ad45c6cbfbe7e464b80cd2db.camel@linuxfoundation.org>
In-Reply-To: <6af27248c02eb709ad45c6cbfbe7e464b80cd2db.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2019 13:00:49 +0000
Message-ID: <CAJTo0LYtBhi3irqWJuTCsT9tw5zvXDfjN=Pt+QJ9UXzP1LhGag@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase/base-files: move /etc/hosts from netbase to base-files
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
X-List-Received-Date: Tue, 08 Jan 2019 13:00:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Jan 2019 at 12:47, <richard.purdie@linuxfoundation.org> wrote:
> > > Not so good if hostname isn't set?
> >
> > hostname = "${MACHINE}"
> >
> > Hostname is always set. :)
>
> Its the kind of thing people likely bbappend and change, or set from
> overrides. Which was one of the reasons I'm nervous about moving hosts
> to a different package in the first place...

In all those situation the hostname will be set, right?  Is anyone
actually going to bbappend/override the value to ""?

Ross


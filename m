Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 74B146ACB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 09:39:28 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id s7so5574076qap.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 02:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bbGJk/DhDN4upjaqEr4mINq9jzdX9MwV1HZvok4e6Kw=;
	b=TlVT523P6hqm5AvTcLAvn87XGYBmBVXL4f1KezSp+6hRxq77Tg0cTQKpCMCKM0usfj
	Yz6SdEDtg9rTomjveoqGRJV7Mg+Le7ianvZXMztqv/U9pp1e+FXd4Vxq7FIV3kEocZZm
	jgT7XSajI/q5RDGF8hFVDy4cYoLPwOZ3Ru21gwPtqYSP8LQ33iI/eLpTfwn4nZvKarCG
	ng98DNWUnBMANILVClObUv8xFIALEEWI255yX0Kq0NSsjG8w1gi7uXtbbc1oDoycbKI1
	yt9lrHNe/LdZ9yFFYM/ICIkvFJD273Bff0PTQDbQX/t8Yq491hvxmdN5odBTcO73y8Ai
	7XAg==
X-Gm-Message-State: ALoCoQlRO1DuZHhjIUtmgWvvklDcjVbtE+g8XN52VsVKmusL7I8dFFq0ob5Q4G6W1XSwP3gOalV3
X-Received: by 10.224.160.83 with SMTP id m19mr4792385qax.17.1413279569258;
	Tue, 14 Oct 2014 02:39:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.100.239 with HTTP; Tue, 14 Oct 2014 02:39:09 -0700 (PDT)
In-Reply-To: <CANyK_8evAyhrmuyHKmk46sfJoF6fwjnF6h9aJoLn4GPGx_Xe1w@mail.gmail.com>
References: <543965E7.3040806@pabigot.com> <543AED25.7070201@pabigot.com>
	<2427853.ctRZJaqR28@peggleto-mobl5.ger.corp.intel.com>
	<CANyK_8evAyhrmuyHKmk46sfJoF6fwjnF6h9aJoLn4GPGx_Xe1w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Oct 2014 10:39:09 +0100
Message-ID: <CAJTo0LZJJArwYq9YrjXk7DG=sjGKq6=jW0BRf2c021QbHtTn9A@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: dbus build host uid/gid leaking into target home directory
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
X-List-Received-Date: Tue, 14 Oct 2014 09:39:31 -0000
Content-Type: text/plain; charset=UTF-8

On 14 October 2014 07:23, Paul Barker <paul@paulbarker.me.uk> wrote:
> Looking at 'man tar', there is a '--numeric-owner' option to always
> use numbers for user/group names. It might just be that we need to
> recommend using this option when untarring a rootfs onto a mounted
> volume. This option is present in GNU tar, I'm not sure about other
> implementations, and I haven't given it a proper test, but it looks
> like the thing we want.

It's part of BSD tar too (well, Darwin).

Ross


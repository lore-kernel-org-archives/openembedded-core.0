Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id A11836A9C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 13:47:27 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id 15so1383798vea.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 06:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=/2s+ORdm2FuBUcQquE7zIhfgGKuL/UcEPWpzsXN7vOo=;
	b=jOAAA25g8MsjrwL/o9TivbyVVPKe1592JzAhf703zG2PPjw4ec4PnGF+3Pqkf8BGta
	lMU2iWQHK5l3CyorqXl7/9bVs27QFB4eoQ23qbHu9L+f7NgDIKeWChrWf+Gs/on5E3Lj
	Y3Cu9tqJ32PU8N4CwWRHFnvxXzviaFAtuaiUqBJts4i3bYdtR7L2hzlHJnuWjYJyFocU
	7bdrGJ+rGzPDa341wMki4J/9XNYASNqwex8Frg7+4WbIvLvNG1a21ZzdMllPablJO6XF
	85lYoGQGFtfR6b9duHJi47QlKMeHTCjyVUdEC9KUG9FFoddRGUGHIXPkb8RBbIQYBEC1
	w1NQ==
X-Received: by 10.58.181.225 with SMTP id dz1mr27362621vec.95.1375192048300;
	Tue, 30 Jul 2013 06:47:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 30 Jul 2013 06:47:08 -0700 (PDT)
In-Reply-To: <1375190653.8017.0.camel@phil-desktop.brightsign>
References: <1375190038-21751-1-git-send-email-ross.burton@intel.com>
	<1375190653.8017.0.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jul 2013 14:47:08 +0100
Message-ID: <CAJTo0LaKRzgcExB89E2giv89E8KRCaohJB=_nmgDJn=puhb1Hw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQns0sayC/0Du5SGV0BBJipmEJo39iyEjxTqi4Mrd1E+4eGiGaYChXg8klErW6dY650GouCo
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez5: Add obex-profiles as a PACKAGECONFIG, package obexd separately
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
X-List-Received-Date: Tue, 30 Jul 2013 13:47:28 -0000
Content-Type: text/plain; charset=UTF-8

On 30 July 2013 14:24, Phil Blundell <pb@pbcl.net> wrote:
>>  meta/classes/buildhistory.bbclass           |    1 +
>
> I don't suppose you intended to send that change to buildhistory as part
> of this patch.

Nope. :(

Ross


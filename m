Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8E2E36D160
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 13:30:11 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id oz11so2376703veb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2013 05:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KfQ3yPyp3kiQY9WzBCAu+nTbG7g+HoK3td7evClVoq8=;
	b=gHf9TZaWPXJuf2rbMlllKsNUgQudfxZtrAqv/GOtY/fJYMQvM+945PZNPsojAzfP0j
	OS9H+d0a8/aXZ0b0CrdBMvS1+DtZaopEGlkemWHEaCA/TNdc+6/Gd0GkVVt8Q2XMAjpj
	BRwJ2dgMZMigFjb+54DbiSzLyrxGXb+nZxsB+paQKoRALP04TiATDAa7ceq7iiNJ4Pfa
	9iaFD2XSzEcyH4kyl8PaUTvlKFlVULXt6YxuF3D8Zk8vYgic5AuMaSEr9c/XXnNM7pfw
	DE8VX9FcU8rDLPXoM2qu4BC4tw2LmzckbS8F0Vw4SpLoMnl+IpnHwgZJNTUR2e+H3JqG
	/cZg==
X-Gm-Message-State: ALoCoQmACa2XaoURb3sUVc65vRDes8yvep8yJyVSuxMQDi/mqg3FhgQPgTYfNlvH/1FsO0Y2N9QS
X-Received: by 10.58.144.168 with SMTP id sn8mr20499veb.33.1383658212735; Tue,
	05 Nov 2013 05:30:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 5 Nov 2013 05:29:52 -0800 (PST)
In-Reply-To: <CAMKF1sr=OGmHxJ4yz_h6R5_YKkzEN-3QcJZMhFhg_QyroZmQvw@mail.gmail.com>
References: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
	<1382970798-13574-5-git-send-email-ross.burton@intel.com>
	<CAMKF1sr=OGmHxJ4yz_h6R5_YKkzEN-3QcJZMhFhg_QyroZmQvw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Nov 2013 13:29:52 +0000
Message-ID: <CAJTo0Lbvp3gybm6OVGkFZAXMDdn4cB+XgnjF=L92pwJQ9Bij=Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] libgcrypt: remove --without-pth
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
X-List-Received-Date: Tue, 05 Nov 2013 13:30:12 -0000
Content-Type: text/plain; charset=UTF-8

On 31 October 2013 03:44, Khem Raj <raj.khem@gmail.com> wrote:
> should it now depend on pth as well for deterministic builds.

No, because the random daemon (the only piece that needs Pth) is
disabled by default.

Ross


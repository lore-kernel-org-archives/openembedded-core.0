Return-Path: <dbaryshkov@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 44BD0602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 12:09:22 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r1so43992054pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 05:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vJ6ANHnAltUi6nGEJRDg5BkN7mbcqQhzIpZ6P+iU+vA=;
	b=oR2VL09N+32W6HNWeS2eJSoIUv4p4dp2OvWGxLM5rriJqdZnh3ng1zaHjC24u05w/O
	n8nHYfm7JmcVbzc/5/l8djz9ZetxPbeaFxkHObHS7TV/3uVg0Q0vQFhJ1O+1Gsexlzo9
	dSY22wmB3r7KgnpecsMJyp/fUcWIvO2xvQ79AapVAleLw6nHIPrQrSUmYLPIJai1N+c4
	vHuT0dbcj46ATpixGp6P70UbanqQ21UbsmFT8Hj8vJpOJm42qmQ78dxvFJqiiAnddrqJ
	0EtlFrYIs0HjXEk6d1truav8vb1ea64I9j2vcbqhHlyNG5RMQVC+c3E+A9TBj37UJusA
	yI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vJ6ANHnAltUi6nGEJRDg5BkN7mbcqQhzIpZ6P+iU+vA=;
	b=OhMycslvwT+EQ+x5x9P6R12r8S8F9innuk2uGZTdvUOwsk+HiCkVem07a+dLdFbdTP
	LggtweEQP2wDscJjozVpR/BVoJDNereBrIoa5KaI2HQ2XbDVcJlGZ/YdToL3l/v+O7/c
	w4u6IqMxMq12OYybvy5Vr2CfaXRxOQCWEDkxuRBuviLow/8CZZKNOPc9M3MZOi/Z/OZY
	piaLU3BF60HRRHXeE9vulhtyDuZn2Vd9YH0OEhI+PCCw0irTRaGwaTD151UsvnS5Fjrf
	vcxEhb+EgFxio9QRrz24kJT5TvOaIltSjwRzEz2dXAQaz1qipoyN0kG6OrwKWQ1rblhq
	s/ug==
X-Gm-Message-State: APjAAAX+fuELpq6FFrSFwp5w/nOnylz6hNyNbO/k9ryxJMdIWuQ9cOcc
	Lm8jQOIauQALUf23y7lHEy/RtwGlRqZdmzH9goY=
X-Google-Smtp-Source: APXvYqydB4La8fYffUSOXrE+EH0HzwhuewylhEKBM4SLVRQXlQndopvFNh8fC/4XDZGhOP2tQGtNmzaV6BdcRZSK3go=
X-Received: by 2002:aa7:9a8a:: with SMTP id w10mr15092974pfi.66.1565266163370; 
	Thu, 08 Aug 2019 05:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190808095725.18596-1-dbaryshkov@gmail.com>
	<1d7e32e5e05a43e18d4b52839a3b2327554c0525.camel@intel.com>
In-Reply-To: <1d7e32e5e05a43e18d4b52839a3b2327554c0525.camel@intel.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Thu, 8 Aug 2019 15:09:11 +0300
Message-ID: <CALT56yO8Hu6TSgR5QBZXhS7L24EYPygmNSwJ+6N2nF41SFkqnw@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "dmitry_eremin-solenikov@mentor.com" <dmitry_eremin-solenikov@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] module.bbclass: do not strip packages if modules signing is enabled
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
X-List-Received-Date: Thu, 08 Aug 2019 12:09:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 8 =D0=B0=D0=B2=D0=B3. 2019 =D0=B3. =D0=B2 14:44, Mittal, Anuj=
 <anuj.mittal@intel.com>:
>
> On Thu, 2019-08-08 at 12:57 +0300, dbaryshkov@gmail.com wrote:
> > From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> >
> > Stripping kernel modules will also remove signature, thus we have to
> > inhibit package striping in case modules signatures are enabled.
> >
>
> Isn't this already being taken care of here:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D8fc56faa5d76=
927f42a4e7cca2418556e231938f

Hmm, true. I missed that commit.

--=20
With best wishes
Dmitry


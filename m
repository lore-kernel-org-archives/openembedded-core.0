Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A7CEF78E00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 20:32:21 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i134-v6so9198929wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 13:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=itU2eip5BV93wIqy6zI7A5KLnUyqzAFh4THJxoVEZNw=;
	b=VV17S4r5tCh4YhpDYBNuqUe2mr7ECMafe2aj2/XA+rmFj6ym40Z/8dVjw2O2g/4Izo
	vstEtymxp0TwkuJWPl4uR3GGG3yeGaFsYlRGYuU07KhoLCiIW+zNZWI5UuAqkWIlB0/s
	71PuIj/2xmwAVwpNuwnfEMaHzxFy08egZm81M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=itU2eip5BV93wIqy6zI7A5KLnUyqzAFh4THJxoVEZNw=;
	b=d8ZGB+sZic+qwB/ei7T71vCKOy1TOIG45KBnWCA8ZUWni5TY9RwIBCbdJ2zwBpx1gk
	a+tWSvvLGBiAohr1fEvt0DscrGlK8qnMBsb4EEjGGDzDLO0ipFXp1uU5MGmiiDf+0jEY
	hNF92/vVXorpdtO/FlkGOcuSNVglnGnph12xzTj03Di0bOTjPPms5A6JtONuQQ9Z9Pn9
	+cOLAk3N9zE6GtxpS+g5wwdaLb+x4UEOSH7safO/4MfcEF+KvC4hByBew1+B9+vGh1PD
	KH5DMw7RVh+9udK5cKf8xKJilpHUWrIhllppEcM982ITah37Y6WvffllxUfT/TdLND01
	7++g==
X-Gm-Message-State: AOUpUlFkjjCG2bceMswW4Yp6HTIXIUMK+3dzCSJQY7fjAS7TgJ05sB3N
	psIUwFGVuY/RZ74VZUAWYjWLJ/oc55k=
X-Google-Smtp-Source: AA+uWPyoGEaNsqb3D42b2EoWW757KQD0aQht01hF02NZyyLs+pW6KEhb9krUT+nsNg+p+w5G9PsIfg==
X-Received: by 2002:a1c:1584:: with SMTP id
	126-v6mr17160831wmv.24.1534451542427; 
	Thu, 16 Aug 2018 13:32:22 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q70-v6sm4355537wmd.39.2018.08.16.13.32.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 13:32:21 -0700 (PDT)
Message-ID: <c04c47319e2d8072610db6bec2cfd619817c7e90.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 16 Aug 2018 21:32:19 +0100
In-Reply-To: <f1d91166-bb69-d3ca-d611-427dbae3ab47@windriver.com>
References: <1534339941-1968-1-git-send-email-bruce.ashfield@windriver.com>
	<ebb9e2738e47c62514b0816b8d8c2ede13a54275.camel@linuxfoundation.org>
	<32bf2998f462edc3286fbd04f44ab251ef1f90ed.camel@linuxfoundation.org>
	<f1d91166-bb69-d3ca-d611-427dbae3ab47@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 16 Aug 2018 20:32:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-08-16 at 13:30 -0400, Bruce Ashfield wrote:
> I have both of the issues fixed, but am waiting for a build cycle to
> complete.
> 
> Fundamentally nothing needs to mess with the kernel source for out of
> tree builds anymore, so just testing for 'build' to exist and
> trusting
> that it is right is the proper thing to do.
> 
> I tweaked both this and the build-appliance image to do just that.
> 
> If you want, I can send the patch before my builds complete (since
> it will be tomorrow before they are done).

Happy to take a patch and run it through the autobuilder in parallel...

Cheers,

Richard


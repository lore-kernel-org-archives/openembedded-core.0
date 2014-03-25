Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC25610D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 14:34:40 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so564539qaq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 07:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=txTu/drGjEV5lnAg/Ee0UnAUprteAFn2UlkSI0jGLD8=;
	b=CheexYIxIrg8G7hS8oBk9COsC/JzIdL0Vu68xwHaipQ6YKFeBD0XgKMmPkS2fb0OMG
	+Ip0fICBW1Eyd86URbW5SLgom/yFv/uymoJzkfbWB7Jmyqkncfem2BNR/NvetPpRr+OA
	euty8XJLa4mtfapHNYENUD7DyKva7ADi+IN/BOAo5I5oPek1o+QSkv76O3aUHRqyieSI
	fm8iY6godYf4kmD3emSJsU0cpp8qO0hRZmJBiMU821ANqKH1cuHheFXWCL7S1PD/5vIN
	MiCgDJiek1aCvunka6LQ9bx5FpVbINjbNtLI1fRkFAUWrObHNVhS2miAT6nQmU/TfsLR
	BfHA==
X-Gm-Message-State: ALoCoQnP1c2kuX1pdvItlmEHLbCPPrRB2wBOAY8uCGdn8pFjXdxBaZtEtSvAzCKbTVG2VoH5wkXa
X-Received: by 10.229.198.2 with SMTP id em2mr3513607qcb.21.1395758081439;
	Tue, 25 Mar 2014 07:34:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Tue, 25 Mar 2014 07:34:21 -0700 (PDT)
In-Reply-To: <1395749168-16746-1-git-send-email-valentin.popa@intel.com>
References: <1395749168-16746-1-git-send-email-valentin.popa@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Mar 2014 14:34:21 +0000
Message-ID: <CAJTo0LYEv7t6PPhp7mZ+UOKxEkY2+QmM9-ofYUDX=m1_=0oNtA@mail.gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] piglit: ship files with correct permissions
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
X-List-Received-Date: Tue, 25 Mar 2014 14:34:41 -0000
Content-Type: text/plain; charset=UTF-8

On 25 March 2014 12:06, Valentin Popa <valentin.popa@intel.com> wrote:
> Adress the warning
> | warning: group pulse does not exist - using root
>
> Piglit files from framework/ generated_tests/ tests/
> and templates/ belong to xuser/pulse.
> Don't keep the permissions while shipping the files,
> they should be root/root.

Reviewed-by: Ross Burton <ross.burton@intel.com>

Ross


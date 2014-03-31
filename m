Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id DC2556F61F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 14:07:29 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id m20so8941335qcx.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 07:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nzqN0dVmfetmVRida0BXdcZ9RybRwMdMoRF4O6VnlOo=;
	b=WpKwTgDOBHv8diM/Ydwedmt+mw8fYVUdb12SdQ4UqhtwYC3tDpFL1UhGhLy5FufaR2
	rCb/ro2ZPqJpeqCc37/7Mk8udGcMJVTMeXxnT8WhJ8iEbR1CrPumy2Fh1tOPYQb3vvQx
	IAawqrtuuciZGSDPpB+ZYPds9rKz2tk/BbywXtmjNxdfNW9+7cpsqHAB4OX4+euDCLDc
	MwhvTOkW3aKpbbWFt54YV8Mj/dtCE8libaPrZnNbfjCUUoVViVLt4EwvqRRuMj/jJN/q
	1yFkBj3ltI0BZHBOXy4FSgleAknH5dvl+irXlGO22pabDaHXWT3ikavf3wuE02G8NGgp
	TAiQ==
X-Gm-Message-State: ALoCoQkhMg2BvaQac4Hmxh6QBINb6xkB/byRsN8W4NCYjUgRLsTqXp1/oEgFHsF/DTRnMefYlGkx
X-Received: by 10.140.42.9 with SMTP id b9mr3013586qga.87.1396274849977; Mon,
	31 Mar 2014 07:07:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Mon, 31 Mar 2014 07:07:09 -0700 (PDT)
In-Reply-To: <f54eb96dbc54cf4fce2cfee8e865a1e6cc41c905.1396175372.git.liezhi.yang@windriver.com>
References: <cover.1396175372.git.liezhi.yang@windriver.com>
	<f54eb96dbc54cf4fce2cfee8e865a1e6cc41c905.1396175372.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Mar 2014 15:07:09 +0100
Message-ID: <CAJTo0LYNZB5MGTFctAHD6nA_m+yQeuTiYyztmeFLLF6NPBuQAw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gtk+3: set proper FLAGS for native
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
X-List-Received-Date: Mon, 31 Mar 2014 14:07:30 -0000
Content-Type: text/plain; charset=UTF-8

On 30 March 2014 11:30, Robert Yang <liezhi.yang@windriver.com> wrote:
>++CFLAGS = @CFLAGS_FOR_BUILD@
>++CPPFLAGS = @CPPFLAGS_FOR_BUILD@
>++LDFLAGS = @LDFLAGS_FOR_BUILD@

So the problem is that the environment is providing a CFLAGS variable
that automake is then using for native builds alongside
CFLAGS_FOR_BUILD.  Instead of replicating the variables, which this
will do, would it be better to unset CFLAGS/CPPFLAGS/LDFLAGS in this
makefile so the environment variables are not used? (as makefile
assignments override environment assignments).

Ross


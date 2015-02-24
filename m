Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 00A8A71633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 12:02:24 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id q107so29361722qgd.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 04:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+HtQOqH+HVkTMUTH7UPXpR1bMEhEddoGT0NlSr/AcOE=;
	b=mR1UdjQVSA1xzsf2IuDA6euV85xSQgwGd8BgAe3w7IcLTFz84vKz21j+HsDOjBbf7c
	GWJFbJkibeZfUdPKV6zdjAjHBYPuWVH3wgOQ5He8txLLDHOHRfLxszfMcI7NMvAJuiHe
	8XRtN2W/ytabJCwf2MqDfLc+BoFNCHLMC8WIe52KcZFAFjkuwyA5Ba9mU0i+T6jqJ347
	qdKbFa2d/KZk7p9WfwQ1cW1I55fJigiNGvSkmo7sNMA/wv8tqXgYyaPjVfhSpx/S9FWH
	X55wIEwm4gy5D0QOkd4raFBw5fB/26Z5WCDrGXbbpmkeJa+aaN+YekQi2Du82pR0fVn+
	QuJg==
X-Gm-Message-State: ALoCoQlNRIYKuF5Qz83ZiqBy9uUQDWIOAQ+Z1qPrJGLWBxue4GwZJUuJuC2lUhJsxeiUk1uZkWHI
X-Received: by 10.140.147.66 with SMTP id 63mr8440965qht.35.1424779345638;
	Tue, 24 Feb 2015 04:02:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 24 Feb 2015 04:02:05 -0800 (PST)
In-Reply-To: <1424758088-31785-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1424758088-31785-1-git-send-email-alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Feb 2015 12:02:05 +0000
Message-ID: <CAJTo0LbRTqtSbeJoczLBHKQgKuZsyhjfcYgBeTUb0tuadM0goA@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-native: Fixes PGEN linking errors Changes Makefile rules to avoid parallel make races when trying to build Parser/PGEN
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
X-List-Received-Date: Tue, 24 Feb 2015 12:02:26 -0000
Content-Type: multipart/alternative; boundary=001a1135547ec7cf05050fd44a30

--001a1135547ec7cf05050fd44a30
Content-Type: text/plain; charset=UTF-8

Hi Alejandro,

On 24 February 2015 at 06:08, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> +Upstream-Status: Inappropriate [embedded specific]
>

This is a genuine build race in the make files and entirely appropriate for
upstream.  Can you send them a patch?

Ross

--001a1135547ec7cf05050fd44a30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Alejandro,</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 24 February 2015 at 06:0=
8, Alejandro Hernandez <span dir=3D"ltr">&lt;<a href=3D"mailto:alejandro.he=
rnandez@linux.intel.com" target=3D"_blank">alejandro.hernandez@linux.intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":fl"=
 class=3D"a3s" style=3D"overflow:hidden">+Upstream-Status: Inappropriate [e=
mbedded specific]<br></div></blockquote><div><br></div><div>This is a genui=
ne build race in the make files and entirely appropriate for upstream.=C2=
=A0 Can you send them a patch?</div><div><br></div><div>Ross=C2=A0</div></d=
iv></div></div>

--001a1135547ec7cf05050fd44a30--

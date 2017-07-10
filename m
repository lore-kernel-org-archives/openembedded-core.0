Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id B53B577BF0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 12:12:54 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id b40so70437209qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Le6QPiwfMMdjNPgVJZSwi4qZJ1g+JNEQwoplhUO1pcM=;
	b=1d/cghE4nqUD3EaaMevm4JmieKPPsAHqP8kI2AGB1KP93CVem09r6+ZDt3jK9cNHqh
	ESS8NShjgrfyC236MgwnMGQozVucjxsRucEUq9KlLtjCLm4NIayQ4b3s0ybYndq2DGHa
	UKgN5uvva9RZYUgFqSq7jE65YmV31j5kavKzboiCPAItKkJ2lBNZy+m5hJQDOaJJf8FU
	7Ez0T/K0aAMJfpR4R4JXqhv6e5d+Yh+a+9LAj42jK7Hu2l/32JndEGikGGbrxHW8cU1O
	EKBTr0DS0prTNWbuz7t+2ePaQXw/yp7Wf5qFpoAK0M68go4FzjbgxL3cuCUad5+wMF+J
	cuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Le6QPiwfMMdjNPgVJZSwi4qZJ1g+JNEQwoplhUO1pcM=;
	b=ubzYcdeVh2DvE/nGbFSDoV+ttsyxmdRDbF+/+D9QUrgLwjL+lla3GT0Krn3cg1wdyR
	0Vf+6PHUAT+Ab4JZQnzO1vlx16SW8b0nlYEKh/qLAgp0CtqedCBgHXoudMkAhLbGVeKx
	MeqptYTpUyHRU5QyIO1KDGVJMz3AOv/7lTh8GucBFwNjpf182OYU/oI0+xhdIJMezZOD
	fTUty+fxGmRN7zX0wQAVEftr50hX8kseRLKP5r+ZcIx79Us4c0XxwWcxlrTgyrJOw07K
	Q1+IVm5JovADlthjJn8ltM9nkrigrbK8x2q13A/odxk1+YtqXPte85Su4o4s/YRXch51
	9S1A==
X-Gm-Message-State: AIVw113AGDIo8V5oRJ7NmU8pwAVcb0LGwLc5yb9w54pQ/jayRxD10b7z
	9/cfpL5kplDj+nssfm5mphOU/diBch+L
X-Received: by 10.200.59.74 with SMTP id r10mr3587042qtf.162.1499688775544;
	Mon, 10 Jul 2017 05:12:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 10 Jul 2017 05:12:35 -0700 (PDT)
In-Reply-To: <c5c0b5ea6f1706acd5966c32ef03d8d88a54171a.1499520469.git.raj.khem@gmail.com>
References: <cover.1499520469.git.raj.khem@gmail.com>
	<c5c0b5ea6f1706acd5966c32ef03d8d88a54171a.1499520469.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Jul 2017 13:12:35 +0100
Message-ID: <CAJTo0LbOPpCmOLoVnS5iWT-4=SjCyCSBQntfFFR1ZWwCxeZt7w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/10] glibc: Upgrade to 2.25.90
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
X-List-Received-Date: Mon, 10 Jul 2017 12:12:56 -0000
Content-Type: multipart/alternative; boundary="f403045e6be2bdad8d0553f58060"

--f403045e6be2bdad8d0553f58060
Content-Type: text/plain; charset="UTF-8"

On 8 July 2017 at 14:34, Khem Raj <raj.khem@gmail.com> wrote:

> +SRCREV_localedef ?= "51e945a8f950a6695754b11c1e6fba8bb750e100"
>

ERROR: cross-localedef-native-2.25.90-r0 do_fetch: Fetcher failure: Unable
to find revision 51e945a8f950a6695754b11c1e6fba8bb750e100 in branch master
even from upstream

Did you push?

Ross

--f403045e6be2bdad8d0553f58060
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 July 2017 at 14:34, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex"><div id=3D"gmail-:1fj" class=3D"gmail-a3s gmail-aXjC=
H gmail-m15d22699499e42bc">+SRCREV_localedef ?=3D &quot;<wbr>51e945a8f950a6=
695754b11c1e6fba<wbr>8bb750e100&quot;<br></div></blockquote></div><br>ERROR=
: cross-localedef-native-2.25.90-r0 do_fetch: Fetcher failure: Unable to fi=
nd revision 51e945a8f950a6695754b11c1e6fba8bb750e100 in branch master even =
from upstream<br></div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Did you push?</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--f403045e6be2bdad8d0553f58060--

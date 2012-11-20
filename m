Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TarI1-00078o-1B
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 18:07:20 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Nov 2012 08:53:05 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so31342589oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 08:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=Ss4aVIKH4wxRazHmcSaaAEQPEp2LvPaQf6FweMZj1DM=;
	b=SyQLO5gJksdrLylly9t+qod3XA+t1KhxWc/JJu61/cR6fpZg1RaM2H8vjwVmpuVVCR
	biPvVJkGw+xN400/fkmdMd+2gBgUEn+yFrSgJi1cMZl9N6M0gbLdFwWsnG5tALxrIaFk
	XMpW8Hp/tw7y3vbj3LINv86/o21ntxPQYwYkAr21MuDBvfMtquZRyrtAXqc6AwSPT0O/
	5jB5gboDRAwf9e9Ek45MIM//rCRQLgvvFsvlAPn9rPJ9UYkyfZkU13YUN3FCSYkh8xqW
	esshMUUYfFWLCCQMboSooeZG49XyiwHVCkZqMDjidSDe6SM3XUOAp5wP24v3Do+MK4r8
	wM4Q==
Received: by 10.50.87.199 with SMTP id ba7mr10867596igb.6.1353430374269;
	Tue, 20 Nov 2012 08:52:54 -0800 (PST)
Received: by 10.50.87.199 with SMTP id ba7mr10867585igb.6.1353430374087; Tue,
	20 Nov 2012 08:52:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.58.197 with HTTP; Tue, 20 Nov 2012 08:52:31 -0800 (PST)
In-Reply-To: <CAJTo0LbCB2K2wfbMF2sb=qosAYheFNc2zncOFfZqoj7c7eBDvw@mail.gmail.com>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<5085800A.4060600@r-finger.com>
	<CAPj87rOXzZ5EwKYCrBnYtYAQo3cUyXtXyyDSh2nKh05Gy=uY9A@mail.gmail.com>
	<50865733.40007@r-finger.com>
	<CAPj87rOZokkPT_a7kbaqmai2bWwV5xLL8oV2UNOfoxkARHfwCg@mail.gmail.com>
	<50866812.10408@r-finger.com>
	<CAJTo0LbCB2K2wfbMF2sb=qosAYheFNc2zncOFfZqoj7c7eBDvw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Nov 2012 16:52:31 +0000
Message-ID: <CAJTo0LYbJPG57e-gyE83Sx6f64LS=QqnJ2f_0WnGRpD+HkzomA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmLwlwS878noc9QJ8LZ0RgB6VJtfdrU7p+gIKWqay8sIZNErlSSeVASlpOThkRNQe9OEPP9Rd5n3pOwFcav4YMlgt4nRTqP24eFO5eh0cQAj+aS6+QvEfT/b/JFZIDpVJKHFryGbKmLt316vowNoDV5eAFwg2oqyI+GZPLwlbMGMQU/PZj7PvPdB28lWu5tIXMmUmbI
Subject: Re: [RFC] OpenGL packaging/staging policy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Nov 2012 17:07:21 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

In case anyone didn't notice, Mesa in oe-core just renamed the binary
packages to libgl-mesa etc, and enabled EGL/GLES on all platforms.
Hopefully there isn't any fallout (there are
replaces/conflicts/provides in place) but if you maintain a GL recipe,
please consider adopting a similar naming scheme.

Ross



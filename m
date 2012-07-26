Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SuLPF-0004rd-Sx
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 12:34:58 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2012 03:23:25 -0700
Received: by yhpp61 with SMTP id p61so1605094yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 03:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=IxBF1OWVs1dV6WKnqOKA0WbLX221K4zchbRsYqPJrOE=;
	b=osnw+KqRhfhGsjcPNPIHzfsQ1phpygpEOKwwLyuJiuipXwE0x5iXaoFuo9XqQR1+Wt
	C5vTK7HoERBgaGWqvenG6To6LpQVQjshVZyxiF3LYx7PPmKjP50Nb6tAQ6Kl1NvXF+CJ
	kk8tDZJnDjJNrqz1oYyMVjHRmhlfeuisvNiWp26mY+LbrRMea1ytY31rdtQcYd9JtPpn
	IAH8rpzXaE6EGdmB0tS87jRTPfa4hjAArihY4xNBNrqLXF1f3RfS4KhTzgwEsYIr9V32
	PvhAewsx8pClwwMGMiHMvQ3uar+I4dhILETH1BxS8UsOZvKPSLq0jk6F7/VjOMuEcB5t
	6xGA==
Received: by 10.60.21.103 with SMTP id u7mr40221754oee.49.1343298204789; Thu,
	26 Jul 2012 03:23:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.33.4 with HTTP; Thu, 26 Jul 2012 03:23:03 -0700 (PDT)
In-Reply-To: <446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
	<F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
	<50110B50.3030900@intel.com>
	<446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jul 2012 11:23:03 +0100
Message-ID: <CAJTo0LZOq=8kZVZoebfMTauCb=zcdm2ORbq5M4O-GWKETtHJ_Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQngQHqSZoq0C7kLJDFi1ZbbDVC0sz+Hwf9SnqOtmRFnrIHJX2LaV6uAnUMD56fCChO8+4J8
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 10:34:58 -0000
Content-Type: text/plain; charset=UTF-8

On 26 July 2012 10:51, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> What's the point of PROVIDES += dbus-x11, it build fine without it (I'm not questioning the correctness of this, just want to understand the need for it).
>
> This morning you said:
>
> "it does not build, it complains about nothing providing dbus-x11"
>
> That's what the PROVIDES is for.

Without seeing the logs, I expect the error was when building the
image.  Nothing will build-depend on dbus-x11 because it isn't a
source package.

Radu, as a follow-up patch please remove all instances of dbus-x11,
replacing with dbus if required.

Ross



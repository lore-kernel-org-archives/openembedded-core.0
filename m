Received: from mail-vb0-f54.google.com ([209.85.212.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVJS2-0004kd-FI
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 12:30:56 +0200
Received: by mail-vb0-f54.google.com with SMTP id w16so2524512vbf.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 03:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=+80y0+Ah8Uo9rRU7+hHK6soXxuUjYoPJ+WgGAkfnyw0=;
	b=Ia1JVky+FO8RPoS6AwuI6Gv4rgfsTwOHBqcDWIKQ6JAz2FhlUHZUitew07HKSzNcik
	cEGsLuwEQihSPGEUAaZVOQCEdTh2XxSY1jtZUVMYV3ML3oruw91Vxvq5ocvKKa6+6bKo
	pyrAh0ApsZ57aU2Bt3w5EQlfxxJQH1tLM6wc6Qbtgw8lkRGzKW1J5jw7V8buLgkamjef
	BI3vLJEX+Te907YQAK7f/Aelx64XcM+r/d0P0QbbCF3iGALW7P20YkwJP6fxRREYdA1x
	M11lyla4dfiUQJ+k8qoWaFq5iwqzjjCFe07xfLjzOoEKOIIUkn7I3RzRP3SDeQrfCfeW
	Za3w==
X-Received: by 10.52.18.206 with SMTP id y14mr11679506vdd.29.1366884790972;
	Thu, 25 Apr 2013 03:13:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Thu, 25 Apr 2013 03:12:50 -0700 (PDT)
In-Reply-To: <1366882349-22368-1-git-send-email-koen@dominion.thruhere.net>
References: <1366882349-22368-1-git-send-email-koen@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Apr 2013 11:12:50 +0100
Message-ID: <CAJTo0LbGvgEg_V8ZqskPCsOqn9koSDW94FAOQ_RdPpiPKEOMfA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkcya4eRd59d8GTwZE9e4lLHt7F22AQ8iQLv0nsq1ayIIF6OKNIrANShcYgiWHtzuvAE0ID
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins-gl: make it work for both openGL and openGL ESv2
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
X-List-Received-Date: Thu, 25 Apr 2013 10:31:01 -0000
Content-Type: text/plain; charset=UTF-8

On 25 April 2013 10:32, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg"
> +DEPENDS += "gst-plugins-base"

This "jpeg" dependency disappeared, was this intentional?

Ross



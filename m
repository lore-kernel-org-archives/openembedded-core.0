Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UdIYh-0006mm-G9
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 13:10:50 +0200
Received: by mail-vc0-f180.google.com with SMTP id gd11so3503729vcb.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 03:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=RsH1j6Hqz7QzpOvIjsZ0D7N3cCbcJl2G5R2eK6TLIVE=;
	b=moqoYJTvYyig5aqm6VvU7XhPGUMKoQ/4y9cYHbyUUem9qFWIEPcuN9xNvxFAxy4ASk
	oSvVAnqCO+j4fEcz96W84gg+jNRHjtLYWSYfHoZW+vHrVNLhD4AKnvhGr61Cp0YHq1N6
	bjRvm/W+5MJS3V3LWGksjcerNH+wRNuYLblqnl17t38as8vTiV6ALudehDGCefI+H8Lx
	1p1d3JYnokN7BXMH/d1zKEAT8PBpIkr0BmA62XWIUuJ7TjDEzawYpFqHEi5M8ZhDoMli
	Xn+dcyRwuvTCPl2mg390voLX+0BRK+2wBdaMPWUZtM5TY+ZT0ihmqlJxkjzA9FO9CsSV
	PQdw==
X-Received: by 10.52.26.140 with SMTP id l12mr7069198vdg.29.1368787951688;
	Fri, 17 May 2013 03:52:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Fri, 17 May 2013 03:52:11 -0700 (PDT)
In-Reply-To: <1368786726-32071-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
References: <1368786726-32071-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 May 2013 11:52:11 +0100
Message-ID: <CAJTo0LaQjm-EukLTCYCMqCXT426L9qGJ69WoQ1NgacthBBecgA@mail.gmail.com>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
X-Gm-Message-State: ALoCoQlQRpUKSgh1T7CnqUpGlMq177oZFR/18xXJ8BGVuPDAINCDvByou+bMTYf2GyFx8QB2iNV/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman-gnome: fixed DHCP segfault
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
X-List-Received-Date: Fri, 17 May 2013 11:11:04 -0000
Content-Type: text/plain; charset=UTF-8

On 17 May 2013 11:32, Emilia Ciobanu
<emilia.maria.silvia.ciobanu@intel.com> wrote:
> +-      if (g_str_equal(ipv4_config.method, "dhcp") == TRUE)
> ++      if (!ipv4_config.method || g_str_equal(ipv4_config.method, "dhcp") == TRUE)

Is this really the right behaviour if IPv4.Method isn't set?

Ross



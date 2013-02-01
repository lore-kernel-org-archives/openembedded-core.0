Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1FbP-0006PQ-W7
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 13:20:20 +0100
Received: from mail-qc0-f198.google.com ([209.85.216.198])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 04:04:34 -0800
Received: by mail-qc0-f198.google.com with SMTP id l35so5260966qco.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 04:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=IJtLKbv7LfeD9qDvOHG6GjX7P1Z1DKAaO6+tw7we/LQ=;
	b=ol4yN4Mtf4jxWpFp0cmVPnCDYOIuxUrVLvIAIZrgSNUyDhPzP6T1igJ2gvFCdJ1cI4
	aXgyEBl1UP7A0Zz9Y4z//PI959ISFm1OmgEpJnsieN8Ro2bTTLlyF7lMQino428xDPER
	ljpU8DxWOib0m/FQNL+m95j8It5vfRwZRKczX2Tmhpd7bP7ODqZHOWJDmBZyqFdypHYp
	8+A7rkOhXP9aHAhwg5ez2sOKDQ9B57i02J5Mrltt+Mtcm8VqWr+2e72/2xCmIAFvdj8f
	oDkf7OJDCMZWtpa7N4mBWf6GsYs3uTkKExENOYe1FCuGuHXi+9VmLEFSQ+OVZjb64WxN
	J4qg==
X-Received: by 10.220.106.133 with SMTP id x5mr10879420vco.61.1359720273866;
	Fri, 01 Feb 2013 04:04:33 -0800 (PST)
X-Received: by 10.220.106.133 with SMTP id x5mr10879416vco.61.1359720273781;
	Fri, 01 Feb 2013 04:04:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 1 Feb 2013 04:04:13 -0800 (PST)
In-Reply-To: <1359718670-20670-1-git-send-email-radu.moisan@intel.com>
References: <1359718670-20670-1-git-send-email-radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2013 12:04:13 +0000
Message-ID: <CAJTo0LakPa7UnW-sC48ftq2hcOfjP4t1cDQd=3J-uVaEqubD+g@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQmQSv25Yf0RuyDHaR6O9Pi0+6NcB0jIjLbCOKoiCLJCmBhdwfmh4tAunYcMMoNpGUCtA8Fd+xU59ilO3pGi0diP5bF+BZwS1soMGLkWQ8Evc1L9cpRD6kTDuE9XirS/ghYKYGqmBTE7aly8Jo/vShcro9OINJwuZaZuFQRJTVDNe5gYtZI2Ij1MXVM90xn+UIMZ02JQ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] polkit: Enable systemd support
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
X-List-Received-Date: Fri, 01 Feb 2013 12:20:35 -0000
Content-Type: text/plain; charset=UTF-8

On 1 February 2013 11:37, Radu Moisan <radu.moisan@intel.com> wrote:
> By default the polkit will autodetect if systemd is available
> and setup the configuraton accordingly, potentially
> contaminating sstate.
> In this patch systemd is explicitly enabled/disabled.
> When enabled, polkit will use systemd for session tarcking,
> otherwise it will use ConsoleKit.
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Ross Burton <ross.burton@intel.com>

Ross



Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ty4yD-0000Qs-UD
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 19:22:51 +0100
Received: from mail-qa0-f71.google.com ([209.85.216.71])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 23 Jan 2013 10:07:12 -0800
Received: by mail-qa0-f71.google.com with SMTP id i20so1738741qad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 10:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=e10udhl6iMm6wlJvh6RhMQZISF2PEpIBSKydSkS1T6M=;
	b=iwmVGW7wGU2Ndi/+BPw3kbqYoeisuqU4EDLfdeeV5rw+I69Rjfdq04xcJQPOIT/MsC
	497SPAPiaJxuSGK7IvWFFc7To0k1Y6LcX9wg0CwSQ0//eb6TodpoBkbEWLnLzvw3ns1A
	KgRTbueC06Yfmdb5vZUXC6vu7gUQG85fKudoM+U1d6RWxB+eb0CE3suoy8m7o18LFA03
	taY4/StEWIPTWoyvDph7OadhApvJmgBKQfXnclEX9Dnnp/soVgCfJOok6VUEX23J+zVo
	3pCHf6irpvztl/JXuE1vEY1xi4txqmtTEYL6By61ENqa2athtNxecDGUMNgF1oVppnM8
	W5cw==
X-Received: by 10.52.177.195 with SMTP id cs3mr2032068vdc.115.1358964431181;
	Wed, 23 Jan 2013 10:07:11 -0800 (PST)
X-Received: by 10.52.177.195 with SMTP id cs3mr2032059vdc.115.1358964431104;
	Wed, 23 Jan 2013 10:07:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Wed, 23 Jan 2013 10:06:51 -0800 (PST)
In-Reply-To: <5100172F.8030001@linaro.org>
References: <1358958255-16099-1-git-send-email-ross.burton@intel.com>
	<5100172F.8030001@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Jan 2013 18:06:51 +0000
Message-ID: <CAJTo0LZzG2dDn+JxpPT7oH=2Z5bdQBAcZvmgMUxAjvWqSGr=Eg@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Gm-Message-State: ALoCoQlp/eMTVcC5mhaZlyp1n19H6+R6+ZbllCKpoJHPFKXZT+390dit+lDXtlQ/IWjLwS/fsOQyBCOfbmMxzyFmcQMt43vMeWt43/rABGBKG797N70xo5hDj83P32lTJHjNxKjJuoV9j4dt495qW/2k/niNuyXGD4hytNIVSYLvv92ps+XEGiaGxSjf0QxM4ERqGjYXP4VJ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta: remove all mention of PCMCIA_MANAGER
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
X-List-Received-Date: Wed, 23 Jan 2013 18:22:52 -0000
X-List-Received-Date: Wed, 23 Jan 2013 18:22:52 -0000
Content-Type: text/plain; charset=UTF-8

On 23 January 2013 17:00, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> OMG... it was so long time ago... pcmciautils started with 2.6.13-rc1
> kernel. Ah those first months when I had to deal with OZ users which
> noticed that their Prism2 cards no longer connect to WPA networks...
>
> My first kernel submissions, then my first accepted ones. At one moment
> I even wrote script which converted 'pccardctl ident' output into kernel
> source lines.
>
> Definitely PCMCIA_MANAGER has to die.

I apologise if I'm digging up many repressed memories and you can't
sleep tonight!

Ross



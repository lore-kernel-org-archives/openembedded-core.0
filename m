Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id CDAA172FFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 15:58:07 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 1so4984890pgz.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 07:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=KzeykTXYtP6XbIG6nLAS2wxOi43Lv3YvUtZQ6BEvkXs=;
	b=CMk+TkKE1GeGWV2rMuvwWnyARcTGugM7z6lwcoqYCYluvqnLuPVTU9bBlSm434/zZf
	mrFQQVKcpQ6ads5q5IXvgi2xPEwSvcADohwmYUnu+d44HSrhPd5dM7ApganxwDhYc587
	xnAPM1kF0SDjBxYDSQye5ORazgcp9RZEe1AUdjTTtiwwPg3HbV/enkqFyUXDaaMIEOTi
	z/vJyEA7Li1XfGwgKQTQthYmPcvD+Wxlnda6Vi3iufBgyO+YuvphAwgUZsKyQTIqzV93
	mCelOEAGupCsiZci146yPXjWjjoyQkcwz1XyFYv/LGvWak9ICRrUpZtrEUxtHDf8sv9M
	sr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=KzeykTXYtP6XbIG6nLAS2wxOi43Lv3YvUtZQ6BEvkXs=;
	b=Dq4oIj9mn7S8uSIaeVXp+QVX8NmgZxmE8w+L0y3vG3nTnOMsmYftpIQ6Uk+IPwc9pn
	TC9MTP+zVGyHVpe2rGYIpEw4yOO0wwKb/a21VEdWNHYuULatQ3bY4llYDwQjCBG5dV3z
	Vq+oNqMDnrjSVu2jxnW8YNaEtkebqQeQg/97L90+0djdUI6/HdOMxSYWBMMYcxkd1LDU
	0CwMbUARpzHGbK83J+iNr7ntfMlJFyEp/LKrCjQYOOPeTv+p71engWonmSW2dN//q+1l
	JMFbKral7Wmay+3GOHO8iNow5KKXmXmWbdrirTFCDs/9fc4K56cRm0UrN827/jpvSbym
	G/gw==
X-Gm-Message-State: AMke39ntfbztnTVjCi8ug77WJu3zzriLzmwwEu9qSql4XdimeAD9XYXxf/pF3tC+S+n2qQ==
X-Received: by 10.84.214.9 with SMTP id h9mr54944325pli.65.1487865488531;
	Thu, 23 Feb 2017 07:58:08 -0800 (PST)
Received: from [10.11.10.242] ([67.23.202.154])
	by smtp.gmail.com with ESMTPSA id
	p73sm10643108pfj.47.2017.02.23.07.58.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Feb 2017 07:58:08 -0800 (PST)
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1487845460-27178-1-git-send-email-markus.lehtonen@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <9bbd49a0-b838-4342-43df-2bf3276c45ca@gmail.com>
Date: Thu, 23 Feb 2017 07:58:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487845460-27178-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: Re: [PATCH 0/3] Fix rpm signing with GPG v2.1
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
X-List-Received-Date: Thu, 23 Feb 2017 15:58:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Markus,


On 02/23/2017 02:24 AM, Markus Lehtonen wrote:
> This patchset makes signing work with all versions of GPG.  Previously, rpm
> package signing in oe-core was not working with GPG v2.1 (which is becoming
> more widespread). This was caused by a change in passphrase dialogue handling
> of GPG.

Off hand, do you know if Morty would benefit from this?

- armin
>
> [YOCTO #11054]
>
> Markus Lehtonen (3):
>    rpm: support customizing gpg command line
>    lib/oe/gpg_sign: make gpg version a property of the signer
>    lib/oe/gpg_sign: fix rpm signing with gpg > 2.1
>
>   meta/lib/oe/gpg_sign.py                            | 12 +++---
>   .../0001-macros-add-_gpg_sign_cmd_extra_args.patch | 43 ++++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
>   3 files changed, 51 insertions(+), 5 deletions(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/0001-macros-add-_gpg_sign_cmd_extra_args.patch
>



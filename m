Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id D94F16160F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 10:35:25 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id jy13so4395286veb.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 03:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=++IzC4iUwfkRTOiGjf6QeNNdG3V6t6bc/sTKwWmF1Q4=;
	b=N3QwKA0MY5sXCJFMWXnFqGb5iQIP46WWofKhZntJqZHRrADQcsI9HxKqGZWl3/eLeZ
	dgdpfRWJfEhdYC4y5+6tD2Xp3kKwuoKY1V02fzN0HxviHWO3JTns98B7UA0F58Y+SQJp
	j/VyzZR76b6ROYxjQD/7ULIT4HGm2hpremuYzx6FmrBWlCk4vKTCckVCm3lVZKUU8SX5
	jSburOHisMUZrsilz0n1E2sueyjpmGGNmMIMMeR0/IhKXQKVYk69iZL7ZoLvOrYVNdPo
	y3mg9sQHdkvsaPvlaaPaauuMIm+2HObDcrbWmr2qQTG1K6wTdQtqXpmGhc4b3LDhR5Me
	Sa4w==
X-Gm-Message-State: ALoCoQnrV6o9m4OYEw3nGbDbMYHrICJZ0Vb5jBd2KiW8g2cJrkSjM2HDX7ygHMtuoGmIA2+/BD/H
X-Received: by 10.58.201.69 with SMTP id jy5mr119017vec.29.1378809327016; Tue,
	10 Sep 2013 03:35:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 10 Sep 2013 03:35:05 -0700 (PDT)
In-Reply-To: <CAFyqS9pEJziMZx-p_u7OVKMV+dOeBcw2F2MOMqvgaP9Y=JWBaA@mail.gmail.com>
References: <CAFyqS9qQR+YQj8tKWHJxOc=9Ti34gM4DFjxaoJi9cVbnDWzLAA@mail.gmail.com>
	<CAFyqS9pEJziMZx-p_u7OVKMV+dOeBcw2F2MOMqvgaP9Y=JWBaA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Sep 2013 11:35:05 +0100
Message-ID: <CAJTo0LbD0YASWjyrNWREjs9kFZpizPK3mvgemsMDFmWEg=8m=A@mail.gmail.com>
To: =?UTF-8?Q?Hans_Beck=C3=A9rus?= <hans.beckerus@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libtool: fix resolve of variable lt_sysroot
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
X-List-Received-Date: Tue, 10 Sep 2013 10:35:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 September 2013 11:17, Hans Beck=C3=A9rus <hans.beckerus@gmail.com> wr=
ote:
> The patch is still getting corrupted by the mail client :( It looks ok
> before sending but after it has been sent lines seems to get split in
> a bad way! I can not use the sendmail function due to access
> restrictions so unless I can not solve that I will have to drop this
> patch.

Worst case, you can push your oe-core/poky repository to github and
post the URL to the commit here.

Ross


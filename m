Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3B76E660
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 16:14:31 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id y207-v6so28166748oie.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 09:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f/Pn/LKsUjNNNbU1JuZ2oqUaO6b7kZBPhFLNM3jNHy0=;
	b=iW7vV4ytfYaoCuzAFcu5ENEYBzhuUM2KdjrTzTHQzym2DmQlOck72Tix56EF9Gc61p
	K4rYLf1RMemnr7XPFNYrUlePbR6pSIiPhg7QZ4PSCYE2/u0n9IxHlomA5kn0MgffVIAP
	QdkhBKwFDbMZWKkKzmdK9Xhg3iSapnChYvrXFyEf6Kz8Kg97UvCBoXOFp285Mv2l/g0C
	FBhYVEhq4YKd65aO52mSyQHfPnDwP/UZa/jr64FOMR8jrHEiwn2yzVxmPAKXKPQXpf3X
	Sq3sJE7nmyG6ZGZ54s9uAEFITavwNznWzoHMSM30xdEbpKR9qjwGikNKgME6yOl6DLAq
	8uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f/Pn/LKsUjNNNbU1JuZ2oqUaO6b7kZBPhFLNM3jNHy0=;
	b=dgLRkSvOXb0oroC+9/53z5AHA62mNH1rztiqXLfS/o/Sr/dqvdQLoq6/aVST8bPpa7
	EQX8q1BzgsiCvPKeZwF6loPFEfUgGit/O9napgjOPrMIz2efBK+Occ7VuH40flXYEwSH
	rFbOgxvQUzG5a9OsMmEaLFT6fNGLt0XB9dxZfNJcJA6zN2s7RPShaajs8KxX/oLZgbGz
	l9O7DkY2R1fmP1mKQVDPT6AdeAmYzqILVU5TSpsqhhD+E3mYXnAA4Ds4PLuBb0JfXoo7
	fA1LzcKB1NDgVuCbqW4OarPzQGu4sq0Xy6ME/qYAVuJUxPuLskHf16SI//Yi3OUa3VR7
	8MGw==
X-Gm-Message-State: APzg51A1zYBJV4X/3okhvHwlUqjRbfRl+0hX0dYHCJIrQuYi0hN+M1kL
	NpRauErLKyYd7J7AUWQV7M9X1wllWFTOtv++MQofx+2/iQw=
X-Google-Smtp-Source: ANB0VdaAug6G8wPmrru9IAbMoCEoTUVt6P8ANnjgYEC28YEV/KLoacydBLZ/1pQvfkc6GGUf/2YD1D1XOMcLn0xXswk=
X-Received: by 2002:aca:a04:: with SMTP id 4-v6mr9067792oik.203.1536336872614; 
	Fri, 07 Sep 2018 09:14:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:385d:0:0:0:0:0 with HTTP;
	Fri, 7 Sep 2018 09:14:12 -0700 (PDT)
In-Reply-To: <d0ae484bdd20a9c83a7f802447ab46f3c9fe6373.1536336171.git.raj.khem@gmail.com>
References: <cover.1536336171.git.raj.khem@gmail.com>
	<d0ae484bdd20a9c83a7f802447ab46f3c9fe6373.1536336171.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Sep 2018 17:14:12 +0100
Message-ID: <CAJTo0LZoUY=94dH_pwpOU8c+JQ4BJMXpgEmHcO8V-60Voxu71g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sysprof: Fix build with clang
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
X-List-Received-Date: Fri, 07 Sep 2018 16:14:31 -0000
Content-Type: text/plain; charset="UTF-8"

On 7 September 2018 at 17:03, Khem Raj <raj.khem@gmail.com> wrote:
> +Upstream-Status: Pending

Make that Submitted: https://gitlab.gnome.org/GNOME/sysprof/merge_requests/6

Ross


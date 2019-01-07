Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id DF1017BE94
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 17:56:05 +0000 (UTC)
Received: by mail-it1-f180.google.com with SMTP id h65so2272956ith.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 09:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Eln+JHoVHA4nnUrsjRv1i0Tcj8K0dwgOmVV6Zlu4rfE=;
	b=rAIu/neppM8jgJogAEleuqNQ5LmP1fflI69ADKgtD31wm9KydejhNcqLy7e+euVnt9
	Z0IM/5pZxyzLYC22ccEGOtcexCqXbgspA8XN33wmoxzMsQ3YFl1zqOnCYix6ipFrZlqY
	lHPrjaS44POcqKZFUvAvbXKb4yLs6R4Pu8fG9oYkkxtJ2t/+IKVr32KKa21lwlunSyEN
	fgpI0Ad4DAdJfZqNFRJVuub1K5zOX+/bGcazz+lDAPzdGJe4LOgE13BrFLUbWRay7/5+
	G/H4A0Gx+xaBeKMKUMroZov7DU93k0t2V6tooadxDaNg0dNxA0pBwhO0Q/JZ+Sq4zZrQ
	yoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Eln+JHoVHA4nnUrsjRv1i0Tcj8K0dwgOmVV6Zlu4rfE=;
	b=IeRw8GBt4hIIGb9tBl+3AyDXnheUYjFQ6oA7kerRqJoQg6K5Tzl9kNRIl3AB7VnXLg
	0T63HkuNbueOSYFIXTW+HIFdEn+j+bWFMdZ7HAFA9Usbo/mRyuMVs1UduZewW3pOP4/z
	d+IdLILD1zddAOx+OpIPCUHAne84CMFy+ymKyurtToXnlkVYK/alvU82lMZrTeVtO//k
	T2/Bs9lwuQSudTNc9VA72A7foyT8+6VvLy6HiW5SqXAsam8E0XY/Cz6kpur+a8KJTGj8
	tgEa7v75p6LzU71JoJCN3XbxZMqYZd/bVNWuC3QKCPJUKb0iz9cl0eXv4UPhDniwb94E
	W7hQ==
X-Gm-Message-State: AJcUuke3Rgco22zJhzm+gjPvvFCiGxgC3f0+ziY73xtia8d7awtqPvzg
	NW5gBW4iQoP0T8Ij/zixgBoiTxVSJkmgoikuj4scrQ==
X-Google-Smtp-Source: ALg8bN7zBJmn88bGasKTcp8dFFwkPjATvBo++08q3rJCGPqsOyxHSwmaz4BbCbcRRmxxcqIcqL69OXdpbuppN0SVgZE=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr4413919ite.26.1546883766980; 
	Mon, 07 Jan 2019 09:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-8-mkelly@xevo.com>
	<CAJTo0LY-16oCyFf-etweZq1P5=DpOtG8Qou0pQHMa0mZkXvPaA@mail.gmail.com>
	<db1d1175-3104-eb1f-a3ca-66c7c362aa4a@xevo.com>
In-Reply-To: <db1d1175-3104-eb1f-a3ca-66c7c362aa4a@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jan 2019 17:55:56 +0000
Message-ID: <CAJTo0La_G9H-unLAJKkf_EaTqt+AvONk8wNsOw66WVO3n6Gh6A@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 7/7] meson: enable nativesdk
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
X-List-Received-Date: Mon, 07 Jan 2019 17:56:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jan 2019 at 17:54, Martin Kelly <mkelly@xevo.com> wrote:
> Could you elaborate on exactly what is breaking, or do you have a link
> to the autobuilder breakage?
>
> To give a bit of background, cmake handles this by putting env vars
> directly into the wrapper script. However, meson does not support env
> vars in its cross toolchain file (and upstream is resistant to adding
> it), so we are left with generating paths at relocate time.

A multilib SDK has multiple environment scripts, and its only the
environment scripts that differs.  By the time I'd figured out what
the problem was I was close to solving it, so there's patches on the
list to solve this problem.

Ross


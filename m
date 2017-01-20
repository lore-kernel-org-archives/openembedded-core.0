Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B11E72002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:51:32 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id n19so6177420vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9MMZO6ipZGM8I5dSn8xSEhpsfNWzSfKWH3uvmwUbp/8=;
	b=vO/B3t1gdr0tpdlgzCCNrqslUAIY7Xib2NxTF9p41zEGjSlRKpaf8IixwXXy4xKuOy
	mwhoovm0XOhMP8RN6bqmfE28h4UQRLNvWpvOJMDvEC0642zTeL7muDIZZw4bgO12xZKD
	PryPhBaPZN3pWUUckJzGaXgSmfHg8a5Z9//l6b2d0qsfGWYTioKKieDU760TdhdlJz45
	IB4sPDpl2WSJSLRBG+wByVfynmQqtFXYQOc5U3MZ14E5xqiHbQoxGOmwT3YXmeOvLNfJ
	uac7A9HLJKBJ0dW8GQeBXQpjrQDL/FvpQtHRDd9Pc5PZzQjJNVhaeblTIkj5U5aNcF9m
	96VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9MMZO6ipZGM8I5dSn8xSEhpsfNWzSfKWH3uvmwUbp/8=;
	b=VtZA38js9kdKjE7qqqNb9Gt4fEh62JlOo4En9yAQJHDwbZPzm4FZ3Arvfy8PtsPbNb
	NhgykKwKH8I451v563JjlBDkyp03DLSRgFFB/CgdcosgNuPZoL8+DFfzjuEELo5dxPVT
	j4ibXmclUQuotHb1BpNXaR1sfYA42Z2wCUzn9wKGaCnMFpumYw6VnPcKHDSKArNNoRHH
	mCQnORfMojK3RqUXY9Zm1ppGMu4LTHl6ZFnrCFSk6KGzn2zn/ZR7fl0KUUu6o8YLO1F3
	sndInm/vBbDCmc7chqY0b+QwFa+HIkAi6cz6XhKu+7nKTcmY9Abiqwqwhb3A5kse6LE7
	qW9A==
X-Gm-Message-State: AIkVDXK6FO3Ln+itDxmQ6074sgl9gvjJRyZaSMdrFJrmNVsmIkdUVe/FwRU4iFLE8BtU8dwdzTyUwJtu5R5YHQ==
X-Received: by 10.31.36.151 with SMTP id k145mr7322657vkk.29.1484920292476;
	Fri, 20 Jan 2017 05:51:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Fri, 20 Jan 2017 05:51:32 -0800 (PST)
In-Reply-To: <CAJTo0LZ3kywd2HR7bNTburb-7Ef9z0kW+NCfXRJEdsb98taBgg@mail.gmail.com>
References: <1484505711-6341-1-git-send-email-juro.bystricky@intel.com>
	<CALbNGRS1L24_fJK3D14vacfRAKcxUfftR4BA8G8hxzHhuYgrFA@mail.gmail.com>
	<CAJTo0LZ3kywd2HR7bNTburb-7Ef9z0kW+NCfXRJEdsb98taBgg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 20 Jan 2017 14:51:32 +0100
Message-ID: <CALbNGRR6h4WCqsGRdL7MizdU=kjgB9hdYi-0jD_aoVD1M_d5zw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: require conf/multiconfig/${BB_CURRENT_MC}.conf
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
X-List-Received-Date: Fri, 20 Jan 2017 13:51:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2017 at 2:42 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 20 January 2017 at 13:36, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
> wrote:
>>
>> | ERROR: ParseError at
>>
>> /home/superandy/oe-core/sources/openembedded-core/meta/conf/bitbake.conf=
:704:
>> Could not include required file conf/multiconfig/${BB_CURRENT_MC}.conf
>
>
> The patch creates the file that it requires:
>
>  meta/conf/bitbake.conf             | 2 +-
>  meta/conf/multiconfig/default.conf | 0
>
> Did it really look for /multiconfig/default.conf or is the fact that the
> path is not expanded the problem here?  oe-core master needs bitbake from
> git, which has changed the behaviour for getVar() (expands by default).
>
> Ross
Ahh - I was missing latest bitbake. It sets BB_CURRENT_MC to 'default'
by default. Am back to build - thanks

Andreas


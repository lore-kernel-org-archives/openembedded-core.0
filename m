Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED19607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 09:39:52 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id c200so51733555wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 01:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=C9VDaEFJz5SXc1aQfymtA5/vohGQwoTCG9HY4Zxl5sM=;
	b=ABN+xYsHR7gCWdMi8m0+h9ZewJbD4b1EiIV/a6WXzSb5fB5Txm4ta+ARL34v3hGyMl
	v8eMyDMtPX39H7AoXFbRgULMupUJlfoYb0STE6+61Q0bpJnTVqli0EBC//5Rar2tLUka
	ArTUPG7cn9ENvVG8DGoZAtqsgdG+Xwy1uZfFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=C9VDaEFJz5SXc1aQfymtA5/vohGQwoTCG9HY4Zxl5sM=;
	b=DuF7O/Ny2+9HIOq2RxQEsBNHsq/sjp4f3DL+heyI1pLi/i+4xViAu2iPVXm7DIh5NL
	RVoZTyxIrS+wIGXfxXKLpUCLcJZeiPvELy57C3mjIUxlGwy4YAjWUIbyoGlS5wZ3DGJH
	GDE/bRowHT/H4k/JjQNiy88JMCzGK0xqxj3HrhUYfaG2jIe3qrhu5YNKMXU5ZqpFj2+E
	M69oBixGXT43HOvjwlKgnFtVwv1a0vA6GkO9aoXmus2sBdUoZsuKIGMPLRHJhlQHH1iv
	z17I2Qylc+/tyZXRNmEs0I3Wm+awtWOLobbl+SYo8/QJKP2TMw3v05fNSNKzMYJi0sFk
	YcBA==
X-Gm-Message-State: AG10YOSVLABoggbbkyM3UWlep0Y2cNWz5Vmjxl+XU9C+fxOrwBrp4fIdm8bX/G1I3ri5iodU3wJoKalx0jKDyHAN
X-Received: by 10.28.210.143 with SMTP id j137mr3605726wmg.13.1455010792732;
	Tue, 09 Feb 2016 01:39:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.206.33 with HTTP; Tue, 9 Feb 2016 01:39:33 -0800 (PST)
In-Reply-To: <b4d964e733159d37952d2f1f6f4d9bbdbad24979.1455008560.git.jussi.kukkonen@intel.com>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
	<aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
	<b4d964e733159d37952d2f1f6f4d9bbdbad24979.1455008560.git.jussi.kukkonen@intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 9 Feb 2016 10:39:33 +0100
Message-ID: <CAP71WjxybQ+N3N-+pOzLo7jQdJ=F0TVwVEoFihAn_96TG-q=7g@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] xserver-xorg: Add PACKAGECONFIG for crypto libraries
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
X-List-Received-Date: Tue, 09 Feb 2016 09:39:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 9, 2016 at 10:24 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> Default to libcrypto (openssl) as before.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

Looks good to me. this is the same implementation I used in the mesa
patch.. so we need to make sure that any review feedback is applied to
both before merging the too, should we get any review feedback.. but
in any case:

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>


Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 12BA87CBA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 20:28:27 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z19so46155018otm.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lVFX8lBDn8AMfM7NYpO5jpbreEeT5e3nkTU1j4uq7mo=;
	b=VuYkGj4JhU13AqnVYsAHEBSqyG4XwZK9NjrbJz4kzWnneFOvFKCurpwJw8+D9YMLPt
	bzkYhPAqkivtZAse+k70Ptr+v63Ai8b5BCBu/K/8v6dm1iYXMqec6s+4nSXIjpn5tEZ+
	NqUlKdg/l+RO8m8dcZg5er47V6yi+5ewlD3f90wBFbCxZqd2RsGQCaCBjrJMHj57yAAp
	g5Dwb5nJkYux3ZxaffEeJGeJCkujdKcau8HigbYjcXKRt2StrBRHFp1Ih4AudlrFObru
	9tTn/fKyjCP7ZB5XNNtUbgnHkR3kWftbq6XLmw+8wA4tY5sHSZZfqoQOpdLn8EjmQeQ6
	Ya8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lVFX8lBDn8AMfM7NYpO5jpbreEeT5e3nkTU1j4uq7mo=;
	b=AEki4tTx2fDaeBBVjR+nHxYACFyL9/ztKeMn3YsxoJ2PYIVsbSMLW/HD20Jex+KsXR
	B/OKuTRSu4kiDpVBvrx6ziMLXIvzZIOqWGZ5fT0xaBW9KkZpZgsftXbrmuoiTPW0kbjP
	+jZbqtH3rqQXyHs4TZV/lL1xVeEatFy+2AcG7SGCAyUX/R7SPrO9AnXuZ5wezq2Cf2cL
	clTfQ0G9k//ZzOZK0k3Z1DJVrtzxeNr1/HCpgO4ZJ/lrDNZWzj531FqfHzKV+fZVd2mC
	IXREFIQFTzKckv1Nkm2Ewdoi9lndLfZS5Ex6uwIA+NSS2Z6oHYKck4nFqRK0nA5TVEO8
	9Yag==
X-Gm-Message-State: AHQUAubMx+K6u6YhRSYq7rhBKYVOa2yAefYOsgX5MLxo3VYNQ7WCySmi
	yuBMyULVw/i5AvBEFebNrIjHNqYlNsl05MFVxeY=
X-Google-Smtp-Source: AHgI3Ibd/1SioNeExbaKJk34KQ7Wm8KeC+fSX91sFX3I/paoXTXUdpC07YlubTqekjebos1p6xd9YlRtVN59Bwa2fiE=
X-Received: by 2002:a9d:4c85:: with SMTP id m5mr250529otf.367.1550780908983;
	Thu, 21 Feb 2019 12:28:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550779769.git.tanuk@iki.fi>
In-Reply-To: <cover.1550779769.git.tanuk@iki.fi>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Feb 2019 21:28:16 +0100
Message-ID: <CANNYZj90S9_U-_6Qh0_vCG4cQEc5StRcdb1AdRNmr1BwCjRYqA@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] alsa recipe updates
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
X-List-Received-Date: Thu, 21 Feb 2019 20:28:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Feb 2019 at 21:13, Tanu Kaskinen <tanuk@iki.fi> wrote:
> Changes in v2:
>  - More reliable SRC_URIs.
>
>
> Tanu Kaskinen (3):
>   alsa-lib: 1.1.6 -> 1.1.8
>   alsa-plugins: 1.1.6 -> 1.1.8
>   alsa-utils: 1.1.6 -> 1.1.8
>
>  .../{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}  |  6 +-
>  ...plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} | 86 +++++++++++++++++--
>  ...s_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
>  ...lsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} | 14 ++-
>  .../recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb |  2 +-

I guess alsa-tools should also get an updated SRC_URI, even without a
version upgrade for now?

Alex


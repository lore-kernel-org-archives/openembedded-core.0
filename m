Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9162178745
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:48:49 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id 37so17182751otv.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 07:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=wEl1Hlph40o8b5MIaLve7+QWgj5S2hQueQY28ZaPRbM=;
	b=csPf968N3ULjSnBfNO5YjilhPmQ5HaqoLZvy52qiGnbcTbA10IWNVxTkV9euw5WJ2G
	kuUGwcvXB47qlQfQJ1276ueu7FplQ8whixaXSfxnpBRbRYc5gU2XZpbGPWcbfErWZQUa
	Srvz2q0tiyG8KdKIevD3G1/IvdOrYtHM7bXnRPFGgpFvnxbOvCidu82oniIjp8vynv1M
	COtybsR5UvgtRiIGTj+nSUtN3sh3iVX1SCmdNl179qkYV0HVY7HyB6LiEzNZM62/I5fd
	4PfIxIFJy2WvSCIUuPJIn4YPXiucDXbfk7U0is8b5qwI60UtgPR1HY5FrSvQVUxDZq0r
	ZGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=wEl1Hlph40o8b5MIaLve7+QWgj5S2hQueQY28ZaPRbM=;
	b=Vwf9GrdNAE72rRWrANs00Zr4v/bCatOnL3CRZNdP9U+aG+Y4iH5BfW0o7dfGWwBVmv
	8awIcAAm8eTTj2BXeLXK2RoS8ptaK9JgcmHlkmfftWYLnTr0PjX3MgE5DFtr/Cvx7hg7
	QkageZLk8uPTwUnW8hYSPyxh9aP1I/wFzDmKnWfJI3UOlk37lZt+cuaHzVtQVeJ/acaf
	QAwX9vXZUHQZLLFq8l1Ojn4wVs1mPGt/E+s//Z+g8qeCdtcPk57g/PwcIyAU/ncceYoC
	L39NYNZHmBZTKasWPyRj5q74C9dEjXl3/e0XCtpDcBukivUf14dUy66W6VRLpgdNkHLO
	nwoA==
X-Gm-Message-State: AKwxytcAN4sMo3+7EQi0pYoEwD8nuXFVrCBIqe3PaMFkhtqCSJWzaXDY
	hvUTt25xbSNHZ3KHKoec8r8u3dwn
X-Google-Smtp-Source: ACJfBotdqLyPfyAq5HTw2DtY2pTluaBZW+uGmFZTZ+yAECb56BmMbth9hUNZM9xSHXklnQ5n8W+w1w==
X-Received: by 10.157.3.39 with SMTP id 36mr1495582otv.322.1516204130186;
	Wed, 17 Jan 2018 07:48:50 -0800 (PST)
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com.
	[74.125.82.172]) by smtp.gmail.com with ESMTPSA id
	j24sm2421016otb.53.2018.01.17.07.48.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 07:48:48 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f172.google.com with SMTP id x15so17208371ote.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 07:48:48 -0800 (PST)
X-Received: by 10.157.37.8 with SMTP id k8mr1457716otb.392.1516204128079; Wed,
	17 Jan 2018 07:48:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Wed, 17 Jan 2018 07:48:47 -0800 (PST)
In-Reply-To: <CAJTo0LasphGec2rDe0COg0JsETHjvia1f+Fg8KK6YNec7f1n8Q@mail.gmail.com>
References: <20180117132107.3599-1-otavio@ossystems.com.br>
	<20180117132107.3599-3-otavio@ossystems.com.br>
	<f1ba6a43-33ec-4f5d-dfcf-950ac40a8dab@linux.intel.com>
	<CAJTo0LasphGec2rDe0COg0JsETHjvia1f+Fg8KK6YNec7f1n8Q@mail.gmail.com>
Date: Wed, 17 Jan 2018 13:48:47 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqyXakFMg+G2oD7ptHZr8YU4fhYoR27efO9+ejhGHG=og@mail.gmail.com>
Message-ID: <CAP9ODKqyXakFMg+G2oD7ptHZr8YU4fhYoR27efO9+ejhGHG=og@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] cmake: upgrade 3.9.5 -> 3.10.1
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
X-List-Received-Date: Wed, 17 Jan 2018 15:48:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 12:25 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 17 January 2018 at 14:21, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>>
>> On 01/17/2018 03:21 PM, Otavio Salvador wrote:
>>>
>>>   ...make-native_3.9.5.bb => cmake-native_3.10.1.bb} |   0
>>>   .../cmake/{cmake_3.9.5.bb => cmake_3.10.1.bb}      |   2 +-
>>
>>
>> Can you look into merging the -native recipe into the main recipe? Is
>> there still a particular reason why they're separate? (I'm sure there was
>> some historical one :)
>
>
> It's not very simple as cmake builds using cmake, so the native recipe is a
> bootstrap.

I will later merge the .inc on the ${PV} one and make the native to
reuse the original. But this is another patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


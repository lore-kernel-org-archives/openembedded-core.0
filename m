Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 807497CA8E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 14:47:36 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id m1so40537979otf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 06:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/YvHjgPq1xVZ4AO/smdUbE/Lp71iPZpMgRwwZlaVv9c=;
	b=ejwdohboXZ49/68LwRb3SihLId7h3uIrO8O2+wx10IYpKS3cJRFQQhjJ0SPemnf6Jo
	qt/Nsts/XGQBK9ORn/JeZEhwT/YPqR+oqZVihh+1xnc7ppN9Y7Cndt3NZzLGWQ5sp0fy
	qShxRabVB9nQNSVN4PxsgRhFJh4bSHBlQSuKDvhdU39NQe1rmKI2WYtePHhXux0g39+x
	mYmrkb36rXm/T5dvDtSYXDowxu1cUEKA9kj2d0zzyWv2ptSxpwhqKI+m4svcQ4NPLndA
	23Uo7a9eNdbY8JlZgN+Y390em8cjgwdGPI4BZDwCkG7rWV4sf4G6ziOpGfuKlGS0uHHv
	2G9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/YvHjgPq1xVZ4AO/smdUbE/Lp71iPZpMgRwwZlaVv9c=;
	b=UGVzSFnbIA89SsRFZOzL41OUbbfUkDcLRA10Eb+g+SnXwTllQTPCSdj00cl5Y5/Ivt
	a0C7dIFVHmvhENMA6cXWLqRqISCmbrGK2tNP6Q0s4mdfjt+E3CPmHRC8M+CAUBbR6m9h
	rYdRYTvZKDxaMwyEptuAVpD4QGYdkVF3AjwpOTfiF04l7MEtyrFfItnW4XIDORE07Wna
	PqZFFU0LNDTycznCGD6b81ULW9v68ixT9IZqiHk4HqbaEvfO8MqbKFISiuiCFqCglSmz
	qdYrtfgMe8jw7z4QhFkBzC4PGVfjX7p+52hlSy2V5Oa6aE5QpZ1OCwqMDfwv9i6qpIP3
	BQKg==
X-Gm-Message-State: AHQUAuarwSRvlX5BWRAdiKjt1wj8ByIAEOagyIMPIirlE+LHFufyo22e
	KxCf6gL/jJ6Xp3ii3COeZY9gbc9sG/1WVBjGraY=
X-Google-Smtp-Source: AHgI3IZSTNJhhE1i5BMETpWKe+GfkPAlpNyzYF1UjJthBMid3lQcq+wBk9f4gkdu3bL60pckbEdLajH8dEXQSssiczk=
X-Received: by 2002:aca:4b51:: with SMTP id y78mr6300547oia.88.1550674057472; 
	Wed, 20 Feb 2019 06:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20190220121544.9462-1-fabio.berton@ossystems.com.br>
	<20190220121544.9462-2-fabio.berton@ossystems.com.br>
In-Reply-To: <20190220121544.9462-2-fabio.berton@ossystems.com.br>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Feb 2019 15:47:25 +0100
Message-ID: <CANNYZj9yLw3oYy0AK6ey2F85JTV9onR47fdxCpNTMjMsyg5R_A@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Wed, 20 Feb 2019 14:47:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Feb 2019 at 13:16, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> -DRIDRIVERS = "swrast"
> -DRIDRIVERS_append_x86_class-target = ",radeon,r200,nouveau,i965,i915"
> -DRIDRIVERS_append_x86-64_class-target = ",radeon,r200,nouveau,i965,i915"
> +DRIDRIVERS_class-native = "swrast"
> +DRIDRIVERS_class-nativesdk = "swrast"
> +DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
> +DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"

This produces:
| configure: error: classic DRI driver 'r100' does not exist

radeon has been renamed to r100 in meson builds, until then it should
be still 'radeon'.

Alex


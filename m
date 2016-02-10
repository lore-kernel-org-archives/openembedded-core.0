Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id A58DA71633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:01:03 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id 5so2136385igt.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XYFZ5LVPq45S7fVrc9lu9LfKr+OGAcoRFUUfnUUJrvc=;
	b=CabO0tGoG+eanvwwSy0Gxguf3zmiS26w7mh9anChpXcdlugyrkLEuSRVMHxDa8HHt9
	mqDkEOtuJCJsY2AHZ+GjTnlsHcjLPPjdfAL4LSoU+ov9maa/y9ceU8q+3l4YwLPPWdVR
	6U3wanVTjwVNSBDDdW5OX+oc69ULK+ot5pTNt0D+z7lsI9hGgVLMfLM5WIUiXxI68sk3
	V/rhuklbAVEoNTZlDde7ybgqhJGh9w3L1wVlU9MgTFNFQ9pthtJsTlSi6oYAoJPmKlHB
	3xgcztVIHKWUuueHeDqgZMC5bm23Jt9IpPRZI0+mzbW8hAykrtFfkjJB+RryLYtPJuTD
	H7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=XYFZ5LVPq45S7fVrc9lu9LfKr+OGAcoRFUUfnUUJrvc=;
	b=YsZ15Rf5pJfVHncIKc/H/edMnUK5tZKRZ5t9+XWUKjziu+j8Er8DueCn16fF9MgOxH
	q9J3UnE9Hv1Pz3moUrtCrssDbR2R/lULDcWbqG6ad+kQ0zMVe14f6bF1DDbhHB3Zt5d0
	IzMTCVcTeQTpxWmLg+GQ7OnwUhScooR9qhu49jk/R5fDmu+cwNWmL8q1rrx2lq5e3p/7
	JqPuiBQcw/FyTT3QxGqA2kXht/S1khzLpGjuz4wdcz//aYemt2mjV8ayNaCumvUzJpr8
	gAU+3xdPJOryk31iLgh1wMqCqfyitO57DIq9ZZYhmZmjUNK3pK2L6n6j7aKp12pKXbq/
	hhMg==
X-Gm-Message-State: AG10YORZhD+aFOEiHYe8bECrVPN88xkFUxwD9jiVPfsBERKaCbuhnKrbzw+IHVu4ng0QdBtH8RDs42BuKKLX8Q==
MIME-Version: 1.0
X-Received: by 10.50.43.133 with SMTP id w5mr10644660igl.52.1455123663906;
	Wed, 10 Feb 2016 09:01:03 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Wed, 10 Feb 2016 09:01:03 -0800 (PST)
In-Reply-To: <1455107576-8931-5-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1455107576-8931-5-git-send-email-maciej.borzecki@open-rnd.pl>
Date: Wed, 10 Feb 2016 18:01:03 +0100
Message-ID: <CALbNGRTJ2zDyZdFEYN30vNtZjo_LvBigoUK0nM8J6q8dqLuTkA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Maciek Borzecki <maciek.borzecki@gmail.com>, Tanu Kaskinen <tanuk@iki.fi>
Subject: Re: [PATCH v2 4/7] systemd: extend PACKAGECONFIG flags
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
X-List-Received-Date: Wed, 10 Feb 2016 17:01:03 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 10, 2016 at 1:32 PM, Maciej Borzecki
<maciej.borzecki@open-rnd.pl> wrote:
> We currently ship a rather full-blown setup of system. Very few
> configuration knobs are actually exposed through PACKAGECONFIG
> flags. This patch adds new PACKAGECONFIG flags for some finer tuning of
> systemd's functionality. The default setting attempts to preserve all of
> the features that were previously auto-enabled.
Thanks

Andreas


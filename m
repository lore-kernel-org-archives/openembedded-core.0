Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id A121678A02
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 14:03:14 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id q11-v6so9932930oic.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hYcHAGorbCLDq56Spe0UJzQTbSNOmm1fL1qe6w4DTs0=;
	b=OSjY3kNdh36G9P5TPaNRPAJqRpBQ9cVVEja5TsB+QJtJIcK06lm+c2yjKhyHTM2vyH
	2dRLIao3XysI1gqkFwKEoZ0RJmIX7HKjTmay4gLzjD3cQNiH1jJMWMUHCXl7wkPh6JHp
	JbPDMKLXjU8PohAay69/xmoiRzSaRTiTKsVgL33ES4M3bsgs9SBijDec9VxfrBXzLtqe
	e0BID6ZWwH6RBozw9VwCgZu+wo/KWM6Nee1ujw/lQqwz3DV3Tk/Bp+6kJqbxp3Hb6aFg
	mLxEcqAMu/ehkvjWviHUccwqZt7oDxGFu/Rczl+XCsGlza2nNrLHeHw8ovR/infLzHW8
	HVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hYcHAGorbCLDq56Spe0UJzQTbSNOmm1fL1qe6w4DTs0=;
	b=Q0+x83jQj12N8qLT+d++yyqGRra0L4sYVZTNnzLrfch00kLFAI4XU8c2fixz423BO4
	D+WIDrALybEIm7VVD5AnxTg96tREgi1N7G+4xxhfbyjQzeEpzV+bgnx0MCGZutQQ13Fi
	BqjJHL7233pS0r7eBlVn26T0/Io+v+g6vhl9igQ7wIhUmNvlXmjb9Y+v3VLaxhvJEZOG
	5PV7Hgt+AAZ10SjTX0gy10pn63Mt1JKv1DfQ79N345xH6eWrbXMdl/5VPF1ropRQZz3S
	j31LAm/Jq/7AgLjrNylPzcMWTbj/BuGvtpysnU2aO7ts6zs8r7LQ6cv1Py/et0zSWgjN
	aihw==
X-Gm-Message-State: AOUpUlFqwdWrlQTGqMfBNnK0+a9EFt+QkgnjxN0JZYgfTRzFTtRhxALm
	+Kd/lbhww59J64t5iVm+/28tyjdk8PfNuRUBYND1iQ==
X-Google-Smtp-Source: AAOMgpeF0jWp5u05S2KOrslvvTkt9OAVcmHIeMrLlCr/IZBHmsDdBEtUya6PUBbOm9ANW0EbSMI79om+tbBKlYa8qQc=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr3527355oih.102.1533304995749; 
	Fri, 03 Aug 2018 07:03:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Fri, 3 Aug 2018 07:02:55 -0700 (PDT)
In-Reply-To: <20180803134831.16694-1-JPEWhacker@gmail.com>
References: <20180803134831.16694-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Aug 2018 15:02:55 +0100
Message-ID: <CAJTo0La5gdatTgqX+RSu6QaE5bW9tkoeWzjNy2BTX--Vv_x8gA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Tanu Kaskinen <tanuk@iki.fi>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] alsa-lib: Cleanup packaging
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
X-List-Received-Date: Fri, 03 Aug 2018 14:03:14 -0000
Content-Type: text/plain; charset="UTF-8"

On 3 August 2018 at 14:48, Joshua Watt <jpewhacker@gmail.com> wrote:
>  # upgrade path
> +RPROVIDES_${PN}-dev = "libasound"
> +RREPLACES_${PN}-dev = "libasound"
> +RCONFLICTS_${PN}-dev = "libasound"

Shouldn't this just be PN?

Ross


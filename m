Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id CA4EA7C752
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 10:56:59 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id e24so6636949itl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 02:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GeMl25rbpxckrET033amX3yTq0l3XNPuxZWQucSG1ic=;
	b=wUqainJRqN8eH9L3pT6dNxyCg7dGdV7ez7XOlAQGEH+0C6P3KN07eN2vKXeh34j5WD
	uNSzLL2jBdlROIO9QE2K6LLqygUpbDA5ii4A1CFf6FdfP+PePzJOxvqTVVFeLDyZPrRp
	+zqD1k5MwYQLmy1BTB0eS8sEtOr4Sn7YHfDJSIRYPDqo8Kp1jyhSzLttDHSAHpRd3WGa
	FIj798MNIxudr3+MGxtDHyHSi7+9GDBN8LfjN8T89Yc8iTuJTE5JmrZtSXhJTWUbO7ng
	elRIqoB+/ktDTwQf5LK29VuH3/OiFyfzkHmQvFK2Sb5mBgYceDRM4+TYC7E9gq0uU0P9
	B3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GeMl25rbpxckrET033amX3yTq0l3XNPuxZWQucSG1ic=;
	b=V+MTwnDLouZuUPH9JCaFMv+TqzEdEruT+eNX0HFnFN2iiSI1CbMc+DA8WArKdNqGz3
	kdSqNkR9vXzCm2wUs/GS4YOBNUTEOwItrQcSsLYwLNGEa206NQT7RR6w0lEf6VX7Hku9
	uyKvCPC7DcCKHdMNeTpqtH2YMLlYDY95bc8CNmMqnU+CgkdDMcaPnqr211cgbazgPwMY
	rbmIuG/sMhwhpgvV2dMSU9iSmTtFR5A6oiBLe9NRXkQ7TVkU5iJWEmiltLM59jiVcqcG
	5oVNnC4nFKhdQC44ZudyEg0hX+RTkAei3g0GtpU/jsSycbPmFlhGNtl5NKnAIsAaQhNS
	szFA==
X-Gm-Message-State: APjAAAVIG/G7679T0fFSLHEKdPVIxwSdOB+2+uX3dM++iBWkejaFAUrj
	HG7WNHo0eimzcIDwDEHuQ7lT3485H4V4VKEDwVP90A==
X-Google-Smtp-Source: AHgI3IYIk5afCfNQLTD1iZYtj8u2U7Q/X3Bm7NbhFS8wAOaDmYISCTsO5smMq1EUi2IKmTJ0BBZnvjhgnQtDGPoZueg=
X-Received: by 2002:a24:2405:: with SMTP id f5mr11149114ita.130.1551697021056; 
	Mon, 04 Mar 2019 02:57:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1551696484.git.liezhi.yang@windriver.com>
	<e58863c6dfe0bfb23665568e90d34da5e9734d0e.1551696484.git.liezhi.yang@windriver.com>
In-Reply-To: <e58863c6dfe0bfb23665568e90d34da5e9734d0e.1551696484.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Mar 2019 10:56:50 +0000
Message-ID: <CAJTo0LbfcTw39fgyXcMCctvxcPyZc-b2xGLYSw-mJr74_JeZpg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] send-error-report: Add --no-ssl to use http protocol
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
X-List-Received-Date: Mon, 04 Mar 2019 10:57:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2019 at 10:30, Robert Yang <liezhi.yang@windriver.com> wrote:
> +    arg_parse.add_argument("--no-ssl",
> +                           help="Use http instead of https protocol",
> +                           action="store_true")

If you do this instead:

arg_parse.add_argument("--no-ssl", help="Use http instead of https protocol",
      dest="protocol", action="store_const", const="http", default="https")

Then you can just use args.protocol instead of having to pass around
the protocol name.

Ross


Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id A202A6E8E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 10:43:27 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id x13so12428744qcv.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 02:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LQTY88psO4sT7FgtcNpnR4i6kJM6q2rWBKMcRqqQW80=;
	b=WpP+xYvfDDNlAY5vPV1CKxCh9MJZVRPFt3Z8jzxICq7glTVOFIt5A1xQ5hYX3zmrY+
	T3R+jYF1TCx1sN6CY54pbrOMhU0+XkqEUt04crhHwxqu8l/iprvrTn00qrxxDc7PzGw+
	piJYxo/iwq4O+PgRXknlOX+GxpnVBgYBAfq/RzgWEpDgXkWJ1089cXGjNUJqnBfVR+GY
	92ITKKyQf2b/OaZbLXZPNhRYaO+jgOsIRmIQzEZv9otj9WtMK3zkTNqy40r/CqTaaupN
	2rnqTC9kpj1WjzuaDFAgpQmMBoIk9EDUsDBFNf8lwAsoixYIbxiwFVEt0mmNYMtfi9tJ
	lPew==
X-Gm-Message-State: ALoCoQmEjOPdIp4TBl2Tbd9n2ul/TAkQqR+WBoDVeYAd6t/Yb7l3tRXRsLI+CijWRP7Nceljloym
X-Received: by 10.224.97.67 with SMTP id k3mr56605058qan.17.1392115408127;
	Tue, 11 Feb 2014 02:43:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Tue, 11 Feb 2014 02:43:08 -0800 (PST)
In-Reply-To: <5eeeedfcaec0bd520449d7926da70085eb033991.1392089446.git.raj.khem@gmail.com>
References: <cover.1392089446.git.raj.khem@gmail.com>
	<5eeeedfcaec0bd520449d7926da70085eb033991.1392089446.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Feb 2014 10:43:08 +0000
Message-ID: <CAJTo0LYuEX-3iYUVcwKu_pppBN5o9bPDSwaJ870zHr1uZ_mjCg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: Enable building microhttpd
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
X-List-Received-Date: Tue, 11 Feb 2014 10:43:28 -0000
Content-Type: text/plain; charset=UTF-8

On 11 February 2014 03:33, Khem Raj <raj.khem@gmail.com> wrote:
> +PACKAGECONFIG[microhttpd] = "--enable-microhttpd,,libmicrohttpd"

There isn't a disabled option here, and you don't set PACKAGECONFIG to
enable it so in theory it's disabled by default.  Is this sufficiently
"core" to be in oe-core?  Alternatively we could have the
packageconfig blocks in oe-core but libmicrohttpd in meta-oe.

Ross


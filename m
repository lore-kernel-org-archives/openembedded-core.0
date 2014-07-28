Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4E3A065CF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 13:01:13 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id z60so8421199qgd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 06:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CTEJ8qjCpWFM6aCnzT4NeFDXZO0DZprcNVFLPrIo2Dk=;
	b=gpWVLZVgX6lZlRNUXSP+BStzVGxDhxlRcEzWthS3hSbVNKv8ISOP+A6ZWqwq0CIxKg
	SpBJNfrsvXACwzWLvLT7Fy6McdOzKUEUH6pmBTGKrebd1Z78pnlJmAJNi5mktroKkNXN
	H0paa4OPZ+mmia4trNs3F+AjnEqDCSeNcIenpuLeiJPbu3b9D3glwpwYXh35dGcfp6NM
	KNNBJpkvRKBxqklq9kAciIPVS9BAYe7Z17bUrJX4iCSGthQiHi4DQJpims1VPVlLu0rR
	59JpenSE1xLRcbTV9qXAPMNrrVGSAkbtr6jsT4ml2nI2/CR9uk3qXAzqEYZvNwCXVYh5
	UQMQ==
X-Gm-Message-State: ALoCoQmYU9wz2KhYT+o0pgwI5Ja9vtVSjeOZQiR1FJ2wm/SZq+sWISb79hVY677ULye+oTyNmyIB
X-Received: by 10.224.136.70 with SMTP id q6mr60381336qat.14.1406552474925;
	Mon, 28 Jul 2014 06:01:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 28 Jul 2014 06:00:54 -0700 (PDT)
In-Reply-To: <019adf4f704dc8b8c756406d64a8ef683a0567f7.1406525420.git.Qi.Chen@windriver.com>
References: <cover.1406525420.git.Qi.Chen@windriver.com>
	<019adf4f704dc8b8c756406d64a8ef683a0567f7.1406525420.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Jul 2014 14:00:54 +0100
Message-ID: <CAJTo0LaHEZXS435nNO05mn89LwoYYfO1tahC72xHY=4rG-5uDg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Chris Larson <clarson@kergoth.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] volatile-binds: add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 13:01:21 -0000
Content-Type: text/plain; charset=UTF-8

On 28 July 2014 06:34, Chen Qi <Qi.Chen@windriver.com> wrote:
> +# This package is only for systemd based systems. So building it with 'systemd'
> +# missing in DISTRO_FEATURES makes no sense.
> +python () {
> +    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
> +        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
> +}

There's a class to help with this: distro_features_check.bbclass.

Ross


Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9B31062062
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 10:21:54 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ht10so2609897vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 03:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=lC+aLBR+OzYd0eLydFbFneC+w0TcgFbe7DsXucMZ9xw=;
	b=ahO4mhtIY8P/rJHKtOOW41gcDitoq3UfcKfpIFnQKCA+sX42iUvlFfrP1mao44ZwU7
	L5r8sJCQc/09ObQEuOTM4C8gpz2fF2wjovciR+7LEyrotOcvQq1A7Q/tCRBzFMTOqI3F
	ZSZBD5R06Iv53hIw1N6uRGOwk461BNNr22o9+sQAB9yfrV4lRjZaOJkuZKE48EE56ka9
	duk+MXuP4j9k3ynKHmbmaJElaYZjR9ujbQLw3hJ0JeQxbrLxJk+b+fxlBqj28iAN2WH9
	OD50q/ZDcXjt19bbjGu3Uc4ADTycRl6We5K2941GgMI6c7SEPFXJQAq9EnNoXTvVmxKX
	jTyA==
X-Received: by 10.220.1.9 with SMTP id 9mr11221812vcd.37.1372760515058; Tue,
	02 Jul 2013 03:21:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 2 Jul 2013 03:21:34 -0700 (PDT)
In-Reply-To: <cover.1372749046.git.sgw@linux.intel.com>
References: <cover.1372749046.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jul 2013 11:21:34 +0100
Message-ID: <CAJTo0LYhCJOiS8=7NHvggv5ZedS5GbG6SJtwEGjqiT9qGaCMgw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmCiMnpynNzLrLHFXHBUrLjby/E86BqLdbeo7WmrRMqHv3wEE0xWoPfe7u8+nbXlCTITe4X
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PREVIEW CONSOLIDATED PATCH 00/42] M2 Final Pull - Preview
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
X-List-Received-Date: Tue, 02 Jul 2013 10:21:54 -0000
Content-Type: text/plain; charset=UTF-8

On 2 July 2013 08:14, Saul Wold <sgw@linux.intel.com> wrote:
> Laurentiu Palcu (1):
>   xinput-calibrator: move it from meta-oe to oe-core

Drop, about to mail a review.

> Randy Witt (1):
>   image-systemd: Support enabling/disabling units at image creation
>     time.

Please drop this for now, it won't really work without some other
patches that we haven't merged yet (and I'll be reviewing those
today).

Ross


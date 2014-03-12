Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3306F7DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 10:24:59 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id 63so9974545qgz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 03:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qbllUTwmTn/XXSDwq+lYZVgPse3SUEUcXNfvfJYL6Fs=;
	b=C84UYtimwIEhF/L0Vx+eiC3O0j4fbbVtIqkKRXfrkimi4UdyqmutiEH7Vr1Dv2gzK9
	gbdes6TYHBY+Jk6sCgexjEhlRAMxzcYY515m3i+4ejP6hLL73IcppmqYCDhu+e7pheEi
	enqFsAsjDZYdCoMNNkIheAa3itG3GG8xPNDj9ewVYpxXNDWa3hAHEae1vKGYltvn6axI
	6W+DGLpMo258d9MyktrokBq2KeipHLStLRfL6bGyZHN0KJ17UBS8ae8T9QCb3cfa72Fx
	KSx96jK9YLTUVzfE34zgdGYkqbPwNeMui8MuIHW35Q9Y1j5kfrjPDpJ7QhXhjfl5PCld
	cOTw==
X-Gm-Message-State: ALoCoQldfpDX/rg8qKtWkuAFHFAS1mWbMr9WFI0nHBTfG41w1GI3JEIdeRM8/qIqptW4Fj5K1G+A
X-Received: by 10.224.127.129 with SMTP id g1mr53946229qas.22.1394619900503;
	Wed, 12 Mar 2014 03:25:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 12 Mar 2014 03:24:40 -0700 (PDT)
In-Reply-To: <1394613382-28992-5-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394613382-28992-1-git-send-email-alexandrux.palalau@linux.intel.com>
	<1394613382-28992-5-git-send-email-alexandrux.palalau@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 10:24:40 +0000
Message-ID: <CAJTo0LZFPsKVuqWDpqncbmEL9xP8NdrFx2Vb7P3AfzvjT1iysw@mail.gmail.com>
To: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] gsettings-desktop-schemas: removed gconf inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 10:25:02 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2014 08:36, Alexandru Palalau
<alexandrux.palalau@linux.intel.com> wrote:
> -inherit gnome gsettings gettext
> +inherit gnomebase gsettings gettext gtk-icon-cache mime

Pretty sure you don't need gtk-icon-cache and mime here.

Ross


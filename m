Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 53877745A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 09:28:10 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w81-v6so17461501oiw.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 02:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VqMWZ36mwpeyr0c77QEtzz6iJr7AjazFro3YqpOqkWA=;
	b=AFpAT2g9O4Qppra3hhhJGxQy+0+J4m3vF/t4RlQx39hE26f+s0HICVUoHf80eYS9+z
	8Z5wwtx1/AIWNUtu2DWBl79R1yH2VvptDTpJcZWExZ2UQ7wJL7cShrgg8ak5rXR0ItGU
	Gbf/SH/lfEhsI/hFGkfBQAB8V5uKczw25lOCIzBFmWi1KhHp7A0++vun5GW5V66gOldi
	UW2UUX1XpWCwJWymlA5r8fusYiTKqvabUmCn3QKDjYVOANpPkQZgRDEr+UrDb8hAi1HC
	Dw9TQNyK1oSTNYJYybluxpIuD1oVVU8qnzWpV9tH0kDQfNu/KEKwhgwadZJVGWOQvGH4
	fhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VqMWZ36mwpeyr0c77QEtzz6iJr7AjazFro3YqpOqkWA=;
	b=aFeTBDFD2QrUxPbnZj8SeG78G5Ei3uUAOlLHmx7iM7ztOPowqR1V4lQlAq9BT87QnS
	pDxRU98bLYKvhCPhRXGszfApGJ/rNsa/W5vfUbU/Y4pJqQreZbhP3+ZqOAGx60CKsphN
	HBpNTMRA20nA4hePVf9SVm2VEvojlzurimAYzy6l7NdWXyWc4U2IOedFxCpaLY12HNWV
	pzz2e5StagH/IwnA+3J67cG8f4U2xtMkMsCZKurrhksHNwVdCAChYi/PpjI32H8OnP9R
	PGqFPhjhtJoPke6SVG58KLcL4TNUnWj0CHy+8cT+cQEZfS+fGX/EkYk/tn1K8MAvqcjO
	5yUA==
X-Gm-Message-State: ABuFfojneMQccGmx2eWi03iVbqvkXNwiSrYD/l48q/B7gwUDASXSkniG
	9jLQT/osxbort250loGUpsLwOX5zhKZFiQN8Ixw//w==
X-Google-Smtp-Source: ACcGV62WJx7PJ69Ed+r9O6ikeRFlxIo9YpZnWOeIJAjcdox3D40CMIyw76JaXbyj12d+WoENayIz/yKFVqJDlVXgOwU=
X-Received: by 2002:aca:ed57:: with SMTP id
	l84-v6mr10721819oih.188.1539682091222; 
	Tue, 16 Oct 2018 02:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20181015182128.13115-1-kamensky@cisco.com>
In-Reply-To: <20181015182128.13115-1-kamensky@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Oct 2018 10:27:59 +0100
Message-ID: <CAJTo0LYWG7O+VryaFi9r4kc5JagPtuynWHi9gV6nV+cLPUw+SQ@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap: 3.3 -> 4.0
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
X-List-Received-Date: Tue, 16 Oct 2018 09:28:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Oct 2018 at 19:22, Victor Kamensky <kamensky@cisco.com> wrote:
> Upgrade systemtap from 3.3 to 4.0: Removed backported patch.

WARNING: systemtap-4.0-r0 do_package_qa: QA Issue: systemtap:
/systemtap/etc/stap-exporter/EXAMPLE is owned by uid 1000, which is
the same as the user running bitbake. This may be due to host
contamination
systemtap: /systemtap/etc/stap-exporter/EXAMPLE_NOERROR is owned by
uid 1000, which is the same as the user running bitbake. This may be
due to host contamination
systemtap: /systemtap/etc/stap-exporter/errno.stp is owned by uid
1000, which is the same as the user running bitbake. This may be due
to host contamination
systemtap: /systemtap/etc/stap-exporter/syscalllatency.stp is owned by
uid 1000, which is the same as the user running bitbake. This may be
due to host contamination
systemtap: /systemtap/etc/stap-exporter/timeout.stp is owned by uid
1000, which is the same as the user running bitbake. This may be due
to host contamination
systemtap: /systemtap/etc/stap-exporter/topsys.stp is owned by uid
1000, which is the same as the user running bitbake. This may be due
to host contamination [host-user-contaminated]


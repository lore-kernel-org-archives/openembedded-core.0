Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tylof-00055t-6M
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 17:07:45 +0100
Received: from mail-qc0-f197.google.com ([209.85.216.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 07:51:00 -0800
Received: by mail-qc0-f197.google.com with SMTP id x40so615582qcs.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 07:52:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=r4/Z2i5U9srFnCiNjgv2XsXwBOn4w/eWk4vRL+rDFQ8=;
	b=DUCzOnsvPpJKiLp3+XXtGaxCBRS88EtWRy/afCYiQkYiuky7UzpOtQq0GC9jQJxJA/
	eLHsWsdki9JhsJZ9IK/B/FWBoaAB85svaDODeNExsDqw1C05MJoge2fuLksbnpFcGs6U
	VM67nVg49s3I7zcS0S7+jJRrtXA0qZ007k0IXJx7+NFQPt1422hBxi3FSrE5CR97/mqr
	tR3YHClcUoErfIx0Zo5kGv/Eaj1DN5wnkUWQszycxlzBXM87NmJ4agXxR5UzWRgoJZ8A
	4EfTS3tJcGbTcD6YHsQtBmZUConZ15PyN11hTBjkH38IJ04u5E8AezVU8tJA86teAQYp
	C3DQ==
X-Received: by 10.221.12.138 with SMTP id pi10mr6486801vcb.18.1359129128753;
	Fri, 25 Jan 2013 07:52:08 -0800 (PST)
X-Received: by 10.221.12.138 with SMTP id pi10mr6486793vcb.18.1359129128685;
	Fri, 25 Jan 2013 07:52:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Fri, 25 Jan 2013 07:51:48 -0800 (PST)
In-Reply-To: <1359128238-23401-1-git-send-email-jstashluk@dekaresearch.com>
References: <1359128238-23401-1-git-send-email-jstashluk@dekaresearch.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 15:51:48 +0000
Message-ID: <CAJTo0LabGif1iV=7bLsrrjm6e7LyhfwJEwuid_vPCVPNrHV-rg@mail.gmail.com>
To: Jeremy Stashluk <stashluk@gmail.com>
X-Gm-Message-State: ALoCoQmrArWF5CMuL+MizoRGgGyi/a/wpAna3olcc89OAiE7aA42r73G2EmcFKCms2QfwUXy1uGiAjb0rRdEwqbJZ/E4gpYrXawjzCC5Dty1izrpoF7rYA+uAPsHS4sevjTER2AxNQdke8xrR5QxgySlHGpCSzle7ZAohlMRmLHSnw+wceawOK2+Sv5RFrDheM9NnquO/hPF
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins-gl: add package recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 16:07:55 -0000
Content-Type: text/plain; charset=UTF-8

On 25 January 2013 15:37, Jeremy Stashluk <stashluk@gmail.com> wrote:
> +PR = "r2"

You don't need PR in oe-core, and you don't need to bump it for reviews.

> +FILES_${PN}-gconfelements += "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"

This was clearly copy and pasted from gst-plugins-good, remove it.

Ross



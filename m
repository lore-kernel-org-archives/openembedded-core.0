Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sqir9-0000o1-4i
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 12:48:47 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 16 Jul 2012 03:37:27 -0700
Received: by qcmv28 with SMTP id v28so2896989qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 03:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=u8WWJEJlxhALGvgfRNSFThEz9veMprs6fH3lWQqS1RQ=;
	b=KQNmTwhkaiyvYs+eYqAonO1q5RpcDsfhNW4yOf6W/Gb0ZiCE6Pm2SmYqO95cTpaKWJ
	eE2y8iAYDnWvalFV/DeO90vpWpyIHfoV+d9fJPl6LQ0wIBOQdMWU1K6HGKsSODUg/wOK
	Hif62CEFRVp86BRL6xHM5+/h3UrJ9dWItAtZYurRWb4tXj+BzhgmbwmiE32XfDACZW+V
	sot3lLVhJdqbi5WzBiQ0N2V2pSEEt3zaI6vGibeGgtXax684EjIdATZF7W+Z83vInome
	gfjJZZsRr1j0Ibq3O5e1jyGRRa0HfxQEZGNS4ARfvqO97DQshsyJwRxdtfOHvEi7REH6
	N6gg==
Received: by 10.229.112.3 with SMTP id u3mr5842600qcp.50.1342435046704; Mon,
	16 Jul 2012 03:37:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.218.201 with HTTP; Mon, 16 Jul 2012 03:37:06 -0700 (PDT)
In-Reply-To: <8F9AE1A6-06B6-432B-B336-B8F72D3C2697@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
	<29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
	<CAJTo0Laa4jNytbBv1ozJWE9kf=-4hSE4_gsZN+VA2N5C1MJVeQ@mail.gmail.com>
	<8F9AE1A6-06B6-432B-B336-B8F72D3C2697@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jul 2012 11:37:06 +0100
Message-ID: <CAJTo0LY_S5JDsPtpcxr_nnQzZDWLv4RkndsuTEv8FWoBUygpiQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlkZF1DYZ8Rr92U/lR5NnGASlg6KAhbhpMTMUpbovROHebTCjlE8NzfhlzvbFvXMm+Sf6KU
Subject: Re: [PATCH] powertop: update to 2.0+git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 10:48:47 -0000
Content-Type: text/plain; charset=UTF-8

On 16 July 2012 11:33, Koen Kooi <koen@dominion.thruhere.net> wrote:
> I'm not debating the usefulness of the U-S field, I'm debating the usefulness of using 'Pending' as a catch-all. I can do:

In my eyes, "pending" means it's been submitted upstream somehow --
bug system, email, whatever.

Ross



Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0Dti-0005lD-Dg
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 17:19:02 +0100
Received: from mail-yh0-f72.google.com ([209.85.213.72])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 Jan 2013 08:02:06 -0800
Received: by mail-yh0-f72.google.com with SMTP id z6so768961yhz.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 08:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=iZ3vVqAzsEzc/2nszAo/ir0p4O2tqrmTvBWzNi3CxQo=;
	b=bes7HDee2Mw7P/CkiO7aOWPax6Te8IrSIhL9R+BOlIWcfZWyRtiPvErHi9/Quj9VSB
	JX4AdY6ZlUckLUT5pCR9EM9sSvv0BhhGAT3WDJi/k+b8whnNe3zvModUVoZiQGBDLhXz
	TwgXK5SCMXw7BpjBBwHzVzFhYyZMMtdqhSzdJWqqNbkh/F93sxGjNCUkkTe358jR+0Je
	ji2nS5SwLPbMqTxWvPE/ZLt2EjBn4Edgtw813NOqlnHr+yuN3UR48p+l3irXXcHfuPZF
	2fH0q9PF6eTk8yz9LEE6v0YiygD0hfsSUMMpNpT0b/fLKARbBm2ahq8VrZEZrcDKpV4m
	P3pA==
X-Received: by 10.52.178.105 with SMTP id cx9mr1370637vdc.31.1359475396616;
	Tue, 29 Jan 2013 08:03:16 -0800 (PST)
X-Received: by 10.52.178.105 with SMTP id cx9mr1370632vdc.31.1359475396556;
	Tue, 29 Jan 2013 08:03:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Tue, 29 Jan 2013 08:02:56 -0800 (PST)
In-Reply-To: <CALbNGRRDFCD+NWh3+u93Wzcmu4UOQHCEtO36=LCOxieARN4pKg@mail.gmail.com>
References: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
	<1359473084-592-3-git-send-email-radu.moisan@intel.com>
	<CALbNGRRDFCD+NWh3+u93Wzcmu4UOQHCEtO36=LCOxieARN4pKg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Jan 2013 16:02:56 +0000
Message-ID: <CAJTo0LaeYkiqTVZWvqTgN5iK_BYM_dgadfNmkfFqJMVYoAnoVA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQnqTgkKYScaW66j+FYVfXz/2kUTlXIDrSK6SigqzYYTYxqsiMqRqawpKdwoFCFAn1MzqNaoNnDVGcMECKHR/kbJMMeN8TjSt/oOC3dB/j2L0ET4w6WU4lqBVyxXtqQS1+FOA/SyfIvpq1IIsnh6btVwz3huIm9NcuFdlvFcF+td+J95/e5SnlZI8gQ1p9jDq52YnSls
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] avahi: Remove -systemd postfix
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
X-List-Received-Date: Tue, 29 Jan 2013 16:19:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 January 2013 15:57, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
> I thought the discussion where to put systemd-files is still open.
> Don't misunderstand me: I am fine with both but I think we should
> decide to go this or that direction not by creating facts.

I'm not convinced that the use case of "install a service but not the
init files so it doesn't auto-start" is good enough considering
systemd provides tools to not start it, and we've never had this
problem with sysvinit.

So no, I don't think its still open.

Ross



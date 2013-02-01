Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1DSq-000345-W8
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 11:03:23 +0100
Received: from mail-vc0-f198.google.com ([209.85.220.198])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 01:47:35 -0800
Received: by mail-vc0-f198.google.com with SMTP id m8so5140333vcd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 01:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=aVZMfYYfklP+EdKgIl8yaVOgrT1TZwOHHf6wqzi+TRE=;
	b=DZFaBg3YRfhqnV4WSLXVria6OH5bKd0nYFChwQdX9n4uxCMjQgDHeZLpSm8AtI7T1+
	gctaCr0NjKXzNQLROU/wxHCnYuxI8Xir6LfpS6WWOIclXfuh4phlS+BLTTuV0ZO1VChC
	aQS8gSQ+nywpnWF2HS3Nw5Kxi0UgToXDkHe2Y1jszV++Vd+XhiyRHH0VW18e15rQijEt
	DKwLDGLGcq2Mt2kwt+H4seb3oXhqWQKiNRtfLsiNomL4UcQJ8mtoB/tekmrNPV72GBHV
	qs7klX+OUMYjSNDAJvMTZR+GHft0IyMBpGxFevpN8tBgQCwfLzfk9VncmYNc875A5qYE
	ldtA==
X-Received: by 10.52.90.243 with SMTP id bz19mr5195328vdb.112.1359712054561;
	Fri, 01 Feb 2013 01:47:34 -0800 (PST)
X-Received: by 10.52.90.243 with SMTP id bz19mr5195326vdb.112.1359712054477;
	Fri, 01 Feb 2013 01:47:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 1 Feb 2013 01:47:14 -0800 (PST)
In-Reply-To: <CALbNGRR7skJWjq+hkTKTTBoJswH0-wFULRkJVPr6h5-nhfS=WA@mail.gmail.com>
References: <1359710522-26839-1-git-send-email-radu.moisan@intel.com>
	<CALbNGRR7skJWjq+hkTKTTBoJswH0-wFULRkJVPr6h5-nhfS=WA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2013 09:47:14 +0000
Message-ID: <CAJTo0LahXzLg_4zcb7qfFi3A1S-aCJLVSKFDFVhpYPjLh9Zkgw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQlYaCOVItv/X/CuDZP1BDEV2tRN06Vr4sXmYdOMxoZwu5YJ1VCMAds7y/AvMPaex8xNbYvQZ0T2RoTOlPq7UbmCVMNwzWHgH0c/xQp8qpg7syCAXA8sSSl3HGMS5OeEOvavHc0ckga0mVlyudrzvQ9DGJdaaKMo5PfhYvNjBqN3lrk0DSURnBplLS4sIChs2L/yVchT
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] polkit: Enable systemd support
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
X-List-Received-Date: Fri, 01 Feb 2013 10:03:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 1 February 2013 09:39, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
> On Fri, Feb 1, 2013 at 10:22 AM, Radu Moisan <radu.moisan@intel.com> wrot=
e:
>> enable/disable support as relevant
>>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> What caused my sign-off - or is it a hint that meta-oe/meta-systemd
> need alignment with this?

This patch is the meta-oe appends merged into oe-core - so yes once
this has been integrated the meta-oe and meta-systemd bbappends can be
removed.

Actually looking at the commit log, it appears that JaMa did the
important commit so credit to him should be given.

Ross



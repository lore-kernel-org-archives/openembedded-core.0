Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6C56089F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 08:49:35 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x16so1927509vbf.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 01:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=YRpJ4r2sFw3fgthKx7ZsAYv77QCxR2UM5DYItX+OI18=;
	b=fMfRst+raGmEus6XbcJOUg3/qOCvGrPeHwVjMLkS8V6HJDokho5XBFRDpzRmrRFozj
	x1lXe+T4WYeS7vUx3xCzG+nHS8Cd4vMHJhiFOP2A1kwPIZAfeLAa/OoEzsofUaTa+sfT
	7fy6K86Gqb3Nru68HUpATazmNVL8ClJTlYZwDAL0jj4odUMj08WU04a8aT6WsOVMzKDy
	Uc6AWIuUuUtZDV5/Qk+qA3mWrD8Ut/RfeXAB+UCuZLX6keq3c2rAO7VcGjq8Wr1VCyWz
	knT3bFEXHj9bcUIO6q9D1mhjYXtSs8aGcw3r8S8YGO00+poDbDEJAwBTiNk5N6gOFHch
	dTGg==
X-Received: by 10.52.165.99 with SMTP id yx3mr3815830vdb.34.1369298975951;
	Thu, 23 May 2013 01:49:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Thu, 23 May 2013 01:49:15 -0700 (PDT)
In-Reply-To: <CA+AhUGxnKoTeEFYZUAZTtzEfOQ2sUEy1S_Hdz7SBo=hZVYkP=g@mail.gmail.com>
References: <1369270777-2932-1-git-send-email-net147@gmail.com>
	<CA+AhUGxnKoTeEFYZUAZTtzEfOQ2sUEy1S_Hdz7SBo=hZVYkP=g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 May 2013 09:49:15 +0100
Message-ID: <CAJTo0La8OEJSayD09eQNDKJz++h5V3FTeufPmo2XVoAYPKRf6Q@mail.gmail.com>
To: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
X-Gm-Message-State: ALoCoQmL3EiH7LXDEEg0fpEaMRZgclyTnz7lGF+JDa6mt7TomoLBBVnO2yKwPcw6Xb0UULcpyvUY
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] systemd: update to 204
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
X-List-Received-Date: Thu, 23 May 2013 08:49:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 May 2013 09:27, Erik Bot=C3=B6 <erik.boto@pelagicore.com> wrote:
> I'd like util-linux added to DEPENDS to avoid the issue described in
> http://lists.openembedded.org/pipermail/openembedded-core/2013-May/078641=
.html
> .
>
> Most of the times util-linux seems to be staged in sysroot due to other
> dependencies, but I guess this is sort of a race situation where it's not
> guaranteed to be there.

Yes, it may or may not be present, and for even more fun may be in the
process of being replaced when systemd needs it.

Ross


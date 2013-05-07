Received: from mail-vb0-f53.google.com ([209.85.212.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UZk16-0008BD-9j
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 17:41:27 +0200
Received: by mail-vb0-f53.google.com with SMTP id i3so589840vbh.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 08:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=rCOrmHi6dYvNM5OBNn0kBIUDTG9JbE2QGlAlz1Ofk8g=;
	b=SjqBsAEYM1EVx4ALUjtG0mzIf+oxB5HUow2y9fAozYyeTQpc4g6yQq171Xk1kxW1Bt
	zE0SrNClMskvUinqu0oEzFjMIPY3KIFTuCaMPSP4ebGolnPyMdPUVDYlLg2nUqHNmP14
	EqmPLVAvqaZcMcN6oN5WqAwKyWz/+RfBGXUhksG1maaWzu5Rt6oq8P9q0JGH6zj594p5
	mi/ssYNrJVUuRyRLWX44XhprDuly2T4NiWURotJIWAENvLWGDkiHRFU1i0katC8RaV7V
	5VEzcal/Kc9y3kUxV06vTSbQUus34GbOcoCqM6ecaQa69GXCrAsp9cTt2GpmEAnQdQCg
	5djA==
X-Received: by 10.220.78.131 with SMTP id l3mr1555227vck.54.1367940202837;
	Tue, 07 May 2013 08:23:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 7 May 2013 08:23:02 -0700 (PDT)
In-Reply-To: <518919FE.9000004@mlbassoc.com>
References: <1367240260.14512.120.camel@phil-desktop.brightsign>
	<518919FE.9000004@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 May 2013 16:23:02 +0100
Message-ID: <CAJTo0Lb1TW9gOW79fbDdqyn61-tvxW+Fh1aQxf+mLuGRUhv0RA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Gm-Message-State: ALoCoQl1V9GE45KpCztxSB9/YN8wU+2OdUmPi784C/01mN8NPOwPl/+j62Dn+tmojnf1vhpffQ8o
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xkeyboard-config: Remove xkbcomp from RDEPENDS_${PN}
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
X-List-Received-Date: Tue, 07 May 2013 15:41:40 -0000
Content-Type: text/plain; charset=UTF-8

On 7 May 2013 16:13, Gary Thomas <gary@mlbassoc.com> wrote:
> It looks like the package(s) you're referring to are the X server.
> Too bad you didn't provide those patches as well as images which
> use X are currently broken (at least mine are)

Yeah, I noticed that when browsing mail over breakfast but dropped the
ball in actually saying on the list.  Add a dependency to it in
xserver-xorg.

Ross



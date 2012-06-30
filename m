Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sknvp-0006jq-Uu
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 05:01:09 +0200
Received: by eaal1 with SMTP id l1so1577039eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 19:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=FhUHbSh8x/7gACw+PCdgnlyu36FRoGOlYmJncJ/RIbA=;
	b=QcusHL8dk5JhAIhqZ4Fx49VU8fgC2eIy52OJRLr8L8LVbA1GVBHjm7CskxM5tAgQL/
	VaCCsA/OQJO97wN4i8CY5qqQndpTbvATFZqbmQ3cRXdl8YHXkuQKlvYtG/kywTM4iZGR
	kpFM2Zy5BCDLLKMw7sHb6017pziiYKawoPxolSVAYiNW3ua3UIiGbkDlOh467fQfdXw6
	ucyNFJXp81+vvTyu+x7R8LlcIlXmIOyWb6TkbtNPPL+t80+V8QkJu2ETkbCqp7VgAnI9
	BGZnRGlI/6AWpivFqc8DJei1Cypdd3ilQeGBZbPTDRu4uFlZupTqLEYYCeuPoHTMr0Xg
	XJ7A==
Received: by 10.14.37.206 with SMTP id y54mr1202486eea.218.1341024613401; Fri,
	29 Jun 2012 19:50:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 19:49:43 -0700 (PDT)
In-Reply-To: <20120629233433.368832026AF@gemini.denx.de>
References: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
	<1340994915-14947-2-git-send-email-paul.gortmaker@windriver.com>
	<CAMKF1srGhdr8kAQ+wyYPnVUW6nq_BHHup22YcGqrFrroW7WHhQ@mail.gmail.com>
	<20120629220145.70BDC2026AF@gemini.denx.de>
	<CAMKF1sp8=OreFKNds00t-rxoVVgWaraUTRzMNqVZdY13FXu2YA@mail.gmail.com>
	<20120629233433.368832026AF@gemini.denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jun 2012 19:49:43 -0700
Message-ID: <CAMKF1sppNxPvs9n6YShgpVtkBYEqit1Ri9aWQHv3LgjOqbqRbw@mail.gmail.com>
To: Wolfgang Denk <wd@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] u-boot: Don't make the -Os removal part of global settings.
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
X-List-Received-Date: Sat, 30 Jun 2012 03:01:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2012 at 4:34 PM, Wolfgang Denk <wd@denx.de> wrote:
>
> Well, -O2 can mean some 30% bigger code size than -Os. =C2=A0This hurts f=
or
> memory-footprint optimized code like a boot loader. =C2=A0[It also hurts =
in
> terms of exacution speed on most embedded systems...]

I understand



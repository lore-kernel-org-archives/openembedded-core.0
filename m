Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6Sb-0007XD-Ga
	for openembedded-core@openembedded.org; Fri, 09 Dec 2011 20:50:21 +0100
Received: by lahd3 with SMTP id d3so1249740lah.6
	for <openembedded-core@openembedded.org>;
	Fri, 09 Dec 2011 11:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=G9yTNgoCPQ4QPTiZHTO2gyHH3linaGvK3FnRRTQQDJ0=;
	b=qt8C4pbqWBrN4md/v8vo8kbCU5Bwwj37fk/dRefP3XibZ2subdwZIG3hMsK1yUuxzD
	cUeztDF1LpaiMExC4i59FFdz0UZRmGpgIpYRbyKgq9ftig6JLFAqbeuHQ9mo3HMZ7AHp
	y9//YJAW2seM+h+tEHLo8UfmXjiTLPQMU7L98=
Received: by 10.152.145.233 with SMTP id sx9mr5799645lab.6.1323459810325; Fri,
	09 Dec 2011 11:43:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 11:42:59 -0800 (PST)
In-Reply-To: <e079fc3617e1c508de82bddc81b8587ffb498ba7.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
	<e079fc3617e1c508de82bddc81b8587ffb498ba7.1323454935.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 11:42:59 -0800
Message-ID: <CAMKF1sqMye1-OOY8OEj2yr96_bV__2tY8rHOwK1N9Q8j3JSxew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@openembedded.org
Subject: Re: [CONSOLIDATED PULL 02/15] ncurses: libcurses.so should link to libncurses.so
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
X-List-Received-Date: Fri, 09 Dec 2011 19:50:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 9, 2011 at 10:23 AM, Saul Wold <sgw@linux.intel.com> wrote:
> + =C2=A0 =C2=A0 =C2=A0 # Make sure that libcurses is linked so that it ge=
ts -ltinfo
> + =C2=A0 =C2=A0 =C2=A0 # also, this should be addressed upstream really.
> + =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${libdir}/libcurses.so
> + =C2=A0 =C2=A0 =C2=A0 ln -s libncurses.so ${D}${libdir}/libcurses.so
>

you could do ln -sf libncurses.so ${D}${libdir}/libcurses.so and be
done in one go



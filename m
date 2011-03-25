Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q3G5A-00079t-Pm
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Mar 2011 00:06:16 +0100
Received: by fxm19 with SMTP id 19so1657661fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 16:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=dZv2FszmqWo+TePUWf/wO0tvb50b7coh/4cZTNaX1q4=;
	b=lXr9ImzuPUjYT5LqTZ0fItBRFZIF3d3dfYDfWiv2nU83Pn9ZFCNcw7IBs3J8nv+x+N
	OVdg3Gf3cbnAXRwqL8OAafGsmXSAnZE5LvHx1htPeSdYM84ECe1XWoBX6AHxReB5GnTj
	gGcPEjeqXWPsWZXdfjkZESWbGkIdOW1z01juM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Q4dSCQ6hnp/fGzSrV6MmDMnl1YBujycfTZ8P14RzGdSem4P5Gx9rHeF/GWOWNFadvh
	HGMaJwEIdLxCuA7Iotcfy+SP1V6CXs96/TluTkScHcDHu4zLPvF2RDldaEhVrfAdpKWX
	G2ys1RZKOjo0sWy59WnDcI5m9yfaFkiqgHPQ0=
Received: by 10.223.56.220 with SMTP id z28mr1529551fag.11.1301094263097; Fri,
	25 Mar 2011 16:04:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Fri, 25 Mar 2011 16:03:53 -0700 (PDT)
In-Reply-To: <20110325225924.GA11423@sakrah.homelinux.org>
References: <20110325225924.GA11423@sakrah.homelinux.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Mar 2011 16:03:53 -0700
Message-ID: <AANLkTi=PooO6FYw9j4tpJ4Uv7LUcGy4aNzfvJYryPHDA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Testcases to show bitbake malfunction when using python functions in recipes
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
X-List-Received-Date: Fri, 25 Mar 2011 23:06:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2011 at 3:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> Attached are two patched good.patch and bad.patch both can be applied on
> top of oe-core independently in two trees.
>
> Then bitbake -p or bitbake -e qemu-native and search for EXTRA_OECONF
>
> You will see that good.patch works but bad.patch does not
>
> What I observed is it
>
> put the python func in .bb - work
> in .inc included by .bb - Does not work
> in .inc -> .inc -> .bb - works
> in =C2=A0.inc -> .inc -> .inc -> .bb - Does not work
>
> So there seems to be a pattern here
>
> Let me =C2=A0know if more info is needed
>
>
> --
> -Khem
>

the patches were stripped again. I wonder if its the mailman because
they appear fine in my sent folder

Here they are put again

http://uclibc.org/~kraj/bad.patch
http://uclibc.org/~kraj/good.patch



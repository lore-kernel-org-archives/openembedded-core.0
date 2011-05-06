Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QIMIU-00078B-Nx
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 16:46:26 +0200
Received: by bwz5 with SMTP id 5so2887803bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2011 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0WJKuWCg7q2F6czyV+vc/TIQ9LTcxrYiE6YMnUfeCuc=;
	b=pRPXVCfJGBzEB+0mevbsdcg35VSmzwoUYa66wPTBEuTl2Hbpn0R1afi7SoZJGJNCwf
	tdCm+i9z2ucND/5cBrXaBKeB+jK0BoAMYbxtLiZ2+KA5+7I6q1Z1HtNxzIv3sFeA7bFV
	uKNUy+H0p2kr3lqaDo8R1rKNtJg3KrcC8LGoo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=RnjcxqZ2BvntZQ98sEYnITc+tUOALaS1xmXCf09Zl9ZXTZ0ZtSargduwQ8n0aj0Q2P
	j159fdSZ0kb1Ja9wzcv4GilGPkrzdCBqIndblgxwctXNi7JM8kTCx5z820HwzBfeLq5V
	YBakvAiMAch+vMV0nNLv35HM2dQKbVzTv0dkU=
Received: by 10.205.37.2 with SMTP id tc2mr1413065bkb.14.1304693025869;
	Fri, 06 May 2011 07:43:45 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id z2sm138540faj.3.2011.05.06.07.43.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2011 07:43:44 -0700 (PDT)
Date: Fri, 6 May 2011 16:43:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110506144336.GB17773@jama.jama.net>
References: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
	<BANLkTimvbbU4yx_aWhaKp0DvYgV1mH-9pg@mail.gmail.com>
	<20110506135458.GA17773@jama.jama.net>
	<CD6D7C47-8778-4086-AE29-BB954F9DE09D@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <CD6D7C47-8778-4086-AE29-BB954F9DE09D@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] systemd units packaging
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
X-List-Received-Date: Fri, 06 May 2011 14:46:26 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline

--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2011 at 04:32:08PM +0200, Koen Kooi wrote:
>=20
> Op 6 mei 2011, om 15:54 heeft Martin Jansa het volgende geschreven:
>=20
> > On Fri, May 06, 2011 at 06:51:58AM -0700, Chris Larson wrote:
> >> On Fri, May 6, 2011 at 6:39 AM, Koen Kooi <koen@dominion.thruhere.net>=
 wrote:
> >>> And related to this: how do I get the "installed but not packaged" ou=
tput back? The bitbake logging changes are hiding it now, which is counterp=
roductive.
> >>=20
> >> Could change those messages from info to warnings, then they'd show up.
> >=20
> > Agreed, please change it. I'm using -v since those were not shown, but =
-v=20
> > brings much more noise then I need.
>=20
> Like this?
>=20
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -676,7 +676,7 @@ python populate_packages () {
>                                 unshipped.append(path)
> =20
>         if unshipped !=3D []:
> -               bb.note("the following files were installed but not shipp=
ed in any package:")
> +               bb.warn("the following files were installed but not shipp=
ed in any package:")
>                 for f in unshipped:


I prefer also with files
-                         bb.note("  " + f)
+                         bb.warn("  " + f)

because later when reading logs from build I can see if it was something
important or just some file I don't need

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kORqDWCi7qDJ0mEj--

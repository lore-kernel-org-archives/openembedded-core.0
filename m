Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJrTd-0008Dx-IW
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 20:16:09 +0200
Received: by fxm19 with SMTP id 19so5071294fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 11:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7WLMCrDY9McJuSVLTSIHKbCYSBkXVXxGzTlIT59Pv5w=;
	b=vxIzmHRgRufCzlXkZAluUzjByhyhyMC3Sr++n3In+1vENFssUCtDHVo/O/n6Zza2+n
	PjppRf5zEJ57xuMzMBma3iO+MAlHkDO8ZefBXQ6IPD2TncsEY/BMhkH3tKekNwnElGzJ
	dlLYjhFaD+49ayO/5x7u3joLfsRht31ZhvxxA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=DbF8+Wj0g2F9cB4VxLpSo8qeqy2nKpqM8J3NYCq+UA/iuFwkNfBiB8D20Z5zVAKS1V
	Yft4wdWAX4tiNLV/S57A+cvRphoQkxsTySBCZXY2rXp78nrcobiyxjlEW5YqVJRceN9Y
	DHDFDKRj2FscgCaJgZv840UW5msULkInp5BOk=
Received: by 10.223.145.78 with SMTP id c14mr1360618fav.75.1305051202730;
	Tue, 10 May 2011 11:13:22 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c3sm1919057fav.3.2011.05.10.11.13.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 11:13:21 -0700 (PDT)
Date: Tue, 10 May 2011 20:13:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110510181314.GF3673@jama.jama.net>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
	<4DC8CA7E.4020302@linux.intel.com>
	<BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>
	<4DC97D27.9080602@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4DC97D27.9080602@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Pull request with misc changes
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
X-List-Received-Date: Tue, 10 May 2011 18:16:09 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qftxBdZWiueWNAVY"
Content-Disposition: inline

--qftxBdZWiueWNAVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 11:00:07AM -0700, Saul Wold wrote:
> On 05/10/2011 05:53 AM, Otavio Salvador wrote:
> > On Tue, May 10, 2011 at 02:17, Saul Wold<sgw@linux.intel.com>  wrote:
> >> Next time, please use the create-pull-request script, which will gener=
ate a
> >> set of patch emails so that we can review this information via email. =
I will
> >> make a couple of additional comments below associated with each patch.
> >
> > It has a problem to me since it depends on using the contrib repo and
> > I am using github.
> > ...
> Is there a reason you can't use the oe-core-contrib repo and create a=20
> branch there?  Can the script be modified to support github also?

I'm using slightly modified script for pull requests from gitorious.

send-pull-request are the same as long as you use git send-email and
have sendemail.to defined in repo.

To modify it for github is as simple as this I guess.

$ diff -uNr shr-core/openembedded-core/scripts/create-pull-request ~/bin/me=
ta-efl-create-pull-request=20
--- shr-core/openembedded-core/scripts/create-pull-request 2011-04-04 09:35=
:47.973626385 +0200
+++ /OE/bin/meta-efl-create-pull-request        2011-05-10 13:33:20.3496888=
15 +0200
@@ -2,9 +2,11 @@
 ODIR=3Dpull-$$
 RELATIVE_TO=3D"master"
 COMMIT_ID=3D"HEAD"
-PULL_URL=3D"git://git.openembedded.org/openembedded-core-contrib"
-WEB_URL_PREFIX=3D"http://git.openembedded.org/cgit.cgi/openembedded-core-c=
ontrib/log/?h=3D"
-PREFIX=3D"PATCH"
+#PULL_URL=3D"git://git.openembedded.org/meta-openembedded-contrib"
+#WEB_URL_PREFIX=3D"http://git.openembedded.org/cgit.cgi/meta-openembedded-=
contrib/log/?h=3D"
+PULL_URL=3D"git://gitorious.org/shr/meta-openembedded.git"
+WEB_URL_PREFIX=3D"http://gitorious.org/shr/meta-openembedded/commits/"
+PREFIX=3D"meta-efl][PATCH"
=20
 usage() {
 CMD=3D$(basename $0)

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qftxBdZWiueWNAVY--

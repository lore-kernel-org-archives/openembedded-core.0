Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <bjst@sestofb10.enea.se>) id 1U319C-0007de-Ce
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 10:18:30 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Wed, 6 Feb 2013
	10:02:36 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 3F454291D4B;
	Wed,  6 Feb 2013 10:02:36 +0100 (CET)
Date: Wed, 6 Feb 2013 10:02:36 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130206090236.GF34322@sestofb10.enea.se>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
	<5111374E.1050802@linux.intel.com>
	<CAC1BbcS3WTFO+UHKc-ZKL0ba2v4=mhW0Co2JdOVj-ryYsWm71w@mail.gmail.com>
	<511151CC.8080801@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <511151CC.8080801@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] Revert "Add ptest for glib."
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
X-List-Received-Date: Wed, 06 Feb 2013 09:18:33 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote:
> >-RDEPENDS_${PN}-ptest +=3D "\
> >-            eglibc-gconv-utf-16 \
> >-            eglibc-charmap-utf-8 \
> >-            eglibc-gconv-cp1255 \
> >-            eglibc-charmap-cp1255 \
> >-            eglibc-gconv-utf-32 \
> >-            eglibc-gconv-utf-7 \
> >-            eglibc-charmap-invariant \
> >-            eglibc-localedata-translit-cjk-variants \
> >-            tzdata \
> >-            tzdata-americas \
> >-            tzdata-asia \
> >-            tzdata-europe \
> >-            tzdata-posix \
> >-            python-pygobject \
> >-            python-dbus \
> >-           "
> Do you have some time to look at this and see if you can make use of
> TCLIBC to use the correct library and locale package info based on
> which libc is being used?
>=20
> I guess you did not originally think about the uclibc case.

Correct, I did not.

The list of packages added by ptest are things that are used by the glib te=
st suite. Without this data, some tests will fail.

I'll look into making it more uclibc friendly.

--=20
Bj=F6rn



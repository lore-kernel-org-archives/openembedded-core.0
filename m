Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <bjst@sestofb10.enea.se>) id 1U3jS2-00068E-D8
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 09:37:34 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Fri, 8 Feb 2013
	09:21:00 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 94215291D4B;
	Fri,  8 Feb 2013 09:21:00 +0100 (CET)
Date: Fri, 8 Feb 2013 09:21:00 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Message-ID: <20130208082100.GJ34322@sestofb10.enea.se>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
	<CAJTo0LYDkCvZUCp4U4o_2bsmuiVor69Wbh4Rd94g3WvQ4=X5Yw@mail.gmail.com>
	<CAC1BbcQss0BHe_CGx+H_QKbASNS-_4Bad8rHeCNdJERg-G8Y4w@mail.gmail.com>
	<CAJTo0LZh=XEoK7DYJqNy8OCthYMRd=+5gLjPMR3Aj8DX6R-76Q@mail.gmail.com>
	<CAC1BbcSpM5nGnH0QBQYOWEjuPVHpvEWR4uxBsErqx4h9n=-3yw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC1BbcSpM5nGnH0QBQYOWEjuPVHpvEWR4uxBsErqx4h9n=-3yw@mail.gmail.com>
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
X-List-Received-Date: Fri, 08 Feb 2013 08:37:36 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Bernhard Reutner-Fischer wrote:
> The uncompressed log is about 50MB, i put it here (still 1.2MB):
> http://busybox.net/~aldot/oe/mk.all.20130118-1442.53.log.xz

Can I ask how you worked around the iconv RPATH issue?

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2669

--=20
Bj=F6rn



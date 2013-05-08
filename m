Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UZxsh-0005JR-Ac
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 08:29:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r486BYFU012238
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2013 23:11:34 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 23:11:34 -0700
Message-ID: <5189EC92.1020909@windriver.com>
Date: Wed, 8 May 2013 14:11:30 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
References: <CA+AhUGxD7Taf2RhuoAp7FF=wfWWJnPSi7_o6fSZZiNMq-u0vgA@mail.gmail.com>
In-Reply-To: <CA+AhUGxD7Taf2RhuoAp7FF=wfWWJnPSi7_o6fSZZiNMq-u0vgA@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r486BYFU012238
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] bbclass for automatic generation of binary recipes
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
X-List-Received-Date: Wed, 08 May 2013 06:29:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable


Is it similar to meta/classes/package.bbclass ?

// Robert

On 05/08/2013 01:53 PM, Erik Bot=F6 wrote:
> Hi,
>
> Background:
> If you use OE to build software which includes e.g. a closed source
> library, but still want to others to be able to build software based
> on that library in a OE environment you would have to create recipes
> that contains a binary version of your library + headers manually.
> This would have to be done manually for each package, and as the
> development of the library continues the binary recipes will have to
> be manually updated to keep in sync.
>
> Idea:
> Create a new bbclass that handles this automatically as much as
> possible. The basic idea is to:
> - Create a tarball of ${WORKDIR}/image/ alternatively
>    ${WORKDIR}/packages-split/
> - By parsing the "source recipe", create a "binary recipe" that uses
> that tarball
>
> The binary recipe should work as a drop in replacement of the source
> recipe. This means that the other recipes depending on the closed
> source software shouldn't need to be adapted to work with one or the
> other.
>
> I'd like feedback on whether you think the idea is feasible, and if
> you think it could be useful for others. And anything else you think
> of.
>
> Cheers,
> Erik Bot=F6
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



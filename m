Return-Path: <Bjoern.Stenberg@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 588C7610DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 08:41:42 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 23 Sep 2013 10:41:38 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id B3EB228BD31;
	Mon, 23 Sep 2013 10:41:38 +0200 (CEST)
Date: Mon, 23 Sep 2013 10:41:38 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: <rongqing.li@windriver.com>
Message-ID: <20130923084138.GE26522@sestofb10.enea.se>
References: <1379901723-887-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1379901723-887-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ptest-runner: compatibile with busybox
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
X-List-Received-Date: Mon, 23 Sep 2013 08:41:43 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

rongqing.li@windriver.com wrote:
> +    for x in `find $libdir -name run-ptest -type f`
> +        cd `dirname "$x"`

You can get this list of ptest dirs by just running `ls -d */ptest`. It is =
simpler and also much faster than using "find".

--=20
Bj=F6rn


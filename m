Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id B5EC070A03
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 10:16:56 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so4692362wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 03:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZwoGXrlcIwns8wnrQZ3BW2v9SNUHgvCusH71MOq0Wqw=;
	b=SSz4egvt++NZ/0BMgXx+6BgdyIoHEn0aWMc/+PMotaBeUOuCRpkNTMcBaMA0FJq1P1
	cwGGbcmSBak8jp6hIDA6YBk9ETwUgT6w17kTxm3Pv8pj4xzjTeXiyosU3jzjOsh4K16m
	I71UIzQpoVoIB/DyJ/OPQnvZ2q3Xk1seEpbWd2s7+JtyMQ3IiViHfhZVMyLM9m6dZpS/
	d/dArDLB+JeVt67GLn498i9vtJMGPUsoeF9DuMUFEiPZRgA+0nud1MEGKS4f7Zj7eJ4c
	Rmhjmcm6KdOadklFTOUmVrSm4Tz/IxBzk3bHOoUZvDzeb3AmgJsyeY6wRkOwuq3XJRlK
	0viw==
X-Received: by 10.180.94.234 with SMTP id df10mr58201476wib.76.1407406617306; 
	Thu, 07 Aug 2014 03:16:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h13sm8882449wjs.2.2014.08.07.03.16.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 03:16:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Aug 2014 12:17:27 +0200
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20140807101727.GV14848@jama>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<53E34C57.6010100@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <53E34C57.6010100@pabigot.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: patchwork client problems
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
X-List-Received-Date: Thu, 07 Aug 2014 10:16:58 -0000
X-Groupsio-MsgNum: 56087
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aBaYPhOdNx+t7mr3"
Content-Disposition: inline

--aBaYPhOdNx+t7mr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 04:52:23AM -0500, Peter A. Bigot wrote:
> On 08/04/2014 03:16 PM, Otavio Salvador wrote:
> > On Fri, Aug 1, 2014 at 10:07 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> >> On 07/14/2014 04:21 AM, Peter A. Bigot wrote:
> >>> I'm finding attempts to use pwclient on
> >>> http://patches.openembedded.org/xmlrpc/ produce an ExpatError because=
 the
> >>> returned document is always empty (per a wireshark trace of the
> >>> transaction).  Can somebody confirm that the server for the command-l=
ine
> >>> client is working properly?  Thanks.
> >>>
> >>> Peter
> >>>
> >> I've downloaded a fresh copy of pwclient from
> >> http://patches.openembedded.org/help/pwclient/
> >>
> >> I've verified my .pwclientrc is exactly what the project info tells me=
 it
> >> should be:
> >>
> >> [base]
> >> url: http://patches.openembedded.org/xmlrpc/
> >> project: oe-core
> >>
> >> I've verified that pwclient works with other servers.
> >>
> >> And I still get empty documents back from the OE patchwork server for =
every
> >> pwclient command I try.
> >>
> >> Anybody have any idea what's going wrong?
> >>
> >> Thanks.
> >>
> >> Peter
> >>
> >> llc[40]$ /tmp/pwclient projects
> >> Traceback (most recent call last):
> >>    File "/tmp/pwclient", line 500, in <module>
> >>      main()
> >>    File "/tmp/pwclient", line 439, in main
> >>      action_projects(rpc)
> >>    File "/tmp/pwclient", line 213, in action_projects
> >>      projects =3D rpc.project_list("", 0)
> >>    File "/usr/lib/python2.7/xmlrpclib.py", line 1224, in __call__
> >>      return self.__send(self.__name, args)
> >>    File "/usr/lib/python2.7/xmlrpclib.py", line 1578, in __request
> >>      verbose=3Dself.__verbose
> >>    File "/usr/lib/python2.7/xmlrpclib.py", line 1264, in request
> >>      return self.single_request(host, handler, request_body, verbose)
> >>    File "/usr/lib/python2.7/xmlrpclib.py", line 1297, in single_request
> >>      return self.parse_response(response)
> >>    File "/usr/lib/python2.7/xmlrpclib.py", line 1471, in parse_response
> >>      p.close()
> >>    File "/usr/lib/python2.7/xmlrpclib.py", line 560, in close
> >>      self._parser.Parse("", 1) # end of data
> >> xml.parsers.expat.ExpatError: no element found: line 1, column 0
> > I have same error; I am adding Khem who I know has access to the
> > server and can know more about it.
>=20
> Thanks for confirming this isn't just me.
>=20
> It's a bit of a problem, since without a working pwclient I can't tell=20
> if there's already a patch that does what I need.  If there's a way to=20
> search through the browser interface I haven't figured it out.

Click on "Filter" link in top left corner of the table.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aBaYPhOdNx+t7mr3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPjUjcACgkQN1Ujt2V2gBxLzACeII+xyaGBe84RifVGpbrIDDNy
EgQAmgLUqSY7dCubp8KUqB4wlhhW4GpS
=fEuJ
-----END PGP SIGNATURE-----

--aBaYPhOdNx+t7mr3--

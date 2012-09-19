Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
	helo=mho-01-ewr.mailhop.org) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blloyd@familyhonor.net>) id 1TEOll-00041a-I2
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 20:13:05 +0200
Received: from [98.142.68.244] (helo=lloydserv.familyhonor.net)
	by mho-01-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1TEOZT-000Bfg-PR; Wed, 19 Sep 2012 18:00:24 +0000
Received: from [10.78.227.203] (mobile-166-147-064-034.mycingular.net
	[166.147.64.34]) (authenticated bits=0)
	by lloydserv.familyhonor.net (8.14.5/8.14.5) with ESMTP id
	q8JHxoBU027862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Wed, 19 Sep 2012 13:00:11 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.68.244
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX18pD2/zxbjRRZmFVM/mhrN7B5C2JKrSXlg=
References: <CAB3sqtaZSMuxaFkeaXtAuFAwcE2=JuXJTE56J-F-=pKvZddpjg@mail.gmail.com>
	<CAMKF1sr8_PN8p0H+35JqUAyKyDLFTij4etP47VEb613pOi11Tw@mail.gmail.com>
	<CAB3sqtb1fBxg0u=1RWL5m5aY1LLeBZwRe-Qb5eVf+R=UjjYBHg@mail.gmail.com>
In-Reply-To: <CAB3sqtb1fBxg0u=1RWL5m5aY1LLeBZwRe-Qb5eVf+R=UjjYBHg@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <177B8C55-470B-4E98-B51E-ED11F2F3B091@familyhonor.net>
X-Mailer: iPhone Mail (9B206)
From: Brian Lloyd <blloyd@familyhonor.net>
Date: Wed, 19 Sep 2012 12:59:44 -0500
To: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: SVN checkout ERROR: Function failed: Fetcher failure for URL:
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
X-List-Received-Date: Wed, 19 Sep 2012 18:13:05 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-352B8874-FF19-45A3-85C5-21EA46D3E4E1
Content-Transfer-Encoding: 7bit

--Apple-Mail-352B8874-FF19-45A3-85C5-21EA46D3E4E1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

This may be a dumb question, but what does svn.local.repo resolve to?

Brian A Lloyd

On Sep 19, 2012, at 12:54 PM, Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>=
 wrote:

> I've tried with both protocol=3Dhttp and without the argument at all. Stil=
l not fetching!
>=20
> On Wed, Sep 19, 2012 at 6:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Sep 19, 2012 at 9:48 AM, Tarek El-Sherbiny
> <tarek.elsherbiny@gmail.com> wrote:
> >
> > I would like to check out from our local SVN repository. This is the URI=

> > line I'm using in the recipe:
> >
> >  SRC_URI =3D
> > "svn://svn.local.repo/svn/dev_repos/Generation3_app;module=3Dtrunk;proto=
=3Dhttp"
>=20
> use protocol=3Dhttp above and make sure that your server exports over
> http otherwise drop the argument
>=20
> >
> > When I try the same command bitbake is using on the command line it work=
s
> > fine. But bitbake is not fetching the package.
> >
> > Is there a special parameter that I need to modify for SVN to work?
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--Apple-Mail-352B8874-FF19-45A3-85C5-21EA46D3E4E1
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=utf-8

<html><head></head><body bgcolor="#FFFFFF"><div>This may be a dumb question, but what does svn.local.repo resolve to?<br><br>Brian A Lloyd</div><div><br>On Sep 19, 2012, at 12:54 PM, Tarek El-Sherbiny &lt;<a href="mailto:tarek.elsherbiny@gmail.com">tarek.elsherbiny@gmail.com</a>&gt; wrote:<br><br></div><div></div><blockquote type="cite"><div>I've tried with both protocol=http and without the argument at all. Still not fetching!<br><br><div class="gmail_quote">On Wed, Sep 19, 2012 at 6:41 PM, Khem Raj <span dir="ltr">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="im">On Wed, Sep 19, 2012 at 9:48 AM, Tarek El-Sherbiny<br>
&lt;<a href="mailto:tarek.elsherbiny@gmail.com">tarek.elsherbiny@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I would like to check out from our local SVN repository. This is the URI<br>
&gt; line I'm using in the recipe:<br>
&gt;<br>
&gt; &nbsp;SRC_URI =<br>
&gt; "svn://svn.local.repo/svn/dev_repos/Generation3_app;module=trunk;proto=http"<br>
<br>
</div>use protocol=http above and make sure that your server exports over<br>
http otherwise drop the argument<br>
<div class="HOEnZb"><div class="h5"><br>
&gt;<br>
&gt; When I try the same command bitbake is using on the command line it works<br>
&gt; fine. But bitbake is not fetching the package.<br>
&gt;<br>
&gt; Is there a special parameter that I need to modify for SVN to work?<br>
</div></div></blockquote></div><br>
</div></blockquote><blockquote type="cite"><div><span>_______________________________________________</span><br><span>Openembedded-core mailing list</span><br><span><a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a></span><br><span><a href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a></span><br></div></blockquote></body></html>

--Apple-Mail-352B8874-FF19-45A3-85C5-21EA46D3E4E1--

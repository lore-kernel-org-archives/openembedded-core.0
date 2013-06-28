Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 22D626A961
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 20:03:54 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id tj12so2819813pac.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 13:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to:x-mailer;
	bh=paMfyDyID2uAWt3imO6MCRYFP8elJY+k+hEmUTMppvw=;
	b=K13NJCDM84Q5vg/J2pzWMWJVwlUzQWSmYqtoj8ZQHoEuZ7sapin++lXfZRBuSuMyRp
	S+5p2CDV1e5pU6qy3BOjrsbUeTMDJE8h4yqO3u8fKd1mWCyBuBzaW7HbwFV7t28IXIdA
	wZ28I76jZBkwhVNR2sSMNpH4d7I+4/LCBCC/9qTYI5MG9HuXXr3pM3/40mTxNVjsFWqb
	swDF6/Aw8pQpKzAW/UP4VmAjjKdRUebYP6luyhNFljGo/DigaTMKxr7XSQV8YNNKLHEz
	uZKDjU4IlwAXKg9S1MQq/T6/hv2FHifEmvYqRwMpOZAYJow0RfnAALzqS7ephqzlZjIz
	YnBA==
X-Received: by 10.68.175.33 with SMTP id bx1mr13088034pbc.21.1372449835270;
	Fri, 28 Jun 2013 13:03:55 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id to6sm10439412pab.0.2013.06.28.13.03.54
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 13:03:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAOHjBZvpKQ2+g5Zi+hQp=7OgNpxLpfiVtcCL7hcVwUNg1CQ9Pg@mail.gmail.com>
Date: Fri, 28 Jun 2013 13:03:53 -0700
Message-Id: <75A9E1A3-12E2-42EA-877B-16CD2B712638@gmail.com>
References: <CAOHjBZuT=59w2VQRUtRfYyEvn7iO_hUuw_pova-jVRSGdgu1PA@mail.gmail.com>
	<CAOHjBZvpKQ2+g5Zi+hQp=7OgNpxLpfiVtcCL7hcVwUNg1CQ9Pg@mail.gmail.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: csl_versions issue on latest update
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
X-List-Received-Date: Fri, 28 Jun 2013 20:03:54 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F34728B2-232F-4703-A8AC-8339FC626246"

--Apple-Mail=_F34728B2-232F-4703-A8AC-8339FC626246
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On Jun 25, 2013, at 7:44 AM, Giuseppe Condorelli =
<giuseppe.condorelli@gmail.com> wrote:

> Solved, updating bitbake to commit  =
3d8044bc79c482c5ea008ddf12a8128dcd1527ee solved the issue.
> Since now I've worked against the commit =
6acd444a557bba977ae1772371fdadf5f510e3b6, which indicates the new 1.19.1 =
version.
> =20


when you are using master of oe-core please use master of bitbake with =
it always for best results.
many  a times changes go into both repos which depend on each other


> Thanks,
> Giuseppe
> 2013/6/25 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
> Hi All,
> =20
> I'm working with the best so far master openembedded-core repository =
plus the bitbake version 1.19.1
> Using the external toolchain csl I'm in trouble because it seems the =
latest modification in the csl-versions.inc
> breaks the csl_get_version routine. I mean, it is not able to find the =
gcc version due to wrong binary name:
> it doesn't attach the TARGET_PREFIX so it finds for gcc only =
(failing).
> The issue seems located to the csl_versions_handler routine, =
backporting it solves the issue.
> =20
> Please can you look at that routine and let me know if I'm wrong in =
something?
> =20
> Cheers,
> Giuseppe
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_F34728B2-232F-4703-A8AC-8339FC626246
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv="Content-Type" content="text/html charset=iso-8859-1"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space; "><br><div><div>On Jun 25, 2013, at 7:44 AM, Giuseppe Condorelli &lt;<a href="mailto:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gmail.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><blockquote type="cite"><div>Solved, updating bitbake to commit&nbsp; <a href="http://cgit.openembedded.org/bitbake/commit/?id=3d8044bc79c482c5ea008ddf12a8128dcd1527ee">3d8044bc79c482c5ea008ddf12a8128dcd1527ee</a>&nbsp;solved the issue.</div><div>Since now I've worked against the commit <a href="http://cgit.openembedded.org/bitbake/commit/?id=6acd444a557bba977ae1772371fdadf5f510e3b6">6acd444a557bba977ae1772371fdadf5f510e3b6</a>, which indicates the new 1.19.1 version.</div>
<div>&nbsp;</div></blockquote><div><br></div><div><br></div><div>when you are using master of oe-core please use master of bitbake with it always for best results.</div><div>many &nbsp;a times changes go into both repos which depend on each other</div><div><br></div><br><blockquote type="cite"><div>Thanks,</div><div>Giuseppe<br></div><div class="gmail_quote">2013/6/25 Giuseppe Condorelli <span dir="ltr">&lt;<a href="mailto:giuseppe.condorelli@gmail.com" target="_blank">giuseppe.condorelli@gmail.com</a>&gt;</span><br>
<blockquote style="margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class="gmail_quote"><div>Hi All,</div><div>&nbsp;</div><div>I'm working with the best so far master openembedded-core repository plus the bitbake version&nbsp;1.19.1</div>
<div>Using the external toolchain csl I'm in trouble because it seems the latest modification in the csl-versions.inc</div>

<div>breaks the csl_get_version routine. I mean, it is not able to find the gcc version due to wrong binary name:</div><div>it doesn't attach the TARGET_PREFIX so it finds for gcc only (failing).</div><div>The issue seems located to the csl_versions_handler routine, backporting it&nbsp;solves the issue.</div>


<div>&nbsp;</div><div>Please can you look at that routine and let me know if I'm wrong in something?</div><div>&nbsp;</div><div>Cheers,</div><div>Giuseppe</div>
</blockquote></div><br>
_______________________________________________<br>Openembedded-core mailing list<br><a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>http://lists.openembedded.org/mailman/listinfo/openembedded-core<br></blockquote></div><br></body></html>

--Apple-Mail=_F34728B2-232F-4703-A8AC-8339FC626246--

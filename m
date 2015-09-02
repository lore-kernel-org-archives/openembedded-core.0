Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 163397702A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 20:28:43 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so53039201wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 13:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3FkyswzMd9N2W/8JrSnmTdPI/ecclN7Zew2fhI9R+gc=;
	b=IieNKB79aVLjMmNhdwP5D/MloqXf5AWej1yOawhv46vVp3IhCUuJSBxYZRiXdmW1u7
	4P2k/IdL8TKZDsYMVqe8RQCy47hbeX+UWeUvKIn8HCFSPusWi/Q4BpRHVH/ch6c/yMTZ
	W/2o/R+yl4csGhb7+Avi0wTAlPI2kGh34Lv6kmWYfA0ZGyKdRCuJ0C0t0wmGNAWh5aC5
	E2D7I07z2E9Dt5oNh4IL16tquL6mPbDEYcFMLX8D6oVW0g8lMAiWqcbXJvySal2HFraJ
	i/4vX5Oc0foowMpgCOjhY175MvVlfms0lWf0p3GZ/0F+LGTksYpxogBIS3QufZWh2ORh
	UViA==
X-Received: by 10.194.187.79 with SMTP id fq15mr13492052wjc.142.1441225722981; 
	Wed, 02 Sep 2015 13:28:42 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i7sm5310813wib.15.2015.09.02.13.28.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 13:28:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Sep 2015 22:29:03 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150902202903.GA29340@jama>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<1441137870.24871.11.camel@linuxfoundation.org>
	<6BBD8EEF-2579-4C56-98E2-BAC8B974E3FE@gmail.com>
	<1441179093.24871.49.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1441179093.24871.49.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Wed, 02 Sep 2015 20:28:47 -0000
X-Groupsio-MsgNum: 70530
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2015 at 08:31:33AM +0100, Richard Purdie wrote:
> I've not said it is a bad thing. What I'm asking is whether more people
> can devote a bit of time to fixing things which aren't their immediate
> problem?

Part of this problem is that sometimes it's almost too pain-full to get
some changes merged for issues which are my immediate problem that in
the end I have to implement them in our fork anyway, We cannot wait
months until it's merged and then few more months to get it backported
into older releases we're using.

So now it's usually fix it in the fork first and then if it doesn't look
controversial, try to upstream it, but the with much lower priority.

like:
http://lists.openembedded.org/pipermail/openembedded-core/2014-March/091222.html
http://patchwork.openembedded.org/patch/76601/ sent July 2014, went in on Mar 9 2015

I'm not saying it's yours or Ross's or anyone's fault. Or I'm faulty as well
with rejecting meta-oe patches until they pass my "bitbake world" tests
and sometimes it can be very hard to reproduce the issues found there.

But I understand the pain and frustration of contributors and agree with
Khem that in long term we have to do something about it or will start
loosing contributions even faster.

> For example, Martin mentioned problems with errors.yp.org.
> There are a ton of open issues with errors.yp.org (see bugzilla) and if
> we fixed a few of those, the reporting systems would work a lot better
> and more reliably. I am struggling to find anyone to work on that right
> now :(. Its just one example of where some help from others would go
> help improve the core of the project for the benefit of all.

I was in contact Andreea about some of these errors.yp.org issues when I
was extending/re-writting it for our purposes and fixing the issues I found
along the way, but we didn't get very far into integrating my fixes.

Since then it was re-written by Michael Wood so I cannot easily upstream
my changes and I'm not very interested in the re-write, because our version
just works.

I'll send patch which shortens too long failure logs, because it helps
reporting errors from bitbake world builds.

Cheers,

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXnXA8ACgkQN1Ujt2V2gBxWXQCgjRMJPSUOzVJHqRB62KHS69KU
5b4AoIM/na4hA3fy3lz36OIPx2Zoni76
=jR8t
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--

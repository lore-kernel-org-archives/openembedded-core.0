Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 201ED7317D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:54:51 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l68so36692296wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=6rdT0q1MkzyizAK1AZBmqM858MlPugMBkKl72Hq+Oo8=;
	b=Ri8OvZ+vyC6FYeh05Ki1C+f8NysKyB5zp0gEn5T5OQjUA4XHeDASx9I5iHrwXgMn8q
	kPgVGRUNAwQxCGof32fEIus+27DkeKpKTD2F6p/UFegvpSwOgwB/zcd8s0+khZcfuc9K
	tLgTm6l5bmT3S/GGhCTOGNmB/I/R5yQ1++YuAjbmI4QSgGdfC70hzUa2SCJPxi+ePrem
	eLIPHYFmfQYv+tujH/nrY8hM2hnc3Vl4M2ykMDKOYJGYzYhhuBy69OvN05vaNGK09wJu
	qLrvP/qv7zSqogiEXG2ZISw1BMDKPnBCGxu02JO9cwOp3MATU9bM0KJYiIUlEPCaaS6w
	9T5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6rdT0q1MkzyizAK1AZBmqM858MlPugMBkKl72Hq+Oo8=;
	b=iakSuhUOTjFiugNnhFlDbUPtaI12hs53Ftc9QQkoOUkRV/iUVP8wQ0FJHiVl0n+L0A
	BtNFe7R3PHftVB8ct5h4ABdKO63ob54NivPS/EOsktkwlICiBsPg0aSmG10fE3mdzyO8
	dH24LXS9X0BWK0djzM18zfaCAjXRiMAhhniIAGa1tkXAEgJPMNsi3ffpnofUSg02R0g2
	qhSIplxPRMSqGfRDnWLub3QlJxXViV67yf03Y61Dyv44SY/hha1+8CQm9M4gCqHmIgaP
	Yje+3tMnnMERUsZC3EFRqHHTUkDxRH3VOXcttO+wk7nki8teG10Z5ytYTr1NnlzjNQEn
	Kyyg==
X-Gm-Message-State: AD7BkJIMrVVvZxB5zX3TTqMDVfbkkUNjO8m13FwSGaYGtQm0/gGFky0JsGdI2bgAsRl3xg==
X-Received: by 10.194.116.9 with SMTP id js9mr5421872wjb.112.1457625291912;
	Thu, 10 Mar 2016 07:54:51 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id v82sm4151878wmv.6.2016.03.10.07.54.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Mar 2016 07:54:50 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <56E1028C.6080605@mlbassoc.com>
Date: Thu, 10 Mar 2016 16:54:48 +0100
Message-Id: <E219D57B-2F63-40DE-9C33-161AE6F738CC@gmail.com>
References: <56E1028C.6080605@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Problems with perl 5.22
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
X-List-Received-Date: Thu, 10 Mar 2016 15:54:52 -0000
X-Groupsio-MsgNum: 79408
Content-Type: multipart/signed;
	boundary="Apple-Mail=_50E88E4E-2C20-412B-A707-0DB7E0CF5C87";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_50E88E4E-2C20-412B-A707-0DB7E0CF5C87
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> Am 10.03.2016 um 06:13 schrieb Gary Thomas <gary@mlbassoc.com>:
> 
> I'm working on a package (amanda - the Advanced Maryland Archiving
> system) that is written heavily in perl with swig interfaces to C.
> This code ran great until the update to perl 5.22; it now dies a
> horrible death on almost every activity.  These failures seem to
> always be in the swig generated wrappers, but that may just be
> where most of the work gets done.
> 
> I've narrowed this down to exactly the change to perl 5.22 from
> 5.20. Using bisect as well as experimentation (e.g. trying all
> the compiler combinations that have occurred since a last good
> version) and I can go from working to failing by only the change
> in perl.
> 
> The interesting (scary) thing is that I've built amanda for my
> target natively on my board running debian, including perl 5.22.
> This means I can't say definitively  that perl 5.22 is the culprit
> as on debian it runs fine.  So, it's got something to do with the
> OE environment/porting/packaging of perl and not just the revision.
> 
> I've also tested this on multiple architectures (ARM, PowerPC) with
> the same results - with perl 5.20 amanda works, with perl 5.22 it fails.
> 
> I've compared the actual 5.22.1 sources used by OE-core and debian
> and they are subtly different, although I can't pinpoint any change
> that might be responsible.
> 
> For the moment, I can just fall back to perl 5.20 for my target
> that needs to run amanda, but this isn't a real solution (e.g.
> in this state I can't propose my recipe to any layer as it's
> totally broken with the current OE-core).  I'd like to see this
> fixed but the amanda code (swig wrappers) are horribly complex
> which makes debugging quite the challenge, not to mention they
> may be about the only way to uncover the bug, whether it's in
> amanda or perl.
> 
> Any suggestions on how to move forward?

Since I have no clue what's wrong and how it fails (backtrace
would point in some directions), several ideas might work:

How clean is your build location (we realize that often between
updates some files remain in our target images until we wipe
tmp/ - cleansstate for image doesn't help ...)?

Did you prove the library path's of your *.so's? Perl does
almost everything within libperl.so - build against wrong version
causes in weird crashes (scan DBI mailing list for admin's
build issues of DBI on AIX/HP-UX ...).

Maybe share your recipe can help to reproduce the problem
elsewhere and debug locally.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_50E88E4E-2C20-412B-A707-0DB7E0CF5C87
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW4ZjJAAoJEESZlq7c5QqdL5gP/jbE5JTDZ4DAkHK12EF3RL8D
kfOmwq6GwEpmr4wQL0sGHkTUV9+hkFsyuXO5LLdpsm378itNIhkCzW8lT802lr43
fYkewONRK1hCUZG1ADwTbfci9/Zc1/Y/pwzDCX4nAxAQnOWW6xW54WxWZY64tkUQ
cGPMpPZWiN++UqhVXZVisJEmbWMsQcJn/VAEPrffSg3P0wjRpmn19mmHiOi2Awl4
slFhk7tw0BYOq0fCeJSsEF19Lo74huuzps9iW0sKIIhe5RKHS+YnlIXHoLBHcy8n
qgA3Ze9S3hZLJyz/hdLAQ7/RGZS08tLW993VavuM94yIikFkVGQF1p7gx/GghTYF
B/nc37J8Ad3gQ9SSyxHeNSbnT9unRM/p5DJK/4pohrVt5ZMsxwSJmbZksX7tnUR9
0JKDPYtpxbv0i4P00le+7D6C55FIORnmBVQJ7MXoi1YLM53rXv6da6PQCnQcARof
k0qCwObQsZyq93ODkbM0bOLv1qSCPXdTI8h5+2WHtAL5bY2i7kKGoQkiLA2oaRm2
UhMDxhSmo17DTPmN45CgfUeQAz+tv5lOJDXWgDLK/KpMIQoAD2zhMpxsHEogm24b
TYgAizucX5tnud9R+W4sBlWTXntIh83h5LIx82rihFzHsUxwE5qSFmNmi1ulecGS
meqnlfLnmzSakQ/r+cBL
=Pz7o
-----END PGP SIGNATURE-----

--Apple-Mail=_50E88E4E-2C20-412B-A707-0DB7E0CF5C87--

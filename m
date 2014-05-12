Return-Path: <drew@moseleynet.net>
X-Greylist: delayed 463 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 14:48:40 UTC
Received: from mail-pa0-f45.google.com (unknown [209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id D845560167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 14:48:40 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id ey11so8748325pad.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=moseleynet.net; s=google;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=K6b5lX08ET0+G3Ob9dQcctETuHJijwDMOOl99w7wE1A=;
	b=TYD/rk6HIPJOZq5yI2aJhIGZ6tWkDHxG8nBxEIJhoGCKYwxo2Eh+3ecGnirfe0weSp
	6HOoy5D60EIfp2RUcRY9vvz0/dtWttxW83B1YVM5yIIYRumJJ6zpzUq181s9Rgoo6RDe
	DUuZ31V3+MbIMlf6qTDJc88iaJuqeXgoKZV+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=K6b5lX08ET0+G3Ob9dQcctETuHJijwDMOOl99w7wE1A=;
	b=V02geVhUI/zfRgn8qlLn8KJF1x2eN5EAFAK7UWJZfpbyQkn+84/IF2aLRyRtJJFwf5
	tbd8HXJA66gR6XTA4JPZdcBtf4NtCdGLL4X3DhL31bSL8uOTARJt+H0NJVicWcrKWt6h
	KLByX+exYL5qwe6krTz9vKR5izIDkbvmeS8lqZkitqkceraiIeH1BGTwPML7tK++SbrV
	D/x9vMCxN3ifNQlgg3V+vuyUq/fa8YCb3mET6tOekDKlP3iLFWzlI8YgEpb2PLzhmLbk
	NmaO7b8cqXO4W6KkFW4IdpC5/+gMQHmVozxObvAb/73JlmkeqNGjBVdUa+5GfonYpw5i
	xASQ==
X-Gm-Message-State: ALoCoQnlx0jDCVDkpdUzY1bp4bHkdVehlQcJBWrRGGdAdvV61xQfpXqH5EDoU6ERqaqktF37WyF0
X-Received: by 10.66.158.132 with SMTP id wu4mr56852210pab.66.1399905659164;
	Mon, 12 May 2014 07:40:59 -0700 (PDT)
Received: from [192.168.1.33] (cpe-174-096-222-251.carolina.res.rr.com.
	[174.96.222.251]) by mx.google.com with ESMTPSA id
	yn4sm23187278pbb.95.2014.05.12.07.40.58 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 May 2014 07:40:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Drew Moseley <drew@moseleynet.net>
In-Reply-To: <CAMKF1srGS73dbGsRC3hw6Aewn7aHp0JokEFisy=vRy4WBmmSCQ@mail.gmail.com>
Date: Mon, 12 May 2014 10:40:55 -0400
Message-Id: <F9CF7C25-EA6B-4177-B269-C20B1E9CB608@moseleynet.net>
References: <1399580261-16249-1-git-send-email-drew@moseleynet.net>
	<CAMKF1srGS73dbGsRC3hw6Aewn7aHp0JokEFisy=vRy4WBmmSCQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1874)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-demos: Specify the lib dir to locate glut libraries
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
X-List-Received-Date: Mon, 12 May 2014 14:48:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On May 10, 2014, at 2:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, May 8, 2014 at 1:17 PM, Drew Moseley <drew@moseleynet.net> =
wrote:
>> +PACKAGECONFIG[glut] =3D =
"--with-glut=3D${STAGING_LIBDIR},--without-glut,"
>=20
> should this be libdir instead ?

I don't believe so.  This is used at compile time to locate the =
libraries and header files.  However forcing it here to be the libdir is =
clearly not correct even though it doesn't seem to break the build.

I'll continue investigating and see if I can find a better solution.=20

Drew=


Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5609165CDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 09:57:36 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id y10so3324728wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 01:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=Ena95B0ngrk4VDoCq+MgHO2uKjMY76ADglQO1XitErc=;
	b=V3/OsCsCRUF9NITFSZnubqFFd4clyTq3HP50rFUMnQhY7hYJaeD91HKUMCIzo4AJ7B
	0Cj48gCuF35Hd8xilgLJCpKTBYCNXWOaAaWi0TjNmbzMK6b9pTPSsZtTk4u6i3JqILG6
	tb7SK1rV9tHaLz9NwBMvrU8NctPMVzQXEj8B6w1UMNuEOODrx1ZnEQHuozIsmsfC3hZR
	3wZwieidRoD/crQUXydpP7d5TYXUeiL40tCxHlEHxNq2+oe9Z4SnsygDrTar6O5SsQxl
	je0AmFjt8wz8XtVqhYkstCYT3+oBsNRFlmg6Zr7TdZAdJETH/qEXLBO7X40wXSCycc3C
	nMVQ==
X-Gm-Message-State: ALoCoQnyQS/PnaC2Gq9T5PxP/3ivS/p0W86aULSfAyOCyBKy27t816EQ3yDAt04nRIim0NUn2PPn
X-Received: by 10.194.103.230 with SMTP id fz6mr14340048wjb.53.1415354256471; 
	Fri, 07 Nov 2014 01:57:36 -0800 (PST)
Received: from ?IPv6:2001:610:612::7934:af7c:ae9a:7a11?
	([2001:610:612:0:7934:af7c:ae9a:7a11])
	by mx.google.com with ESMTPSA id f7sm1379043wiz.13.2014.11.07.01.57.34
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 07 Nov 2014 01:57:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
Date: Fri, 7 Nov 2014 10:57:33 +0100
Message-Id: <5475F887-48B8-42E6-85D3-7200814EC360@dominion.thruhere.net>
References: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Moving llvm to oe-core?
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
X-List-Received-Date: Fri, 07 Nov 2014 09:57:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 6 nov. 2014, om 18:42 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>=20
> Hi,
>=20
> So I think it's fair to say that neither GCC nor LLVM are going away =
anytime soon, both having their respective niches.  Because of this I'm =
wondering if we should be adding LLVM to oe-core (taking the meta-oe =
recipes).  GCC will still be the cross-compiler used but LLVM will be =
available out of the box, for example the Gallium LLVM-based Mesa =
drivers can be enabled without requiring meta-oe.
>=20
> Anyone have thoughts/comments/objections?

Having llvm enabled by default in mesa would save me a few distro =
overrides. Just try to enable r600 support and you'll see how painful =
the current situation is.

regards,

Koen=


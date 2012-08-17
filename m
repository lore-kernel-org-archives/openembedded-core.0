Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T2Ic8-0007N9-1X
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 11:13:08 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 17 Aug 2012 02:01:08 -0700
Received: by obceq6 with SMTP id eq6so4350911obc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 02:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=HW8s7/E9avijRrBgNAahtVdLvT6p+Kdw0Mr3qWVowDQ=;
	b=ow2pin5abaueOfQH0Fpy0ORCezSULGyFSDbLXqWCggh0aJzBcJhGVedCb98hoOTClf
	NA42gaOWESFRPdVz/+F/1UVMHs8HaLsg54Eg65obNt6DXC6FCs1h3FyIeEtpehcE8U3d
	rtkynzNCTazEXWJLHV/sEJgUMLmcuHUbs1lbyig/2LsDPy5ewG7HH7Y/waMuhuUPNb6P
	xkiQ/0TDfGLw6WETfyjqzCk1SQPEb8kyQOf/r225NyHKAibeApEeapdaIpuM2Gh+Yy+M
	VNBMuyymMBtyPLSd8KPLDGzXjuffTJVQdmr20lzrvrAB0Xj+eetOYjT0rGQp6/Kp9w9G
	zRKg==
Received: by 10.60.28.162 with SMTP id c2mr3407294oeh.3.1345194067667; Fri, 17
	Aug 2012 02:01:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Fri, 17 Aug 2012 02:00:47 -0700 (PDT)
In-Reply-To: <1345193717-23225-2-git-send-email-schnitzeltony@googlemail.com>
References: <1345193717-23225-1-git-send-email-schnitzeltony@googlemail.com>
	<1345193717-23225-2-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Aug 2012 10:00:47 +0100
Message-ID: <CAJTo0LYBdGj1ANujgM0f0mU8OE5XXovegKzQqVhXROT=qa=6ZQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn+7MLaYAidIWoiVfvFK9R9mj4wsQHr/WaMt9xFMaC0RpvA/y/qrwOsxaNcwdM1Pt5FUVqm
Subject: Re: [PATCH 2/2] webkit-gtk: update to 1.8.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 09:13:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 August 2012 09:55, Andreas M=C3=BCller <schnitzeltony@googlemail.com>=
 wrote:
> -SRC_URI[md5sum] =3D "f2f01b1fdc7262a2eede81ebed0970b2"
> -SRC_URI[sha256sum] =3D "9a126a76b40ca61adb1f1626e1567f976740af2332948cc5=
189489dbd01e3b28"
> +SRC_URI[md5sum] =3D "f7bd0bd4f323039f15e19c82a9a8313c"
> +SRC_URI[sha256sum] =3D "0cd69b7c4bf4af3442a5e6777a1487cabf14db15baeeed96=
d0865419f69b81e6"

I've got this patch in a branch too, but I was... concerned by the
hashes of the tarballs not matching the hashes in the release mail.  I
mailed the person who sent the release announcement but no reply.

Did you chase upstream about this -- I presume it's a genuine mistake
(maybe the tarball was re-generated) but I'm curious.

Ross



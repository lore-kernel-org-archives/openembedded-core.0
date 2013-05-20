Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UeUR9-0008W1-Jo
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 20:03:56 +0200
Received: by mail-pb0-f45.google.com with SMTP id mc17so2155551pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 10:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=5WH+b3l14T257vhWmolglvUX1fc2v3NWLJYmR+jly4c=;
	b=heosWL4Zi4exD1lCG58inWWDbTAB3MDc02tXDgsPL100ATKyMsfUA+gITgCv5/n8dJ
	qppRGXP+g+AW72tpkXWEXA9PMVWCBaJLauMcKFUa0Y6CvJMtnUTwNcxSNdpmLPrPeRpf
	RA6S1QuVD5Tx2l0Pi6tbnTGx7890PVGxMEv4kBlhALinHskRaR8mqQ99djM9UgyyDWca
	GwgQQQ989h3hVr8IC0YeG49eurBQRA+hztsVdgkVHetWQTe+9t06TydCePfDlEeCe59u
	/s5Uw4lcXYRuw0KHNR5v+7MAZ5fVRk7404HVH1ufTx+RuzcUT0GbsdpFdYFVQmxF3FUP
	5KKw==
X-Received: by 10.67.2.33 with SMTP id bl1mr1224332pad.26.1369071934317;
	Mon, 20 May 2013 10:45:34 -0700 (PDT)
Received: from [10.0.9.174] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	ze11sm26668888pab.22.2013.05.20.10.45.32 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 May 2013 10:45:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <519A4B9E.30305@windriver.com>
Date: Mon, 20 May 2013 10:39:44 -0700
Message-Id: <1FF62BA5-719D-4BFD-95C4-0BFC8A1C54AB@gmail.com>
References: <CANyK_8eXDE0PFgtzrBdXw3=eXrn5H_hdZ6ivVj4+TRQbnC1+eg@mail.gmail.com>
	<519A4B9E.30305@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Clashing man pages
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
X-List-Received-Date: Mon, 20 May 2013 18:03:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 20, 2013, at 9:13 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:

> Also, with the RPM package manager, if the contents of the two files =
are the same no conflict is generated.  I don't know in this case if =
that is true or not.  But that could be an alternative approach for some =
of these packages -- ensure the files are the same and use RPM (or adapt =
ipk to compare file contents before reporting a conflict.)

you forgot dpkg :). Well I guess general solution independent of package =
manager behavior would be best.=



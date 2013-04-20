Received: from mail-pd0-f172.google.com ([209.85.192.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1UTM0O-0005ym-5M; Sat, 20 Apr 2013 02:50:17 +0200
Received: by mail-pd0-f172.google.com with SMTP id 5so2505468pdd.3
	for <multiple recipients>; Fri, 19 Apr 2013 17:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=l7UGseGkaPoRmj84J4rZn06hN3PiNWvvtqP0y3TUTCE=;
	b=tLm0tx6TQxqLZwGt69ITKfDeC+ySOznNAAH3b3taaVIXerX5HgwV+PU46nwNbnSaQj
	+kLPd7APOM4Ab1dDciCjefO3gv86qpb0wR5wa3+5t9nq1rdWno1kAArKqpHYsZEfV5Mw
	Y+Ux5qFY/eH48q5vz/vdB8BQt9+1g3LdokDGaQMWWkuXuTrglRlfqItgfBRflCEJVNGA
	FuAZVJcsqh3OYnuNcuVHPzrQy+d/ZLIlcQIROs7MEXEhf/bBK4xFzyaysa4vECslRW7m
	ku847zVtsiH+/cULcx4N1MNK3Lan6EHB/Ok2pam0LZfA9z5JNdSE/DuiFlxYhOxTeLKB
	0kcQ==
X-Received: by 10.68.35.37 with SMTP id e5mr21416014pbj.208.1366417959898;
	Fri, 19 Apr 2013 17:32:39 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id mm9sm14897973pbc.43.2013.04.19.17.32.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 17:32:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <4669BF70-0FA8-441D-9A60-325FA8DFA54B@gmail.com>
Date: Fri, 19 Apr 2013 17:32:43 -0700
Message-Id: <501EC0A2-9F13-4ADF-9D94-056671BFC6DD@gmail.com>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
	<20130329145514.GH11120@jama> <20130330090319.GM11120@jama>
	<20130401095202.GP11120@jama>
	<4669BF70-0FA8-441D-9A60-325FA8DFA54B@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Sat, 20 Apr 2013 00:50:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 2, 2013, at 7:22 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Thanks Martin, elfutils test case is now reduced and reported others I =
will take a look.


I have pushed a fix for elfutils issue to the pull branch. please retest =
and report.=



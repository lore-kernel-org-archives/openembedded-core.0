Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9BADD71E10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 16:50:43 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id q130so122225719qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=38XberlU5LhrU6QjzXOIMQxenodJfzQHBnzkOGipgTE=;
	b=QNKSUg6L4Z11X/Mk7qcLhr9IepmyGd+zp9M2CsKeJMfgxFfIWYuuqSCp7MliJLN2h+
	Hk57xFLEy+Ljws9QYvdxjnBLT5+ttLEeNSmAgxxBKyS+9agpMz6xb2DNxsKnRG5I1GBu
	iWYyL5V6rVvnX/DKICJouoRS2rKsd8dIrmtwE+1Iws4/7Bkf+VzvM8xf34chZ2xU8Reb
	Qspa6bn07tdPoYt+O60q08s1dcarjJmx4BF6UHClPAq7hnNzd8kTcaD7IrSVf8L/OWlR
	lsRDChLsum2Dn0IQyM6kiKIGh7TgSgeRyqyTwVd7DcyNjhjhpT8Hy41cEYJqCussJDnn
	sitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=38XberlU5LhrU6QjzXOIMQxenodJfzQHBnzkOGipgTE=;
	b=FFLKj+I15/Hn7/z2JWQvOgABtF82ILr7aiuN6k1KEJdOd+ZhtC43rQdtwuq5T5aC13
	5kBmwqoLtVOYMC81UXbQVxGLJlKta1rqCprPbpnlcPOHFzVFVcI/anwaOHNGI0KczJcK
	2XgcSjaFC7qHdcOn0Yv9YoDrbwDkIATRyIkHjrAIwkDBdxNY9EzY/w0Xqc+lTMik7I+m
	qM9HflNFg4nK08z7x2iD61/AKWNqzkKeUEFCaqqXymZlTODv22k5oV7n5cpSygv3Oj/w
	+iunXwTCToncQkCCdXfSOpiqL4FORz17eWS1s87uRE3GeOSTbjCfo+kw0wUP1K0mVclV
	wptw==
X-Gm-Message-State: AKaTC02UgcnrIMajfCvi9NSe7CTQ+luYtSyrRQuTqczf766Rfrn0lS5+0ODTlR1FDs3B1qCQsXeYhBspSfyDArF0
X-Received: by 10.55.8.20 with SMTP id 20mr95382079qki.3.1481647844482; Tue,
	13 Dec 2016 08:50:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 08:50:24 -0800 (PST)
In-Reply-To: <add9f53a-8c35-91a1-9758-62bd7e12766d@linux.intel.com>
References: <1479227073-13133-1-git-send-email-jose.perez.carranza@linux.intel.com>
	<CAJTo0LZ1cj5Nm+iSO5aaHRMgf1Syhx6wQ3R2OaBe99A-SKX5Yg@mail.gmail.com>
	<CAJTo0LYbCY=ETjx3wdo1nwsDDJCgEZU7F0JfiuP_zZf+tS3F-A@mail.gmail.com>
	<add9f53a-8c35-91a1-9758-62bd7e12766d@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 16:50:24 +0000
Message-ID: <CAJTo0LYy2OKK3bOECPRqjjH2E0mNhLrFB+OzxVxZf=t7Ud4cXw@mail.gmail.com>
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oe-tests: Migrate tests from /oe/test to /oeqa/selftest/oe-tests
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
X-List-Received-Date: Tue, 13 Dec 2016 16:50:47 -0000
Content-Type: multipart/alternative; boundary=001a114c9d6073f35405438d05e1

--001a114c9d6073f35405438d05e1
Content-Type: text/plain; charset=UTF-8

On 13 December 2016 at 16:53, Jose Perez Carranza <
jose.perez.carranza@linux.intel.com> wrote:

> at my host is very fast the load (1 second)
>

Okay, proof that I need a new build machine. :)


> Ok, just wondering if oe-selftest -l will also list those test cases ??
>

Huh.  -l doesn't, but -m does.

Ross

--001a114c9d6073f35405438d05e1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 December 2016 at 16:53, Jose Perez Carranza <span dir=3D"ltr">&lt;<a =
href=3D"mailto:jose.perez.carranza@linux.intel.com" target=3D"_blank">jose.=
perez.carranza@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div text=3D"#000000" bgcolor=3D"#FFFFFF">at my host is very =
fast the load (1 second) <br></div></blockquote><div><br></div><div>Okay, p=
roof that I need a new build machine. :)</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div text=3D"#000000" bgcolor=3D"#FFFFFF">Ok, just wonde=
ring if oe-selftest -l will also list those test cases
    ?? </div></blockquote></div><br>Huh. =C2=A0-l doesn&#39;t, but -m does.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a114c9d6073f35405438d05e1--

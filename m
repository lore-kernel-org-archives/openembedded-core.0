Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1A977195
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 18:36:55 +0000 (UTC)
Received: by qgad10 with SMTP id d10so30005416qga.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 10:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=shBNss0LYIjRPDROVlNeI070FWUxvsZY5qbKaQIkxFQ=;
	b=Uv0h+xzfpjhBfm9vPdYNBzM4W4e9lDzkCvHVIYAAuPT1sg7qbyHnPqpaUpOFO+sWtx
	gH4bLonDmf/dcQQkhn4jXHiVMvgDv5TRhsLaMjbGb95BAfgvx2PBfEyet1tz2h0o1xng
	p6jcuSBh5TVYRJfEefbjt0EdD6E3W2kKJRn2sYQj/qXQ5mJJRhxJSmhYFCM+/pPnknzY
	5JCH7A5E4GMAz7MKT/LwTuhv5Q8ltHu7UncAXdJvHQysA9U8TAdh0n11uaBC7UdZWcnA
	CxK36pfVhOnIMN1qMhcvkrc7tFA2/qUt8E9Alx1B/iNLVNB0p6v6e8Qd6wIxeiq7MxE6
	crbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=shBNss0LYIjRPDROVlNeI070FWUxvsZY5qbKaQIkxFQ=;
	b=bbF2AX6WlXqIXnb46hxwDd73SPWWNfGQBO+JIMUwAeUJ3Dj1SHXJ1a3N1ff8nN5RWG
	fA5YbEG5sJn5S0lDo3ykjPNTZHOxZrE6or4sl649UYOgzP/TdldHrtin9FDHmMnqmO0R
	wYi3jnUKni+HewLRJHmAfnguMxvdODZ9n5Uz5sncmZxpkEM75acSXDEPa4+4H+4Lhsjk
	1xrRSN0NMMOJjzaWTeVKN0TRn8eVI//y+FKx7lkLUQRVluQOa+x2CvhAbnAwUeZFpRVi
	Hzr2NPdUwAjMlmzVM4RPJyGMN6rDodsnz5+lDs4FxB54VBGbZXfX4YmLlelNPAGDJpBZ
	6bcg==
X-Gm-Message-State: ALoCoQlVbmaJ/9Bumb0CunPuldpZJFIoMJH7nN3EIxL1EUTKU0odEdUyAnSphBDSIILUktdSQUH8
X-Received: by 10.140.17.8 with SMTP id 8mr12141607qgc.80.1447267015880; Wed,
	11 Nov 2015 10:36:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Wed, 11 Nov 2015 10:36:36 -0800 (PST)
In-Reply-To: <CAMKF1soMHOgJ3bFSqQJkvQ29OJ9Q7Tty2gPOs-LymS3i0RiOZg@mail.gmail.com>
References: <1447240308-2849-1-git-send-email-ross.burton@intel.com>
	<1447240308-2849-2-git-send-email-ross.burton@intel.com>
	<4611513.VyrzVSX4hN@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1soMHOgJ3bFSqQJkvQ29OJ9Q7Tty2gPOs-LymS3i0RiOZg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Nov 2015 18:36:36 +0000
Message-ID: <CAJTo0LbvdUZ1JYZ9vZJSgHiVxnwQdD-gR47UBDh4yFGgJaQhqQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: fix Upstream-Status tag
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
X-List-Received-Date: Wed, 11 Nov 2015 18:36:59 -0000
Content-Type: multipart/alternative; boundary=001a11c0ca6060a59f0524481caa

--001a11c0ca6060a59f0524481caa
Content-Type: text/plain; charset=UTF-8

On 11 November 2015 at 17:48, Khem Raj <raj.khem@gmail.com> wrote:

> for a non-native english speaker like me both just means same :) lets
> stick to one and move on.
>

There is a small semantic difference, but must... resist... bikeshedding...
;)

Ross

--001a11c0ca6060a59f0524481caa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2015 at 17:48, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":1j6" class=3D"a3s" st=
yle=3D"overflow:hidden">for a non-native english speaker like me both just =
means same :) lets<br>
stick to one and move on.</div></blockquote></div><br></div><div class=3D"g=
mail_extra">There is a small semantic difference, but must... resist... bik=
eshedding... ;)</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a11c0ca6060a59f0524481caa--

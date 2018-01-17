Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 53692786C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:28:57 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id c16so9169014itc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 05:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=smkGkbOlSDsNaRVQnaipcnx4HFsXAgBvJP1tRLpkKfY=;
	b=FLoBa8YLPP1L4kSizGLo8n6mpteLhRrBl23g9IeNgeO1xQ5VZB+Lz5YJGcGiaGuqHM
	RQi7w/Z+maZBs/cqkCRF5ywZQ4uIljOZeDePi6CBw7liyMeAbpoSzfKed5BFOhgo39aK
	d/N3TUTNnJBWsF107Ixr473kulaVyjQ7xDH0nDXdsevE3ZbmZ3peKRtPWZRTQpGvOgRN
	qRbt9W0aIYLJybYCVV4o2tIwsQQ7vDOunZD55kbhIvdXqfMGaLzVxoZ+gFen5huYSqKv
	UNB9Sq9tMczGJIBepJfyxBdZuLQdrgp5KwzdeYbPkaPGbqoy4Dp/oQGTptpqNSo4tdhY
	S6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=smkGkbOlSDsNaRVQnaipcnx4HFsXAgBvJP1tRLpkKfY=;
	b=FeOVGk9wMAOOIcqb0slt4M2Ig6NtT43prprLmKB5DKnGDXN0fd8qM5pYsbCWROvfG/
	8ragT2H0nwnudcsVAdfcQ7ZNJUxss8dWmvA9rY0t3iC7FGc5u7Pkw0bQS7l2bxgXpcfK
	sa2vFidxGvB27391R6MtT9hJaILOkEegKYUgQ6j3lN0xgA3PpasVeLsqe5qNufMvIgnB
	yC8YpMbTeXbWQz7Ex/nBHT31e16g3pzpg00WdLKU74redG27bvJf9Ei55qtMDgcOKO6T
	PYuyOeRiovaE7qPHnQlxKH9s5sDJ7D3rcqNn7yZv95GuzXKkSUQuM0Vl5euJPD+PRglK
	AvZQ==
X-Gm-Message-State: AKwxytcjO2xIOIWEEmor+iFqJF1N7+K6brqUM7MZHVhY4u9W8znsKogl
	wPz/2QjmAqUlElAD2oYtaggy2c0kxo47HimoaojL1Q==
X-Google-Smtp-Source: ACJfBoscWNc01bqXKcBdWekhtqeyEWCBDPwge2usrlKDUoQl6i6cqLhgLWf51CXIR/rkasUwWSZnmTnTowGymHYHycA=
X-Received: by 10.36.86.20 with SMTP id o20mr3870081itb.53.1516195739394; Wed,
	17 Jan 2018 05:28:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Wed, 17 Jan 2018 05:28:38 -0800 (PST)
In-Reply-To: <CAP9ODKrpR3c2a-8rwoCQOV_RztL_SJFDDgU6qvhZwQBB-5wnWg@mail.gmail.com>
References: <20180117131155.2297-1-otavio@ossystems.com.br>
	<20180117131155.2297-3-otavio@ossystems.com.br>
	<CAJTo0LYONEvXNkEYzanBQXseap_vG=5BA9sRbRtXsK+PdwLwHA@mail.gmail.com>
	<CAP9ODKrpR3c2a-8rwoCQOV_RztL_SJFDDgU6qvhZwQBB-5wnWg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Jan 2018 13:28:38 +0000
Message-ID: <CAJTo0LaMzcg4uWMDO8kQw2-OVuGAAAg6MF4m6E-mz4kJJRAxuw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/3] cmake: upgrade 3.9.5 -> 3.10.1
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
X-List-Received-Date: Wed, 17 Jan 2018 13:28:58 -0000
Content-Type: multipart/alternative; boundary="001a1144d5ea752dfb0562f8d461"

--001a1144d5ea752dfb0562f8d461
Content-Type: text/plain; charset="UTF-8"

On 17 January 2018 at 13:22, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> I believe it is looking for the utils inside sysroot now. Do you think
> it makes sense to avoid the dependency?
>

Yes, we don't need to build it as make is in HOSTTOOLS.

Can you just tell it where to find the make, or even better just tell it to
run "make"?

(also, I've patches to switch cmake from make to ninja)

Ross

--001a1144d5ea752dfb0562f8d461
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 January 2018 at 13:22, Otavio Salvador <span dir=3D"=
ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_bla=
nk">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div class=3D=
"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I b=
elieve it is looking for the utils inside sysroot now. Do you think<br>
it makes sense to avoid the dependency?<br></blockquote><div><br></div><div=
>Yes, we don&#39;t need to build it as make is in HOSTTOOLS.</div><div><br>=
</div><div>Can you just tell it where to find the make, or even better just=
 tell it to run &quot;make&quot;?</div><div><br></div><div>(also, I&#39;ve =
patches to switch cmake from make to ninja)</div><div><br></div><div>Ross=
=C2=A0</div></div></div></div>

--001a1144d5ea752dfb0562f8d461--

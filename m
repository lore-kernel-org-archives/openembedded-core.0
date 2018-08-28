Return-Path: <nwwinters@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 599EA74F09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 05:52:43 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id 8-v6so775711oip.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 22:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=c1FpwOtUxLHDGS4pSRPn/b/qlzxX0+d+u8+CJrmW4UM=;
	b=i+WzLrsXlkzTCR4YBGyQuLubqgjXQmXm/G+BY8RZMv4gZrqfbqgzMoKVuhZ8C+d7WP
	tAsW7xrk5UknOsD+biOYO0gwxiExeKZBRLRfQAZOvrT8YUrZz6jhz9QkUQbGLW0EqbHg
	GR9mFtfRHtfkao98Gtksh9DrMqozOKuTjijt/nz+rz3TD2O141yeLLrXith2rD1q8Dj6
	SxP8LYIy+FSW9nagt51u57rkuGD6al6pSETDMPPBpCBtx96NL8bBA8+LuKBhgKVu/3GK
	8He3MbZ93Q5x/2keneoTdlNh+y9ZGLDacGYc+nGJBB7TKbh4skCJ+uA3CjAbBhwztEpg
	YPiw==
X-Gm-Message-State: APzg51A/iY3i2Uujvxy3YHMMtMukdMXC/LkzCrIOEFzyH/dC4feoh5+R
	kaOPLJ45FsCECqvoDMaZ4HtbuKvI
X-Google-Smtp-Source: ANB0VdYY9CtbyJNUTyzdCLwlZFWX+GpNBDudcsR45DRzCP1Mr+p2jWz+5btdXoqgXMGxZlhh5nMPIg==
X-Received: by 2002:aca:180b:: with SMTP id h11-v6mr52182oih.91.1535435564150; 
	Mon, 27 Aug 2018 22:52:44 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	o125-v6sm63199oig.44.2018.08.27.22.52.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 22:52:43 -0700 (PDT)
Received: by mail-oi0-f50.google.com with SMTP id c190-v6so742307oig.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 22:52:43 -0700 (PDT)
X-Received: by 2002:aca:ac54:: with SMTP id v81-v6mr52642oie.1.1535435563270; 
	Mon, 27 Aug 2018 22:52:43 -0700 (PDT)
MIME-Version: 1.0
From: Nick Winters <nick@wintersteam.org>
Date: Mon, 27 Aug 2018 22:53:05 -0700
X-Gmail-Original-Message-ID: <CA+FvCj6uCS7iSwpyOnNx0Q-A7iXfzTg_NtcH98ihmsfLDGkn9Q@mail.gmail.com>
Message-ID: <CA+FvCj6uCS7iSwpyOnNx0Q-A7iXfzTg_NtcH98ihmsfLDGkn9Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Troubleshooting sstate cache
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
X-List-Received-Date: Tue, 28 Aug 2018 05:52:43 -0000
Content-Type: multipart/alternative; boundary="00000000000053077105747873ec"

--00000000000053077105747873ec
Content-Type: text/plain; charset="UTF-8"

Often when I use an sstate cache from another build, I run into problems
where builds fail. Usually the failure is a result of not being able to
find a shared library. If I delete the sstate cache, the build succeeds,
although it is 8 hours later. I switched to using sstate mirrors and had
similar problems.

Questions:

* Are there any tools or bitbake commands to use for troubleshooting
failures like this?

* I am creating one sstate cache per architecture being built. Should this
really be necessary?

* Any other advice to help troubleshoot sstate cache issues?

Thanks,
Nick

--00000000000053077105747873ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Often when I use an sstate cache from another build, I run=
 into problems where builds fail. Usually the failure is a result of not be=
ing able to find a shared library. If I delete the sstate cache, the build =
succeeds, although it is 8 hours later. I switched to using sstate mirrors =
and had similar problems.<div><br></div><div>Questions:</div><div><br></div=
><div>* Are there any tools or bitbake commands to use for troubleshooting =
failures like this?</div><div><br></div><div>* I am creating one sstate cac=
he per architecture being built. Should this really be necessary?</div><div=
><br></div><div>* Any other advice to help troubleshoot sstate cache issues=
?</div><div><br></div><div>Thanks,<br></div><div>Nick</div></div>

--00000000000053077105747873ec--

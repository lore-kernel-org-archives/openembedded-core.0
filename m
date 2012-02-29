Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2jZa-0002ne-SB
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 14:28:02 +0100
Received: by vcbfl13 with SMTP id fl13so3044135vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 05:19:33 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.66.228 as permitted sender) client-ip=10.52.66.228; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.66.228 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.66.228])
	by 10.52.66.228 with SMTP id i4mr326872vdt.12.1330521573952 (num_hops =
	1); Wed, 29 Feb 2012 05:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WdXKwEPyTlrMEBgjBGWhOHcw8NbVZaiU9iuOwnIYtLA=;
	b=oZhI/ov3NIkwjLIcBaoFD7vXgRcTq1tyPT6ACiTIQeKeyPiJ5/7hKFT/4PoVxVD7BB
	46fCXeON8padcCrtRKg50exiOzAerTB+t0BejO3MRi44R04wpTVZYH9QToeKVGSiyVP+
	/frN+iXLngsGNgVA/mPE0Bb6oAJ/ZEgT4VKhU=
MIME-Version: 1.0
Received: by 10.52.66.228 with SMTP id i4mr269000vdt.12.1330521573716; Wed, 29
	Feb 2012 05:19:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Wed, 29 Feb 2012 05:19:33 -0800 (PST)
In-Reply-To: <9f75e5f43a30ed6e154f299ead955588c98de5c7.1330520324.git.paul.eggleton@linux.intel.com>
References: <cover.1330520324.git.paul.eggleton@linux.intel.com>
	<9f75e5f43a30ed6e154f299ead955588c98de5c7.1330520324.git.paul.eggleton@linux.intel.com>
Date: Wed, 29 Feb 2012 10:19:33 -0300
X-Google-Sender-Auth: 75Qwhkh62PT0392EAqpwJfec4-0
Message-ID: <CAP9ODKpPUtNpV0Wc91kvehnf=1OpYtKdJ411-+kV8Z=GADOKiQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] More quoting fixes
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
X-List-Received-Date: Wed, 29 Feb 2012 13:28:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 29, 2012 at 09:59, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> -export VERBOSE=3D1
> +export VERBOSE=3D"1"

I fully agree with the change but here it doesn't raise a parser
error. Isn't it expected to happen?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



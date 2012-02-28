Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2Nnh-0001PE-P2
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 15:13:09 +0100
Received: by vbbfr13 with SMTP id fr13so2023771vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:04:42 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.95.74 as permitted sender) client-ip=10.52.95.74; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.95.74 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.95.74])
	by 10.52.95.74 with SMTP id di10mr13142806vdb.46.1330437882047
	(num_hops = 1); Tue, 28 Feb 2012 06:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+PNcytewmEgVHkTD9cTmycVdSQuKBSfI082hcko+tac=;
	b=HCXF7toz/9ZJXpEMboygLDIlyhbapFBsQ3KNrjdeDX3LGyTFVzSye6bOt/KbiePpep
	S9xJ+8NMzim5beS7BgT4WlZJdttykepEX57rE4zXPotk9Bpw69ejHQHXLtvgu2oVczsz
	nBZowS06BPfoFtvLLFUzp9yxZVmSBDbxPmv00=
MIME-Version: 1.0
Received: by 10.52.95.74 with SMTP id di10mr10850737vdb.46.1330437881789; Tue,
	28 Feb 2012 06:04:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Tue, 28 Feb 2012 06:04:41 -0800 (PST)
In-Reply-To: <441d5b0afed2faa6f94c1806f7d9117fa395215c.1330109787.git.sgw@linux.intel.com>
References: <cover.1330109787.git.sgw@linux.intel.com>
	<441d5b0afed2faa6f94c1806f7d9117fa395215c.1330109787.git.sgw@linux.intel.com>
Date: Tue, 28 Feb 2012 11:04:41 -0300
X-Google-Sender-Auth: NQqi7_Y9YiRuWnRjXKvivedtDyM
Message-ID: <CAP9ODKrKtR7kB8gz6AAsAeDWvpYoi4QMTSMUO5Nt1Q+PJnHf-w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] syslinux: Package unpackaged files in -misc
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
X-List-Received-Date: Tue, 28 Feb 2012 14:13:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 16:59, Saul Wold <sgw@linux.intel.com> wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

This missed a PR bump and broke autobuilder; can you send a patch
bumping PR please?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SG9Q2-0003yW-2M
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 15:41:38 +0200
Received: by dadz8 with SMTP id z8so2845337dad.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 06:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=ofZaaCMt7Zwu76GcuIsv4BgtF7d3JpIbtMZsx0NhD1k=;
	b=Lkt9D6xhoMJIinblPrAsja4wuIkMcbvY5z5pStucNNPITaQtklE3WraPk3al672O/i
	jYzg2CEwhLOOcdRR0QgUqTzf7NEZHS1yniSw5R2gp/xDEzetWbsIshm265ledbeoUaLz
	Dk7jJqt6Y2jh99qHX5i/ijDsdz8HsJI+NFB8kQ/5eHbl3DTqf0Rkdpz55al1vnSGQ16f
	jf8auhME2R1w0C/XY6rwaAGm4BJyxpSnwqntaeaTixLyvvllID5ILAaA6joaJiQK+EiD
	KykwUcfa+BHZbExzVOlxhwjkslMCY7qUKmf40QVg08rPFFvgZ4unf20DSs88+j2Adl+9
	SleQ==
Received: by 10.68.239.233 with SMTP id vv9mr16037933pbc.75.1333719140950;
	Fri, 06 Apr 2012 06:32:20 -0700 (PDT)
Received: from [192.168.68.136] ([207.239.114.206])
	by mx.google.com with ESMTPS id s10sm6315543pbp.14.2012.04.06.06.32.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Apr 2012 06:32:19 -0700 (PDT)
References: <cover.1333295122.git.dexuan.cui@intel.com>
	<1333337337.647.3.camel@ted>
	<949066CF-9C65-4057-9432-B4904A8B3AFD@dominion.thruhere.net>
	<A25F549E4D43CD42B4C02DF47A1913230FCFCF55@SHSMSX102.ccr.corp.intel.com>
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCFCF55@SHSMSX102.ccr.corp.intel.com>
Mime-Version: 1.0 (1.0)
Message-Id: <BEE164D2-9C82-4144-BFD6-52EA787FF8E9@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9B179)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 6 Apr 2012 06:32:18 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmMQjF12t2ESjtqupUDfLXQ0TQRYcOaJn/NpkzMzKzIN1rdZ8MUTwinRnuSQMi5NsNWN5zL
Subject: Re: [PATCH 0/5] dexuan: more build appliance patches:	[Apr 1, 2012]
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
X-List-Received-Date: Fri, 06 Apr 2012 13:41:38 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 5 apr. 2012 om 10:21 heeft "Cui, Dexuan" <dexuan.cui@intel.com> het volge=
nde geschreven:

> Koen Kooi wrote on 2012-04-04:
>>>> are available in the git repository at:
>>>> git://git.yoctoproject.org/poky-contrib dcui/master
>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Ddcui/master
>>>> Dexuan Cui (5):
>>>> genext2fs: support large files and  filesystems without using large
>>>>   amounts of memory
>>> I've merged these to master, thanks. Whilst I'm reluctant to do so at
>>> this point in the release process for such major changes, I think in
>>> this case it does make sense since the genext2fs changes seem to fix a
>>> number of problematic issues.
>>=20
>> I'm getting:
>>=20
>> | genext2fs: set_file_size: ftruncate: Invalid argument
>>=20
>> Trying to see why that happens and find out how to fix it.
> Hi Koen, did you get the cause?
>=20
> This is the prototype of the function:
> int ftruncate(int fd, off_t length);
>=20
> I suppose you're using a 32-bit building host so the off_t in your host ca=
n't exceed 4G?

no, 64bit host

>=20
> We do need to test it in a 32-bit host and at least we need to document th=
e issue.
>=20
> Thanks,
> -- Dexuan
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



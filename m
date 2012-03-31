Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SDzbh-0003MX-SL
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 16:48:45 +0200
Received: by lagw12 with SMTP id w12so1730954lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ZMPgIwsNqheBetdi3oShfLdOX/WRvwR4Q2fF0qLbpiw=;
	b=wO4xGeZH08UyRS69XyZ+IP1Ar+8Pkqf1m8rc3aBJO+akPI2nhjlYfsYQCIvKZ019lc
	AztwU3OQMobQHcSYyok4DlpBAA+cfRwOes+J5RRuHxecud4ayXtGhmv7Nm77b1iqxL4H
	KlpXIaPUN7tmgVN6shoYjt2WTIpaHwfMCLW8Xlj/DVBgTYuC7l0eCORVagBv18d5mfhh
	DKdWLFeQ7ujMXbnX+m+muu25fkZh02XVXm791DcdDebQC91aClmOfLaRMP8BnxKsG7FH
	5ZGq1sYTu/89KQuKIdKTsV91uU8CGMi0//LxsSLIxJNV7TDCp4cikbN2XCDMmitcCWbf
	Ld/A==
Received: by 10.152.131.74 with SMTP id ok10mr215353lab.17.1333204779861; Sat,
	31 Mar 2012 07:39:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Sat, 31 Mar 2012 07:39:09 -0700 (PDT)
In-Reply-To: <eb2bbe99f15183d5c82ab5c12178a1e336a7c5ce.1333176251.git.lianhao.lu@intel.com>
References: <cover.1333176251.git.lianhao.lu@intel.com>
	<d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
	<eb2bbe99f15183d5c82ab5c12178a1e336a7c5ce.1333176251.git.lianhao.lu@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 31 Mar 2012 07:39:09 -0700
Message-ID: <CAMKF1srXwcC9s_wOb3OuSEt+QWeSOfn3yR6R6VGtGP3mhhRASw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] eglibc-nativesdk: Set GCC_ADDONS.
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
X-List-Received-Date: Sat, 31 Mar 2012 14:48:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 11:49 PM, Lianhao Lu <lianhao.lu@intel.com> wrote:
>
> =C2=A0GLIBC_ADDONS ?=3D "ports,nptl,libidn"
> +GLIBC_ADDONS_virtclass-nativesdk =3D "nptl"

nptl is bogus now a days. so please delete it completely.



Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id ED22771AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 16:55:11 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id r21-v6so3232312qtm.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aDRdK/uSE92unV5Mfh8v3AgC+h7VCUB3eGRUYNL0f4c=;
	b=VW9tK9yfSU/1sqbrESZHGL0CuBPpGDyiH5YQE+eFRO3/h2iBnUA2QHXRqeiITGErE5
	g6JTBVoOKnEx0S7DwzGphSSZVzZX/GKI1GdVrNO3+rxPS2oh+WuBMjuWoN6lAfoVhlLq
	AmfIQl5dXbkQsyzn5d2dIKAzSVWTGBW2pdxwR8Aw4hpU4IpqxmY+7sHWpZRaYsUxe/RA
	grAE2pt6hYXd7G4fOld8U66o6ilGyjBEzXy7zZqhvVB3M+1qg8asp8KP/TXD5yev7Vfi
	GZIXuyjnDEeatM85gC92EhxX9RCyG3MeKVpnpXFeoJbcMq2K2yHhpebntLzfe8eeG1B6
	XLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aDRdK/uSE92unV5Mfh8v3AgC+h7VCUB3eGRUYNL0f4c=;
	b=sYc+JpzZ66MJS0cbBtPRJD+ZguXaf2Ec2EfMXpuIRFcIdHJJQ8HD3Zdno7jtu5EOMw
	TU2XXARMp3ZKRjrlLvpdEMgzS9bew+7pNvOHKwGhsmrBTCbFctp9247hmPKJkLRp7xwr
	3ktV6Sawbl/aSeLJrNP1dxoKBSJCw0K1NxE9lRrOAs04BAzNMUg6fdGebW7ZK93/CunZ
	Lhzl0O5qOdcjfM0QKW0jknXEGakvxz31S7RExvCfYllSxv+SZSlTZh9Kgk345hHswcC+
	o+SpMRwAEMKW+Uf3P/0W0GGsyAcJu3jIDCoKLjBazlvNOPmakeKnsz3DTvXRh5YSf5NK
	9ZvQ==
X-Gm-Message-State: AOUpUlFlL2mDuDXPasHs1pxYvNpDZakYL0wmaXhAMN4kw+qvSNGT2hQ1
	+ybFvIBxx3S+yiROho68eeppwHRGlHku7dzO/f8=
X-Google-Smtp-Source: AA+uWPzYw4PRaU4T/+db5M89uhC2P8A15gh5d0MAwmi3AoyTSQN/uelvIq7p/yfQYT3gOn8Ri7HT//jfKmujHD+A2u0=
X-Received: by 2002:ac8:25f1:: with SMTP id
	f46-v6mr3679393qtf.20.1533747312647; 
	Wed, 08 Aug 2018 09:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1533595822.git.raj.khem@gmail.com>
	<e9bcf3a4c54ac1cd9721abc0d9be5324d4004845.1533595822.git.raj.khem@gmail.com>
	<CA+chaQfiZ4MPSPE5B3JPYNrcJaDOEQiyHE4UsMf2dP_vWsfrwQ@mail.gmail.com>
	<CAMKF1sqaXt17u1gGPmZi4qiziwVtwcFrd7_2nJ8kap5BSB3LiQ@mail.gmail.com>
	<CAJTo0LbnL2uCT=r1iZ1BuummBhdJm5020YcqvKf4kiwGrhQKvQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbnL2uCT=r1iZ1BuummBhdJm5020YcqvKf4kiwGrhQKvQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Aug 2018 09:54:46 -0700
Message-ID: <CAMKF1spY3CgeHE8+na-YZ0GGrBH=hNNwOsriwWfaJ5E7ROdn_A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/18] Disable crypt support in glibc
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
X-List-Received-Date: Wed, 08 Aug 2018 16:55:12 -0000
Content-Type: text/plain; charset="UTF-8"

OK I have pushed the changes to pull branch
On Wed, Aug 8, 2018 at 9:10 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Yeah squashing makes sense, as the intermediate commit is broken.
>
> Ross
>
> On 8 August 2018 at 17:06, Khem Raj <raj.khem@gmail.com> wrote:
> > I deliberately kept it separate for readability from glibc upgrade,
> > but squashing this with packaging changes alone is ok. I will leave
> > that to Ross
> > On Wed, Aug 8, 2018 at 8:48 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >>
> >> Should this be squashed with "glibc: Drop packaging libcrypt from 2.28+ onwards" ?
> >>
> >> I've accidentally cherry-picked the packaging change from patchwork and missed this one which results in:
> >>
> >> ERROR: glibc-2.28-r0 do_package: QA Issue: glibc: Files/directories were installed but not shipped in any package:
> >>   /lib/libcrypt.so.1
> >>   /lib/libcrypt-2.28.so
> >> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> >> glibc: 2 installed and not shipped files. [installed-vs-shipped]
> >>
> >>
> >> On Tue, Aug 7, 2018 at 12:59 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> We have independent crypt implementation coming from libxcrypt
> >>>
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ---
> >>>  meta/recipes-core/glibc/glibc_2.28.bb | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
> >>> index 086daed04c..906e6c2b62 100644
> >>> --- a/meta/recipes-core/glibc/glibc_2.28.bb
> >>> +++ b/meta/recipes-core/glibc/glibc_2.28.bb
> >>> @@ -83,6 +83,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
> >>>                  --enable-bind-now \
> >>>                  --enable-stack-protector=strong \
> >>>                  --enable-stackguard-randomization \
> >>> +                --disable-crypt \
> >>>                  ${GLIBCPIE} \
> >>>                  ${GLIBC_EXTRA_OECONF}"
> >>>
> >>> --
> >>> 2.18.0
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rb5MJ-0000mB-4Z
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 08:04:03 +0100
Received: by lami14 with SMTP id i14so815421lam.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 22:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=vbos2gpcf/nk49a+CiEs+WDMC7QR6ADueuHHGxH/UcA=;
	b=QVIjblahb1Qn/NfEoRFvuEKZykOPzu7wi2UdvdGruc4JG1EPVrZaDmvgEBp528maNg
	mjOuK907tA6onWnMbkvIVWoCX2jWq0J9B7Hd61H8sNoh/WZJHydWv8RhETs37obzo+PV
	nf8VG+BZN6sX+3B6NoLRKlStwaSVZrtzbKSUk=
Received: by 10.152.103.51 with SMTP id ft19mr1379449lab.42.1323932225312;
	Wed, 14 Dec 2011 22:57:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 14 Dec 2011 22:56:34 -0800 (PST)
In-Reply-To: <7645ba6589957af6afa3fbe8766fb1ca6f1b004f.1323911699.git.sgw@linux.intel.com>
References: <cover.1323911699.git.sgw@linux.intel.com>
	<7645ba6589957af6afa3fbe8766fb1ca6f1b004f.1323911699.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Dec 2011 22:56:34 -0800
Message-ID: <CAMKF1sqUViQRC4G6rZi_szkCbbC5-juiTAJsF=U8iBusrm3LJA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] ed: Fix EXTRA_OECONF to ensure right compiler is found
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
X-List-Received-Date: Thu, 15 Dec 2011 07:04:03 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 14, 2011 at 5:50 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
> +EXTRA_OECONF = "'CC=${CC}' 'CXX=${CXX}' 'CFLAGS=${CFLAGS}' 'CXXFLAGS=${CXXFLAGS}' 'CPPFLAGS=${CPPFLAGS}' 'LDFLAGS=${LDFLAGS}'"
> +

hmm why doesnt it pick it from environment in configure ?



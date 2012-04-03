Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SEwMK-00089d-EZ
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 07:32:48 +0200
Received: by lagw12 with SMTP id w12so4098339lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2012 22:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=/KIOtFp+s/MXr6E6qmMn7ou7J+okrkDPbHMqfng6t2Q=;
	b=Mr+vleMIhd9A71a7JaXv/+tT/zSyjsVPa2A1bB/86XL5rZL8e1PGgPv/py7nfT8jLK
	RYM0i6CzQ9j9feRnOdvzitcJH6bn5yz0IvDWw8gDW91Ne0Y6+6I5Jlx3XzfzkBkROd1J
	BcrODgzD8zUidrVnLz1cy7MOhyo+gccnd0FXq+zTQNuCBg6LCoaMdeYyEvwifU4LuEpw
	3yjhgukiZX8EG5rcM4vka2sQiuPsWk33YdkY6m76eUtReP3lyG/80TSCJ2aF2uoR19Vm
	nwLFnuOegLn3bsCNSys7buFlk8PUOrd+aKokg2ADxRB5w/KTotIxVrpIdxk0ymkmVY2Q
	+c+g==
Received: by 10.152.146.163 with SMTP id td3mr12564683lab.31.1333430619262;
	Mon, 02 Apr 2012 22:23:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Mon, 2 Apr 2012 22:23:09 -0700 (PDT)
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FD1A2D4@SHSMSX101.ccr.corp.intel.com>
References: <cover.1333176251.git.lianhao.lu@intel.com>
	<d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
	<eb2bbe99f15183d5c82ab5c12178a1e336a7c5ce.1333176251.git.lianhao.lu@intel.com>
	<CAMKF1srXwcC9s_wOb3OuSEt+QWeSOfn3yR6R6VGtGP3mhhRASw@mail.gmail.com>
	<CAMKF1sosTMMM0AUhPy6=4P7CQBAO2WJ3VCfObAb-+0g2+25mig@mail.gmail.com>
	<857BE142E5399E46B20FD45B9DB8A7BC0FD1A2D4@SHSMSX101.ccr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Apr 2012 22:23:09 -0700
Message-ID: <CAMKF1spebc30yfkVZNN7oX8avFEFcdnX_xA01VhR5yj2NTrOMA@mail.gmail.com>
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
X-List-Received-Date: Tue, 03 Apr 2012 05:32:48 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 2, 2012 at 5:22 PM, Lu, Lianhao <lianhao.lu@intel.com> wrote:
> I've recreated the patches per Richard's comment. However, removing nptl from the add-on settings resulted an eglibc configure error saying that it is an required add-on.

hmm interesting. I will see whats going on there.



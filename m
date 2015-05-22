Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 57C67609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 13:12:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2015 06:12:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="730216098"
Received: from cestaunt-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.15.40])
	by fmsmga002.fm.intel.com with ESMTP; 22 May 2015 06:12:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: thomas.perrot@tupi.fr
Date: Fri, 22 May 2015 14:12:44 +0100
Message-ID: <2176018.53hRFMtF2v@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <CAGXeWgkEspQ4aK4rXfabQvHCXa+B-KvgWzkL96d86PRisc+sdg@mail.gmail.com>
References: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>
	<CAP9ODKprXP3_O41a7HAenLXPuJAGTOz0_1bF0xyud+vRvxJcRA@mail.gmail.com>
	<CAGXeWgkEspQ4aK4rXfabQvHCXa+B-KvgWzkL96d86PRisc+sdg@mail.gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd-serialgetty: Remove SERIAL_CONSOLE definition, because it depends of machine definition. Set it, here, can be make the value is not good.
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
X-List-Received-Date: Fri, 22 May 2015 13:12:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Thomas,

On Friday 22 May 2015 15:02:02 Thomas PERROT wrote:
> If the machine layer definition is applied after meta-systemd also
> with a default setting operator instead an affectation, this var will
> be bad initialized. It's the case with meta-raspberrypi layer.

1) Where in meta-systemd is SERIAL_CONSOLE being set? I can't find it anywhere 
in there.

2) Should you even be using meta-systemd? systemd support in OE-Core is 99% 
complete; meta-systemd is mostly only needed for legacy usages.

3) When the machine configuration sets the value, that happens pretty early on 
in the parsing process so there's no way that this value is going to take 
precedence over the machine value. Have you looked at the output of 
bitbake -e systemd-serialgetty | less to see how the value of this variable is 
being set?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T4E4V-0001hU-Sr
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:46:24 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2012 09:25:46 -0700
Received: by obceq6 with SMTP id eq6so1377442obc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 09:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=daMZbyueV2mbDtDiACYzcC/AEX8kEvByYeAc6unhGyU=;
	b=GXK+G9IPVx2fyqPPrjrnO+d6wTFd5aDbrmgUX74rvH6czk2Wkh1kcMgfE8DmxhZ9tJ
	sucBjM4z2cmS11v+qXjOiriTiTHfGLcGhe2VPTyMGkLwFcHT96vhtUUpgU3iVnw5NjVg
	1b4h131WJgB+Q3o2QyakkO+uNI0IDEEBR0ejnoBwKq/+kRVaEdX0vMJbMwak/AthErL4
	zwjP+5CWjuC0zA65vc7n2kXPcmU02GjOGT3Kebx5dl7LoWHaNBumpEqvPh+d0m66pZg/
	nnDire+G7l82a+7lwZQ/+xDE45Vf0b6n3/qVplDt0MTFLPKiJgTGYUKZYgo1gK9bAwm1
	8EXg==
Received: by 10.182.50.68 with SMTP id a4mr16343839obo.59.1345652745850; Wed,
	22 Aug 2012 09:25:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Wed, 22 Aug 2012 09:25:25 -0700 (PDT)
In-Reply-To: <1840245.41xHr4Jb3c@helios>
References: <1345650627-3232-1-git-send-email-paul.eggleton@linux.intel.com>
	<1840245.41xHr4Jb3c@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 17:25:25 +0100
Message-ID: <CAJTo0LZw-E5WcXewiGqPN+x4nJ4ox_U940vQWhSypGN5N_gLdw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQmlqjxz1h6MC/G8WgHSgiTq/FWugeDbMMzib92baOYPJZF92g3sW+/uqXpSDwC191KnRxba
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] zeroconf: remove - RFC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 16:46:24 -0000
Content-Type: text/plain; charset=UTF-8

On 22 August 2012 17:11, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Wednesday 22 August 2012 16:50:27 Paul Eggleton wrote:
>> We already have avahi in OE-Core and some cursory research suggests that
>> avahi is preferred over this package, which has apparently not seen a
>> release since 2006. Nothing in OE-Core actually refers to it, so let's just
>> remove it.
>
> Hmm, this was meant to be an RFC - I would like to give people some time to
> respond.

Not seeing a release since 2006 is good enough reason to remove
something which is handling data directly from the network...

Ross



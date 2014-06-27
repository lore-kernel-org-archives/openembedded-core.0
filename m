Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 2231E60703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 10:39:12 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s5RAdANl004085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 27 Jun 2014 12:39:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1403865552;
	bh=ZXqgyvf4DGzd5/bjGI/IPPCu8xwCcYoTHVokHUIYxw4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=WzkqDURsWxuaPvKVja+/N6I6LXqf8d43m7Zn0klwz5oCKdpgLW/7Bux/NMB711RA6
	gwldZ2GNZp6+ROOG3dnRm5vLzTAS909aZQ5mdQyl4AiDwrDkzSOFz/GGYxCXXc4wIe
	/XkPKiIxlI6PyJxLbf3FWNXn2GTNVoL7KF6GL1Zk=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s5RAd5bt003720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Jun 2014 12:39:06 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1X0TYf-0002w5-D6; Fri, 27 Jun 2014 12:39:05 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1403654908.git.sgw@linux.intel.com>
	<06c0930e320d25880f1fab734179e949b1ffce46.1403654908.git.sgw@linux.intel.com>
	<ly8uoi7k26.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1403863939.28648.5.camel@ted>
Date: Fri, 27 Jun 2014 12:39:05 +0200
In-Reply-To: <1403863939.28648.5.camel@ted> (Richard Purdie's message of "Fri, 
	27 Jun 2014 11:12:19 +0100")
Message-ID: <lyd2dur60m.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/10] liburcu: Update to 0.8.4
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
X-List-Received-Date: Fri, 27 Jun 2014 10:39:19 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> This new package seems to blacklist[1] gcc-4.8.0 till gcc-4.8.2 which is
>> used by OE.
>
> OE-Core is using gcc 4.9 by default now?

yes; but 4.8.2 is still in the tree.


> That said do we know which fix is needed for gcc 4.8.x?

The urcu commit which blacklists gcc 4.8 refers to

           https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854

The patch mentioned in this report is applied to our gcc 4.8.2

  meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch



Enrico

